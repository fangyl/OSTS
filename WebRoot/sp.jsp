<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %> 
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>sp.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%>sp.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>sp.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%>sp.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%>sp.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%>sp.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>sp.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%>sp.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>sp.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
}
</script>
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
          <IMG height=11 src="<%=basePath%>images/up.gif" width=11></SPAN><STRONG> ��Ʊ��Ϣ </STRONG></TD></TR>
<%		
    cb.setEVERYPAGENUM(5);
	int cou = cb.getMessageCount("select count(*) from sp ");//�õ���Ϣ����			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from sp order by id desc",9);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //�õ�ҳ��  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq"); 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>        
        <TR>
          <TD>
            <TABLE height=38 background=<%=basePath%>images/xx.htm border=0>
              <TBODY>
              <TR bgColor=#eeeeee>
              <TD vAlign=center width=100 height=20><img src=<%=basePath+pagelist2.get(2).toString() %> width=100 height=100 border=0></TD>
                <TD vAlign=center width=461 height=20> 
				<A href="<%=basePath %>spinfo.jsp?id=<%=pagelist2.get(0).toString()%>"  ><%=pagelist2.get(1).toString()%></A></TD>
                <TD width=81>�������:<FONT color=red><%=pagelist2.get(8).toString()%></FONT></TD>
                <TD width=79><%=pagelist2.get(6).toString().substring(0,10) %></TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
<%}} %>
        </TBODY>
      </TABLE>
 <form action="" method="post" name="form3">
<TABLE align=center cellSpacing=0 cellPadding=0  border=0>
  <TBODY>
  <TR>
    <TD align=left> 
    <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
	<input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->  
      <P align=center>
      <a href="#" onClick="top2()">��ҳ</a> 
      <a href="#" onClick="pre2()">��һҳ</a> 
      ��<%=session.getAttribute("busMessageCount").toString()%>����¼,��<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ 
      <a href="#" onClick="next2()">��һҳ</a> <a href="#" onClick="last2()">βҳ</a> <input name="busjump" type="text" size="3" /> <a href="#" onClick="bjump2()">ת</a>
	  </P>
	</TD>
  </TR>
  </TBODY>
</TABLE>
</FORM>      
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
                  class=font_02>���Ź�Ʊ</SPAN></STRONG></TD>
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