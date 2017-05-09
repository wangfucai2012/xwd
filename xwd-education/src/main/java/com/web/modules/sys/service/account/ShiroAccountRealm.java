package com.web.modules.sys.service.account;

import com.web.commons.security.UserUtils;
import com.web.modules.sys.entity.Menu;
import com.web.modules.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;
import org.springside.modules.utils.Encodes;

import javax.annotation.PostConstruct;
import java.util.List;

@Service
@DependsOn({ "userDao", "roleDao", "menuDao" })
public class ShiroAccountRealm extends AuthorizingRealm {
   @Autowired
   private SystemService systemService;

   public SystemService getSystemService() {
       // if (systemService == null) {
       // systemService = SpringContextHolder.getBean(SystemService.class);
       // }
       return systemService;
   }

   public void setSystemService(SystemService systemService) {
       this.systemService = systemService;
   }

   /*
    * (non-Javadoc)
    *
    * @see
    * org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache
    * .shiro.subject.PrincipalCollection)
    */
   @Override
   protected AuthorizationInfo doGetAuthorizationInfo(
           PrincipalCollection principals) {
       ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
       User user = systemService.getUserByLoginName(shiroUser.getLoginName());
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
       // info.addStringPermissions(role.getPermissionList());
       /******* 添加权限 *******/

       // 更新最后登录IP和时间
       systemService.updateUserLoginInfo(user.getId());
       return info;
   }

   /*
    * (non-Javadoc)
    *
    * @see
    * org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org
    * .apache.shiro.authc.AuthenticationToken)
    */
   @Override
   protected AuthenticationInfo doGetAuthenticationInfo(
           AuthenticationToken authcToken) throws AuthenticationException {
       UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
       User user = systemService.getUserByLoginName(token.getUsername());
       if (user != null) {
           // 判断只有正常用户才能登陆，已经删除(User.DEL_FLAG_DELETE)和正在审核(User.DEL_FLAG_AUDIT)的都不行。
           if (!user.getDelFlag().equals(User.DEL_FLAG_NORMAL)) {
               throw new DisabledAccountException();
           }
           byte[] salt = Encodes.decodeHex(user.getSalt());
           return new SimpleAuthenticationInfo(new ShiroUser(user),
                   user.getPassword(), ByteSource.Util.bytes(salt), getName());
       } else {
           return null;
       }
   }

   /**
    * 设定Password校验的Hash算法与迭代次数.
    */
   @PostConstruct
   public void initCredentialsMatcher() {
       HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(
               SystemService.HASH_ALGORITHM);
       matcher.setHashIterations(SystemService.HASH_INTERATIONS);

       setCredentialsMatcher(matcher);
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
