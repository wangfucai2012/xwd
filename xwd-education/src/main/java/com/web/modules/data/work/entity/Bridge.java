package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import com.web.modules.sys.entity.Dict;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:桥梁
 *  @author :wangjianwei 
 *  @create Date:2016年4月19日 下午4:12:35
 */
@Entity
@Table(name = "data_work_bridg")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Bridge extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private String bureauNo;// 局编号
	private String bureauName;// 局名
	private String lineNo;// 线编号
	private String lineName;// 线名
	private String stream;// 行别
	private String bridgeNo;// 桥编号
	private String bridgeName;// 桥名
	private Double length;// 全长
	private String birdgeType;//桥梁类型
	private String startM;
	private String endM;
	private String worksectionNo;//工务段编号
	private String sublineNo;//辅助线编号
	private String sublineName;//辅助线线名
	private String gauge;//轨距
	private String linefork;//线路分岔别
	private Catalog cat;//所属类型
	private Dict dic;//字典
	
	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_bridg", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getBureauNo() {
		return bureauNo;
	}
	public void setBureauNo(String bureauNo) {
		this.bureauNo = bureauNo;
	}
	public String getBureauName() {
		return bureauName;
	}
	public void setBureauName(String bureauName) {
		this.bureauName = bureauName;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public String getLineNo() {
		return lineNo;
	}
	public void setLineNo(String lineNo) {
		this.lineNo = lineNo;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getBridgeNo() {
		return bridgeNo;
	}
	public void setBridgeNo(String bridgeNo) {
		this.bridgeNo = bridgeNo;
	}
	public String getBridgeName() {
		return bridgeName;
	}
	public void setBridgeName(String bridgeName) {
		this.bridgeName = bridgeName;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	
	@ManyToOne
	@JoinColumn(name = "dic_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Dict getDic() {
		return dic;
	}
	public void setDic(Dict dic) {
		this.dic = dic;
	}
	public String getBirdgeType() {
		return birdgeType;
	}
	public void setBirdgeType(String birdgeType) {
		this.birdgeType = birdgeType;
	}
	public String getStartM() {
		return startM;
	}
	public void setStartM(String startM) {
		this.startM = startM;
	}
	public String getEndM() {
		return endM;
	}
	public void setEndM(String endM) {
		this.endM = endM;
	}
	
	public String getWorksectionNo() {
		return worksectionNo;
	}
	public void setWorksectionNo(String worksectionNo) {
		this.worksectionNo = worksectionNo;
	}
	public String getSublineNo() {
		return sublineNo;
	}
	public void setSublineNo(String sublineNo) {
		this.sublineNo = sublineNo;
	}
	public String getSublineName() {
		return sublineName;
	}
	public void setSublineName(String sublineName) {
		this.sublineName = sublineName;
	}
	public String getGauge() {
		return gauge;
	}
	public void setGauge(String gauge) {
		this.gauge = gauge;
	}
	public String getLinefork() {
		return linefork;
	}
	public void setLinefork(String linefork) {
		this.linefork = linefork;
	}
	@ManyToOne
	@JoinColumn(name = "cat_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Catalog getCat() {
		return cat;
	}
	public void setCat(Catalog cat) {
		this.cat = cat;
	}

}
