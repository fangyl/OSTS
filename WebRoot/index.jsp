<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<SCRIPT language=javascript>
//检验表单的合法性
function checklogin() {
	if (document.loginform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的用户名！");
		document.loginform.username.focus();
		return false;
	}
	if (document.loginform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的密码！");
		document.loginform.password.focus();
		return false;
	} 
}
</SCRIPT>
<TABLE cellSpacing=0 width=1003 align=center border=0>
  <TBODY>
  <TR>
    <TD width=230>
      <TABLE class=border cellSpacing=0 cellPadding=0 width=225 align=center border=0>
        <TBODY>
        <TR>
          <TD class=font_01 align=middle width=31 background=<%=basePath %>images/menu_bg1.gif>
		  <IMG height=16 src="<%=basePath %>images/icon_keyword.gif" width=16></TD>
          <TD class=font_01 width=148 background=<%=basePath %>images/menu_bg1.gif height=25>
		  <STRONG><SPAN class=font_02>最新股票</SPAN></STRONG><IMG src="<%=basePath %>images/hot.gif"></TD>
          <TD class=font_01 width=44 background=<%=basePath %>images/menu_bg1.gif>
		  <A href="<%=basePath %>sp.jsp"><IMG height=11 src="<%=basePath %>images/more.gif" width=29 border=0></A></TD></TR>
        <TR>
          <TD colSpan=3 height=150>
            <TABLE cellSpacing=0 cellPadding=0 width="96%" align=center border=0>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
<%
	List tlist=cb.getCom("select id,mc,sj from sp order by id desc limit 0,8",3);
	if(!tlist.isEmpty()){
		for(int i=0;i<tlist.size();i++){
		List list2=(List)tlist.get(i);
%>                 
              <TR>
                <TD height=20> <A class="links" href="<%=basePath %>spinfo.jsp?id=<%=list2.get(0).toString()%>"  >
                <%=list2.get(1).toString().length()>13?list2.get(1).toString().substring(0,13):list2.get(1).toString() %></A></TD>
                <TD><%=list2.get(2).toString().substring(5,10) %></TD>
			  </TR>
<%}} %>			   
              <TR>
                <TD height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD width=5>&nbsp;</TD>
    <TD>
      <TABLE class=border2 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#fff7d6 height=15><SPAN class=font_01>&nbsp;&nbsp; </SPAN><STRONG> 
			<A href="#"><FONT color=red> </FONT></A><FONT color=red> </FONT></STRONG></TD>
		  </TR>
        <TR>
          <TD height=170>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width="60%">
                  <TABLE height=150 cellSpacing=0 cellPadding=0 width="100%" 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD align=middle>
                        <DIV align=center>
                        <SCRIPT type=text/javascript>
var imgUrl = new Array();
var imgtext = new Array();
var imgLink = new Array();

imgUrl[0]='upfile/roll/1.jpg';
imgLink[0]='http://www.163.com';
imgtext[0]=' ';

imgUrl[1]='upfile/roll/2.jpg';
imgLink[1]='http://www.baidu.com';
imgtext[1]=' ';

imgUrl[2]='upfile/roll/3.jpg';
imgLink[2]='http://www.sina.com';
imgtext[2]=' ';

imgUrl[3]='upfile/roll/4.jpg';
imgLink[3]='http://www.yahoo.com.cn';
imgtext[3]=' ';
				

var pics=imgUrl[0];
var links=imgLink[0];
var texts=imgtext[0];
for(var i=1;i<imgUrl.length;i++){
	pics+='|'+imgUrl[i];
	links+='|'+imgLink[i];
	texts+='|'+imgtext[i];
}

