package cn.appsys.controller.dev;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.ErrorManager;

import org.apache.commons.lang.math.RandomUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

import cn.appsys.pojo.AppCategory;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;
import cn.appsys.pojo.DataDictionary;
import cn.appsys.pojo.DevUser;
import cn.appsys.service.appCategory.AppCategoryServiceImpl;
import cn.appsys.service.appInfo.AppInfoServiceImpl;
import cn.appsys.service.appVersion.AppVersionServiceImpl;
import cn.appsys.service.dataDictionary.DataDictionaryServiceImpl;
import cn.appsys.tools.DelFile;
import cn.appsys.tools.ErrorMessage;
import cn.appsys.tools.Page;

@SuppressWarnings("unused")
@Controller
@RequestMapping("/app")
public class AppInfoController {
	@Autowired
	private AppInfoServiceImpl appInfoServiceImpl;
	@Autowired
	private DataDictionaryServiceImpl dataDictionaryServiceImpl;
	@Autowired
	private AppCategoryServiceImpl appCategoryServiceImpl;
	@Autowired
	private AppVersionServiceImpl appVersionServiceImpl;
	//查询APP信息列表
	@RequestMapping("/list")
    public String toAppInfoList(Model model,AppInfo appinfo,String pageIndex){
		if(pageIndex==null || pageIndex==""){
			pageIndex="1";
		}
		if(appinfo==null){
			appinfo=new AppInfo();
		}
		try {
			Page page=new Page();
			page.setPageSize(5);
			page.setTotalCount(appInfoServiceImpl.selectCountByPage(appinfo));
			int pageNo=Integer.parseInt(pageIndex);
			if(pageNo<=0){
				pageNo=1;
			}
			if(pageNo>=page.getTotalPageCount()){
				pageNo=page.getTotalPageCount();
			}
			page.setCurrentPageNo(pageNo);
			ArrayList<AppInfo> lists=(ArrayList<AppInfo>) appInfoServiceImpl.selectByPage(appinfo, page.getCurrentPageNo(), page.getPageSize());
			ArrayList<DataDictionary> statusList=(ArrayList<DataDictionary>) dataDictionaryServiceImpl.getStatusList();
			ArrayList<DataDictionary> flatFormList=(ArrayList<DataDictionary>) dataDictionaryServiceImpl.getflatFormList();
			ArrayList<AppCategory> categoryLevel1List=(ArrayList<AppCategory>) appCategoryServiceImpl.getListCategoryByParent(null);
			model.addAttribute("categoryLevel1List",categoryLevel1List);
			model.addAttribute("statusList",statusList);
			model.addAttribute("flatFormList",flatFormList);
			model.addAttribute("appInfo",appinfo);
			model.addAttribute("page",page);
			model.addAttribute("list",lists);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "/development/appInfoView";
    }
	
	//根据父级分类id查询分类集合
	@RequestMapping("/categoryList")
	@ResponseBody
	public ArrayList<AppCategory> getCategoryList(String id){
		  ArrayList<AppCategory> list=new ArrayList<AppCategory>();
		  if(id==null || id.equals("")){
			  id=null;
		  }
		  try {
			list=(ArrayList<AppCategory>) appCategoryServiceImpl.getListCategoryByParent(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  return list;
	}
	//查询所属平台
	@RequestMapping("/flatFormList")
	@ResponseBody
	public ArrayList<DataDictionary> getFlatFormList(){
		ArrayList<DataDictionary> flatFormList=new ArrayList<DataDictionary>();
		try {
			flatFormList=(ArrayList<DataDictionary>) dataDictionaryServiceImpl.getflatFormList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flatFormList;
	}
	//前往添加页面
	@RequestMapping("/toAdd")
	public String toAdd(Model model,@RequestParam(value="fileUploadError",required= false)String fileUploadError){
		if(null != fileUploadError){
			model.addAttribute("fileUploadError", ErrorMessage.error);
		}
		return "/development/addAppInfo";
	}
	@RequestMapping("/selectHaveApkName")
	@ResponseBody
	public String selectHaveApkName(String apkName){
		String isTrue="";
		if(apkName==null||apkName.equals("")){
			isTrue="empty";
		}else{
			int num=appInfoServiceImpl.selectHaveApkName(apkName);
			if(num>0){
				isTrue="exist";
			}else{
				isTrue="noexist";
			}
		}
		return JSON.toJSONString(isTrue);
	}
	//添加APP信息
	@RequestMapping("/add")
	public String add(AppInfo appInfo,HttpSession session,HttpServletRequest request,@RequestParam(value="a_logoPicPath") MultipartFile file){
		appInfo.setStatus(1);
		String fileUploadError="";
		if(!file.isEmpty()){
			String path=session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
			String oldFileName=file.getOriginalFilename();
			String type=FilenameUtils.getExtension(oldFileName);
			int size=50000000;
			if(file.getSize()>size){
				fileUploadError="上传大小不得超过40M";
			}else{
				if(!type.equalsIgnoreCase("jpg")&&!type.equalsIgnoreCase("png")&&!type.equalsIgnoreCase("gif")){
					fileUploadError="上传图片格式不正确";
				}else{
					String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"."+type;
					File newFile=new File(path,fileName);
					try {
						file.transferTo(newFile);
						appInfo.setCreatedBy(((DevUser)session.getAttribute("devUser")).getId());
						appInfo.setDevId(((DevUser)session.getAttribute("devUser")).getId());
						appInfo.setCreationDate(new Date());
						appInfo.setLogoLocPath(path+File.separator+fileName);
						appInfo.setLogoPicPath(request.getContextPath()+"/statics/uploadfiles/"+fileName);
						appInfoServiceImpl.add(appInfo);
						return "redirect:/app/list";
					}catch (Exception e) {
						e.printStackTrace();
						fileUploadError=e.getMessage();
					}
				}
			}
		}
		ErrorMessage.error=fileUploadError;
		return "redirect:/app/toAdd?fileUploadError=1";
	}
	//删除app
	@RequestMapping("/del")
	@ResponseBody
	public String delete(String id,HttpSession session){
		String isTrue="false";
		if(id==null||id.equals("")){
			isTrue="notexist";
		}else{
			AppInfo appInfo=appInfoServiceImpl.selectById(id);
			if(appInfo==null){
				isTrue="notexist";
			}
			if(appInfo.getLogoLocPath()!=null&&!appInfo.getLogoLocPath().equals("")){
			DelFile.delFile(appInfo.getLogoLocPath());
			}
			System.out.println(appInfo.getVersionList().size());
			if(appInfo.getVersionId()!=null&&!appInfo.getVersionId().equals("")){
				for(AppVersion version:appInfo.getVersionList()){
					if(version.getApkLocPath()!=null&&!version.getApkLocPath().equals("")){
					DelFile.delFile(version.getApkLocPath());
					}
				}
				appVersionServiceImpl.deleteByAppId(id);
			}
			if(appInfoServiceImpl.deleteById(id)>0){
				isTrue="true";
			}
		}
		return JSON.toJSONString(isTrue);
	}
	//查看APP信息
	@RequestMapping("/toView/{id}")
	public String toView(@PathVariable String id,Model model){
		AppInfo appInfo=null;
		appInfo=appInfoServiceImpl.selectById(id);
		model.addAttribute("appInfo", appInfo);
		return "/development/appView";
	}
	//上下架
	@RequestMapping("/updateStatus")
	@ResponseBody
	public Object updateStatus(String appId){
		HashMap<String,String> map=new HashMap<String, String>();
		try {
			if(appId==null||appId.equals("")){
				map.put("errorCode", "param000001");
				return map;
			}else {
				AppInfo appInfo=appInfoServiceImpl.selectById(appId);
			     if(appInfo==null||appInfo.getStatus()<=0){
			    	 map.put("errorCode", "param000001");
			    	 return map;
			     }
				
				map.put("errorCode", "0");
				if(appInfoServiceImpl.updateStatus(Integer.parseInt(appId), appInfo.getStatus(),"")>0){
					map.put("resultMsg", "success");
				}else{
					map.put("resultMsg", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("errorCode", "exception000001");
		}
		return JSON.toJSONString(map);
	}
	//修改APP信息
	@RequestMapping("/updateInfo")
	public String toUpdateInfo(String id,Model model,@RequestParam(value="fileUploadError",required= false)String fileUploadError){
		if(null != fileUploadError){
			model.addAttribute("fileUploadError", ErrorMessage.error);
		}
		AppInfo appInfo=null;
		appInfo=appInfoServiceImpl.selectById(id);
		model.addAttribute("appInfo", appInfo);
		return "/development/updateAppInfo";
	}
	//删除文件
	@RequestMapping("/delFile")
	@ResponseBody
	public HashMap<String,String>  delLogo(String id,String flag){
		HashMap<String,String> map=new HashMap<String, String>();
		AppInfo appInfo=null;
		appInfo=appInfoServiceImpl.selectById(id);
		String isTrue="false";
		if(flag.equals("logo")&&appInfo.getLogoLocPath()!=null&&!appInfo.getLogoLocPath().equals("")){
			boolean is=DelFile.delFile(appInfo.getLogoLocPath());
			if(is==true){
				is=(appInfoServiceImpl.delFile(Integer.parseInt(id), flag)>0)?true:false;
			}
			 isTrue=String.valueOf(is);
		}else if(flag.equals("apk")&&appInfo.getVersionList().get(0).getApkLocPath()!=null&&!appInfo.getVersionList().get(0).getApkLocPath().equals("")){
			boolean is=DelFile.delFile(appInfo.getVersionList().get(0).getApkLocPath());
			if(is==true){
				is=(appVersionServiceImpl.deleteApkFile(appInfo.getVersionList().get(0).getId())>0)?true:false;
			}
			 isTrue=String.valueOf(is);
		}
		map.put("result", isTrue);
		return map;
	}
	//修改APP信息
	@RequestMapping("/update")
	public String update(AppInfo appInfo,HttpServletRequest request,HttpSession session,
			@RequestParam(value="isUpdateStatus",required=false)String isUpdateStatus,
			@RequestParam(value="attach",required=false) MultipartFile file){
		String fileUploadError=null;
		if(file!=null&&!file.isEmpty()){
			String path=session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
			String oldFileName=file.getOriginalFilename();
			String type=FilenameUtils.getExtension(oldFileName);
			int size=50000000;
			if(file.getSize()>size){
				fileUploadError="上传大小不得超过40M";
				ErrorMessage.error=fileUploadError;
				return "redirect:/app/updateInfo?fileUploadError=1&id="+appInfo.getId();
			}else{
				if(!type.equalsIgnoreCase("jpg")&&!type.equalsIgnoreCase("png")&&!type.equalsIgnoreCase("gif")){
					fileUploadError="上传图片格式不正确";
					ErrorMessage.error=fileUploadError;
					return "redirect:/app/updateInfo?fileUploadError=1&id="+appInfo.getId();
				}else{
					String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"."+type;
					File newFile=new File(path,fileName);
					try {
						appInfo.setLogoLocPath(path+File.separator+fileName);
						appInfo.setLogoPicPath(request.getContextPath()+"/statics/uploadfiles/"+fileName);
						file.transferTo(newFile);	
					}catch (Exception e) {
						e.printStackTrace();
						fileUploadError= e.getMessage();
						ErrorMessage.error=fileUploadError;
						return "redirect:/app/updateInfo?fileUploadError=1&id="+appInfo.getId();
					}
				}
			}
		}
		appInfo.setModifyBy(((DevUser)session.getAttribute("devUser")).getId());
		appInfo.setModifyDate(new Date());
		int num=appInfoServiceImpl.updateInfo(appInfo, isUpdateStatus);
		if(num>0){
		return "redirect:/app/list";
		}
		ErrorMessage.error=fileUploadError;
		return "redirect:/app/updateInfo?fileUploadError=1&id="+appInfo.getId();
	}
	//前往添加版本信息页
	@RequestMapping("/toAddVersion")
	public String toAddVersion(Model model,String id,@RequestParam(value="fileUploadError",required= false)String fileUploadError){
		if(null != fileUploadError){
			model.addAttribute("fileUploadError", ErrorMessage.error);
		}
		model.addAttribute("appInfo",appInfoServiceImpl.selectById(id));
		return "/development/addVersion";
	}
	//添加版本信息
	@RequestMapping("/addVersion")
	public String addVersion(HttpSession session,HttpServletRequest request,AppVersion appVersion,
			@RequestParam(value="a_downloadLink",required=false) MultipartFile file){
		String fileUploadError=null;
		if(file!=null&&!file.isEmpty()){
			String path=session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
			String oldFileName=file.getOriginalFilename();
			String type=FilenameUtils.getExtension(oldFileName);
			int size=50000000;
			if(file.getSize()>size){
				fileUploadError="上传大小不得超过40M";
			}else{
				if(!type.equalsIgnoreCase("apk")){
					fileUploadError="上传文件格式不正确";
				}else{
					String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"."+type;
					File newFile=new File(path,fileName);
					try {
						appVersion.setCreatedBy(((DevUser)session.getAttribute("devUser")).getId());
						appVersion.setCreationDate(new Date());
						appVersion.setApkLocPath(path+File.separator+fileName);
						appVersion.setDownloadLink(request.getContextPath()+"/statics/uploadfiles/"+fileName);
						appVersion.setApkFileName(fileName);
						file.transferTo(newFile);	
						appVersionServiceImpl.addVersion(appVersion);
						appInfoServiceImpl.updateVersionId(appVersion.getAppId(), appVersion.getId());
						return "redirect:/app/list";
					}catch (Exception e) {
						e.printStackTrace();
						fileUploadError= e.getMessage();
					}
				}
			}
		}
		ErrorMessage.error=fileUploadError;
		return "redirect:/app/toAddVersion?fileUploadError=1&id="+appVersion.getAppId();
	}
	//前往修改版本信息页
	@RequestMapping("/toUpdateVersion")
	public String toUpdateVersion(Model model,String aid,@RequestParam(value="fileUploadError",required= false)String fileUploadError){
		if(null != fileUploadError){		
			System.out.println( ErrorMessage.error);
			model.addAttribute("fileUploadError", ErrorMessage.error);
		}
		model.addAttribute("appInfo",appInfoServiceImpl.selectById(aid));
		return "/development/updateVersion";
	}
	//修改版本信息
		@RequestMapping("/updateVersion")
		public String updateVersion(HttpSession session,HttpServletRequest request,AppVersion appVersion,
				@RequestParam(value="a_downloadLink",required=false) MultipartFile file){
			String fileUploadError=null;
			if(file!=null&&!file.isEmpty()){
				String path=session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
				String oldFileName=file.getOriginalFilename();
				String type=FilenameUtils.getExtension(oldFileName);
				int size=50000000;
				if(file.getSize()>size){
					fileUploadError="上传大小不得超过40M";
					ErrorMessage.error=fileUploadError;
					return "redirect:/app/toUpdateVersion?fileUploadError=1&aid="+appVersion.getAppId();
				}else{
					if(!type.equalsIgnoreCase("apk")){
						fileUploadError="上传文件格式不正确";
						ErrorMessage.error=fileUploadError;
						return "redirect:/app/toUpdateVersion?fileUploadError=1&aid="+appVersion.getAppId();
					}else{
						try {
						    String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"."+type;
						    File newFile=new File(path,fileName);
							appVersion.setApkLocPath(path+File.separator+fileName);
							appVersion.setDownloadLink(request.getContextPath()+"/statics/uploadfiles/"+fileName);
							appVersion.setApkFileName(fileName);
							file.transferTo(newFile);	
						}catch (Exception e) {
							e.printStackTrace();
							fileUploadError= e.getMessage();
							ErrorMessage.error=fileUploadError;
							return "redirect:/app/toUpdateVersion?fileUploadError=1&aid="+appVersion.getAppId();
						}
					}
				}
			}
			appVersion.setModifyBy(((DevUser)session.getAttribute("devUser")).getId());
			appVersion.setModifyDate(new Date());
			int num=appVersionServiceImpl.updateVersion(appVersion);
			if(num>0){
				return "redirect:/app/list";
				}
			ErrorMessage.error=fileUploadError;
			return "redirect:/app/toUpdateVersion?fileUploadError=1&aid="+appVersion.getAppId();
			
		}
		@RequestMapping("/loginOut")
		public String loginOut(HttpSession session){
			session.removeAttribute("devUser");
			return "redirect:/dev/login";
		}
}
