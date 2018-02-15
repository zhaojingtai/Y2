package cn.appsys.pojo;

import java.util.Date;
import java.util.List;

/**
 * AppInfo entity. @author MyEclipse Persistence Tools
 */

public class AppInfo{

	// Fields

	private Long id;//主键id
	private String softwareName;//软件名称
	private String apkname;//apk名称
	private String supportRom;//支持Rom
	private String interfaceLanguage;//界面语言
	private Double softwareSize;//软件大小
	private Long devId;//开发者id
	private String appInfo;//应用简介
	private int status;//APP状态id
	private String statusString;//APP状态名称
	private Date onSaleDate;//上架时间
	private Date offSaleDate;//下架时间
	private Long flatformId;//APP所属平台id
	private String flatformString;//apk所属平台名称
	private Long categoryLevel3;//所属三级分类id
	private String categoryLevel3String;//所属三级分类名称
	private Long downloads;//下载量
	private Long createdBy;//创建者
	private Date creationDate;//创建时间
	private Long modifyBy;//更新者
	private Date modifyDate;//更新时间
	private Long categoryLevel1;//所属一级分类id
	private String categoryLevel1String;//所属一级分类名称
	private List<AppVersion> versionList;
	public List<AppVersion> getVersionList() {
		return versionList;
	}

	public void setVersionList(List<AppVersion> versionList) {
		this.versionList = versionList;
	}

	public String getStatusString() {
		return statusString;
	}

	public void setStatusString(String statusString) {
		this.statusString = statusString;
	}

	public String getFlatformString() {
		return flatformString;
	}

	public void setFlatformString(String flatformString) {
		this.flatformString = flatformString;
	}

	public String getCategoryLevel3String() {
		return categoryLevel3String;
	}

	public void setCategoryLevel3String(String categoryLevel3String) {
		this.categoryLevel3String = categoryLevel3String;
	}

	public String getCategoryLevel1String() {
		return categoryLevel1String;
	}

	public void setCategoryLevel1String(String categoryLevel1String) {
		this.categoryLevel1String = categoryLevel1String;
	}

	public String getCategoryLevel2String() {
		return categoryLevel2String;
	}

	public void setCategoryLevel2String(String categoryLevel2String) {
		this.categoryLevel2String = categoryLevel2String;
	}

	private Long categoryLevel2;//所属二级分类id
	private String categoryLevel2String;//所属二级分类名称
	private String logoPicPath;//图片URL路径
	private String logoLocPath;//图片的服务器存储路径
	private Long versionId;//最新版本id
	public Date getOnSaleDate() {
		return onSaleDate;
	}

	public void setOnSaleDate(Date onSaleDate) {
		this.onSaleDate = onSaleDate;
	}

	public Date getOffSaleDate() {
		return offSaleDate;
	}

	public void setOffSaleDate(Date offSaleDate) {
		this.offSaleDate = offSaleDate;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	private String versionString;

	// Constructors

	public String getVersionString() {
		return versionString;
	}

	public void setVersionString(String versionString) {
		this.versionString = versionString;
	}

	/** default constructor */
	public AppInfo() {
	}

	/** full constructor */
	public AppInfo(String softwareName, String apkname, String supportRom,
			String interfaceLanguage, Double softwareSize,
			Long devId, String appInfo, int status, Date onSaleDate,
			Date offSaleDate, Long flatformId, Long categoryLevel3,
			Long downloads, Long createdBy, Date creationDate,
			Long modifyBy, Date modifyDate, Long categoryLevel1,
			Long categoryLevel2, String logoPicPath, String logoLocPath,
			Long versionId) {
		this.softwareName = softwareName;
		this.apkname = apkname;
		this.supportRom = supportRom;
		this.interfaceLanguage = interfaceLanguage;
		this.softwareSize = softwareSize;
		this.devId = devId;
		this.appInfo = appInfo;
		this.status = status;
		this.onSaleDate = onSaleDate;
		this.offSaleDate = offSaleDate;
		this.flatformId = flatformId;
		this.categoryLevel3 = categoryLevel3;
		this.downloads = downloads;
		this.createdBy = createdBy;
		this.creationDate = creationDate;
		this.modifyBy = modifyBy;
		this.modifyDate = modifyDate;
		this.categoryLevel1 = categoryLevel1;
		this.categoryLevel2 = categoryLevel2;
		this.logoPicPath = logoPicPath;
		this.logoLocPath = logoLocPath;
		this.versionId = versionId;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSoftwareName() {
		return this.softwareName;
	}

	public void setSoftwareName(String softwareName) {
		this.softwareName = softwareName;
	}

	public String getApkname() {
		return this.apkname;
	}

	public void setApkname(String apkname) {
		this.apkname = apkname;
	}

	public String getSupportRom() {
		return this.supportRom;
	}

	public void setSupportRom(String supportRom) {
		this.supportRom = supportRom;
	}

	public String getInterfaceLanguage() {
		return this.interfaceLanguage;
	}

	public void setInterfaceLanguage(String interfaceLanguage) {
		this.interfaceLanguage = interfaceLanguage;
	}

	public Double getSoftwareSize() {
		return this.softwareSize;
	}

	public void setSoftwareSize(Double softwareSize) {
		this.softwareSize = softwareSize;
	}

	public Long getDevId() {
		return this.devId;
	}

	public void setDevId(Long devId) {
		this.devId = devId;
	}

	public String getAppInfo() {
		return this.appInfo;
	}

	public void setAppInfo(String appInfo) {
		this.appInfo = appInfo;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	


	public Long getFlatformId() {
		return this.flatformId;
	}

	public void setFlatformId(Long flatformId) {
		this.flatformId = flatformId;
	}

	public Long getCategoryLevel3() {
		return this.categoryLevel3;
	}

	public void setCategoryLevel3(Long categoryLevel3) {
		this.categoryLevel3 = categoryLevel3;
	}

	public Long getDownloads() {
		return this.downloads;
	}

	public void setDownloads(Long downloads) {
		this.downloads = downloads;
	}

	public Long getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}


	
	public Long getModifyBy() {
		return this.modifyBy;
	}

	public void setModifyBy(Long modifyBy) {
		this.modifyBy = modifyBy;
	}

	
	

	public Long getCategoryLevel1() {
		return this.categoryLevel1;
	}

	public void setCategoryLevel1(Long categoryLevel1) {
		this.categoryLevel1 = categoryLevel1;
	}

	public Long getCategoryLevel2() {
		return this.categoryLevel2;
	}

	public void setCategoryLevel2(Long categoryLevel2) {
		this.categoryLevel2 = categoryLevel2;
	}

	public String getLogoPicPath() {
		return this.logoPicPath;
	}

	public void setLogoPicPath(String logoPicPath) {
		this.logoPicPath = logoPicPath;
	}

	public String getLogoLocPath() {
		return this.logoLocPath;
	}

	public void setLogoLocPath(String logoLocPath) {
		this.logoLocPath = logoLocPath;
	}

	public Long getVersionId() {
		return this.versionId;
	}

	public void setVersionId(Long versionId) {
		this.versionId = versionId;
	}

}