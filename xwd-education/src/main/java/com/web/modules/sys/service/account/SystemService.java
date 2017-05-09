package com.web.modules.sys.service.account;

import com.web.commons.security.UserUtils;
import com.web.commons.service.BaseService;
import com.web.commons.service.ServiceException;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.MenuDao;
import com.web.modules.sys.dao.RoleDao;
import com.web.modules.sys.dao.UserDao;
import com.web.modules.sys.entity.Menu;
import com.web.modules.sys.entity.Role;
import com.web.modules.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

/**
 * 系统管理和权限，涉及用户、权限、菜单
 * 
 * @author nanxiaoqiang,daLiu
 * 
 * @version 2014年1月31日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SystemService extends BaseService {

	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;

	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private MenuDao menuDao;
	//@Autowired
	//private ShiroCasAccountRealm systemRealm;

	@Autowired
	private ShiroAccountRealm systemRealm;

	// @Autowired
	// private IdentityService identityService;

	// -- User Service --//

	public User getUser(Long id) {
		return userDao.get(id);
	}

	public Page<User> findUser(Page<User> page, User user) {
		DetachedCriteria dc = userDao.createDetachedCriteria();
		User currentUser = UserUtils.getUser();
		dc.createAlias("company", "company");
		if (user.getCompany() != null && user.getCompany().getId() != null) {
			dc.add(Restrictions.or(
					Restrictions.eq("company.id", user.getCompany().getId()),
					Restrictions.like("company.parentIds", "%,"
							+ user.getCompany().getId() + ",%")));
		}
		dc.createAlias("office", "office");
		if (user.getOffice() != null && user.getOffice().getId() != null) {
			dc.add(Restrictions.or(
					Restrictions.eq("office.id", user.getOffice().getId()),
					Restrictions.like("office.parentIds", "%,"
							+ user.getOffice().getId() + ",%")));
		}
		// 如果不是超级管理员，则不显示超级管理员用户
		if (!currentUser.isAdmin()) {
			dc.add(Restrictions.ne("id", 1L));
		}
		dc.add(dataScopeFilter(currentUser, "office", ""));
		// System.out.println(dataScopeFilterString(currentUser, "office", ""));
		if (StringUtils.isNotEmpty(user.getLoginName())) {
			dc.add(Restrictions.like("loginName", "%" + user.getLoginName()
					+ "%"));
		}
		if (StringUtils.isNotEmpty(user.getName())) {
			dc.add(Restrictions.like("name", "%" + user.getName() + "%"));
		}
		dc.add(Restrictions.eq(User.FIELD_DEL_FLAG, User.DEL_FLAG_NORMAL));
		if (!StringUtils.isNotEmpty(page.getOrderBy())) {
			dc.addOrder(Order.asc("company.code"))
					.addOrder(Order.asc("office.code"))
					.addOrder(Order.desc("id"));
		}
		return userDao.find(page, dc);
	}

	// 取用户的数据范围
	public String getDataScope(User user) {
		return dataScopeFilterString(user, "office", "");
	}

	public User getUserByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}

	@Transactional(readOnly = false)
	public void saveUser(User user) {
		if (isSupervisor(user)) {
			logger.warn("操作员{}尝试修改超级管理员用户", getCurrentUserName());
		}

		// 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		userDao.clear();
		userDao.save(user);
		systemRealm.clearAllCachedAuthorizationInfo();
		// 同步到Activiti
		// saveActivitiUser(user);
	}

	@Transactional(readOnly = false)
	public void deleteUser(Long id) {
		if (isSupervisor(id)) {
			logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
			throw new ServiceException("不能删除超级管理员用户");
		}
		userDao.deleteById(id);
		// 同步到Activiti
		// deleteActivitiUser(userDao.get(id));
	}

	// /**
	// * 要更改！！！！
	// *
	// * @deprecated // 暂时废弃
	// * @param id
	// * @param loginName
	// * @param newPassword
	// */
	// @Transactional(readOnly = false)
	// public void updatePasswordById(Long id, String loginName, String
	// newPassword) {
	// userDao.updatePasswordById(entryptPassword(newPassword), id);
	// systemRealm.clearCachedAuthorizationInfo(loginName);
	// }// systemService.entryptPassword(user);

	@Transactional(readOnly = false)
	public void updatePasswordById(User user, String newPassword) {
		user.setPlainPassword(newPassword);
		entryptPassword(user);
		userDao.save(user);
		// userDao.updatePasswordById(entryptPassword(newPassword),
		// user.getId());
		systemRealm.clearCachedAuthorizationInfo(user.getLoginName());
	}

	@Transactional(readOnly = false)
	public void updateUserLoginInfo(Long id) {
		userDao.updateLoginInfo(SecurityUtils.getSubject().getSession()
				.getHost(), new Date(), id);
	}

	// /**
	// * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
	// *
	// * @deprecated
	// */
	// public static String entryptPassword(String plainPassword) {
	// byte[] salt = Digests.generateSalt(SALT_SIZE);
	// byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt,
	// HASH_INTERATIONS);
	// return Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword);
	// }

	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	public void entryptPassword(User user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),
				salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}

	/**
	 * 取出Shiro中的当前用户LoginName.
	 */
	private String getCurrentUserName() {
		// 当改为SSO之后，subject.getPrincipal()返回的是用户名
		// ShiroUser user = (ShiroUser)
		// SecurityUtils.getSubject().getPrincipal();
		// return user.loginName;
		return (String) SecurityUtils.getSubject().getPrincipal();
	}

	/**
	 * 验证密码
	 * 
	 * @param plainPassword
	 *            明文密码
	 * 
	 * @param oldsalt
	 *            加密
	 * 
	 * @param password
	 *            密文密码
	 * @return 验证成功返回true
	 */
	public static boolean validatePassword(String plainPassword,
			String oldsalt, String password) {
		// byte[] salt = Encodes.decodeHex(oldsalt);// password.substring(0,
		// 16));
		// byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt,
		// HASH_INTERATIONS);
		// Log.warn("plainPassword:" + plainPassword + "||||password:" +);
		// return password.equals(Encodes.encodeHex(salt)
		// + Encodes.encodeHex(hashPassword));

		byte[] salt = Encodes.decodeHex(oldsalt);// password.substring(0, 16));
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt,
				HASH_INTERATIONS);
		logger.debug("Old:" + password + "||||typed:"
				+ Encodes.encodeHex(hashPassword));
		return password.equals(Encodes.encodeHex(hashPassword));
	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(User user) {
		return ((user.getId() != null) && (user.getId() == 1L));
	}

	/**
	 * 判断是否超级管理员.
	 */
	private boolean isSupervisor(Long id) {
		return id == 1;
	}

	/**
	 * daLiu 获取值班人员
	 * 
	 * @return
	 */
	public List<User> findUserList() {
		return userDao.findAllList();
	}

	// -- Role Service --//

	public Role getRole(Long id) {
		return roleDao.get(id);
	}

	public Role findRoleByName(String name) {
		return roleDao.findByName(name);
	}

	public List<Role> findAllRole() {
		// User user = UserUtils.getUser();
		DetachedCriteria dc = roleDao.createDetachedCriteria();
		// dc.createAlias("office", "office");
		// dc.createAlias("userList", "userList", JoinType.LEFT_OUTER_JOIN);
		// dc.add(dataScopeFilter(user, "office", "userList"));
		dc.add(Restrictions.eq(Role.FIELD_DEL_FLAG, Role.DEL_FLAG_NORMAL));
		dc.addOrder(Order.asc("name"));// addOrder(Order.asc("office.code")).
		return roleDao.find(dc);
	}

	@Transactional(readOnly = false)
	public void saveRole(Role role) {
		roleDao.clear();
		roleDao.save(role);
		systemRealm.clearAllCachedAuthorizationInfo();
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
		// 同步到Activiti
		// saveActivitiGroup(role);
	}

	@Transactional(readOnly = false)
	public void deleteRole(Long id) {
		roleDao.deleteById(id);
		systemRealm.clearAllCachedAuthorizationInfo();
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
		// 同步到Activiti
		// deleteActivitiGroup(roleDao.get(id));
	}

	@Transactional(readOnly = false)
	public void deleteMultiRole(String ids) {
		StringTokenizer delTokens = new StringTokenizer(ids, ",");
		while (delTokens.hasMoreTokens()) {
			Long id = Long.valueOf(delTokens.nextToken());
			roleDao.deleteById(id);
			// 此操作可放到最后
			// systemRealm.clearAllCachedAuthorizationInfo();
			// 同步到Activiti
			// deleteActivitiGroup(roleDao.get(id));
		}
		systemRealm.clearAllCachedAuthorizationInfo();
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
	}

	@Transactional(readOnly = false)
	public Boolean outUserInRole(Role role, Long userId) {
		User user = userDao.get(userId);
		List<Long> roleIds = user.getRoleIdList();
		List<Role> roles = user.getRoleList();
		//
		if (roleIds.contains(role.getId())) {
			roles.remove(role);
			saveUser(user);
			return true;
		}
		return false;
	}

	@Transactional(readOnly = false)
	public User assignUserToRole(Role role, Long userId) {
		User user = userDao.get(userId);
		List<Long> roleIds = user.getRoleIdList();
		if (roleIds.contains(role.getId())) {
			return null;
		}
		user.getRoleList().add(role);
		saveUser(user);
		return user;
	}

	// -- Menu Service --//

	public Menu getMenu(Long id) {
		return menuDao.get(id);
	}

	public List<Menu> findAllMenu() {
		return UserUtils.getMenuList();
	}

	@Transactional(readOnly = false)
	public void saveMenu(Menu menu) {
		menu.setParent(this.getMenu(menu.getParent().getId()));
		String oldParentIds = menu.getParentIds(); // 获取修改前的parentIds，用于更新子节点的parentIds
		menu.setParentIds(menu.getParent().getParentIds()
				+ menu.getParent().getId() + ",");
		menuDao.clear();
		menuDao.save(menu);
		// 更新子节点 parentIds
		List<Menu> list = menuDao.findByParentIdsLike("%," + menu.getId()
				+ ",%");
		for (Menu e : list) {
			e.setParentIds(e.getParentIds().replace(oldParentIds,
					menu.getParentIds()));
		}
		menuDao.save(list);
		systemRealm.clearAllCachedAuthorizationInfo();
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
		// 同步到Activiti
		// saveActiviti(menu);
	}

	@Transactional(readOnly = false)
	public void deleteMenu(Long id) {
		menuDao.deleteById(id, "%," + id + ",%");
		systemRealm.clearAllCachedAuthorizationInfo();
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
		// 同步到Activiti
		// deleteActiviti(id);
	}

	// /////////////// Synchronized to the Activiti //////////////////

	// /**
	// * 手工同步所有Activiti数据
	// */
	// @Transactional(readOnly = false)
	// public void synToActiviti() {
	// try {
	// menuDao.updateBySql("delete from ACT_ID_MEMBERSHIP", null);
	// menuDao.updateBySql("delete from ACT_ID_GROUP", null);
	// menuDao.updateBySql("delete from ACT_ID_USER", null);
	//
	// List<Group> activitiGroupList = identityService.createGroupQuery()
	// .list();
	// List<org.activiti.engine.identity.User> activitiUserList =
	// identityService
	// .createUserQuery().list();
	// if (activitiGroupList.size() == 0 && activitiUserList.size() == 0) {
	// // 同步时候添加所有用户，所有组，以及关联关系，之后增删改用户，增删改角色时不需要判断用户，组是否存在。
	// List<User> userList = userDao.findAllList();
	// for (User user : userList) {
	// org.activiti.engine.identity.User activitiUesr = identityService
	// .newUser(ObjectUtils.toString(user.getId()));
	// identityService.saveUser(activitiUesr);
	// }
	// for (Menu menu : menuDao.findAllActivitiList()) {
	// if (StringUtils.isNotEmpty(menu.getActivitiGroupId())) {
	// Group group = identityService.newGroup(menu
	// .getActivitiGroupId());
	// identityService.saveGroup(group);
	// }
	// }
	// // 创建关联关系
	// for (User user : userList) {
	// List<Menu> menuList = menuDao.findAllActivitiList(user
	// .getId());
	// if (!Collections3.isEmpty(menuList)) {
	// for (Menu menu : menuList) {
	// if (StringUtils.isNotEmpty(menu
	// .getActivitiGroupId())) {
	// identityService.createMembership(
	// ObjectUtils.toString(user.getId()),
	// menu.getActivitiGroupId());
	// }
	// }
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void saveActiviti(Role role) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (role != null) {
	// List<User> userList = roleDao.get(role.getId()).getUserList();
	// if (!Collections3.isEmpty(userList)) {
	// for (User user : userList) {
	// String userId = ObjectUtils.toString(user.getId());
	// org.activiti.engine.identity.User activitiUser = identityService
	// .createUserQuery().userId(userId)
	// .singleResult();
	// // 是新增用户
	// if (activitiUser == null) {
	// activitiUser = identityService.newUser(userId);
	// identityService.saveUser(activitiUser);
	// }
	// // 同步用户角色关联数据
	// List<Menu> menuList = menuDao.findAllActivitiList(user
	// .getId());
	// merge(user, menuList);
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void deleteActiviti(Role role) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (role != null) {
	// List<User> userList = roleDao.get(role.getId()).getUserList();
	// if (!Collections3.isEmpty(userList)) {
	// for (User user : userList) {
	// List<Menu> menuList = menuDao.findAllActivitiList(user
	// .getId());
	// merge(user, menuList);
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void saveActiviti(User user) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (user != null) {
	// String userId = ObjectUtils.toString(user.getId());
	// org.activiti.engine.identity.User activitiUser = identityService
	// .createUserQuery().userId(userId).singleResult();
	// // 是新增用户
	// if (activitiUser == null) {
	// activitiUser = identityService.newUser(userId);
	// identityService.saveUser(activitiUser);
	// }
	// // 同步用户角色关联数据
	// List<Menu> menuList = menuDao.findAllActivitiList(user.getId());
	// merge(user, menuList);
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void deleteActiviti(User user) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (user != null ) {
	// String userId = ObjectUtils.toString(user.getId());
	// identityService.deleteUser(userId);
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void saveActiviti(Menu menu) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (menu != null) {
	// Group group = identityService.createGroupQuery()
	// .groupId(menu.getActivitiGroupId()).singleResult();
	// if (group != null) {
	// identityService.deleteGroup(group.getId());
	// }
	// if (Menu.YES.equals(menu.getIsActiviti())
	// && StringUtils.isNotBlank(menu.getActivitiGroupId())) {
	// group = identityService.newGroup(menu.getActivitiGroupId());
	// group.setName(menu.getActivitiGroupName());
	// identityService.saveGroup(group);
	// List<Role> roleList = menuDao.get(menu.getId())
	// .getRoleList();
	// if (!Collections3.isEmpty(roleList)) {
	// for (Role role : roleList) {
	// List<User> userList = role.getUserList();
	// if (!Collections3.isEmpty(userList)) {
	// for (User user : userList) {
	// identityService.createMembership(
	// ObjectUtils.toString(user.getId()),
	// menu.getActivitiGroupId());
	// }
	// }
	// }
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// private void deleteActiviti(String id) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// if (id != null) {
	// Menu menu = menuDao.get(id);
	// if (Menu.YES.equals(menu.getIsActiviti())
	// && StringUtils.isNotBlank(menu.getActivitiGroupId())) {
	// identityService.deleteGroup(menu.getActivitiGroupId());
	// }
	// if (menu != null) {
	// List<Menu> menuList = menuDao.findByParentIdsLike("%,"
	// + menu.getId() + ",%");
	// for (Menu m : menuList) {
	// if (Menu.YES.equals(menu.getIsActiviti())
	// && StringUtils.isNotBlank(m
	// .getActivitiGroupId())) {
	// identityService.deleteGroup(m.getActivitiGroupId());
	// }
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// @SuppressWarnings("unchecked")
	// private void merge(User user, List<Menu> menuList) {
	// if (!Global.isSynActivitiIndetity()) {
	// return;
	// }
	// try {
	// String userId = ObjectUtils.toString(user.getId());
	// List<Group> activitiGroupList = identityService.createGroupQuery()
	// .groupMember(userId).list();
	// if (Collections3.isEmpty(menuList)) {
	// for (Group group : activitiGroupList) {
	// identityService.deleteMembership(userId, group.getId());
	// }
	// } else {
	// Map<String, String> groupMap = Maps.newHashMap();
	// for (Menu menu : menuList) {
	// groupMap.put(menu.getActivitiGroupId(),
	// menu.getActivitiGroupName());
	// }
	// Map<String, String> activitiGroupMap = Collections3
	// .extractToMap(activitiGroupList, "id", "name");
	// for (String groupId : activitiGroupMap.keySet()) {
	// if (StringUtils.isNotBlank(groupId)
	// && !groupMap.containsKey(groupId)) {
	// identityService.deleteMembership(userId, groupId);
	// }
	// }
	// for (String groupId : groupMap.keySet()) {
	// if (StringUtils.isNotBlank(groupId)
	// && !activitiGroupMap.containsKey(groupId)) {
	// identityService.createMembership(userId, groupId);
	// }
	// }
	// }
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	// /////////////// Synchronized to the Activiti end //////////////////

}
