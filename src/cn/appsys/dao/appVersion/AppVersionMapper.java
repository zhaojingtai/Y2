package cn.appsys.dao.appVersion;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppVersion;

public interface AppVersionMapper {
     public int deleteByAppId(@Param("id")int id);
     public int addVersion(AppVersion appVersion);
     public int getNewVersion(@Param("id")int id);
     public int updateVersion(AppVersion appVersion);
     public int deleteApkFile(@Param("id")long id);
}
