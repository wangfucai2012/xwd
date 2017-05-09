package com.web.modules.sys.service;

import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.SiteDao;
import com.web.modules.sys.entity.Site;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 
 * @description:
 * @author: nanxiaoqiang
 * @version: V1.00
 * @create Date: 2015年5月13日下午2:41:49
 */
@Service
@Transactional(readOnly = true)
public class SiteService extends BaseService {
	@Autowired
	private SiteDao dao;

	public Site get(Long id) {
		return dao.get(id);
	}

	public Page<Site> find(Page<Site> page, Site site) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(site.getName())) {
			dc.add(Restrictions.eq("name", site.getName()));
		}
		if (StringUtils.isNotEmpty(site.getValue())) {
			dc.add(Restrictions.like("value", site.getValue()));
		}
		if (StringUtils.isNotEmpty(site.getUrl())) {
			dc.add(Restrictions.like("url", "%" + site.getUrl() + "%"));
		}
		dc.add(Restrictions.eq(Site.FIELD_DEL_FLAG, Site.DEL_FLAG_NORMAL));
		dc.addOrder(Order.asc("sort")).addOrder(Order.desc("id"));
		return dao.find(page, dc);
	}
	
	public List<Site> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Site site) {
		dao.save(site);
	}

	@Transactional(readOnly = false)
	public void delete(Long id) {
		dao.deleteById(id);
	}
}
