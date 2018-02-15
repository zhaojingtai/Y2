package cn.appsys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DevUser;

public class Interceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)throws Exception{
		HttpSession session=request.getSession();
		BackendUser backendUser=((BackendUser)(session.getAttribute("backendUser")));
		DevUser devUser=(DevUser)(session.getAttribute("devUser"));
		if(null != devUser){ //dev SUCCESS
			return true;
		}else if(null != backendUser){ //backend SUCCESS
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/403.jsp");
			return false;
		}
	}
}
