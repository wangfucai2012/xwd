package com.web.modules.sys.service.account;

import com.google.common.base.Objects;
import com.web.modules.sys.entity.User;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
 */
public class ShiroUser implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Long id;
	public String loginName;
	public String name;
	public Map<String, Object> cacheMap;

	public ShiroUser(String loginName, String name) {
		this.loginName = loginName;
		this.name = name;
	}

	public ShiroUser(User user) {
		this.id = user.getId();
		this.loginName = user.getLoginName();
		this.name = user.getName();
	}

	public Long getId() {
		return id;
	}

	public String getLoginName() {
		return loginName;
	}

	public String getName() {
		return name;
	}

	public Map<String, Object> getCacheMap() {
		if (cacheMap == null) {
			cacheMap = new HashMap<String, Object>();
		}
		return cacheMap;
	}

	/**
	 * 本函数输出将作为默认的<shiro:principal/>输出.
	 */
	@Override
	public String toString() {
		return loginName + "(" + name + ")";// 或者loginName？
	}

	/**
	 * 重载hashCode,只计算loginName;
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(loginName);
	}

	/**
	 * 重载equals,只计算loginName;
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		ShiroUser other = (ShiroUser) obj;
		if (loginName == null) {
			if (other.loginName != null) {
				return false;
			}
		} else if (!loginName.equals(other.loginName)) {
			return false;
		}
		return true;
	}
}