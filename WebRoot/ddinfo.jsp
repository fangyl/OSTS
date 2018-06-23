<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>  
<script type="text/javascript">
<!--
function check()
{
	gwform.submit();
}
//-->
</script>
 
 <form action="<%=basePath%>ComServlet?method=dd" method=post name=gwform >
      <TABLE align=center class=border2  cellSpacing=0 cellPadding=0 width="995" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#fff7d6 height=25 colspan=11><SPAN class=font_01>&nbsp;&nbsp;
          <IMG height=11 src="<%=basePath%>images/up.gif" width=11></SPAN><STRONG> 订单信息 </STRONG></TD></TR>
          <TR bgColor=#eeeeee>
               <TD Align=center width=661 height=20>股票名称</TD>
                <TD Align=center>单价</TD>
                <TD Align=center>购买数量</TD>
                <TD Align=center>总价</TD> 
           </TR>
<%		String ddbh=request.getParameter("ddbh");String spmember=request.getParameter("spmember");
     float f=0;
	List pagelist1 = cb.getCom("select ddinfo.* from ddinfo,dd where ddinfo.ddbh='"+ddbh+"' and dd.ddbh='"+ddbh+"'  ",5); 
	 
		if(pagelist1!=null){
		for(int i=0;i<pagelist1.size();i++){ List list2=(List)pagelist1.get(i);
		float ff=Float.parseFloat(list2.get(3).toString())*Integer.parseInt(list2.get(4).toString());
		f+=ff;
%> 
      
              <TR bgColor=#eeeeee>
               <TD Align=center width=661 height=20><%=cb.getString("select mc from sp where id='"+list2.get(2).toString()+"'") %></TD>
                <TD Align=center><%=list2.get(3).toString() %></TD>
                <TD Align=center><%=list2.get(4).toString()%></TD>
                <TD Align=center><%=ff %></TD>
                 
        </TR>
<%}}%>
      <TR bgColor=#eeeeee>
               <TD Align=center colspan=11>订单总计：<%=f %> 元</TD>
                 
        </TR>
      </TABLE>
</form> 
<%@ include file="iframe/foot.jsp"%>