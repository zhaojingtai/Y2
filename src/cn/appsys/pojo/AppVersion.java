package cn.appsys.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * AppVersion entity. @author MyEclipse Persistence Tools
 */

public class AppVersion{

	// Fields

	private Long id;//主键id
	private Long appId;//APPid
	private String versionNo;//版本号
	private String versionInfo;//版本描述
	private Long publishStatus;//发布状态id
	private String downloadLink;//apk文件下载链接
	private Double versionSize;//版本大小
	
	private Long createdBy;//创建者
	private Date creationDate;//创建时间
	private Long modifyBy;//更新者
	private Date modifyDate;//更新时间
	private String apkLocPath;//APK文件的服务器存储路径
	public String publishStatusString;//发布状态名称
	private String apkFileName;//上传的apk文件名称

	// Constructors

	/** default constructor */
	public AppVersion() {
	}

	/** full constructor */
	public AppVersion(Long appId, String versionNo, String versionInfo,
			Long publishStatus, String downloadLink, Double versionSize,
			Long createdBy, Date creationDate, Long modifyBy,
			Date modifyDate, String apkLocPath, String apkFileName) {
		this.appId = appId;
		this.versionNo = versionNo;
		this.versionInfo = versionInfo;
		this.publishStatus = publishStatus;
		this.downloadLink = downloadLink;
		this.versionSize = versionSize;
		this.createdBy = createdBy;
		this.creationDate = creationDate;
		this.modifyBy = modifyBy;
		this.modifyDate = modifyDate;
		this.apkLocPath = apkLocPath;
		this.apkFileName = apkFileName;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAppId() {
		return this.appId;
	}

	public void setAppId(Long appId) {
		this.appId = appId;
	}

	public String getVersionNo() {
		return this.versionNo;
	}

	public void setVersionNo(String versionNo) {
		this.versionNo = versionNo;
	}

	public String getVersionInfo() {
		return this.versionInfo;
	}

	public void setVersionInfo(String versionInfo) {
		this.versionInfo = versionInfo;
	}

	public Long getPublishStatus() {
		return this.publishStatus;
	}

	public void setPublishStatus(Long publishStatus) {
		this.publishStatus = publishStatus;
	}

	public String getDownloadLink() {
		return this.downloadLink;
	}

	public void setDownloadLink(String downloadLink) {
		this.downloadLink = downloadLink;
	}

	public Double getVersionSize() {
		return this.versionSize;
	}

	public void setVersionSize(Double versionSize) {
		this.versionSize = versionSize;
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

	public String getCreationDate() {
		if(creationDate!=null){
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		return sd.format(creationDate);
		}
		return  null;
	}

	public void setCreationDate(Date creationDate) {
		if(creationDate!=null){
		this.creationDate = creationDate;
		}
	}

	public String getModifyDate() {
		if(modifyDate!=null){
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		return sd.format(modifyDate);
		}
		return null;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getApkLocPath() {
		return this.apkLocPath;
	}

	public void setApkLocPath(String apkLocPath) {
		this.apkLocPath = apkLocPath;
	}

	public String getApkFileName() {
		return this.apkFileName;
	}

	public void setApkFileName(String apkFileName) {
		this.apkFileName = apkFileName;
	}
	public String getPublishStatusString() {
		return publishStatusString;
	}

	public void setPublishStatusString(String publishStatusString) {
		this.publishStatusString = publishStatusString;
	}

}