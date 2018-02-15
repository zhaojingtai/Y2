package cn.appsys.pojo;

import java.sql.Timestamp;

/**
 * DataDictionary entity. @author MyEclipse Persistence Tools
 */

public class DataDictionary {

	// Fields

	private Long id;//主键id
	private String typeCode;//类型编码
	private String typeName;//类型名称
	private Long valueId;//类型值id
	private String valueName;//类型值名称
	
	private Long createdBy;//创建者
	private Timestamp creationDate;//创建时间
	
	private Long modifyBy;//更新者
	private Timestamp modifyDate;//更新时间

	// Constructors

	/** default constructor */
	public DataDictionary() {
	}

	/** full constructor */
	public DataDictionary(String typeCode, String typeName, Long valueId,
			String valueName, Long createdBy, Timestamp creationDate,
			Long modifyBy, Timestamp modifyDate) {
		this.typeCode = typeCode;
		this.typeName = typeName;
		this.valueId = valueId;
		this.valueName = valueName;
		this.createdBy = createdBy;
		this.creationDate = creationDate;
		this.modifyBy = modifyBy;
		this.modifyDate = modifyDate;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTypeCode() {
		return this.typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Long getValueId() {
		return this.valueId;
	}

	public void setValueId(Long valueId) {
		this.valueId = valueId;
	}

	public String getValueName() {
		return this.valueName;
	}

	public void setValueName(String valueName) {
		this.valueName = valueName;
	}

	public Long getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreationDate() {
		return this.creationDate;
	}

	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}

	public Long getModifyBy() {
		return this.modifyBy;
	}

	public void setModifyBy(Long modifyBy) {
		this.modifyBy = modifyBy;
	}

	public Timestamp getModifyDate() {
		return this.modifyDate;
	}

	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

}