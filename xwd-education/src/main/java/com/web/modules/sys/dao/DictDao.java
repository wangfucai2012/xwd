/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.sys.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.Dict;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 字典DAO接口
 * 
 * @author ThinkGem
 * @version 2013-01-15
 */
@Repository
public class DictDao extends BaseDao<Dict> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Dict.DEL_FLAG_DELETE);
	}

	public List<Dict> findAllList() {
		return find("from Dict where delFlag=:p1 order by sort", new Parameter(
				Dict.DEL_FLAG_NORMAL));
	}

	public List<String> findTypeList() {
		return find("select type from Dict where delFlag=:p1 group by type",
				new Parameter(Dict.DEL_FLAG_NORMAL));
	}

	// @Query("from Dict where delFlag='" + Dict.DEL_FLAG_NORMAL +
	// "' and type=?1 order by sort")
	// public List<Dict> findByType(String type);
	//
	// @Query("select label from Dict where delFlag='" + Dict.DEL_FLAG_NORMAL +
	// "' and value=?1 and type=?2")
	// public List<String> findValueByValueAndType(String value, String type);

}