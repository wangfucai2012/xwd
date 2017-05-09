package com.web.modules.sys.service.dict;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.web.commons.service.BaseService;
import com.web.commons.web.Page;
import com.web.modules.sys.dao.dict.RailDao;
import com.web.modules.sys.entity.dict.Rail;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 铁路局的Service层
 * Created by nemo on 16-06-12.
 */
@Service
@Transactional(readOnly = true)
public class RailService extends BaseService {

    @Autowired
    private RailDao dao;

    /**
     * 保存
     * @param entity
     */
    @Transactional(readOnly = false)
    public void save(Rail entity){
        dao.clear();
        dao.save(entity);
    }

    /**
     * 删除
     * @param id
     */
    public void delete(Long id){
        dao.clear();
        dao.deleteById(id);
    }

    /**
     * 根据ID获取
     * @param id
     * @return
     */
    public Rail getById(Long id){
        return dao.get(id);
    }

    /**
     * 根据分页参数获取
     * @return
     */
    public Page<Rail> getByPage(Page<Rail> page, Rail entity){
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        if(entity!=null) {
            if(entity.getName()!=null && !entity.getName().equals("")) {
                dc.add(Restrictions.like("name","%"+entity.getName()+"%"));
            }
        }
        dc.addOrder(Order.asc("sort"));

        return dao.find(page,dc);
    }

    /**
     * 查询所有
     * @return
     */
    public List<Rail> getAll(){
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        dc.addOrder(Order.asc("sort"));
        return dao.find(dc);
    }
    
    /**
     * 查询所有路局
     * @return
     */
    public List<Rail> getAllRail(){
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        
        /**
         * 需要的是路局数据（railOrDistrict=1）
         */
        dc.add(Restrictions.eq("railOrDistrict", Rail.IS_RAIL));
        dc.addOrder(Order.asc("sort"));
        return dao.find(dc);
    }
    
    /**
     * 查询所有区段
     * @return
     */
    public List<Rail> getAllDistrict(){
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        
        /**
         * 需要的是区段数据（railOrDistrict=1）
         */
        dc.add(Restrictions.eq("railOrDistrict", Rail.IS_DISTRICT));
        dc.addOrder(Order.asc("sort"));
        return dao.find(dc);
    }
    
    /**
     * 通过中心里程获取路局名称
     * @return
     */
    public String getRailName(String centerM){
    	String railName = "";
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        
        /**
         * 需要过滤路局数据
         */
        dc.add(Restrictions.eq("railOrDistrict", Rail.IS_RAIL));
        dc.add(Restrictions.le("startM", centerM));
        dc.add(Restrictions.ge("endM", centerM));
        List<Rail> railList = dao.find(dc);
        if(railList!=null && railList.size()>0){
        	railName = railList.get(0).getName();
        }
		return railName;
    }
    
	/**
	 * 通过路局id获取区段对象
	 * @return
	 */
	public @ResponseBody List<Rail> getDistrict(@RequestParam(required = false)Long id){
        DetachedCriteria dc = dao.createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));
        /**
         * 需要过滤路局数据
         */
        dc.add(Restrictions.eq("railOrDistrict", Rail.IS_DISTRICT));
        
        dc.add(Restrictions.eq("parent.id", id));
        dc.addOrder(Order.asc("sort"));
        return dao.find(dc);
	}
	
	/**
	 * 重新排序List，得到正确的TreeTable需要的数据
	 * @param list
	 * @param sourcelist
	 * @param parentId
     */
	public List<Rail> sortList(List<Rail> list, List<Rail> sourcelist,
                               Long parentId) {
		for (int i = 0; i < sourcelist.size(); i++) {
			Rail e = sourcelist.get(i);
			if (e.getParent() != null && e.getParent().getId() != null
					&& e.getParent().getId().equals(parentId)) {
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j = 0; j < sourcelist.size(); j++) {
					Rail child = sourcelist.get(j);
					if (child.getParent() != null
							&& child.getParent().getId() != null
							&& child.getParent().getId().equals(e.getId())) {
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
		
		return list;
	}
	
	/**
	 * 获取目录树的数据
	 * @author LUTAO
	 * @param parentId
	 * @return
	 */
	public List<Map<String, Object>> getRailList(Long parentId){

		List<Rail> list = new ArrayList<>();
		List<Rail> sourcelist  = new ArrayList<Rail>();
		List<Map<String, Object>> mapList = Lists.newArrayList();

		Long parentid=-1L;

		//若parentId为空，那么则取全部的数据
		if (parentId==null) {
			sourcelist = dao.findAllList();
			parentid = 1L;
		}else {
			//获取数据
			sourcelist = findListByParent(parentId);

			//找出第一个父节点的根
			if(sourcelist!=null && sourcelist.size()>0){
				parentid = sourcelist.get(0).getParent().getId();
			}
			if(parentid!=-1L){
				for(int i=0;i<sourcelist.size();i++){
					if(sourcelist.get(i).getParent().getId()<parentid){
						parentid = sourcelist.get(i).getParent().getId();
					}
				}
			}

			//重新封装数据，把根节点找出来，因为可能会存在多个根
			for(int i=0;i<sourcelist.size();i++){
				if (sourcelist.get(i).getParent().getId() == parentid) {
					Rail cg = new Rail();
					cg.setId(parentid);
					sourcelist.get(i).setParent(cg);
				}
			}
		}

		//重新排布数据
		sortList(list, sourcelist, parentid);

		//拼接需要的数据
		if(list!=null && list.size()>0){
			for (int i=0; i<list.size(); i++){
				Rail e = list.get(i);
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", (e.getParent()!=null&&e.getParent().getId()!=parentid)?e.getParent().getId():0);
				map.put("name", e.getName());
				//Add by Nemo 0n 2016/06/28 添加是否有字节点的标识
				List<Rail> childrenList = dao.findByParentId( e.getId());
				if(childrenList!=null && childrenList.size()>0){
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
	 * 根据类型和父级ID查询
	 * @param type
	 * @return
	 */
	public List<Rail> findListByParent(Long parentId){
		List<Rail> sourcelist = dao.findListByParent(parentId);
		return sourcelist;
	}

}
