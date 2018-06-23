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
 
 <form action="<%=basePath%>gwDd.action?method=dd" method=post name=gwform >
      <TABLE align=center class=border2  cellSpacing=0 cellPadding=0 width="995" border=0>
        <TBODY>
        <TR>
          <TD bgColor=#fff7d6 height=25 colspan=11><SPAN class=font_01>&nbsp;&nbsp;
          <IMG height=11 src="<%=basePath%>images/up.gif" width=11></SPAN><STRONG> 购物车信息 </STRONG></TD></TR>
          <TR bgColor=#eeeeee>
               <TD Align=center width=661 height=20>股票名称</TD>
                <TD Align=center>单价</TD>
                <TD Align=center>购买数量</TD>
                <TD Align=center>总价</TD>
                <TD Align=center>修改</TD>
                <TD Align=center>删除</TD>
           </TR>
<%		
     
	String sddbh=(String)session.getAttribute("ddbh"); 
	 List pagelist1=cb.getCom("select * from ddinfo where ddbh='"+sddbh+"'",5);
		if(pagelist1!=null){
		for(int i=0;i<pagelist1.size();i++){ List list2=(List)pagelist1.get(i);
%> 
      
              <TR bgColor=#eeeeee>
               <TD Align=center width=661 height=20><%=cb.getString("select mc from sp where id='"+list2.get(2).toString()+"'") %></TD>
                <TD Align=center><%=list2.get(3).toString() %></TD>
                <TD Align=center><input type="text" id="<%=list2.get(0).toString()%>_count" value="<%=list2.get(4).toString()%>" size="10"/></TD>
                <TD Align=center><%=Float.parseFloat(list2.get(3).toString())*Integer.parseInt(list2.get(4).toString()) %></TD>
                <TD Align=center><a href="javascript:go('<%=list2.get(0).toString()%>')">修改</a>
<script type="text/javascript">
function go(proId)
{
var str;
str="upGw.action?method=upgwc&count=";
str+=document.getElementById(proId+"_count").value;
str+="&&";
str+="proId=";
str+=proId;
window.location=str;
}
function go2(proId)
{
var str;
str="delGw.action?method=delgwc&count=";
str+=document.getElementById(proId+"_count").value;
str+="&&";
str+="proId=";
str+=proId;
window.location=str;
}
</script> 
                </TD>
                <TD Align=center><a href="javascript:go2('<%=list2.get(0).toString()%>')">删除</a></TD>
        </TR>
<%}}%>
       <TR>
          <TD colspan=11>
            <TABLE align=center height=38  width=995 border=0>
              <TBODY>
              <TR bgColor=#eeeeee>
               <TD Align=center><input type=button value="模拟支付完成提交订单" onclick="check()"></TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
      </TABLE>
</form> 
<%@ include file="iframe/foot.jsp"%>