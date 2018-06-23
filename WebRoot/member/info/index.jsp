<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<SCRIPT language=javascript>
//检验表单的合法性
function checkreg() {
	if (document.regform.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的真实姓名！");
		document.regform.realname.focus();
		return false;
	} 
	if (document.regform.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的年龄！");
		document.regform.age.focus();
		return false;
	} 
	if (document.regform.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的联系地址！");
		document.regform.address.focus();
		return false;
	} 
	if (document.regform.email.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的邮箱！");
		document.regform.email.focus();
		return false;
	} 
	if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(document.regform.email.value)) 
    {
        alert("请输入格式正确的 e-mail 地址！");
        document.regform.email.focus();
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
	
	String member=(String)session.getAttribute("member"); 
	if(member==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		List mlist=cb.get1Com("select * from member where username='"+member+"'",9);
%>
<body>
<form action="<%=basePath %>upMember.action?method=mupreg" method="post" name="regform" onSubmit="return checkreg()">
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="2" height="25">修改详细资料 当前用户：<FONT color=red><%=member %></FONT></th>
    </tr>
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>真实姓名：</td>
      <td class="td_bg" align=left><input type="text" size="10" name="realname" value="<%=mlist.get(3).toString() %>"></td>
    </tr>
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>性别：</td>
      <td class="td_bg" align=left><input type="radio" name="sex" value="男" checked="checked"> 男 <input type="radio" name="sex" value="女"> 女</td>
    </tr>
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>年龄：</td>
      <td class="td_bg" align=left><input type="text" size="10" name="age" value="<%=mlist.get(5).toString() %>"></TD>
    </tr>
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>联系地址：</td>
      <td class="td_bg" align=left><input type="text" size="30" name="address" value="<%=mlist.get(6).toString() %>"></TD>
    </tr> 
    <tr>
      <td class="td_bg" width="45%" height="23" align=right>邮箱：</td>
      <td class="td_bg" align=left><input type="text" size="30" name="email" value="<%=mlist.get(7).toString() %>"></TD>
    </tr>  
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center>
      <input type="submit" value="确定修改"></td>
    </tr> 
  </tbody>
</table>
</form>
</body>
<%} %>
