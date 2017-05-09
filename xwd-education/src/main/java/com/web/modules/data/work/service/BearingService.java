package com.web.modules.data.work.service;

import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.data.work.dao.BearingDao;
import com.web.modules.data.work.entity.Bearing;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;


/**
 * 
 *  @description:支座Service
 *  @author:wangjianwei 
 *  @create Date:2016年4月25日 上午9:02:00
 */
@Service
@Transactional(readOnly = true)
public class BearingService extends BaseService {
	@Autowired
	private BearingDao dao;

	public Bearing get(Long id) {
		return dao.get(id);
	}

	public Page<Bearing> find(Page<Bearing> page, Bearing entity, Long catalogid) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Bearing.FIELD_DEL_FLAG, Bearing.DEL_FLAG_NORMAL));
		if(catalogid!=null){
			dc.createAlias("cat", "lg");
	        dc.add(Restrictions.or(Restrictions.eq("cat.id", catalogid),Restrictions.like("lg.parentIds", "%"+catalogid.toString()+"%")));
		}
		
		/**
		 * GIS使用
		 */
		if(entity.getLabel()!=null && !entity.getLabel().trim().equals("")){
			dc.add(Restrictions.like("label",entity.getLabel()));
		}
		if(entity.getMstart()!=null && !entity.getMstart().equals("")){
			dc.add(Restrictions.ge("centerM",entity.getMstart()));
		}
		if(entity.getMend()!=null && !entity.getMend().equals("")){
			dc.add(Restrictions.le("centerM",entity.getMend()));
		}
		
        if(entity.getStartM()!=null && !entity.getStartM().equals("")) {
            dc.add(Restrictions.ge("centerM",entity.getStartM()));
        }
        if(entity.getEndM()!=null && !entity.getEndM().equals("")){
            dc.add(Restrictions.le("centerM", entity.getEndM()));
        }
		//modi 按中心里程升序
		dc.addOrder(Order.asc("centerM"));
		return dao.find(page, dc);
	}
	
	public List<Bearing> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Bearing entity) {
		dao.clear();
		dao.save(entity);
		dao.flush();
	}

	@Transactional(readOnly = false)
	public void delete(Long id) {
		dao.deleteById(id);
	}
	
	@Transactional(readOnly = false)
	public void deleteMulti(String ids) {
		StringTokenizer delTokens = new StringTokenizer(ids, ",");
		while (delTokens.hasMoreTokens()) {
			Long id = Long.valueOf(delTokens.nextToken());
			dao.deleteById(id);
		
		}
	}
	
	/**
	 * Add by lutao on 2016/06/23
	 * 这是GIS中的字段和对应的字段含义（表头）对应，需要统一，第一列必须为ID
	 * @return
     */
	public Map<String,String> getGisTitle() {
		Map<String,String> res = Maps.newLinkedHashMap();
		res.put("id","编号");
		res.put("centerM","中心里程");
		res.put("startM","起始里程");
		res.put("endM","终止里程");
		res.put("type","支座类型");
		res.put("pierNo","墩身编号");
		res.put("bridge.bridgeName","所属桥梁");
		res.put("pier.pnumber","所属墩身");
		res.put("ass.name","所属固资");
		res.put("heights","支座高度");
		res.put("numbers","数量");
		return res;
	}

	/**
	 * Add by lutao on 2016/06/25
	 * 根据GIS平台的数据获取详细的信息
	 * @param gclsId
	 * @param gcode
     * @return
     */
	public Bearing getByGclsidAndGcode(String gclsId, String gcode){
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Bearing.FIELD_DEL_FLAG, Bearing.DEL_FLAG_NORMAL));
		if(gclsId!=null){
			dc.add(Restrictions.eq("gclsId",gclsId));
		}
		if(gcode!=null){
			dc.add(Restrictions.eq("gcode",gcode));
		}
		List<Bearing> ls = dao.find(dc);
		if(ls!=null&&ls.size()>0){
			return ls.get(0);
		}else{
			return new Bearing();
		}
	}
}
