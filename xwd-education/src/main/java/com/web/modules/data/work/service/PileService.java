package com.web.modules.data.work.service;

import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.data.work.dao.PileDao;
import com.web.modules.data.work.entity.Pile;
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
 *  @description:桩基Service
 *  @author:wangjianwei 
 *  @create Date:2016年4月25日 上午9:16:55
 */
@Service
@Transactional(readOnly = true)
public class PileService extends BaseService {
	@Autowired
	private PileDao dao;

	public Pile get(Long id) {
		return dao.get(id);
	}

	public Page<Pile> find(Page<Pile> page, Pile entity, Long catalogid) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Pile.FIELD_DEL_FLAG, Pile.DEL_FLAG_NORMAL));
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
	
	public List<Pile> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Pile entity) {
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
		res.put("bridge","所属桥梁");
		res.put("bridge.bridgeName","所属桥梁");
		res.put("pier","所属墩身");
		res.put("pier.pnumber","所属墩身");
		res.put("ass","所属固资");
		res.put("ass.name","所属固资");

		res.put("pnumber","钻孔数");
		res.put("diaM","钻孔直径");
		res.put("dlength","钻孔长");
		res.put("array","桩基排列");
		res.put("loss","桩基圬工方");
		return res;
	}

	/**
	 * Add by lutao on 2016/06/25
	 * 根据GIS平台的数据获取详细的信息
	 * @param gclsId
	 * @param gcode
     * @return
     */
	public Pile getByGclsidAndGcode(String gclsId, String gcode){
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Pile.FIELD_DEL_FLAG, Pile.DEL_FLAG_NORMAL));
		if(gclsId!=null){
			dc.add(Restrictions.eq("gclsId",gclsId));
		}
		if(gcode!=null){
			dc.add(Restrictions.eq("gcode",gcode));
		}
		List<Pile> ls = dao.find(dc);
		if(ls!=null&&ls.size()>0){
			return ls.get(0);
		}else{
			return new Pile();
		}
	}
}
