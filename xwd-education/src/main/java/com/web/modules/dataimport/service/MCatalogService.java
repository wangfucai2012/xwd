package com.web.modules.dataimport.service;

import com.web.modules.sys.dao.CatalogDao;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 代理Catalog的服务类
 * Created by nemo on 16-6-18.
 */
@Service
@Transactional(readOnly = true)
public class MCatalogService {

    @Autowired
    private CatalogDao catalogDao;

    public Catalog getCatalogByCode(String code) {

        if (code == null || code.trim().equals("")) {
            code = "Nemo不查询标识";
            return new Catalog();
        }

        DetachedCriteria dc = catalogDao.createDetachedCriteria();

        /**
         * 需要的是未标志为删除的数据
         */
        dc.add(Restrictions.eq(Catalog.FIELD_DEL_FLAG, Catalog.DEL_FLAG_NORMAL));
        dc.add(Restrictions.eq("code", code));

        List<Catalog> catalogs = catalogDao.find(dc);
        if (catalogs == null || catalogs.size() != 1) {
            System.out.println("ECLSID:"+code+"找不到对应的目录！！！");
            return new Catalog();
//            throw new NullPointerException("查找的数据为空或者含有多条，请调试后确认！！！");
        } else {
            return catalogs.get(0);
        }
    }

}
