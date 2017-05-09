/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.sys.service;

import com.web.commons.security.UserUtils;
import com.web.commons.service.BaseService;
import com.web.modules.sys.dao.OfficeDao;
import com.web.modules.sys.entity.Dict;
import com.web.modules.sys.entity.Office;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 机构Service
 * @author ThinkGem
 * @version 2013-5-29
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends BaseService {

	@Autowired
	private OfficeDao officeDao;
	
	public Office get(Long id) {
		return officeDao.get(id);
	}
	
	public List<Office> findAll(){
		return UserUtils.getOfficeList();
	}
	
	@Transactional(readOnly = false)
	public void save(Office office) {
		office.setParent(this.get(office.getParent().getId()));
		String oldParentIds = office.getParentIds(); // 获取修改前的parentIds，用于更新子节点的parentIds
		office.setParentIds(office.getParent().getParentIds()+office.getParent().getId()+",");
		officeDao.clear();
		officeDao.save(office);
		// 更新子节点 parentIds
		List<Office> list = officeDao.findByParentIdsLike("%,"+office.getId()+",%");
		for (Office e : list){
			e.setParentIds(e.getParentIds().replace(oldParentIds, office.getParentIds()));
		}
		officeDao.save(list);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Long id) {
		officeDao.deleteById(id, "%,"+id+",%");
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}

	/**
	 * 获取所有路局
	 * @return
     */
	public List<Office> getAllRail(){
		DetachedCriteria dc=officeDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Dict.FIELD_DEL_FLAG, Dict.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("parent.id",2L));// TODO: 京沪公司ID 2  2016/6/30
		dc.add(Restrictions.eq("type","1"));//1 公司
		return officeDao.find(dc);
	}

	/**
	 * 获取站段数据
	 * @param railId
	 * @return
     */
	public List<Office> getDepot(Long railId){
		DetachedCriteria dc=officeDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Dict.FIELD_DEL_FLAG, Dict.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("parent.id",railId));
		dc.add(Restrictions.eq("type","3"));// TODO: 3 小组  2016/6/30
		return officeDao.find(dc);
	}
	/**
	 * 获取区间数据
	 * @param depotId
	 * @return
	 */
	public List<Office> getSection(Long depotId){
		DetachedCriteria dc=officeDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Dict.FIELD_DEL_FLAG, Dict.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("parent.id",depotId));
		//dc.add(Restrictions.eq("type",3));// TODO: 待定 2016/6/30
		return officeDao.find(dc);
	}

}
