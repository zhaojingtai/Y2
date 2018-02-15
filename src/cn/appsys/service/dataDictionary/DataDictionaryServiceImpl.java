package cn.appsys.service.dataDictionary;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.appsys.dao.dataDictionary.DataDictionaryMapper;
import cn.appsys.pojo.DataDictionary;
@Service
public class DataDictionaryServiceImpl implements DataDictionaryService{
	@Autowired
    private DataDictionaryMapper dataDictionaryMapper;
	@Override
	public List<DataDictionary> getStatusList() {
		ArrayList<DataDictionary> list=null;
		try {
			list=(ArrayList<DataDictionary>) dataDictionaryMapper.getStatusList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	@Override
	public List<DataDictionary> getflatFormList() {
		ArrayList<DataDictionary> list=null;
		try {
			list=(ArrayList<DataDictionary>) dataDictionaryMapper.getflatFormList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

}
