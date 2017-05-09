package com.web.modules.sys.dao.dict;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.dict.Line;
import com.web.modules.sys.entity.dict.LineStation;
import com.web.modules.sys.entity.dict.Station;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LineStationDao extends BaseDao<LineStation> {
	public int deleteById(Long id) {
		return this.updateDelFlag(id, LineStation.DEL_FLAG_DELETE);
	}

	public List<LineStation> findByLine(Long lineId) {
		return find(
				"from LineStation where delFlag=:p1 and line.id =:p2 and line.delFlag=:p3 order by sort",
				new Parameter(Station.DEL_FLAG_NORMAL, lineId,
						Line.DEL_FLAG_NORMAL));
	}

	public List<LineStation> findByLineIdStartEndStationSort(Long lineId,
                                                             Float startStationSort, Float endStationSort) {
		return find(
				"from LineStation where delFlag=:p1 and line.id =:p2 and line.delFlag=:p3 and sort between :p4 and :p5 order by sort",
				new Parameter(Station.DEL_FLAG_NORMAL, lineId,
						Line.DEL_FLAG_NORMAL, startStationSort, endStationSort));
	}
}
