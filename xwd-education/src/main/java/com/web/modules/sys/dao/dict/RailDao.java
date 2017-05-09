package com.web.modules.sys.dao.dict;

import com.web.commons.dao.BaseDao;
import com.web.commons.dao.Parameter;
import com.web.modules.data.work.entity.Bridge;
import com.web.modules.sys.entity.dict.Rail;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 *  铁路局
 * Created by nemo on 16-06-12.
 */
@Repository
public class RailDao extends BaseDao<Rail> {
    /**
     * 根据类型和父级ID查询
     * @param type
     * @return
     */
    public List<Rail> findListByParent(Long parentId){

        DetachedCriteria dc = createDetachedCriteria();
        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Rail.FIELD_DEL_FLAG, Rail.DEL_FLAG_NORMAL));

        if(parentId!=null){
            dc.add(Restrictions.or(Restrictions.eq("id", parentId),Restrictions.like("parentIds", "%."+parentId.toString()+"%")));
        }

        dc.addOrder(Order.asc("sort"));
        List<Rail> res = find(dc);
        return res==null?new ArrayList<Rail>():res;
    }
    
    /**
     * 根据父级id获取rail数据
     * @param type
     * @return
     */
	public List<Rail> findByParentId(Long id){
		return find("from Rail where delFlag=:p1 and parent.id=:p2 order by sort"
				, new Parameter(Bridge.DEL_FLAG_NORMAL, id));
		
	}
}
