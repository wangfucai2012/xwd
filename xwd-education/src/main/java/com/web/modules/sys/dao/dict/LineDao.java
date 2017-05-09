package com.web.modules.sys.dao.dict;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.dict.Line;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LineDao extends BaseDao<Line> {
	public int deleteById(Long id) {
		return this.updateDelFlag(id, Line.DEL_FLAG_DELETE);
	}

	public List<Line> findAllList() {
		return find("from Line where delFlag=:p1 order by sort", new Parameter(
				Line.DEL_FLAG_NORMAL));
	}

	public List<Line> findName(String name) {
		return find("from Line where delFlag=:p1 and name=:p2 order by sort",
				new Parameter(Line.DEL_FLAG_NORMAL, name));
	}

}
