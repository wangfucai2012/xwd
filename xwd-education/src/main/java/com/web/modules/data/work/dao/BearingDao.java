/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Bearing;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:支座DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午2:26:15
 */
@Repository
public class BearingDao extends BaseDao<Bearing> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Bearing.DEL_FLAG_DELETE);
	}

	public List<Bearing> findAllList(){
		return find("from Bearing where delFlag=:p1 order by sort", new Parameter(Bearing.DEL_FLAG_NORMAL));
		
	}

}