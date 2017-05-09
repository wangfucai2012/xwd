package com.web.modules.data.work.service;

import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.data.work.dao.PierDao;
import com.web.modules.data.work.entity.Pier;
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
 *  @description:墩身Service
 *  @author:wangjianwei 
 *  @create Date:2016年4月25日 上午9:14:32
 */
@Service
@Transactional(readOnly = true)
public class PierService extends BaseService {
	@Autowired
	private PierDao dao;

	public Pier get(Long id) {
		return dao.get(id);
	}

	public Page<Pier> find(Page<Pier> page, Pier entity, Long catalogid) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Pier.FIELD_DEL_FLAG, Pier.DEL_FLAG_NORMAL));
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
	
	public List<Pier> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Pier entity) {
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
		res.put("pnumber","墩台号");
		res.put("designM","设计里程");
		res.put("centerM","中心里程");
		res.put("endM","起始里程");
		res.put("startM","终止里程");
		res.put("type","墩身类型");
		res.put("hwd","墩身长宽高");
		res.put("pLength","墩身长");
		res.put("pWidth","墩身宽");
		res.put("pHeight","墩身高");
		res.put("hollow","是否空心");
		res.put("hwidth","空心宽度");
		res.put("loss","墩身圬工方");
		res.put("topHeight","墩顶高");
		
		res.put("bridge","所属桥梁");
		res.put("bridge.bridgeName","所属桥梁");
		res.put("ass","所属固资");
		res.put("ass.name","所属固资");
		res.put("hole","孔别");
		res.put("baseHeight","墩基底高");
		res.put("drawNo","墩台定型图号");
		res.put("maxScourline","最大冲刷线");
		res.put("material","墩材质");
		res.put("baseType","墩基础式样");
		res.put("basematerial","墩基础材质");
		res.put("baseGeology","墩基底地质");
		return res;
	}

	/**
	 * Add by lutao on 2016/06/25
	 * 根据GIS平台的数据获取详细的信息
	 * @param gclsId
	 * @param gcode
     * @return
     */
	public Pier getByGclsidAndGcode(String gclsId, String gcode){
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Pier.FIELD_DEL_FLAG, Pier.DEL_FLAG_NORMAL));
		if(gclsId!=null){
			dc.add(Restrictions.eq("gclsId",gclsId));
		}
		if(gcode!=null){
			dc.add(Restrictions.eq("gcode",gcode));
		}
		List<Pier> ls = dao.find(dc);
		if(ls!=null&&ls.size()>0){
			return ls.get(0);
		}else{
			return new Pier();
		}
	}
}
