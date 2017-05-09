package com.web.modules.sys.dao.dict;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.dict.Station;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StationDao extends BaseDao<Station> {
	public int deleteById(Long id) {
		return this.updateDelFlag(id, Station.DEL_FLAG_DELETE);
	}

	public List<Station> findAllList() {
		return find("from Station where delFlag=:p1 order by sort",
				new Parameter(Station.DEL_FLAG_NORMAL));
	}

	public List<Station> findStation(String name) {
		return find(
				"from Station where delFlag=:p1 and name=:p2 order by sort",
				new Parameter(Station.DEL_FLAG_NORMAL, name));
	}

	public List<Station> findAllByStationType(String type) {
		return find(
				"from Station where delFlag=:p1 and stationType=:p2 order by sort",
				new Parameter(Station.DEL_FLAG_NORMAL, type));
	}
}
