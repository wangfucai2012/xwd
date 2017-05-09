package com.web.modules.sys.service.dict;

import com.google.common.collect.Lists;
import com.web.commons.service.BaseService;
import com.web.commons.utils.StringUtils;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.dict.LineStationDao;
import com.web.modules.sys.dao.dict.StationDao;
import com.web.modules.sys.entity.dict.LineStation;
import com.web.modules.sys.entity.dict.Station;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.StringTokenizer;

/**
 * 名称：车站Service<br/>
 * 
 * @author 封博卿 nanxiaoqiang
 * 
 */
@Service
@Transactional(readOnly = true)
public class StationService extends BaseService {
	@Autowired
	private StationDao stationDao;

	@Autowired
	private LineStationDao lineStationDao;

	/**
	 * @Title: getByName
	 * @Description: 根据名称得到相应的站
	 * @param name
	 * @return
	 * @return Station
	 * @throws
	 */
	public Station getByName(String name) {
		DetachedCriteria dc = stationDao.createDetachedCriteria();
		// 删除标记
		dc.add(Restrictions.eq(Station.FIELD_DEL_FLAG, Station.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("name", name));
		List<Station> stationList = stationDao.find(dc);
		if (stationList != null && stationList.size() != 0) {
			return stationList.get(0);
		} else {
			return null;
		}
	}

	public Station get(Long id) {
		return stationDao.get(id);
	}

	public List<Station> findAll() {
		return stationDao.findAllList();
	}

	public List<Station> findAllByStationType(String type) {
		if (StringUtils.isBlank(type)) {
			return findAll();
		}
		return stationDao.findAllByStationType(type);
	}

	public Page<Station> find(Page<Station> page, Station entity,
                              boolean isDataScopeFilter) {
		DetachedCriteria dc = stationDao.createDetachedCriteria();
		// 根据名称查找预案
		if (StringUtils.isNotEmpty(entity.getName())) {
			dc.add(Restrictions.like("name", "%" + entity.getName() + "%"));
		}

		// 删除标记
		dc.add(Restrictions.eq(Station.FIELD_DEL_FLAG, entity.getDelFlag()));
		return stationDao.find(page, dc);
	}

	@Transactional(readOnly = false)
	public void save(Station entity) {
		stationDao.clear();
		stationDao.save(entity);
	}

	public Station getEntity(Long id) {
		return stationDao.get(id);
	}

	@Transactional(readOnly = false)
	public void delete(Long id) {
		stationDao.deleteById(id);
	}

	@Transactional(readOnly = false)
	public void deleteMulti(String ids) {
		StringTokenizer delTokens = new StringTokenizer(ids, ",");
		while (delTokens.hasMoreTokens()) {
			Long id = Long.valueOf(delTokens.nextToken());
			stationDao.deleteById(id);

		}
	}

	/**
	 * 根据线路ID返回该线路的所有车站，按照站序
	 * 
	 * @param lineId
	 * @param type
	 *            车站类型：null 或者"" 所有
	 * @return
	 */
	public List<Station> findByLineId(Long lineId, String type) {
		List<LineStation> stations = lineStationDao.findByLine(lineId);
		List<Station> temp = Lists.newArrayList();
		for (LineStation ls : stations) {
			if (StringUtils.isBlank(type)) {
				temp.add(ls.getStation());
			} else {
				if (ls.getStation().getStationType().equals(type)) {
					temp.add(ls.getStation());
				}
			}
		}
		return temp;
	}

	/**
	 * 返回所有的所，包括车辆段等
	 * 
	 * @param lineId
	 * @return
	 */
	public List<Station> findAllByLineId(Long lineId) {
		return findByLineId(lineId, null);
	}

    /**
     * 根据路局排序，获取所有车站
     * @return
     */
	public List<Station> findAllByOrderRail(){
		String hql="select s from Station s LEFT JOIN s.rail r where s.delFlag='0' order by r.sort,s.sort";
		return stationDao.find(hql);
	}

}
