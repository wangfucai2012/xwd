package com.web.modules.sys.service.dict;

import com.web.commons.service.BaseService;
import com.web.commons.utils.StringUtils;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.dict.LineDao;
import com.web.modules.sys.entity.dict.Line;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.StringTokenizer;

/**
 * 名称：线路Service<br/>
 * 
 * @author 封博卿
 *
 */
@Service
@Transactional(readOnly = true)
public class LineService extends BaseService {
	@Autowired
	private LineDao lineDao;

	public Line get(Long id) {
		return lineDao.get(id);
	}

	public Line findName(String name) {
		List<Line> list = lineDao.findName(name);
		if (list != null && list.size() > 0)
			return list.get(0);
		else
			return null;

	}

	public List<Line> findAll() {
		return lineDao.findAllList();
	}

	public Page<Line> find(Page<Line> page, Line entity,
                           boolean isDataScopeFilter) {
		DetachedCriteria dc = lineDao.createDetachedCriteria();
		// 根据名称查找预案
		if (StringUtils.isNotEmpty(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}

		// 删除标记
		dc.add(Restrictions.eq(Line.FIELD_DEL_FLAG, entity.getDelFlag()));
		return lineDao.find(page, dc);
	}

	@Transactional(readOnly = false)
	public void save(Line entity) {
		lineDao.clear();
		lineDao.save(entity);
	}

	// public Line getEntity(Long id) {
	// return lineDao.get(id);
	// }

	@Transactional(readOnly = false)
	public void delete(Long id) {
		lineDao.deleteById(id);
	}

	@Transactional(readOnly = false)
	public void deleteMulti(String ids) {
		StringTokenizer delTokens = new StringTokenizer(ids, ",");
		while (delTokens.hasMoreTokens()) {
			Long id = Long.valueOf(delTokens.nextToken());
			lineDao.deleteById(id);

		}
	}
}
