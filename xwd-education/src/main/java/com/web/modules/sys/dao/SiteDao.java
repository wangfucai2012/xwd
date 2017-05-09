package com.web.modules.sys.dao;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.sys.entity.Site;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SiteDao extends BaseDao<Site> {
	
	public int deleteById(Long id) {
		return this.updateDelFlag(id, Site.DEL_FLAG_DELETE);
	}
	
	public List<Site> findAllList(){
		return find("from Site where delFlag=:p1 order by sort", new Parameter(
				Site.DEL_FLAG_NORMAL));
	}
}
