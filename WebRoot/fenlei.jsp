<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
 
<TABLE cellSpacing=0 width=1003 align=center border=0>
  <TBODY>
  <TR>
    <TD height=2></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 width=995 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=760 height=547>
      <TABLE class=border2 height=250 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#fff7d6 height=25><SPAN class=font_01>&nbsp;&nbsp;
          <IMG height=11 src="<%=basePath%>images/up.gif" width=11></SPAN><STRONG> 股票信息 </STRONG></TD></TR>
<%		
     
	List pagelist1 = cb.getCom("select * from fenlei order by id desc",2); 
	 
		if(!pagelist1.isEmpty()){
		for(int i=0;i<pagelist1.size();i++){
			List pagelist2 =(ArrayList)pagelist1.get(i);
%>        
        <TR>
          <TD>
            <TABLE height=38 background=<%=basePath%>images/xx.htm border=0>
              <TBODY>
              <TR bgColor=#eeeeee>
               
                <TD vAlign=center width=661 height=20> 
				<A href="<%=basePath %>flinfo.jsp?flm=<%=pagelist2.get(1).toString()%>" ><%=pagelist2.get(1).toString()%></A></TD>
                <TD width=81><FONT color=red></FONT></TD>
                <TD width=79></TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
<%}} %>
        </TBODY>
      </TABLE>
  
</TD>
    <TD width=5>&nbsp;</TD>
    <TD vAlign=top align=left width=231>
      <TABLE height=304 width=230 border=0>
        <TBODY>
        <TR>
          <TD height=179>
            <TABLE class=border cellSpacing=0 cellPadding=0 width=225 
            align=center border=0>
              <TBODY>
              <TR>
                <TD class=font_01 align=middle width=31 
                background=<%=basePath%>images/menu_bg1.gif><IMG height=16 
                  src="<%=basePath%>images/icon_keyword.gif" width=16></TD>
                <TD class=font_01 width=148 background=<%=basePath%>images/menu_bg1.gif 
                height=25><STRONG><SPAN 
                  class=font_02>热门股票</SPAN></STRONG></TD>
                <TD class=font_01 width=44 background=<%=basePath%>images/menu_bg1.gif></TD></TR>
              <TR>
                <TD colSpan=3 height=150>
                  <TABLE cellSpacing=0 cellPadding=0 width="96%" align=center 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD height=5></TD></TR>
<%
	List t6list=cb.getCom("select id,mc,sj from sp order by dj desc limit 0,25",3);
	if(!t6list.isEmpty()){
		for(int i=0;i<t6list.size();i++){
		List list2=(List)t6list.get(i);
%>                      
                    <TR>
                      <TD height=20> <A href="<%=basePath %>spinfo.jsp?id=<%=list2.get(0).toString()%>" target=_blank>
                      <%=list2.get(1).toString()%></A></TD>
                    </TR>
<%}} %>                   
                    <TR>
                      <TD height=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
        
        </TBODY></TABLE></TD></TR></TBODY></TABLE>
<%@ include file="iframe/foot.jsp"%>