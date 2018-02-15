package cn.appsys.service.appInfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppInfo;

@SuppressWarnings("unused")
public interface AppInfoService {
	  public List<AppInfo> selectByPage(AppInfo appInfo,int pageNo,int pageSize);
	  public int selectCountByPage(AppInfo appInfo);
	  public int add(AppInfo appInfo);
	  public int selectHaveApkName(String apkName);
	  public int deleteById(String id);
	  public AppInfo selectById(String id);
	  public int updateStatus(int id,int status,String isTrue);
	  public int  delFile(int id,String flag);
	  public int updateInfo(AppInfo appInfo,String isUpdateStatus);
	  public int updateVersionId(long id,long versionId);  //修改最新版本id
}
