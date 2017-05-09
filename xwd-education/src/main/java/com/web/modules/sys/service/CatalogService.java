package com.web.modules.sys.service;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.utils.StringUtils;
import com.web.modules.sys.dao.CatalogDao;
import com.web.modules.sys.entity.Catalog;
import com.web.modules.sys.service.account.ShiroAccountRealm;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 目录分类Service
 * Created by nemo on 16-5-12.
 */
@Service
@Transactional(readOnly = true)
public class CatalogService extends BaseService {

	@Autowired
	private CatalogDao catalogDao;

	//@Autowired
	//private ShiroCasAccountRealm systemRealm;

	@Autowired
	private ShiroAccountRealm systemRealm;

	//得到所有
	public List<Catalog> findAllCatalog(String level){

		DetachedCriteria dc = catalogDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
		dc.add(Restrictions.like("levels","%"+level+"%"));
		dc.addOrder(Order.asc("sort"));
		return catalogDao.find(dc);
	}

	//保存
	@Transactional(readOnly = false)
	public void save(Catalog catalog){
		catalogDao.clear();
		catalogDao.save(catalog);
		//systemRealm.clearAllCachedAuthorizationInfo();
	}

	/**
	 * 删除
	 * @param id
	 */
	public void delete(Long id){
		catalogDao.clear();
		catalogDao.deleteById(id);
	}

	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Catalog getById(Long id){
		return catalogDao.get(id);
	}

	/**
	 * 根据父节点ID获取其下所有数据
	 * @param parentid
	 * @return
	 */
	public List<Catalog> getByParentId(Long parentid){
		return catalogDao.findListByParent(parentid);
	}

	/**
	 * 根据类型和父级ID查询
	 * @param type
	 * @return
	 */
	public List<Catalog> findListByTypeAndParentAndLevel(String level, Long parentId, String type){
		List<Catalog> sourcelist = catalogDao.findListByTypeAndParentAndLevel(level,parentId,type);
		return sourcelist;
	}
	
	/**
	 * 根据类型和父级ID查询
	 * @param type
	 * @return
	 */
	public List<Catalog> findListByTypeAndParentAndLevelAndMenuType(String level, Long parentId, String type, int menuType){
		List<Catalog> sourcelist = catalogDao.findListByTypeAndParentAndLevelAndMenuType(level,parentId,type,menuType);
		return sourcelist;
	}

	/**
	 * 获取目录树的数据
	 * @param level
	 * @param parentId
	 * @param type
	 * @return
	 */
	public List<Map<String, Object>> getCatalogList(String level,Long parentId,String type){

		List<Catalog> list = new ArrayList<>();
		List<Catalog> sourcelist  = new ArrayList<Catalog>();
		List<Map<String, Object>> mapList = Lists.newArrayList();

		Long parentid=-1L;

		//若type为空，那么则取全部的数据
		if (type==null || parentId==null || level==null) {
			sourcelist = findAllCatalog(level);
			parentid = 1L;
		}else {
			//获取数据
			sourcelist = findListByTypeAndParentAndLevel(level,parentId,type);

			//找出第一个父节点的根
			if(sourcelist!=null && sourcelist.size()>0){
				parentid = sourcelist.get(0).getParents().getId();
			}
			if(parentid!=-1L){
				for(int i=0;i<sourcelist.size();i++){
					if(sourcelist.get(i).getParents().getId()<parentid){
						parentid = sourcelist.get(i).getParents().getId();
					}
				}
			}

			//重新封装数据，把根节点找出来，因为可能会存在多个根
			for(int i=0;i<sourcelist.size();i++){
				if (sourcelist.get(i).getParents().getId() == parentid) {
					Catalog cg = new Catalog();
					cg.setId(parentid);
					sourcelist.get(i).setParents(cg);
				}
			}
		}

		//重新排布数据
		Catalog.sortList(list, sourcelist, parentid);

		//拼接需要的数据
		if(list!=null && list.size()>0){
			for (int i=0; i<list.size(); i++){
				Catalog e = list.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", (e.getParents()!=null&&e.getParents().getId()!=parentid)?e.getParents().getId():0);
				map.put("name", e.getNames());
				map.put("href", e.getHrefs());
				map.put("gname",e.getGlayerName());
				//Add by Nemo 0n 2016/06/28 添加是否有字节点的标识
				if(e.getChildList()!=null&&e.getChildList().size()>0){
					map.put("hasChild","true");
				}else{
					map.put("hasChild","false");
				}
				mapList.add(map);
			}
		}

		return mapList;
	}
	
	/**
	 * 获取目录树的数据
	 * @param level
	 * @param parentId
	 * @param type
	 * @return
	 */
	public List<Map<String, Object>> getCatalogList_jhgis(String level,Long parentId,String type){

		List<Catalog> list = new ArrayList<>();
		List<Catalog> sourcelist  = new ArrayList<Catalog>();
		List<Map<String, Object>> mapList = Lists.newArrayList();

		Long parentid=-1L;

		//若type为空，那么则取全部的数据
		if (type==null || parentId==null || level==null) {
			sourcelist = findAllCatalog(level);
			parentid = 1L;
		}else {
			//获取数据
			sourcelist = findListByTypeAndParentAndLevel(level,parentId,type);

			//找出第一个父节点的根
			if(sourcelist!=null && sourcelist.size()>0){
				parentid = sourcelist.get(0).getParents().getId();
			}
			if(parentid!=-1L){
				for(int i=0;i<sourcelist.size();i++){
					if(sourcelist.get(i).getParents().getId()<parentid){
						parentid = sourcelist.get(i).getParents().getId();
					}
				}
			}

			//重新封装数据，把根节点找出来，因为可能会存在多个根
			for(int i=0;i<sourcelist.size();i++){
				if (sourcelist.get(i).getParents().getId() == parentid) {
					Catalog cg = new Catalog();
					cg.setId(parentid);
					sourcelist.get(i).setParents(cg);
				}
			}
		}

		//重新排布数据
		Catalog.sortList(list, sourcelist, parentid);

		//拼接需要的数据
		if(list!=null && list.size()>0){
			for (int i=0; i<list.size(); i++){
				Catalog e = list.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", (e.getParents()!=null&&e.getParents().getId()!=parentid)?e.getParents().getId():0);
				map.put("name", e.getNames());
				map.put("href", e.getHrefs());
				map.put("gid",e.getGlayerId());
				map.put("gname", e.getGlayerName());
				map.put("code",e.getCode());
				mapList.add(map);
			}
		}

		return mapList;
	}
	
