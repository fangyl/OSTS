<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/main.css" type="text/css" rel="stylesheet">
</HEAD>
<%String username=(String)session.getAttribute("user"); %>
<BODY>
<div id="head">
  <div class="left"> &nbsp; </div>
  <div class="left head_txt">您好：尊敬的管理员 <%=username%></div>
  <div class="right head_menu">
    <ul id="head_menu">
      <li><A onClick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath%>adminExit.action?method=adminexit" target=_top>退出管理</a></li>
    </ul>
  </div>
</div>
</BODY>
</HTML>