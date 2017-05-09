package com.web.modules.sys.entity.dict;

import com.web.commons.entity.DataEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 车站表修改
 * @description: 
 * @author: nanxiaoqiang
 * @version: V1.00 
 * @since 2014年6月6日
 * @create Date: 2015年5月14日下午5:45:11
 */
@Entity
@Table(name = "sys_dic_line")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Line extends DataEntity {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;// 线路名称
	private String scribe;// 线路描述
	private Double linelength;// 线路长度

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_dic_line", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getScribe() {
		return scribe;
	}

	public void setScribe(String scribe) {
		this.scribe = scribe;
	}

	public Double getLinelength() {
		return linelength;
	}

	public void setLinelength(Double linelength) {
		this.linelength = linelength;
	}

	@Override
	public int hashCode() {
		// 第二个参数可以不填，是不使用的属性名称
		return HashCodeBuilder.reflectionHashCode(this, "remark");
	}

	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}
}
