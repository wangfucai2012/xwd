/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.data.work.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.BearingPlatform;
import org.springframework.stereotype.Repository;

import java.util.List;


/**
 * 
 *  @description:承台DAO接口
 *  @author:wangjianwei 
 *  @create Date:2016年4月22日 下午2:23:32
 */
@Repository
public class BearingPlatformDao extends BaseDao<BearingPlatform> {

	public int deleteById(Long id) {
		return this.updateDelFlag(id, BearingPlatform.DEL_FLAG_DELETE);
	}

	public List<BearingPlatform> findAllList(){
		return find("from BearingPlatform where delFlag=:p1 order by sort", new Parameter(BearingPlatform.DEL_FLAG_NORMAL));
		
	}

}