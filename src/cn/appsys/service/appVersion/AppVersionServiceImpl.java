package cn.appsys.service.appVersion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.appVersion.AppVersionMapper;
import cn.appsys.pojo.AppVersion;

@Service
public class AppVersionServiceImpl implements AppVersionService{
	@Autowired
     private AppVersionMapper appVersionMapper;
	
	@Override
	public int deleteByAppId(String id) {
		return appVersionMapper.deleteByAppId(Integer.parseInt(id));
	}

	@Override
	public int addVersion(AppVersion appVersion) {
		return appVersionMapper.addVersion(appVersion);
	}

	@Override
	public int getNewVersion(int id) {
		return appVersionMapper.getNewVersion(id);
	}

	@Override
	public int updateVersion(AppVersion appVersion) {
		return appVersionMapper.updateVersion(appVersion);
	}

	@Override
	public int deleteApkFile(long id) {
		return appVersionMapper.deleteApkFile(id);
	}

}
