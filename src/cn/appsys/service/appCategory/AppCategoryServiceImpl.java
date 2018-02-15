package cn.appsys.service.appCategory;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.appCategory.AppCategoryMapper;
import cn.appsys.pojo.AppCategory;
@Service
public class AppCategoryServiceImpl implements AppCategoryService{
	@Autowired
    private AppCategoryMapper appCategoryMapper;
	@Override
	public List<AppCategory> getListCategoryByParent(String id) {
		ArrayList<AppCategory> list=null;
		try {
			list=(ArrayList<AppCategory>) appCategoryMapper.getListCategoryByParent(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}
   
}
