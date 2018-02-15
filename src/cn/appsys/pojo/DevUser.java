package cn.appsys.pojo;

import java.sql.Timestamp;

/**
 * DevUser entity. @author MyEclipse Persistence Tools
 */

public class DevUser {

	// Fields

	private Long id;//主键id
	private String devCode;//开发者账号
	private String devName;//开发者名称
	private String devPassword;//开发者密码
	private String devEmail;//开发者邮箱
	private String devInfo;//开发者简介
	
	private Long createdBy;//创建者
	private Timestamp creationDate;//创建时间
	
	private Long modifyBy;//更新者
	private Timestamp modifyDate;//更新时间

	// Constructors

	/** default constructor */
	public DevUser() {
	}

	/** full constructor */
	public DevUser(String devCode, String devName, String devPassword,
			String devEmail, String devInfo, Long createdBy,
			Timestamp creationDate, Long modifyBy, Timestamp modifyDate) {
		this.devCode = devCode;
		this.devName = devName;
		this.devPassword = devPassword;
		this.devEmail = devEmail;
		this.devInfo = devInfo;
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

	public String getDevCode() {
		return this.devCode;
	}

	public void setDevCode(String devCode) {
		this.devCode = devCode;
	}

	public String getDevName() {
		return this.devName;
	}

	public void setDevName(String devName) {
		this.devName = devName;
	}

	public String getDevPassword() {
		return this.devPassword;
	}

	public void setDevPassword(String devPassword) {
		this.devPassword = devPassword;
	}

	public String getDevEmail() {
		return this.devEmail;
	}

	public void setDevEmail(String devEmail) {
		this.devEmail = devEmail;
	}

	public String getDevInfo() {
		return this.devInfo;
	}

	public void setDevInfo(String devInfo) {
		this.devInfo = devInfo;
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