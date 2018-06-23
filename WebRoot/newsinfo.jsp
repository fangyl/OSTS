<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
 <script type="text/javascript">
<!--
function CheckForm()
{
	if(document.plform.content.value=="")
	{
		alert("ÇëÌîÐ´ÆÀÂÛÄÚÈÝ£¡");
		document.plform.content.focus();
		return false;
	}
	if(document.plform.member.value=="")
	{
		alert("ÇëÌîÐ´ÆÀÂÛÈË£¡");
		document.plform.member.focus();
		return false;
	}
}
//-->
</script>
<%  
	String id=request.getParameter("id");  
	List nlist=cb.get1Com("select * from news where id='"+id+"'",4);
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
 
              <TR>
                <TD colspan=2 align=center height=20><br><%=nlist.get(2).toString() %><br></TD>
              </TR> 
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        
        </TBODY>
      </TABLE>     
</TD> </TR></TBODY></TABLE>
<%@ include file="iframe/foot.jsp"%> 