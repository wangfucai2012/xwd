package com.web.modules.data.work.service;

import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.utils.JsonUtil;
import com.web.commons.web.Page;
import com.web.modules.data.work.dao.BridgeDao;
import com.web.modules.data.work.entity.Bridge;
import com.web.modules.sys.entity.Catalog;
import com.web.modules.sys.service.dict.RailService;
import org.apache.commons.lang3.StringUtils;
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
 *  @description:桥梁Service
 *  @author:wangjianwei 
 *  @create Date:2016年4月25日 上午9:04:17
 */
@Service
@Transactional(readOnly = true)
public class BridgeService extends BaseService {
	@Autowired
	private BridgeDao dao;

	public Bridge get(Long id) {
		return dao.get(id);
	}

	@Autowired
	private RailService railService;

	public Page<Bridge> find(Page<Bridge> page, Bridge entity, Long catalogid) {
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Bridge.FIELD_DEL_FLAG, Bridge.DEL_FLAG_NORMAL));
		if(catalogid!=null){
			dc.createAlias("cat", "lg");
	        dc.add(Restrictions.or(Restrictions.eq("cat.id", catalogid),Restrictions.like("lg.parentIds", "%"+catalogid.toString()+"%")));
		}
		
		if(entity.getStartM()!=null&&entity.getStartM().length()>0){
			String startM = entity.getStartM();
			if(startM.substring(0,1).equals("k")||startM.substring(0,1).equals("K")){
				startM = startM.substring(1).replace("+", "");
				if(StringUtils.isNumeric(startM)){					
					dc.add(Restrictions.ge("centerM", startM));
				}
			}
		}
		if(entity.getEndM()!=null&&entity.getEndM().length()>0){
			String endM = entity.getEndM();
			if(endM.substring(0,1).equals("k")||endM.substring(0,1).equals("K")){
				endM= endM.substring(1).replace("+", "");
				if(StringUtils.isNumeric(endM)){					
					dc.add(Restrictions.le("centerM", endM));
				}
			}
		}
		if(entity.getBridgeName()!=null&&entity.getBridgeName().length()>0){
			dc.add(Restrictions.like("bridgeName","%"+entity.getBridgeName()+"%"));
		}

		/**
		 * Add by Nemo on 2016/06/24 GIS台帐定位中需要的查询条件
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
		//modi 按中心里程升序
		dc.addOrder(Order.asc("centerM"));
		return dao.find(page, dc);
	}
	
	public List<Bridge> findAllList(){
		return dao.findAllList();
	}

	@Transactional(readOnly = false)
	public void save(Bridge entity) {
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
	 * 获取桥梁类型和菜单层级
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Catalog> getMenuType(Long catalogid, String menuType){
		List<Catalog> list = dao.getMenuType(catalogid, menuType);
		return list;
	}
	
	public String getGisData(String gclsId, String gcode) {
		List<Bridge> list = dao.findGisData(gclsId, gcode);
		if (list.size() > 0) {
			String jsonData = JsonUtil.getJson(list.get(0), JsonUtil.INCLUDES,
	        		"id", "bridgeName", "centerM", "birdgeType", "length", "stream", "bureauName");
			String jsonTitle = "[{\"id\":\"编号\", \"bridgeName\":\"桥梁名称\", \"centerM\":\"中心里程\", \"birdgeType\":\"桥梁类型\","+
					" \"length\":\"长度\", \"stream\":\"行别\", \"bureauName\":\"路局名称\"},";
			return jsonTitle+jsonData+"]";
		} else {
			return null;
		}
	}

	/**
	 * Add by Nemo on 2016/06/23
	 * 这是GIS中的字段和对应的字段含义（表头）对应，需要统一，第一列必须为ID
	 * @return
     */
	public Map<String,String> getGisTitle() {
		Map<String,String> res = Maps.newLinkedHashMap();
		res.put("id","编号");
		res.put("bridgeName","桥梁名称");
		res.put("centerM","中心里程");
		res.put("startM","起始里程");
		res.put("endM","终止里程");
		res.put("dic","桥梁类型");
		res.put("dic.label","桥梁类型");
		res.put("length","长度");
		res.put("stream","行别");
		res.put("bureauName","路局名称");
		
		res.put("bridgeNo","桥编号");
		res.put("worksectionNo","工务段编号");
		res.put("sublineNo","辅助线编号");
		res.put("sublineName","辅助线线名");
		res.put("gauge","轨距");
		res.put("linefork","线路分岔别");
		res.put("ass","所属固资");
		res.put("ass.name","所属固资");
		return res;
	}

	/**
	 * Add by Nemo on 2016/06/25
	 * 根据GIS平台的数据获取详细的信息
	 * @param gclsId
	 * @param gcode
     * @return
     */
	public Bridge getByGclsidAndGcode(String gclsId, String gcode){
		DetachedCriteria dc = dao.createDetachedCriteria();
		dc.add(Restrictions.eq(Bridge.FIELD_DEL_FLAG, Bridge.DEL_FLAG_NORMAL));
		if(gclsId!=null){
			dc.add(Restrictions.eq("gclsId",gclsId));
		}
		if(gcode!=null){
			dc.add(Restrictions.eq("gcode",gcode));
		}
		List<Bridge> ls = dao.find(dc);
		if(ls!=null&&ls.size()>0){
			return ls.get(0);
		}else{
			return new Bridge();
		}
	}

}
