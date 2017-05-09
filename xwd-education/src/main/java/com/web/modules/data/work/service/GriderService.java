package com.web.modules.data.work.service;

import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.data.work.dao.GriderDao;
import com.web.modules.data.work.entity.Grider;
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
 *  @description:梁面Service
 *  @author:wangjianwei 
 *  @create Date:2016年4月25日 上午9:13:39
 */
@Service
@Transactional(readOnly = true)
public class GriderService extends BaseService {
	@Autowired
	private GriderDao dao;

	public Grider get(Long id) {
		return dao.get(id);
	}

	public Page<Grider> find(Page<Grider> page, Grider entity, Long catalogid) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Grider.FIELD_DEL_FLAG, Grider.DEL_FLAG_NORMAL));
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
            dc.add(Restrictions.ge("startM",entity.getStartM()));
        }
        if(entity.getEndM()!=null && !entity.getEndM().equals("")){
            dc.add(Restrictions.le("endM", entity.getEndM()));
        }

		//modi 按中心里程升序
		dc.addOrder(Order.asc("centerM"));
		return dao.find(page, dc);
	}
	
	public List<Grider> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Grider entity) {
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
		res.put("type","梁类型");
		res.put("length","长度");
		res.put("width","宽度");
		res.put("height","梁标高");
		res.put("baseHeight","梁底高");
		res.put("bridge","所属桥梁");
		res.put("bridge.bridgeName","所属桥梁");
		res.put("pier","所属墩身");
		res.put("pier.pnumber","所属墩身");
		res.put("ass","所属固资");
		res.put("ass.name","所属固资");
		
		res.put("loss","梁圬工方");
		res.put("spans","跨度");
		res.put("changeYear","换梁年代");
		res.put("pattern","梁式样");
		res.put("patternCode","梁式样代码");
		res.put("hole","孔别");
		res.put("layYear","枕铺设年度");
		res.put("drawNo","定型图号");
		res.put("designLimits","设计限界");
		res.put("kinds","梁种类");
		res.put("clearHole","净孔");
		res.put("weight","梁重");
		res.put("volume","梁体积");
		res.put("maincenterSpace","主梁中心距");
		res.put("ordinatecenterSpace","纵梁中心距");
		res.put("ordinateHeight","纵梁高");
		res.put("desliveload","设计活载");
		res.put("carryCoefficient","承载系数");
		res.put("controlPostion","控制部位");
		res.put("paintingYear","钢梁涂装年");
		res.put("bend","挠度");
		res.put("fastenerType","扣件类型");
		res.put("fastenerNum","扣件数量");
		res.put("plateType","轨枕类型");
		res.put("plateNum","轨枕数量");
		res.put("steelrailType","钢轨类型");
		res.put("glzfcxjg","钢梁振幅超限加固");
		res.put("rcbulkNum","混凝土梁横隔板数");
		res.put("rcbulkJoin","混凝土梁横隔板连接");
		res.put("limitEq","梁端限位装置");
		res.put("rcbzljg","混凝土并置梁加固");
		res.put("dzcwidth","道碴槽宽度");
		res.put("thickness","圬工梁跨中道碴厚度");
		res.put("footwalkMaterial","人行道材质");
		res.put("footwalkWidth","人行道宽");
		res.put("fixcheckEq","固定检查设备");
		res.put("gtly","公铁两用");
		
		return res;
	}

	/**
	 * Add by lutao on 2016/06/25
	 * 根据GIS平台的数据获取详细的信息
	 * @param gclsId
	 * @param gcode
     * @return
     */
	public Grider getByGclsidAndGcode(String gclsId, String gcode){
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Grider.FIELD_DEL_FLAG, Grider.DEL_FLAG_NORMAL));
		if(gclsId!=null){
			dc.add(Restrictions.eq("gclsId",gclsId));
		}
		if(gcode!=null){
			dc.add(Restrictions.eq("gcode",gcode));
		}
		List<Grider> ls = dao.find(dc);
		if(ls!=null&&ls.size()>0){
			return ls.get(0);
		}else{
			return new Grider();
		}
	}
}
