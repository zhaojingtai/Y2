package cn.appsys.dao.dataDictionary;

import java.util.List;

import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {
   public List<DataDictionary> getStatusList();
   public List<DataDictionary> getflatFormList();
}
