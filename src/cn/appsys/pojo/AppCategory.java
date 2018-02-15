package cn.appsys.pojo;

import java.sql.Timestamp;

/**
 * AppCategory entity. @author MyEclipse Persistence Tools
 */

public class AppCategory {

	// Fields

	private Long id;//主键id
	private String categoryCode;//分类编码
	private String categoryName;//分类名称
	private Long parentId;//父级节点id
	private Long createdBy;//创建者
	private Timestamp creationTime;//创建时间
	private Long modifyBy;//更新者
	private Timestamp modifyDate;//更新时间

	// Constructors

	/** default constructor */
	public AppCategory() {
	}

	/** full constructor */
	public AppCategory(String categoryCode, String categoryName, Long parentId,
			Long createdBy, Timestamp creationTime, Long modifyBy,
			Timestamp modifyDate) {
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
		this.parentId = parentId;
		this.createdBy = createdBy;
		this.creationTime = creationTime;
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

	public String getCategoryCode() {
		return this.categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Long getParentId() {
		return this.parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreationTime() {
		return this.creationTime;
	}

	public void setCreationTime(Timestamp creationTime) {
		this.creationTime = creationTime;
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