var focus_width=500
var focus_height=200
var text_height=1
var swf_height = focus_height+text_height

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="<%=basePath %>images/rollpic.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#F0F0F0">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
document.write('<embed src="<%=basePath %>images/rollpic.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#F0F0F0" quality="high" width="'+ focus_width +'" height="'+ focus_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');

</SCRIPT>
                        </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD width=5>&nbsp;</TD>
    <TD width=230>
      <TABLE class=border cellSpacing=0 cellPadding=0 width=225 align=center border=0>
        <TBODY>
        <TR>
          <TD class=font_01 align=middle width=31 background=<%=basePath %>images/menu_bg1.gif><IMG height=16 src="<%=basePath %>images/icon_keyword.gif" width=16></TD>
          <TD class=font_01 width=148 background=<%=basePath %>images/menu_bg1.gif height=25><SPAN class=font_02><STRONG>用户登录</STRONG></SPAN></TD>
          <TD class=font_01 width=44 background=<%=basePath %>images/menu_bg1.gif>&nbsp;</TD>
		</TR>
        <TR>
          <TD colSpan=3 height=150>
<%String member=(String)session.getAttribute("member");if(member==null){ %>
          <FORM name="loginform" method="post" action="<%=basePath %>loginMember2.action?method=mlogin" onSubmit="return checklogin();"> 
            <TABLE height=175 cellSpacing=0 cellPadding=0 width="97%" align=center border=0>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=32 align="center">帐号：<input type="text" size="15" name="username"></TD>
			  </TR>
			  <TR>
                <TD height=20 align="center">密码：<input type="password" size="15" name="password"></TD>
			  </TR>
              <TR>
                <TD height=20 align="center"><input type="submit" value="登录">
				<INPUT value="注册" type="button" onclick="window.location.href='reg.jsp'">&nbsp;&nbsp;
      <INPUT value="找回密码" type="button" onclick="window.location.href='lost.jsp'"></TD></TR>
              <TR>
                <TD height=5></TD></TR></TBODY>
                </TABLE>
         </FORM>
<%}else{ %>
			<TABLE height=175 cellSpacing=0 cellPadding=0 width="97%" align=center border=0>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
              <TR>
                <TD height=32 align="center">欢迎会员：<%=member %></TD>
			  </TR>
			  <TR>
                <TD height=20 align="center"><a href="<%=basePath %>member/index.jsp">会员中心</a></TD>
			  </TR>
              <TR>
                <TD height=20 align="center"><a href="<%=basePath%>exitMember.action?method=memberexit">退出登录</a></TD></TR>
              <TR>
                <TD height=5></TD></TR></TBODY>
                </TABLE>
<%} %>
           
          </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 width=1003 align=center border=0>
  <TBODY>
  <TR>
    <TD height=5></TD></TR></TBODY></TABLE>
<TABLE height=199 cellSpacing=0 width=1003 align=center border=0>
  <TBODY>
  <TR>
    <TD width=230 height=199>
      <TABLE class=border cellSpacing=0 cellPadding=0 width=225 align=center border=0>
        <TBODY>
        <TR>
          <TD class=font_01 align=middle width=31 background=<%=basePath %>images/menu_bg1.gif><IMG height=16 src="<%=basePath %>images/icon_keyword.gif" width=16></TD>
          <TD class=font_01 width=148 background=<%=basePath %>images/menu_bg1.gif height=25>
		  <SPAN class=font_02><STRONG>热门股票</STRONG></SPAN><IMG src="<%=basePath %>images/hot.gif"></TD>
          <TD class=font_01 width=44 background=<%=basePath %>images/menu_bg1.gif><A href="<%=basePath %>sp.jsp"><IMG height=11 src="<%=basePath %>images/more.gif" width=29 border=0></A></TD>
		</TR>
        <TR>
          <TD colSpan=3 height=150>
            <TABLE cellSpacing=0 cellPadding=0 width="96%" align=center border=0>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
<%
	List t2list=cb.getCom("select id,mc,sj from sp order by dj desc limit 0,8",3);
	if(!t2list.isEmpty()){
		for(int i=0;i<t2list.size();i++){
		List list2=(List)t2list.get(i);
%>                 
              <TR>
                <TD height=20> <A class="links" href="<%=basePath %>spinfo.jsp?id=<%=list2.get(0).toString()%>" target="_blank">
                <%=list2.get(1).toString().length()>13?list2.get(1).toString().substring(0,13):list2.get(1).toString() %></A></TD>
                <TD><%=list2.get(2).toString().substring(5,10) %></TD>
			  </TR>
<%}} %> 
              <TR>
                <TD height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD width=5>&nbsp;</TD>
    <TD><img src="<%=basePath %>images/abc.jpg" width="520" height="280" border="0"></TD>
    <TD width=5>&nbsp;</TD>
    <TD width=230>
      <TABLE class=border cellSpacing=0 cellPadding=0 width=225 align=center border=0>
        <TBODY>
        <TR>
          <TD class=font_01 align=middle width=31 background=<%=basePath %>images/menu_bg1.gif><IMG height=16 src="<%=basePath %>images/icon_keyword.gif" width=16></TD>
          <TD class=font_01 width=148 background=<%=basePath %>images/menu_bg1.gif height=25><SPAN class=font_02><STRONG>股票分类<IMG src="<%=basePath %>images/hot.gif"></STRONG></SPAN></TD>
          <TD class=font_01 width=44 background=<%=basePath %>images/menu_bg1.gif><A href="<%=basePath %>fenlei.jsp"><IMG height=11 src="<%=basePath %>images/more.gif" width=29 border=0></A></TD>
		</TR>
        <TR>
          <TD colSpan=3 height=150>
            <TABLE cellSpacing=0 cellPadding=0 width="96%" align=center border=0>
              <TBODY>
              <TR>
                <TD height=5></TD></TR>
<%
	List t3list=cb.getCom("select id,mc from fenlei order by id desc limit 0,8",2);
	if(!t3list.isEmpty()){
		for(int i=0;i<t3list.size();i++){
		List list2=(List)t3list.get(i);
%>                 
              <TR>
                <TD height=20> <A class="links" href="<%=basePath %>flinfo.jsp?flm=<%=list2.get(1).toString()%>" target="_blank">
                <%=list2.get(1).toString()  %></A></TD>
                <TD> </TD>
			  </TR>
<%}} %> 
              <TR>
                <TD height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
 
<center>
<TABLE class=border cellSpacing=0 cellPadding=0 width=996 align=center border=0>
    <TBODY>
     <TR>
          <TD class=font_01 align=middle width=31 background=<%=basePath %>images/menu_bg1.gif><IMG height=16 src="<%=basePath %>images/icon_keyword.gif" width=16></TD>
          <TD align="left" class=font_01 background=<%=basePath %>images/menu_bg1.gif height=25><SPAN class=font_02><STRONG>股票信息<IMG src="<%=basePath %>images/hot.gif"></STRONG></SPAN></TD> 
    </TR>
	</TBODY>
</TABLE>
 
<TABLE class=border cellSpacing=0 cellPadding=0 width=996 align=center border=0>
    <TBODY>
    <TR>
<%
	List t9list=cb.getCom("select id,mc,pic,pp,jg from sp order by id desc limit 5",5);
	if(!t9list.isEmpty()){
		for(int i=0;i<t9list.size();i++){
		List list2=(List)t9list.get(i);
%>
	<TD align=middle>
	  <DIV><A href="<%=basePath %>spinfo.jsp?id=<%=list2.get(0).toString() %>" > 
	  <IMG title="名称：<%=list2.get(1).toString() %> 分类：<%=list2.get(3).toString() %> 价格：<%=list2.get(4).toString() %>" height=180 src="<%=basePath+list2.get(2).toString() %>" width=190 border=0></A></DIV>
	  <DIV style="LINE-HEIGHT: 200%"><A href="<%=basePath %>proinfo.jsp?id=<%=list2.get(0).toString() %>" ><%=list2.get(1).toString() %></A></DIV>
	</TD>
<%}} %> 
  </TR>
  <TR>
<%
	List ss9list=cb.getCom("select id,mc,pic,pp,jg from sp order by id desc limit 10",5);
	if(!ss9list.isEmpty()){
		for(int i=5;i<ss9list.size();i++){
		List list2=(List)ss9list.get(i);
%>
	<TD align=middle>
	  <DIV><A href="<%=basePath %>spinfo.jsp?id=<%=list2.get(0).toString() %>" > 
	  <IMG title="名称：<%=list2.get(1).toString() %> 分类：<%=list2.get(3).toString() %> 价格：<%=list2.get(4).toString() %>" height=180 src="<%=basePath+list2.get(2).toString() %>" width=190 border=0></A></DIV>
	  <DIV style="LINE-HEIGHT: 200%"><A href="<%=basePath %>proinfo.jsp?id=<%=list2.get(0).toString() %>" ><%=list2.get(1).toString() %></A></DIV>
	</TD>
<%}} %> 
  </TR>
  </TBODY>
</TABLE>
 
  
</center>
<%@ include file="iframe/foot.jsp"%>