	/**
	 * 获取目录树的数据,同级目录数据
	 * @param level
	 * @param parentId
	 * @param type
	 * @return
	 */
	public List<Map<String, Object>> getCatalogList_jhgis_tj(String level,Long parentId,String type,int menuType){

		List<Catalog> list = new ArrayList<>();
		List<Catalog> sourcelist  = new ArrayList<Catalog>();
		List<Map<String, Object>> mapList = Lists.newArrayList();

		Long parentid=-1L;

		//若type为空，那么则取全部的数据
		if (type==null || parentId==null || level==null) {
			sourcelist = findAllCatalog(level);
			parentid = 1L;
		}else {
			//获取数据
			sourcelist = findListByTypeAndParentAndLevelAndMenuType(level,parentId,type,menuType);

			//找出第一个父节点的根
			if(sourcelist!=null && sourcelist.size()>0){
				parentid = sourcelist.get(0).getParents().getId();
			}
			if(parentid!=-1L){
				for(int i=0;i<sourcelist.size();i++){
					if(sourcelist.get(i).getParents().getId()<parentid){
						parentid = sourcelist.get(i).getParents().getId();
					}
				}
			}

			//重新封装数据，把根节点找出来，因为可能会存在多个根
			for(int i=0;i<sourcelist.size();i++){
				if (sourcelist.get(i).getParents().getId() == parentid) {
					Catalog cg = new Catalog();
					cg.setId(parentid);
					sourcelist.get(i).setParents(cg);
				}
			}
		}

		//重新排布数据
		Catalog.sortList(list, sourcelist, parentid);

		//拼接需要的数据
		if(list!=null && list.size()>0){
			for (int i=0; i<list.size(); i++){
				Catalog e = list.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", (e.getParents()!=null&&e.getParents().getId()!=parentid)?e.getParents().getId():0);
				map.put("name", e.getNames());
				map.put("href", e.getHrefs());
				map.put("gid",e.getGlayerId());
				map.put("gname", e.getGlayerName());
				mapList.add(map);
			}
		}

		return mapList;
	}
	
	/**
	 * 获取当前结点的所有父节点数据标签
	 * @param catalogId
	 * @return 按由高到底顺序返回结果，以>分割
	 * @author lcx.
	 * @date 2016年6月19日 下午6:04:47
	 */
	public String getParentsLabelById(Long catalogId) {
		String titleLabel = "";
		Catalog entity = getById(catalogId);
		if (null != entity) {
			String str = entity.getParentIds();
			String[] parentIds = StringUtils.split(str, '.');
			if (parentIds.length > 3) {
				for (int i=3; i < parentIds.length; i++) {
					titleLabel = titleLabel.concat(getById(Long.parseLong(parentIds[i])).getNames() + ">");	    			
				}
			}
			
		}
		titleLabel = titleLabel.concat(entity.getNames());
		
		return titleLabel;
	}

	/**
	 * 根据GLayerName获取数据
	 * @param glayerName
	 * @return
     */
	public Catalog getByGLayerName(String glayerName) {
		DetachedCriteria dc = catalogDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("glayerName",glayerName));
		List<Catalog> list=catalogDao.find(dc);
		return (list!=null&&list.size()>0)?list.get(0):null;
	}
	
	/**
	 * 根据GclsId获取数据
	 * @param gclsId
	 * @return
     */
	public Catalog getByGclsId(String gclsId) {
		DetachedCriteria dc = catalogDao.createDetachedCriteria();
		dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
		dc.add(Restrictions.eq("code",gclsId));
		List<Catalog> list=catalogDao.find(dc);
		return (list!=null&&list.size()>0)?list.get(0):null;
	}

	/**
	 * 根据多个ID获取数据
	 * @param catalogIds [1,2,3,4]
	 * @return
     */
	public List<Catalog> getByIds(String catalogIds) {
		List<Catalog> list=null;
		if(StringUtils.isNotEmpty(catalogIds)){
			String[] ids=catalogIds.split(",");
			Long[] lids=new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				lids[i]=Long.valueOf(ids[i]);
			}
			if(lids!=null&&lids.length>0){
				DetachedCriteria dc = catalogDao.createDetachedCriteria();
				dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
				dc.add(Restrictions.in("id",lids));
				list=catalogDao.find(dc);
			}
		}
		return list;
	}

	/**
	 * 根据名称获取Catalog 名称为 逗号分隔字符串
	 * @param layerNames
	 * @return
     */
	public List<Catalog> getByGLayerNames(String layerNames) {
		if(StringUtils.isNotEmpty(layerNames)){
			String[] names=layerNames.split(",");
			if(names!=null&&names.length>0){
				DetachedCriteria dc = catalogDao.createDetachedCriteria();
				dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
				dc.add(Restrictions.in("glayerName",names));
				List<Catalog> list=catalogDao.find(dc);
				return list;
			}
		}
		return null;
	}
}
