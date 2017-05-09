/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.google.common.collect.Lists;
import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Bridge;
import com.web.modules.sys.entity.Catalog;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:桥梁DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午2:31:14
 */
@Repository
public class BridgeDao extends BaseDao<Bridge> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, Bridge.DEL_FLAG_DELETE);
	}

	public List<Bridge> findAllList(){
		return find("from Bridge where delFlag=:p1 order by sort", new Parameter(Bridge.DEL_FLAG_NORMAL));
		
	}
	
	public List<Catalog> getMenuType(Long catalogid, String menuType){
		List<Catalog> list = Lists.newArrayList();
		if("3".equals(menuType)){
			list = find("from Catalog where delFlag=:p1 and parentIds like :p2 order by id", new Parameter(
					Catalog.DEL_FLAG_NORMAL, "%."+catalogid));
		}else if("4".equals(menuType)){
			list = find("from Catalog where delFlag=:p1 and id=:p2", new Parameter(
					Catalog.DEL_FLAG_NORMAL, catalogid));
		}
		return list;
	}
	
	public List<Bridge> findGisData(String gclsId, String gcode){
		return find("from Bridge where gclsId=:p1 and gcode=:p2 and delFlag=:p3 order by sort", new Parameter(
				gclsId, gcode, Bridge.DEL_FLAG_NORMAL));
	}

}