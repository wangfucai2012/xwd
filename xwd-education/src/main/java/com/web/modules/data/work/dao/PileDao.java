/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Pile;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:桩基DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午3:06:22
 */
@Repository
public class PileDao extends BaseDao<Pile> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Pile.DEL_FLAG_DELETE);
	}

	public List<Pile> findAllList(){
		return find("from Pile where delFlag=:p1 order by sort", new Parameter(Pile.DEL_FLAG_NORMAL));
		
	}

}