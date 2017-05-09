package com.web.modules.sys.dao;

import com.web.commons.dao.BaseDao;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * 目录分类的dao
 * Created by nemo on 16-5-12.
 */
@Repository
public class CatalogDao extends BaseDao<Catalog> {

    /**
     * 根据ID删除，其实并不是真删除，只是把删除标志修改为已删除
     * @param id
     * @return
     */
    public int deleteById(Long id){
        return this.updateDelFlag(id, Catalog.DEL_FLAG_DELETE);
    }

    /**
     * 根据父节点的信息查询下级所有树
     * @param parentId
     * @return
     */
    public List<Catalog> findListByParent(Long parentId){
        DetachedCriteria dc = createDetachedCriteria();

        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
        if(parentId!=null){
            Catalog catalog = get(parentId);
            if(catalog!=null) {
                /**
                 * 根据父节点的ID/父节点的拼接字符串来获取数据
                 */
                dc.add(Restrictions.or(Restrictions.eq("id", catalog.getParents()), Restrictions.like("parentIds", "%" + catalog.getParents()+"."+catalog.getId() + "%")));
            }
        }
        dc.addOrder(Order.asc("sort"));
        return find(dc);
    }

    /**
     * 根据类型和父级ID查询
     * @param type
     * @return
     */
    public List<Catalog> findListByTypeAndParentAndLevel(String level, Long parentId, String type){

        DetachedCriteria dc = createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
        if(level!=null){
            dc.add(Restrictions.eq("levels",level));
        }
        if(type!=null){
            dc.add(Restrictions.eq("types",type));
        }

        if(parentId!=null){
            dc.add(Restrictions.or(Restrictions.eq("id", parentId),Restrictions.like("parentIds", "%."+parentId.toString()+"%")));
        }

        dc.addOrder(Order.asc("sort"));
        List<Catalog> res = find(dc);
        return res==null?new ArrayList<Catalog>():res;
    }
    
    /**
     * 根据类型和父级ID查询
     * @param type
     * @return
     */
    public List<Catalog> findListByTypeAndParentAndLevelAndMenuType(String level, Long parentId, String type, int menuType){

        DetachedCriteria dc = createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
        if(level!=null){
            dc.add(Restrictions.eq("levels",level));
        }
        if(type!=null){
            dc.add(Restrictions.eq("types",type));
        }

        if(parentId!=null){
            dc.add(Restrictions.or(Restrictions.eq("id", parentId),Restrictions.like("parentIds", "%."+parentId.toString()+"%")));
        }
        
        /**
         * 同级字段条件
         */
        if(menuType!=0){
        	 dc.add(Restrictions.eq("menuType",menuType));
        }

        dc.addOrder(Order.asc("orders"));
        List<Catalog> res = find(dc);
        return res==null?new ArrayList<Catalog>():res;
    }

}
