package cn.appsys.service.appInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.appInfo.AppInfoMapper;
import cn.appsys.pojo.AppInfo;
@Service
public class AppInfoServiceImpl implements AppInfoService{
	@Autowired
    private AppInfoMapper appInfoMapper;
	@Override
	public List<AppInfo> selectByPage(AppInfo appInfo, int pageNo, int pageSize) {
		return appInfoMapper.selectByPage(appInfo, (pageNo-1)*pageSize, pageSize);
	}

	@Override
	public int selectCountByPage(AppInfo appInfo) {
		return appInfoMapper.selectCountByPage(appInfo);
	}

	@Override
	public int add(AppInfo appInfo) {
		return appInfoMapper.add(appInfo);
	}

	@Override
	public int selectHaveApkName(String apkName) {
		return appInfoMapper.selectHaveApkName(apkName);
	}

	@Override
	public int deleteById(String id) {
		int num=0;
		try {
			num=appInfoMapper.deleteById(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public AppInfo selectById(String id) {
		AppInfo appInfo=null;
		try {
			appInfo=appInfoMapper.selectById(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appInfo;
	}

	@Override
	public int updateStatus(int id, int status,String isTrue) {
		
		return appInfoMapper.updateStatus(id, status,isTrue);
	}

	@Override
	public int delFile(int id, String flag) {
		return appInfoMapper.delFile(id, flag);
	}

	@Override
	public int updateInfo(AppInfo appInfo,String isUpdateStatus) {
		return appInfoMapper.updateInfo(appInfo,isUpdateStatus);
	}

	@Override
	public int updateVersionId(long id, long versionId) {
		return appInfoMapper.updateVersionId(id, versionId);
	}

}
