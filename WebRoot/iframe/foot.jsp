<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%
String path2 = request.getContextPath();
String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path2+"/"; 
%>

<TABLE class=border3 cellSpacing=0 width=996 align=center border=0>
  <TBODY>
  <TR><TD align=center ><img src="<%=basePath2 %>images/foot.jpg" width="996"  ></TD></TR>
  </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=996 align=center border=0>
  <TBODY>
  <TR>
    <TD align=right width=50 height=50>&nbsp;</TD>
    <TD align=middle width=791><a href="<%=basePath2 %>admin/login.jsp">系统管理员登录</a><BR></TD>
    <TD width=92></TD>
  </TR>
  </TBODY>
</TABLE> 