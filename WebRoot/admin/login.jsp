<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理登录</title>
<link href="<%=basePath %>admin/images/home.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	form1.username.focus()	
	function checkform()
	{
		var flag=true;
		if(form1.username.value==""){alert("请输入用户名!");form1.username.focus();return false};
		if(form1.password.value==""){alert("请输入口令!");form1.password.focus();return false}; 
		form1.submit();
	}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
%>
<body>
<center>
<div class="b_w">
   <div class="l_t">
      <div class="left l_title">网站管理系统</div>
	  <div class="right"><img src="<%=basePath %>admin/images/icon_back.gif" alt="返回" hspace="4" vspace="8" border="0"  />
	  <a href="javascript:window.close()"><img src="<%=basePath %>admin/images/icon_close.gif" alt="关闭" hspace="4" vspace="8" border="0"/></a></div>
   </div>
  <div class="l_bg">
    <ul class="l_user">
<form name="form1" method="post" action="<%=basePath %>loginChange.action">
<input type="hidden" name="method" value="one" />
	  <li>帐户：<input name="username" value="" size="14" type="text" class="l_input" /></li>
	  <li>密码：<input name="password" value="" size="14" type="password" class="l_input" /></li>
	  <li><input class="l_bnt" accesskey="login" value="登 录" type="button"  onclick="checkform()"/>　<input class="l_bnt" value="重 写" type="reset" /></li>
	  </form>
	</ul> 
  </div>
  <div class="l_f">
    <div class="left"><img src="<%=basePath %>admin/images/f_l.gif" /></div>
	<div class="left">
		<img src="<%=basePath %>admin/images/f_bg.gif" width="378" height="36"/></div>
	<div class="right"><img src="<%=basePath %>admin/images/f_r.gif" /></div>
  </div>
</div>
</center>
</body>
</html>