package cn.appsys.dao.appInfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppInfo;

public interface AppInfoMapper {
  public List<AppInfo> selectByPage(@Param("appInfo")AppInfo appInfo,@Param("from")int from,@Param("pageSize")int pageSize); //分页查询
  public int selectCountByPage(@Param("appInfo")AppInfo appInfo);  //查询总数
  public int add(AppInfo appInfo);  //添加APP信息
  public int selectHaveApkName(@Param("apkName")String apkName);  //查询是否含有apk名称 
  public int deleteById(@Param("id")int id);  //删除
  public AppInfo selectById(@Param("id")int id); //通过id查询信息
  public int updateStatus(@Param("id")int id,@Param("status")int status,@Param("isTrue")String isTrue);  //修改状态
  public int  delFile(@Param("id")int id,@Param("flag")String flag);  //删除文件
  public int updateInfo(@Param("appInfo")AppInfo appInfo,@Param("isUpdateStatus")String isUpdateStatus); //修改APP信息
  public int updateVersionId(@Param("id")long id,@Param("versionId")long versionId);  //修改最新版本id
}
