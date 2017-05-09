package com.web.commons.utils;

/**
 * 里程处理的通用工具类
 * Created by nemo on 16-6-22.
 */
public class MileUtils {

    /**
     * 格式化里程字符串
     * @param oldString 需要格式化的字符串，一般为小数或者整数
     * @return
     */
    public static String getFormatMile(String oldString){

        if(oldString == null){
            oldString = "";
        }

        StringBuffer bf = new StringBuffer("");
        String m;

        if(oldString.indexOf(".")!=-1){
            m = oldString.split("\\.")[0];
            if(m.length()>3){
                bf.append("K ");
                bf.append(m.substring(0,m.length()-3));
                bf.append(" + ");
                bf.append(m.substring(m.length()-3,m.length()));
            }else{
                bf.append("K 0 + ");
                bf.append((m.equals("")?"0":m));
            }
            bf.append("."+oldString.split("\\.")[1]);
        }else if(oldString.indexOf(".")==-1){
            m = oldString;
            if(m.length()>3){
                bf.append("K ");
                bf.append(m.substring(0,m.length()-3));
                bf.append(" + ");
                bf.append(m.substring(m.length()-3,m.length()));
            }else{
                bf.append("K 0 + ");
                bf.append(m.equals("")?"0":m);
            }
            bf.append(".00");
        }

        return bf.toString();
    }

}
