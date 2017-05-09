package com.web.modules.sys.service.account;

import com.web.commons.security.UserUtils;
import com.web.modules.sys.entity.Menu;
import com.web.modules.sys.entity.Role;
import com.web.modules.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@DependsOn({ "userDao", "roleDao", "menuDao" })
public class ShiroCasAccountRealm extends CasRealm {

	private static Logger log = LoggerFactory
			.getLogger(ShiroCasAccountRealm.class);

	@Autowired
	private SystemService systemService;

	public SystemService getSystemService() {
		return systemService;
	}

	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// retrieve user information
		SimplePrincipalCollection principalCollection = (SimplePrincipalCollection) principals;
		List<Object> listPrincipals = principalCollection.asList();
		String username = (String) listPrincipals.get(0);
		// ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		User user = systemService.getUserByLoginName(username);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// 需要根据user得到user能访问的menu，然后循环得到user的menu（就是权限）
		/******* 添加权限 *******/
		// 基于Permission的权限信息
		List<Menu> list = UserUtils.getMenuList();
		for (Menu menu : list) {
			if (StringUtils.isNotBlank(menu.getPermission())) {
				// 添加基于Permission的权限信息
				info.addStringPermission(menu.getPermission());
			}
		}

		/**
		 * Add by Nemo on 2016/06/07
		 * 添加目录权限
		 */
		List<Role> roles = user.getRoleList();
		String catalogs[];
		for(Role role : roles){
			catalogs = new String[]{};
			//普通管理员
			if(role.getCatalogList()!=null){
				catalogs = role.getCatalogList().split(";");
			}

			for(int i=0;i<catalogs.length;i++){
				info.addStringPermission(catalogs[i]);
			}
		}

		//Add by Nemo on 2016/06/08 超级管理员，所有目录权限都有
		if(user.isAdmin()){
			catalogs = new String[]
					{"catalog:gongdian","catalog:gongwu","catalog:tongxin", "catalog:tudi",
							"catalog:xinhao","catalog:fangjian","catalog:jipaishui","catalog:lvfu"};
			for(int i=0;i<catalogs.length;i++){
				info.addStringPermission(catalogs[i]);
			}
		}

		// info.addStringPermissions(role.getPermissionList());
		/******* 添加权限 *******/

		// 更新最后登录IP和时间
		systemService.updateUserLoginInfo(user.getId());
		return info;

	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		CasToken casToken = (CasToken) token;
		if (token == null) {
			return null;
		}

		String ticket = (String) casToken.getCredentials();
		if (!StringUtils.isNotBlank(ticket)) {
			return null;
		}

		TicketValidator ticketValidator = ensureTicketValidator();

		try {
			// contact CAS server to validate service ticket
			System.err.println("连接CAS服务端去做验证...start... ticket:" + ticket
					+ " |CasService:" + getCasService());
			Assertion casAssertion = ticketValidator.validate(ticket,
					getCasService());
			System.err.println("得到casAssertion：" + casAssertion.toString());
			// get principal, user id and attributes
			AttributePrincipal casPrincipal = casAssertion.getPrincipal();
			String userId = casPrincipal.getName();

			// 中间是自定义的
			User user = systemService.getUserByLoginName(userId);
			if (user != null) {
				// 判断只有正常用户才能登陆，已经删除(User.DEL_FLAG_DELETE)和正在审核(User.DEL_FLAG_AUDIT)的都不行。
				if (!user.getDelFlag().equals(User.DEL_FLAG_NORMAL)) {
					throw new DisabledAccountException();
				}
				// // byte[] salt = Encodes.decodeHex(user.getSalt());
				// return new SimpleAuthenticationInfo(new ShiroUser(user),
				// ticket, getName());
				// } else {
				// return null;
			}
			// 中间是自定义的

			log.debug(
					"Validate ticket : {} in CAS server : {} to retrieve user : {}",
					new Object[] { ticket, getCasServerUrlPrefix(), userId });

			Map<String, Object> attributes = casPrincipal.getAttributes();
			// refresh authentication token (user id + remember me)
			casToken.setUserId(userId);
			String rememberMeAttributeName = getRememberMeAttributeName();
			String rememberMeStringValue = (String) attributes
					.get(rememberMeAttributeName);
			boolean isRemembered = rememberMeStringValue != null
					&& Boolean.parseBoolean(rememberMeStringValue);
			if (isRemembered) {
				casToken.setRememberMe(true);
			}
			// create simple authentication info
			List<Object> principals = CollectionUtils
					.asList(userId, attributes);

			//
			principals.add(new ShiroUser(user));

			PrincipalCollection principalCollection = new SimplePrincipalCollection(
					principals, getName());
			SimpleAuthenticationInfo s = new SimpleAuthenticationInfo(
					principalCollection, ticket);
			return s;
		} catch (TicketValidationException e) {
			throw new CasAuthenticationException("Unable to validate ticket ["
					+ ticket + "]", e);
		}
	}

	/**
	 * 清空用户关联权限认证，待下次使用时重新加载
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(
				principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清空所有关联认证
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}
}
