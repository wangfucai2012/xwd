package com.web.modules.data.work.entity;

import com.web.commons.entity.CodeEntity;
import com.web.modules.sys.entity.Catalog;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;

import javax.persistence.Entity;
import javax.persistence.*;
import javax.persistence.Table;

/**
 *  @description:墩身
 *  @author wangjianwei 
 *  @create Date:2016年4月20日 上午9:07:46
 */
@Entity
@Table(name = "data_work_pier")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Pier extends CodeEntity {
	private static final long serialVersionUID = 1L;
	private Long id;// id
	private String pnumber;// 墩台号
	private String type;// 墩身类型
	private String hwd;// 墩身长宽高
	private String pLength;//墩身长
	private String pWidth;//墩身宽
	private String pHeight;//墩身高
	private String designM;//设计里程
	private String hollow;// 是否空心
	private String hwidth;// 空心宽度
	private String loss;// 墩身圬工方
	private Catalog cat;//所属类型
    private Bridge bridge;//所属桥梁
	private String endM;
	private String startM;
	private String hole;//孔别
	private String topHeight;//墩顶高
	private Double baseHeight;//墩基底高
	private String drawNo;//墩台定型图号
	private Double maxScourline;//最大冲刷线
	private String material;//墩材质
	private String baseType;//墩基础式样
	private String basematerial;//墩基础材质
	private String baseGeology;//墩基底地质
	
	@Id
	@TableGenerator(name = "web_tab_pk", table = "web_tab_pk", pkColumnName = "G_KEY", pkColumnValue = "data_work_pier", valueColumnName = "G_VALUE", allocationSize = 1)
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

	public String getHwd() {
		return hwd;
	}

	public void setHwd(String hwd) {
		this.hwd = hwd;
	}

	public String getHollow() {
		return hollow;
	}

	public void setHollow(String hollow) {
		this.hollow = hollow;
	}

	public String getHwidth() {
		return hwidth;
	}

	public void setHwidth(String hwidth) {
		this.hwidth = hwidth;
	}

	public String getLoss() {
		return loss;
	}

	public void setLoss(String loss) {
		this.loss = loss;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
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

	public String getHole() {
		return hole;
	}

	public void setHole(String hole) {
		this.hole = hole;
	}

	public String getTopHeight() {
		return topHeight;
	}

	public void setTopHeight(String topHeight) {
		this.topHeight = topHeight;
	}

	public Double getBaseHeight() {
		return baseHeight;
	}

	public void setBaseHeight(Double baseHeight) {
		this.baseHeight = baseHeight;
	}

	public Double getMaxScourline() {
		return maxScourline;
	}

	public void setMaxScourline(Double maxScourline) {
		this.maxScourline = maxScourline;
	}

	public String getDrawNo() {
		return drawNo;
	}

	public void setDrawNo(String drawNo) {
		this.drawNo = drawNo;
	}

	

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getBaseType() {
		return baseType;
	}

	public void setBaseType(String baseType) {
		this.baseType = baseType;
	}

	public String getBasematerial() {
		return basematerial;
	}

	public void setBasematerial(String basematerial) {
		this.basematerial = basematerial;
	}

	public String getBaseGeology() {
		return baseGeology;
	}

	public void setBaseGeology(String baseGeology) {
		this.baseGeology = baseGeology;
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
	@JoinColumn(name = "cat_id")
	@NotFound(action = NotFoundAction.IGNORE)
	public Catalog getCat() {
		return cat;
	}
	public void setCat(Catalog cat) {
		this.cat = cat;
	}
	public String getpLength() {
		return pLength;
	}
	public void setpLength(String pLength) {
		this.pLength = pLength;
	}
	public String getpWidth() {
		return pWidth;
	}
	public void setpWidth(String pWidth) {
		this.pWidth = pWidth;
	}
	public String getpHeight() {
		return pHeight;
	}
	public void setpHeight(String pHeight) {
		this.pHeight = pHeight;
	}
	public String getDesignM() {
		return designM;
	}
	public void setDesignM(String designM) {
		this.designM = designM;
	}
}
