package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:梁面
 *  @author wangjianwei 
 *  @create Date:2016年4月19日上午8:50:12
 */
@Entity
@Table(name = "data_work_grider")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Grider extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private String type;// 梁类型
	private Double length;// 梁长
	private Double sildwidth;// 缝宽
	private Double width;// 梁宽
	private Double height;// 梁标高
	private Double loss;// 梁圬工方
	private String startM;// 起始里程
	private String endM;// 终点里程
	private Catalog cat;//所属类型
	private Bridge bridge; //所属桥梁
	private Pier pier;//所属墩身
	private Double spans;//跨度
	private String changeYear;//换梁年代
	private String pattern;//梁式样
	private String patternCode;//梁式样代码
	private Double baseHeight;//梁底高
	private String hole;//孔别
	private String layYear;//枕铺设年度
	private String drawNo;//定型图号
	private String designLimits;//设计限界
	private String kinds;//梁种类
	private Double clearHole;//净孔
	private Double weight;//梁重
	private Double volume;//梁体积
	private Double maincenterSpace;//主梁中心距
	private Double ordinatecenterSpace;//纵梁中心距
	private Double ordinateHeight;//纵梁高
	private String desliveload;//设计活载
	private Double carryCoefficient;//承载系数
	private String controlPostion;//控制部位
	private String paintingYear;//钢梁涂装年
	private Integer bend;//挠度
	private String fastenerType;//扣件类型
	private Integer fastenerNum;//扣件数量
	private String plateType;//轨枕类型
	private Integer plateNum;//轨枕数量
	private String steelrailType;//钢轨类型
	private String glzfcxjg;//钢梁振幅超限加固
	private Integer rcbulkNum;//混凝土梁横隔板数
	private String rcbulkJoin;//混凝土梁横隔板连接
	private String limitEq;//梁端限位装置
	private String rcbzljg;//混凝土并置梁加固
	private Double dzcwidth;//道碴槽宽度
	private Double thickness;//圬工梁跨中道碴厚度
	private String footwalkMaterial;//人行道材质
	private Double footwalkWidth;//人行道宽
	private String fixcheckEq;//固定检查设备
	private String gtly;//公铁两用

	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_grider", valueColumnName = "G_VALUE", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "web_tab_pk")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public Double getSildwidth() {
		return sildwidth;
	}
	public void setSildwidth(Double sildwidth) {
		this.sildwidth = sildwidth;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getLoss() {
		return loss;
	}
	public void setLoss(Double loss) {
		this.loss = loss;
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
	@ManyToOne
	@JoinColumn(name = "bridge_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Bridge getBridge() {
		return bridge;
	}
	public void setBridge(Bridge bridge) {
		this.bridge = bridge;
	}

	@ManyToOne
	@JoinColumn(name = "pier_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Pier getPier() {
		return pier;
	}
	public void setPier(Pier pier) {
		this.pier = pier;
	}

	public String getChangeYear() {
		return changeYear;
	}
	public void setChangeYear(String changeYear) {
		this.changeYear = changeYear;
	}
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public String getPatternCode() {
		return patternCode;
	}
	public void setPatternCode(String patternCode) {
		this.patternCode = patternCode;
	}
	
	public String getHole() {
		return hole;
	}
	public void setHole(String hole) {
		this.hole = hole;
	}
	public String getLayYear() {
		return layYear;
	}
	public void setLayYear(String layYear) {
		this.layYear = layYear;
	}
	public String getDrawNo() {
		return drawNo;
	}
	public void setDrawNo(String drawNo) {
		this.drawNo = drawNo;
	}
	public String getDesignLimits() {
		return designLimits;
	}
	public void setDesignLimits(String designLimits) {
		this.designLimits = designLimits;
	}
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	
	
	public String getDesliveload() {
		return desliveload;
	}
	public void setDesliveload(String desliveload) {
		this.desliveload = desliveload;
	}

	public String getControlPostion() {
		return controlPostion;
	}
	public void setControlPostion(String controlPostion) {
		this.controlPostion = controlPostion;
	}
	public String getPaintingYear() {
		return paintingYear;
	}
	public void setPaintingYear(String paintingYear) {
		this.paintingYear = paintingYear;
	}
	public Integer getBend() {
		return bend;
	}
	public void setBend(Integer bend) {
		this.bend = bend;
	}
	public String getFastenerType() {
		return fastenerType;
	}
	public void setFastenerType(String fastenerType) {
		this.fastenerType = fastenerType;
	}
	public Integer getFastenerNum() {
		return fastenerNum;
	}
	public void setFastenerNum(Integer fastenerNum) {
		this.fastenerNum = fastenerNum;
	}
	public String getPlateType() {
		return plateType;
	}
	public void setPlateType(String plateType) {
		this.plateType = plateType;
	}
	public Integer getPlateNum() {
		return plateNum;
	}
	public void setPlateNum(Integer plateNum) {
		this.plateNum = plateNum;
	}
	public String getSteelrailType() {
		return steelrailType;
	}
	public void setSteelrailType(String steelrailType) {
		this.steelrailType = steelrailType;
	}
	public String getGlzfcxjg() {
		return glzfcxjg;
	}
	public void setGlzfcxjg(String glzfcxjg) {
		this.glzfcxjg = glzfcxjg;
	}
	public Integer getRcbulkNum() {
		return rcbulkNum;
	}
	public void setRcbulkNum(Integer rcbulkNum) {
		this.rcbulkNum = rcbulkNum;
	}
	public String getRcbulkJoin() {
		return rcbulkJoin;
	}
	public void setRcbulkJoin(String rcbulkJoin) {
		this.rcbulkJoin = rcbulkJoin;
	}
	public String getLimitEq() {
		return limitEq;
	}
	public void setLimitEq(String limitEq) {
		this.limitEq = limitEq;
	}
	public String getRcbzljg() {
		return rcbzljg;
	}
	public void setRcbzljg(String rcbzljg) {
		this.rcbzljg = rcbzljg;
	}
	public Double getSpans() {
		return spans;
	}
	public void setSpans(Double spans) {
		this.spans = spans;
	}
	public Double getBaseHeight() {
		return baseHeight;
	}
	public void setBaseHeight(Double baseHeight) {
		this.baseHeight = baseHeight;
	}
	public Double getClearHole() {
		return clearHole;
	}
	public void setClearHole(Double clearHole) {
		this.clearHole = clearHole;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getVolume() {
		return volume;
	}
	public void setVolume(Double volume) {
		this.volume = volume;
	}
	public Double getMaincenterSpace() {
		return maincenterSpace;
	}
	public void setMaincenterSpace(Double maincenterSpace) {
		this.maincenterSpace = maincenterSpace;
	}
	public Double getOrdinatecenterSpace() {
		return ordinatecenterSpace;
	}
	public void setOrdinatecenterSpace(Double ordinatecenterSpace) {
		this.ordinatecenterSpace = ordinatecenterSpace;
	}
	public Double getOrdinateHeight() {
		return ordinateHeight;
	}
	public void setOrdinateHeight(Double ordinateHeight) {
		this.ordinateHeight = ordinateHeight;
	}
	public Double getCarryCoefficient() {
		return carryCoefficient;
	}
	public void setCarryCoefficient(Double carryCoefficient) {
		this.carryCoefficient = carryCoefficient;
	}
	public Double getDzcwidth() {
		return dzcwidth;
	}
	public void setDzcwidth(Double dzcwidth) {
		this.dzcwidth = dzcwidth;
	}
	public Double getThickness() {
		return thickness;
	}
	public void setThickness(Double thickness) {
		this.thickness = thickness;
	}
	public String getFootwalkMaterial() {
		return footwalkMaterial;
	}
	public void setFootwalkMaterial(String footwalkMaterial) {
		this.footwalkMaterial = footwalkMaterial;
	}
	public Double getFootwalkWidth() {
		return footwalkWidth;
	}
	public void setFootwalkWidth(Double footwalkWidth) {
		this.footwalkWidth = footwalkWidth;
	}
	public String getFixcheckEq() {
		return fixcheckEq;
	}
	public void setFixcheckEq(String fixcheckEq) {
		this.fixcheckEq = fixcheckEq;
	}
	public String getGtly() {
		return gtly;
	}
	public void setGtly(String gtly) {
		this.gtly = gtly;
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
