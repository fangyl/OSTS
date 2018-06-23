<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>网站后台管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.5880" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{ 		
%>
<frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=basePath %>admin/iframe/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="top" />
  <frameset cols="180,*" frameborder="no" border="0" framespacing="0">
    <frame src="<%=basePath %>admin/iframe/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="left" />
    <frame src="<%=basePath %>admin/iframe/main.jsp" name="MainFrame" id="mainFrame" title="main" />
  </frameset>
</frameset>
<noframes>
<%} %> 
