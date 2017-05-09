package com.web.modules.sys.entity.dict;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.commons.entity.DataEntity;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 * 原来的是车站、现在要求放入其他的如车辆段停车场等等
 * 
 * @description:
 * @author: nanxiaoqiang
 * @version: V1.00
 * @since 2014年6月6日
 * @create Date: 2015年5月14日下午5:46:38
 */
@Entity
@Table(name = "sys_dic_station")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Station extends DataEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String isHuancheng;// 是否换乘（1：是；0：否）
	private String stationType;// 车站类型（1：车站；2：停车场；3：车辆段）

	/**
	 * Add by Nemo on 2016/06/12
     */
	private Rail rail;//所在路局
	private String centerMile ;//中心里程
	private String city;//所在省市
	private String description;//备注

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "sys_dic_station", valueColumnName = "G_VALUE", allocationSize = 1)
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

	public String getIsHuancheng() {
		return isHuancheng;
	}

	public void setIsHuancheng(String isHuancheng) {
		this.isHuancheng = isHuancheng;
	}

	public String getStationType() {
		return stationType;
	}

	public void setStationType(String stationType) {
		this.stationType = stationType;
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

	@ManyToOne
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnore
	@JoinColumn(name="rail_id")
	public Rail getRail() {
		return rail;
	}

	public void setRail(Rail rail) {
		this.rail = rail;
	}

	public String getCenterMile() {
		return centerMile;
	}

	public void setCenterMile(String centerMile) {
		this.centerMile = centerMile;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
