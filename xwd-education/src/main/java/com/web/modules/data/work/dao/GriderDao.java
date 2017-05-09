/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Grider;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:梁面DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午2:46:11
 */
@Repository
public class GriderDao extends BaseDao<Grider> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Grider.DEL_FLAG_DELETE);
	}

	public List<Grider> findAllList(){
		return find("from Grider where delFlag=:p1 order by sort", new Parameter(Grider.DEL_FLAG_NORMAL));
		
	}

}