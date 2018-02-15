package cn.appsys.service.devUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.devUser.DevUserMapper;
import cn.appsys.pojo.DevUser;
@Service
public class DevUserServiceImpl implements DevUserService{
	@Autowired
    private DevUserMapper devUserMapper;
	@Override
	public DevUser login(String devCode, String devPassword) {
		DevUser user=null;
		try {
			user=devUserMapper.login(devCode, devPassword);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

}
