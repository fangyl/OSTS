<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%> 
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body>
 
<table id=content width=100% border=0 cellpadding=3 cellspacing=1 class=css_table bgcolor='#E1E1E1'>
  <tr class="css_col11">
    <td colspan=10>统计结果</td> 
  </tr> 
  <TR class="css_col11">
   
      <td height="23"><strong>序号</strong></td>
      <td><strong>股票名称</strong></td> 
      <td><strong>销售价格</strong></td>
      <td><strong>购买数量</strong></td> 
      <td><strong>总计</strong></td>   
    </tr>
<%float sum=0;float ff=0;
	 String mc=Common.toChineseAndTrim(request.getParameter("mc"));System.out.println(mc);
	 String spid=cb.getString("select id from sp where mc='"+mc+"'");
	List pagelist3 = cb.getCom("select * from ddinfo where spid='"+spid+"' order by id desc",5);
	 
		if(!pagelist3.isEmpty()){
		for(int i=0;i<pagelist3.size();i++){
			List pagelist2 =(ArrayList)pagelist3.get(i);
			float jg=Float.parseFloat(pagelist2.get(3).toString());
			int sl=Integer.parseInt(pagelist2.get(4).toString());
			ff=jg*sl;sum+=ff;
%> 
    <TR class="css_col11">
      <td height="23"><%=i+1 %></td>
      <td><%=mc %></td>
      <td><%=jg %></td>
      <td><%=sl %></td> 
      <td><%=ff %></td>  
    </tr>
<% }} %> 
  <TR class="css_col11">
      <td height="23" colspan=9>总计：<%=sum %> </td>  
    </tr>
                        
                    </TABLE>
      
</body>
<%} %>
