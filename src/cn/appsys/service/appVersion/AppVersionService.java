package cn.appsys.service.appVersion;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppVersion;

@SuppressWarnings("unused")
public interface AppVersionService {
	public int deleteByAppId(String id);

	public int addVersion(AppVersion appVersion);

	public int getNewVersion(int id);

	public int updateVersion(AppVersion appVersion);
	public int deleteApkFile(long id);
}
