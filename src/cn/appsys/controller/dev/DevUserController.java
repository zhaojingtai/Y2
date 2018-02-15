package cn.appsys.controller.dev;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appsys.pojo.DevUser;
import cn.appsys.service.devUser.DevUserServiceImpl;
@SuppressWarnings("unused")
@Controller
@RequestMapping("/dev")
public class DevUserController {
	@Autowired
     private DevUserServiceImpl service;
	//前往登录页面
	@RequestMapping("/login")
	public String toLogin(){
		return "devLogin";
	}
	//登录
	@RequestMapping("/index")
	public String login(Model model,HttpSession session,String devCode,String devPassword){
	    DevUser user=null;
	    String error="";
	    try {
			user=service.login(devCode.trim(), devPassword.trim());
		} catch (Exception e) {
			e.printStackTrace();
			error="发生异常";
			model.addAttribute("error",error);
			return "devLogin";
		}
	    if(user==null){
	    	error="用户名或密码错误";
	    	model.addAttribute("error",error);
	    	return "devLogin";
	    }
	    session.setAttribute("devUser", user);
		return "/development/openIndex";
	}
	/* @RequestMapping("/down.do")
	    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception{
	        //example.xls 为源文件
	        String fileName = "E:\\mybatis-3-mapper.dtd";
	        //获取输入流
	        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
	        //下载的文件名称
	        String filename = "模版文件.dtd";
	        //转码，免得文件名中文乱码
	        filename = URLEncoder.encode(filename,"UTF-8");
	        //设置文件下载头
	        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
	        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
	        response.setContentType("multipart/form-data");

	        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());//输出
	        int len = 0;
	        while((len = bis.read()) != -1){//一边输入一边输出
	            out.write(len);
	            out.flush();//数据冲刷
	        }
	        out.close();//关闭流
	    }*/
}
