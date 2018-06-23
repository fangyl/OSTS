<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" /> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
</head>
<script type="text/javascript">
function sub()
{
	if(document.form1.mc.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入分类名称！");
		document.form1.mc.focus();
		return false;
	} 
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
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		
%>
<body>
<table width=100% border=0 cellpadding=3 cellspacing=1 class=css_table bgcolor='#E1E1E1'>
  <tr class="css_col11">
    <td colspan=10>
      <table width=100% border=0 cellpadding=4 cellspacing=0 class=css_main_table>
        <tr>
          <td class=css_main>分类管理</td>
        </tr>
      </table>
    </td>
  </tr> 
  <TR class="css_col11">
    <td height="26">序号</td>
	<td>分类名称</td> 
      <TD>删除</td>
    </tr>
    <%
			List pagelist3=cb.getCom("select * from fenlei order by id desc",2);
			if(!pagelist3.isEmpty()){
			for(int i=0;i<pagelist3.size();i++){
				List pagelist2 =(ArrayList)pagelist3.get(i);
	%> 
	<TR class="css_col11">
      <TD><%=i+1 %></td>
      <TD><%=pagelist2.get(1).toString() %></td>  
      <TD><a href="<%=basePath%>delFenlei.action?method=delfl&id=<%=pagelist2.get(0).toString()%>" >删除</a></td>
    </tr>
<% }} %>
	<TR class="css_col11">
	<td colspan=3>删除分类将删除该分类下所有相关信息，请谨慎操作！</td>
	</tr>  
	<TR class="css_col11">
	<td height="26" align="center" colspan=3>
<form name="form1" action="<%=basePath %>addFenlei.action?method=addfl" method="post">	
<table cellspacing="1" cellpadding="2" align="center" border="0">
  <tbody>
    <TR class="css_col11">
      <td align="center" height="26" bgcolor="#FAFBFC">
      分类名称：<input name="mc" size="25" type="text"> 
      <input type="button" value="确定" onclick='sub()'></td>
    </tr> 
  </tbody>
</table>
</form>
	</td>
	</tr> 
			</table> 
		  
 
</BODY>
<%} %> 
