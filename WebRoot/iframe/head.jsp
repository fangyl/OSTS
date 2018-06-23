<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content=all name=robots>
<META content=index,follow name=GoogleBot>
<META content=index,follow name=Baiduspider>
<LINK href="<%=basePath %>images/css.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.5945" name=GENERATOR>
</HEAD>
<BODY>
<TABLE cellSpacing=0 width="996" height="280" align="center" background="<%=basePath %>images/top.jpg" border="0"><TBODY><TR><TD></TD></TR></TBODY></TABLE>
<TABLE class=border cellSpacing=0 cellPadding=0 width=996 align=center border=0>
  <TR>
    <TD background=<%=basePath %>images/menu_bg_l.gif height=40>
     
            <DIV align=center>
			<STRONG class=font_01>
			<A href="<%=basePath %>index.jsp" target=""><FONT color=#ffffff>本站首页</FONT></A> ┆  
			<A href="<%=basePath %>news.jsp" target=""><FONT color=#ffffff>股市动态</FONT></A> ┆ 
      <A href="<%=basePath %>sp.jsp" target=""><FONT color=#ffffff>股票信息</FONT></A> ┆ 
      <A href="<%=basePath %>fenlei.jsp" target=""><FONT color=#ffffff>股票分类</FONT></A> ┆ 
      <A href="<%=basePath %>gwc.jsp" target=""><FONT color=#ffffff>购物车</FONT></A> ┆  
       <A href="<%=basePath %>member/index.jsp" target=""><FONT color=#ffffff>会员中心</FONT></A> ┆
      <A href="<%=basePath %>admin/login.jsp" target=""><FONT color=#ffffff>管理登录</FONT></A>  
 			</STRONG></DIV>
		  
	 </TD>
  </TR>
</TABLE>
<TABLE width=996 align="center" bgcolor="#FFFFFF">
<TR>
  <TD align="center" >
  <MARQUEE scrollAmount=2 width=900 >
	<%  List affList=cb.getCom("select * from gg order by id desc",4);
	if(!affList.isEmpty()){
		for(int aff=0;aff<affList.size();aff++){
		List affList2=(List)affList.get(aff);
  	%> 
	公告：<%=affList2.get(2).toString() %>---<%=affList2.get(3).toString() %>&nbsp;&nbsp;&nbsp;&nbsp; 
	<%}}%>
	</MARQUEE>
  </TD>
</TR>
</TABLE>
<FORM id=form1 name=form1 action="<%=basePath %>sinfo.jsp" method="post">
<TABLE width=996 align="center"  >
<TR>
  <TD align=center background=<%=basePath %>images/menu_bg_l.gif height=40>
  <FONT color=#ffffff><B style="FONT-SIZE: 14px">股票搜索：</B></FONT>
  <SELECT name=type> 
	  <%List flist=cb.getCom("select * from fenlei order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
      <option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>
      <%}} %> 
  </SELECT> 
  <INPUT maxLength=11 size=17 name="key"> 
  <INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BACKGROUND: url(<%=basePath %>images/xq.gif) no-repeat; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" type=submit value=" 搜 索 ">
  </TD>
</TR>
</TABLE>
</FORM>
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