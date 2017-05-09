package com.web.commons.utils;

/**
 * M。c
 * 2016-07-11
 * Jnwsczh@163.com
 * 获取查询实体class
 */

public class FindBean {
    public enum Typ{EQ,LK,IDS}
    private Typ typ;
    private Object value;

    public FindBean(Typ typ, Object value) {
        this.typ = typ;
        this.value = value;
    }

    public Typ getTyp() {
        return typ;
    }

    public void setTyp(Typ typ) {
        this.typ = typ;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

}
