/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.sys.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.User;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * 用户DAO接口
 * 
 * @author ThinkGem, nanxiaoqiang
 * @version 2013-01-15
 */
@Repository
public class UserDao extends BaseDao<User> {
	public User findByLoginName(String loginName) {
		return getByHql("from User where delFlag = :p1 and loginName = :p2",
				new Parameter(User.DEL_FLAG_NORMAL, loginName));
	}

	public int deleteById(Long id) {
		return this.updateDelFlag(id, User.DEL_FLAG_DELETE);
	}

	public int updatePasswordById(String newPassword, Long id) {
		// public int updatePasswordById(String newPassword, String id){
		return update("update User set password=:p1 where id = :p2",
				new Parameter(newPassword, id));
	}

	public int updateLoginInfo(String loginIp, Date loginDate, Long id) {
		return update(
				"update User set loginIp=:p1, loginDate=:p2 where id = :p3",
				new Parameter(loginIp, loginDate, id));
	}

	public List<User> findAllList() {
		return find("from User where delFlag=:p1 order by id", new Parameter(
				User.DEL_FLAG_NORMAL));
	}
}