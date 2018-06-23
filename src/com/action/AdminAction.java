package com.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.ComBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Common;
import com.util.Constant;

public class AdminAction extends ActionSupport implements Action{
	
	String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();	
	ComBean cBean = new ComBean(); 
	
	//管理员登录
	public String loginChange() throws Exception { 
		String username = request.getParameter("username");
		String password = request.getParameter("password"); 
		String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+password+"'");
		if(str==null){
			request.setAttribute("message", "登录信息错误！"); 
			return "login";
		}
		else{
			session.setAttribute("user", username); 
			return "system";
		}

	}

	//管理员修改密码
	public String adminPwd() throws Exception{
		String username=(String)session.getAttribute("user"); 
		String oldpwd = request.getParameter("oldpwd"); 
		String newpwd = request.getParameter("newpwd"); 
		String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+oldpwd+"'");
		if(str==null){
			request.setAttribute("message", "原始密码信息错误！");
			return "pwd"; 
		}
		else{
			int flag=cBean.comUp("update admin set password='"+newpwd+"' where username='"+username+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				return "pwd";  
			}
			else { 
				request.setAttribute("message", "操作失败！");
				return "pwd"; 
			}
		}
	}
	//管理员退出登录
	public String adminExit() throws Exception {
		session.removeAttribute("user");
		return "exit";
	}
	//增加管理员
	public String addManage() throws Exception{ 
		String method=request.getParameter("method").trim();
		if(method.equals("addm")){
			String username = request.getParameter("username"); 
			String password = request.getParameter("password"); 
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String tel = request.getParameter("tel");
			String str=cBean.getString("select id from admin where username='"+username+"'");
			if(str==null){
				int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,address,tel,addtime) " +
						"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+tel+"','"+date+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					return "success"; 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					return "success"; 
				}
			}
			else{
				request.setAttribute("message", "该用户名已存在！");
				return "success"; 
			} 
		}
		else if(method.equals("upm")){//修改管理员 
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String realname = request.getParameter("realname"); 
			String sex = request.getParameter("sex"); 
			String age = request.getParameter("age"); 
			String address = request.getParameter("address"); 
			String tel = request.getParameter("tel"); System.out.print(realname);
			int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
					"address='"+address+"',tel='"+tel+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				return "success"; 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				return "success";  
			}
		}
		else{
			return "success";  
		}
	}
	//删除管理员
	public String delManage() throws Exception {
		String id = request.getParameter("id");  
		int flag=cBean.comUp("delete from admin where id='"+id+"'");
		if(flag == Constant.SUCCESS){ 
			request.setAttribute("message", "操作成功！");
			return "success"; 
		}
		else { 
			request.setAttribute("message", "操作失败！");
			return "success"; 
		}
	}
}
