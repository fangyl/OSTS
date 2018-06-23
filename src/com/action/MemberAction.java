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
import com.util.Constant;

public class MemberAction extends ActionSupport implements Action{
	
	String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();	
	ComBean cBean = new ComBean();

	//会员注册
	public String regMember() throws Exception {
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		String realname = request.getParameter("realname"); 
		String sex = request.getParameter("sex"); 
		String age = request.getParameter("age"); 
		String address = request.getParameter("address"); 
		String email = request.getParameter("email");
		String str=cBean.getString("select id from member where username='"+username+"'");
		if(str==null){
			int flag=cBean.comUp("insert into member(username,password,realname,sex,age,address,email,regtime) " +
					"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+email+"','"+date+"')");
			if(str == null){
				request.setAttribute("message", "注册成功请登录！");
				return "success";
			}
			else{
				session.setAttribute("member", username);
				request.setAttribute("message", "操作失败！");
				return "success";
			}
		}
		else{
			request.setAttribute("message", "该用户名已存在！");
			return "success";
		} 
	}
	//会员修改
	public String upMember() throws Exception {
		String member=(String)session.getAttribute("member"); 
		String realname = request.getParameter("realname"); 
		String sex = request.getParameter("sex"); 
		String age = request.getParameter("age"); 
		String address = request.getParameter("address"); 
		String email = request.getParameter("email"); 
		int flag=cBean.comUp("update member set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
				"address='"+address+"',email='"+email+"' where username='"+member+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "操作成功！");
			return "success";
		}
		else{
			request.setAttribute("message", "操作失败！");
			return "success";
		}
	}
	//会员修改
	public String pwdMember() throws Exception {
		String member=(String)session.getAttribute("member"); 
		String oldpwd = request.getParameter("oldpwd"); 
		String newpwd = request.getParameter("newpwd"); 
		String str=cBean.getString("select id from member where username='"+member+"' and  password='"+oldpwd+"'");
		if(str==null){
			request.setAttribute("message", "原始密码信息错误！");
			return "success"; 
		}
		else{
			int flag=cBean.comUp("update member set password='"+newpwd+"' where username='"+member+"'");
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
	//会员登录
	public String loginMember() throws Exception {
		String username=request.getParameter("username");
		String password = request.getParameter("password"); 
		String str=cBean.getString("select id from member where username='"+username+"' and password ='"+password+"' and ifuse='在用'");
		if(str == null){
			request.setAttribute("message", "登录信息错误！");
			return "success";
		}
		else{
			session.setAttribute("member", username);
			request.setAttribute("message", "登录成功！");
			return "success";
		}
	}
	public String loginMember2() throws Exception {
		String username=request.getParameter("username");
		String password = request.getParameter("password"); 
		String str=cBean.getString("select id from member where username='"+username+"' and password ='"+password+"' and ifuse='在用'");
		if(str == null){
			request.setAttribute("message", "登录信息错误！");
			return "success";
		}
		else{
			session.setAttribute("member", username);
			request.setAttribute("message", "登录成功！");
			return "success";
		}
	}
	
	//会员找回密码
	public String lostPwd() throws Exception {
		request.setAttribute("message", "新密码已经发到您的邮箱请注意查收！");
		return "success"; 
	}
	//会员退出登录
	public String exitMember() throws Exception {
		session.removeAttribute("member");
		return "success";
	}
	
	
	//锁定会员
	public String useMember() throws Exception {
		String id = request.getParameter("id");  
		String sql="";
		String str=cBean.getString("select ifuse from member where id='"+id+"'");
		if(str.equals("在用")){
			sql="update member set ifuse='停用' where id='"+id+"'";
		}
		else{
			sql="update member set ifuse='在用' where id='"+id+"'";
		}
		int flag=cBean.comUp(sql);
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "操作成功！");
			return "success";
		}
		else{
			request.setAttribute("message", "操作失败！");
			return "success";
		}
	}
	//删除会员
	public String delMember() throws Exception {
		String id = request.getParameter("id");  
		int flag=cBean.comUp("delete from member where id='"+id+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "操作成功！");
			return "success";
		}
		else{
			request.setAttribute("message", "操作失败！");
			return "success";
		}
	}
}
