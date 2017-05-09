/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Pier;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:桩基DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午3:09:44
 */
@Repository
public class PierDao extends BaseDao<Pier> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Pier.DEL_FLAG_DELETE);
	}

	public List<Pier> findAllList(){
		return find("from Pier where delFlag=:p1 order by sort", new Parameter(Pier.DEL_FLAG_NORMAL));
		
	}
	
	//查出某一桥梁下的墩台
	public List<Pier> findAllListByBri(Long bridgeId){
		return find("from Pier where delFlag=:p1 and bridge.id=:p2 order by sort", 
				new Parameter(Pier.DEL_FLAG_NORMAL, bridgeId));
	}

}