package com.web.modules.sys.utils;

import com.web.commons.utils.SpringContextHolder;
import com.web.modules.sys.entity.dict.Rail;
import com.web.modules.sys.service.dict.RailService;

import java.util.List;

/**
 * 铁路局的工具类
 * Created by nemo on 16-6-13.
 */
public class RailUtil {

    private static RailService service = SpringContextHolder.getBean(RailService.class);

    /**
     * 对外提供的获取铁路局列表的方法
     * @return
     */
    public static List<Rail> getRailList(){
            return service.getAll();
    }

    /**
     * 对外提供的获取路局一层的方法
     * @return
     */
    public static List<Rail> getAllRail(){
        return service.getAllRail();
    }
}
