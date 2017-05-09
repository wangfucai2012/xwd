package com.web.commons.utils;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

/**
 * JSON处理类
 * @author Mc
 * JNWSCZH@163.COM
 */
public class JsonUtil {
    public static final int EXCLUDES=1;
    public static final int INCLUDES=2;

	/**
	 * 将对象转换成JSON
	 * @param o 对象
	 * @param typ 需要解析：Includes=2 过滤解析：Excludes=1
	 * @param filter 需要解析/需要过滤 的字段
     * @return
     */
    public static String getJson(Object o,int typ,String... filter){
        SimplePropertyPreFilter simplePropertyPreFilter=null;
        if(filter!=null) {
            simplePropertyPreFilter = new SimplePropertyPreFilter();
            if(typ==EXCLUDES) {
                simplePropertyPreFilter.getExcludes().addAll(Arrays.asList(filter));
            }else {
                simplePropertyPreFilter.getIncludes().addAll(Arrays.asList(filter));
            }
        }
        return JSONObject.toJSONString(o,simplePropertyPreFilter, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty);
    }

	/**
	 * Add by Nemo on 2016/06/24
	 * 将对象转换成JSON
	 * @param o 对象
	 * @param typ 需要解析：Includes=2 过滤解析：Excludes=1
	 * @return
	 */
	public static String getJson1(Object o, int typ, List<String> ls){
		SimplePropertyPreFilter simplePropertyPreFilter=null;
		if(ls!=null) {
			simplePropertyPreFilter = new SimplePropertyPreFilter();
			if(typ==EXCLUDES) {
				simplePropertyPreFilter.getExcludes().addAll(ls);
			}else {
				simplePropertyPreFilter.getIncludes().addAll(ls);
			}
		}
		return JSONObject.toJSONString(o,simplePropertyPreFilter, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty);
	}


	/**
	 * 将对象转换成JSON
	 * @param o 对象
	 * @param includes 需要的字段
	 * @param excludes 过滤的字段
     * @return
     */
	public static String getJson(Object o,String[] includes,String[] excludes){
		SimplePropertyPreFilter simplePropertyPreFilter= new SimplePropertyPreFilter();
		if(includes!=null) {
			simplePropertyPreFilter.getExcludes().addAll(Arrays.asList(excludes));
		}
		if(excludes!=null) {
			simplePropertyPreFilter.getIncludes().addAll(Arrays.asList(includes));
		}
		return JSONObject.toJSONString(o,simplePropertyPreFilter, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty);
	}

	/**
	 * 对象解析成JSON
	 * @param o
	 * @return
     */
	public static String getJson(Object o){
		return JSONObject.toJSONString(o,SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteNullStringAsEmpty,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullListAsEmpty);
	}

	/**
	 * 以JSON格式输出
	 * @param response
	 */
	public static void responseOutWithJson(HttpServletResponse response, String jsonStr) {
		//将实体对象转换为JSON Object转换
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.append(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
	
}
