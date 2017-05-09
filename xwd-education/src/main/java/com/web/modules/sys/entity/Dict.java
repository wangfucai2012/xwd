/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.web.modules.sys.entity;

import com.web.commons.entity.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

/**
 * 字典Entity
 * 
 * @author ThinkGem
 * @version 2013-05-15
 */
@Entity
@Table(name = "sys_dict")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Dict extends DataEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id; // 编号
	private String label; // 标签名
	private String value; // 数据值
	private String type; // 类型
	private String description;// 详细

	public Dict() {
		super();
	}

	public Dict(Long id) {
		this();
		this.id = id;
	}

	/**
	 * 按照原有的表结构，用一个通用的表来管理ID，暂时只是用于Oracle
	 * 
	 * @return
	 */
	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_dict", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Length(min = 1, max = 100)
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	@Length(min = 1, max = 100)
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Length(min = 1, max = 100)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min = 0, max = 4000)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}