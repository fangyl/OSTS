<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css">  
</head>
<SCRIPT language=javascript>
//检验表单的合法性
function check() {
	if (document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写登录帐号名！");
		document.form1.username.focus();
		return false;
	}
	if (document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写登录密码！");
		document.form1.password.focus();
		return false;
	} 
	if (document.form1.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写真实姓名！");
		document.form1.realname.focus();
		return false;
	} 
	if (document.form1.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写年龄！");
		document.form1.age.focus();
		return false;
	} 
	if (document.form1.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写联系地址！");
		document.form1.address.focus();
		return false;
	} 
	if (document.form1.tel.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写联系电话！");
		document.form1.tel.focus();
		return false;
	} 
}
</SCRIPT>
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";
		String usernam="";String password="";String realname="";String sex="";String age="";String address="";String tel="";
		if(method.equals("upm")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from admin where id='"+id+"'",9);
			usernam=alist.get(1).toString();
			password=alist.get(2).toString();
			realname=alist.get(3).toString();
			sex=alist.get(4).toString();
			age=alist.get(5).toString();
			address=alist.get(6).toString();
			tel=alist.get(7).toString();
		}
%>
<body>
<form action="<%=basePath %>addManage.action?method=<%=method%>&id=<%=id%>" method="post" name="form1" onSubmit="return check()">
<table width=100% border=0 cellpadding=3 cellspacing=1 class=css_table bgcolor='#E1E1E1'>
  <tr class="css_col11">
    <td colspan=10>
      <table width=100% border=0 cellpadding=4 cellspacing=0 class=css_main_table>
        <tr>
          <td class=css_main>系统用户管理</td>
        </tr>
      </table>
    </td>
  </tr> 
  	  <TR class="css_col11">
		<td align=right width=40%>登录帐号：</td> 
		<td align="left"><%if(method.equals("upm")){ %>
      <input type="text" size="20" name="username" value="<%=usernam %>" readonly>
      <%}else{ %><input type="text" size="20" name="username" value="<%=usernam %>"><% } %></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>初始密码：</td> 
		<td align="left"><input type="password" name="password" size="20" maxlength=16 value="<%=password %>"></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>真实姓名：</td> 
		<td align="left"><input type="text" size="10" name="realname" value="<%=realname %>"></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>用户性别：</td> 
		<td align="left"><input type="radio" name="sex" value="男" checked="checked"> 男
		 <input type="radio" name="sex" value="女"> 女</td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>用户年龄：</td> 
		<td align="left"><input type="text" size="10" name="age" value="<%=age %>"></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>联系地址：</td> 
		<td align="left"><input type="text" size="30" name="address" value="<%=address %>"></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right>联系电话：</td> 
		<td align="left"><input type="text" size="30" name="tel" value="<%=tel %>"></td> 
	  </tr>
	  <TR class="css_col11">
		<td colspan=2 height="30" align="center"><input type="submit" value="确定"></td> 
	  </tr>
	</table>
	</form> 
 
</body>
<%} %>