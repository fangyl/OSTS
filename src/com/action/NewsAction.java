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

public class NewsAction extends ActionSupport implements Action{
	
	String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();	
	ComBean cBean = new ComBean();

	//增加 及修改
	public String addNews() throws Exception { 
		String method=request.getParameter("method");
		if(method.equals("addnews")){
			String mc = request.getParameter("title");  
			String nr = request.getParameter("content1");  
			String sj = request.getParameter("sj");  
			int flag = cBean.comUp("insert into news(mc,nr,sj )  values('"+mc+"','"+nr+"','"+date+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "操作成功！");
				return "success";
			}
			else{
				request.setAttribute("message", "操作失败！");
				return "success";
			} 
		}
		else{
			String id = request.getParameter("id");
			String mc = request.getParameter("title");  
			String nr = request.getParameter("content1");  
			int flag = cBean.comUp("update news set mc='"+mc+"',nr='"+nr+"' where id='"+id+"' "); 
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
	//删除
	public String delNews() throws Exception {
		String id = request.getParameter("id");
		int flag = cBean.comUp("delete from news where id='"+id+"'");
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
