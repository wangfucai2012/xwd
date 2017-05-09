/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.sys.service;

import com.web.commons.service.BaseService;
import com.web.commons.utils.DateUtils;
import com.web.commons.utils.StringUtils;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.LogDao;
import com.web.modules.sys.entity.Log;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;
import java.util.Objects;

/**
 * 日志Service
 * 
 * @author ThinkGem
 * @version 2013-6-2
 */
@Service
@Transactional(readOnly = true)
public class LogService extends BaseService {

	@Autowired
	private LogDao logDao;

	public Log get(Long id) {
		return logDao.get(id);
	}

	public Page<Log> find(Page<Log> page, Map<String, Object> paramMap) {
		DetachedCriteria dc = logDao.createDetachedCriteria();

		Long createById = StringUtils.toLong(paramMap.get("createById"));
		if (createById > 0) {
			dc.add(Restrictions.eq("createBy.id", createById));
		}

		String requestUri = Objects.toString(paramMap.get("requestUri"));
		// 下边是旧的方法，但是在Java7中采用 Objects.toString，所以已经废弃
		// ObjectUtils.toString(paramMap.get("requestUri"));
		if (StringUtils.isNotBlank(requestUri)) {
			dc.add(Restrictions.like("requestUri", "%" + requestUri + "%"));
		}

		String exception = Objects.toString(paramMap.get("exception"));
		// 下边是旧的方法，但是在Java7中采用 Objects.toString，所以已经废弃
		// ObjectUtils.toString(paramMap.get("exception"));
		if (StringUtils.isNotBlank(exception)) {
			dc.add(Restrictions.eq("type", Log.TYPE_EXCEPTION));
		}

		Date beginDate = DateUtils.parseDate(paramMap.get("beginDate"));
		if (beginDate == null) {
			beginDate = DateUtils.setDays(new Date(), 1);
			paramMap.put("beginDate",
			DateUtils.formatDate(beginDate, "yyyy-MM-dd"));
		}
		Date endDate = DateUtils.parseDate(paramMap.get("endDate"));
		if (endDate == null) {
			endDate = DateUtils.addDays(DateUtils.addMonths(beginDate, 1), -1);
			paramMap.put("endDate", DateUtils.formatDate(endDate, "yyyy-MM-dd"));
		}
		dc.add(Restrictions.between("createDate", beginDate, endDate));

		dc.addOrder(Order.desc("id"));
		return logDao.find(page, dc);
	}

}
