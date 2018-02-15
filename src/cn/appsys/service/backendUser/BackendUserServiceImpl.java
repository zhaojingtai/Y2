package cn.appsys.service.backendUser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.backendUser.BackendUserMapper;
import cn.appsys.pojo.BackendUser;

@Service
public class BackendUserServiceImpl implements BackendUserService{
	@Autowired
    private BackendUserMapper backendUserMapper;
	@Override
	public BackendUser login(String userCode, String userPassword) {

		BackendUser user=null;
		try {
			user=backendUserMapper.login(userCode, userPassword);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

}
