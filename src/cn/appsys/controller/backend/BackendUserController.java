package cn.appsys.controller.backend;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DevUser;
import cn.appsys.service.backendUser.BackendUserServiceImpl;

@SuppressWarnings("unused")
@Controller
@RequestMapping("/backend")
public class BackendUserController {
	@Autowired
	private BackendUserServiceImpl backendUserServiceImpl;
	@RequestMapping("/login")
	public String toLogin(){
		return "backendLogin";
	}
	@RequestMapping("/index")
	public String login(Model model,HttpSession session,String userCode,String userPassword){
		
		 BackendUser user=null;
		    String error="";
		    try {
				user=backendUserServiceImpl.login(userCode.trim(), userPassword.trim());
			} catch (Exception e) {
				e.printStackTrace();
				error="发生异常";
				model.addAttribute("error",error);
				return "backendLogin";
			}
		    if(user==null){
		    	error="用户名或密码错误";
		    	model.addAttribute("error",error);
		    	return "backendLogin";
		    }
		    session.setAttribute("backendUser",user);
		return "/backend/openIndex";
	}
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){
		session.removeAttribute("backendUser");
		return "redirect:/backend/login";
	}
}
