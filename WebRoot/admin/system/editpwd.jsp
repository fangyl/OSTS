<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>��̨������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css">  
</head>
<script type="text/javascript">
function check()
{
	if(document.form1.oldpwd.value=="")
	{
		alert("����������룡");
		document.form1.oldpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value=="")
	{
		alert("�����������룡");
		document.form1.newpwd.focus();
		return false;
	} 
	if(document.form1.repwd.value=="")
	{
		alert("��ȷ�����룡");
		document.form1.repwd.focus();
		return false;
	}
	if(document.form1.repwd.value!=document.form1.newpwd.value)
	{
		alert("�Բ���������������벻��ͬ����ȷ�����룡");
		document.form1.repwd.focus();
		return false;
	}
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
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{ 
%>
<body>
<form action="<%=basePath %>adminPwd.action?method=uppwd" method="post" name="form1" onSubmit="return check()">
<table width=100% border=0 cellpadding=3 cellspacing=1 class=css_table bgcolor='#E1E1E1'>
  <tr class="css_col11">
    <td colspan=10>
      <table width=100% border=0 cellpadding=4 cellspacing=0 class=css_main_table>
        <tr>
          <td class=css_main>ϵͳ�û�����</td>
        </tr>
      </table>
    </td>
  </tr> 
  	  <TR class="css_col11">
		<td align=right width=40%>�� �� �룺</td> 
		<td align="left"><input type="password" name="oldpwd" size="20" maxlength=16></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right width=40%>�� �� �룺</td> 
		<td align="left"><input type="password" name="newpwd" size="20" maxlength=16></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right width=40%>ȷ�����룺</td> 
		<td align="left"><input type="password" name="repwd" size="20" maxlength=16></td> 
	  </tr>
	  <TR class="css_col11">
		<td align=right width=40%><input type="submit" value="ȷ��"></td> 
		<td align="left"><input type="reset" value="����"></td> 
	  </tr>
	</table>
	</form> 
</body>
<%} %>
</HTML>
