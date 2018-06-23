<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=basePath %>admin/images/main.css" type="text/css" rel="stylesheet" />
<script src="<%=basePath %>admin/images/main.js"  language=JavaScript></script> 
</head>
 
<%
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<div id="content">
  <div id="left">
    <div class="left_title"><a onclick="pucker_show('submenu_',1,'dis','block')" style="CURSOR:pointer;"> 系统用户管理</a></div>
    <ul id="submenu_1" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">修改登陆密码</a></li>
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">系统用户管理</a></li>
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加系统用户</a></li>
    </ul>
    
    
    <div class="left_title"><a onclick="pucker_show('submenu_',8,'dis','block')" style="CURSOR:pointer;"> 系统公告管理</a></div>
    <ul id="submenu_8" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/gg/index.jsp" target="MainFrame">系统公告管理</a></li>
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/gg/add.jsp?method=addgg" target="MainFrame">发布系统公告</a></li>
    </ul>
     
    
    
    
    <div class="left_title"><a onclick="pucker_show('submenu_',3,'dis','block')" style="CURSOR:pointer;"> 股票信息管理</a></div>
    <ul id="submenu_3" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/sp/index.jsp" target="MainFrame">股票信息管理</a></li> 
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/sp/add.jsp?method=addhh" target="MainFrame">增加股票信息</a></li>  
    </ul>
    <div class="left_title"><a onclick="pucker_show('submenu_',2,'dis','block')" style="CURSOR:pointer;"> 管理评论信息</a></div>
    <ul id="submenu_2" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/sp/pl.jsp" target="MainFrame">管理评论信息</a></li> 
    </ul>
    <div class="left_title"><a onclick="pucker_show('submenu_',4,'dis','block')" style="CURSOR:pointer;"> 股票分类管理</a></div>
    <ul id="submenu_4" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/fenlei/index.jsp" target="MainFrame">股票分类管理</a></li> 
    </ul>
    <div class="left_title"><a onclick="pucker_show('submenu_',5,'dis','block')" style="CURSOR:pointer;"> 注册用户管理</a></div>
    <ul id="submenu_5" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/member/index.jsp" target="MainFrame">注册用户管理</a></li>
    </ul>
    <div class="left_title"><a onclick="pucker_show('submenu_',6,'dis','block')" style="CURSOR:pointer;"> 股市动态管理</a></div>
    <ul id="submenu_6" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/news/index.jsp" target="MainFrame">股市动态管理</a></li>
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/news/add.jsp?method=addnews" target="MainFrame">发布股市动态</a></li>
    </ul>
    <div class="left_title"><a onclick="pucker_show('submenu_',7,'dis','block')" style="CURSOR:pointer;"> 订单信息管理</a></div>
    <ul id="submenu_7" class="dis">
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/dd/index.jsp" target="MainFrame">订单信息管理</a></li> 
      <li class="left_link" onClick="DoLocation(this)"><a href="<%=basePath %>admin/dd/tj.jsp" target="MainFrame">销售信息统计</a></li> 
    </ul>
  </div>
</div>
</body>
<%} %>
