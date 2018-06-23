<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
 <script type="text/javascript">
<!--
function CheckForm()
{
	if(document.plform.content.value=="")
	{
		alert("请填写评论内容！");
		document.plform.content.focus();
		return false;
	}
	if(document.plform.member.value=="")
	{
		alert("请填写评论人！");
		document.plform.member.focus();
		return false;
	}
}
//-->
</script>
<%  
	String id=request.getParameter("id");
	if(id==null)id=(String)request.getAttribute("id");
	cb.comUp("update sp set dj=dj+1 where id='"+id+"'");
	List nlist=cb.get1Com("select * from sp where id='"+id+"'",9);
%>
<TABLE cellSpacing=0 width=1003 align=center border=0>
  <TBODY>
  <TR>
    <TD height=2></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 width=995 align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width=995 height=547>
      <TABLE class=border2 cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#fff7d6 height=25 align=center><STRONG> <%=nlist.get(1).toString() %> </STRONG></TD></TR>
      
        <TR>
          <TD>
            <TABLE width="100%" border=0>
              <TBODY>
              <TR bgColor=#eeeeee>
                <TD colspan=2 align=center height=20>
				股票分类：<%=nlist.get(3).toString() %>&nbsp;&nbsp;
                      股票价格：<%=nlist.get(4).toString() %>&nbsp;&nbsp;
                      时间：<%=nlist.get(6).toString() %>&nbsp;&nbsp; 
                      查看：<%=nlist.get(8).toString() %>&nbsp;&nbsp;
                      评论：<%=cb.getCount("select count(*) from pl where nid='"+nlist.get(0).toString()+"'") %>
                      <a href="<%=basePath %>addGw.action?spid=<%=nlist.get(0).toString()%>">加入购物车</a>
                       <a href="<%=basePath %>addCt.action?spid=<%=nlist.get(0).toString()%>"> </a></TD>
              </TR>
              <TR>
                <TD colspan=2 align=center height=20><br><%=nlist.get(5).toString() %><br></TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        <TR>
        <TD>
        <FORM name="plform" method="post" action="<%=basePath %>addPl.action?nid=<%=id%>" onSubmit="return CheckForm();"> 
<TABLE cellSpacing=0 cellPadding=0 width=759 align=center border=0>
  <TBODY>
  <TR>
    <TD background="<%=basePath %>images/list_04.gif" colspan="3" height="20">&nbsp;&nbsp;评论</TD>
  </TR>
  <%
  	List pllist=cb.getCom("select * from pl where nid='"+id+"'",5);
  	if(!pllist.isEmpty()){
		for(int i=0;i<pllist.size();i++){
			List list2 =(ArrayList)pllist.get(i);
  %>
  <TR>
    <TD align=left><%=list2.get(2).toString()%></TD>
    <TD align=center><%=list2.get(3).toString()%></TD>
    <TD align=right><%=list2.get(4).toString()%></TD>
  </TR>
  <%}} %>
  <TR>
      <TD colspan="3" align=center><TEXTAREA id="content" style="WIDTH: 660px; HEIGHT: 80px" name="content"></TEXTAREA></TD></TR>
    <TR>
      <TD colspan="3" align=center>评论人：<INPUT id="member" style="WIDTH: 120px" maxLength=25 value=游客 name="member"> 
      <INPUT value="提交评论" type=submit>
      </TD>
	</TR>
  </TBODY>
</TABLE>
</FORM>
        </TD>
        </TR>
        </TBODY>
      </TABLE>     
</TD> </TR></TBODY></TABLE>
<%@ include file="iframe/foot.jsp"%> 