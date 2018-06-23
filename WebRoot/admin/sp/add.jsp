<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>
<link rel="stylesheet" href="<%=basePath %>editor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=basePath %>editor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=basePath %>editor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=basePath %>editor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<script type="text/javascript">
function check()
{ //String mc="";String pic="";String pp="";String jg="";String content="";
	if(document.form1.mc.value==""||document.form1.pp.value==""||document.form1.jg.value=="")
	{
		alert("请填写全部内容！");
		//document.form1.mc.focus();
		return false;
	} 
	if(document.form1.pic.value=="")
	{
		alert("请上传产品图片！");
		document.form1.pic.focus();
		return false;
	} 
	if(document.form1.pic.value!="")
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		}
	}
	form1.submit();
}
</script>
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
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";
		String mc="";String pic="";String pp="";String jg="";String content="";
		if(method.equals("uphh")){
			id=request.getParameter("id");
			List wzlist=cb.get1Com("select * from sp where id='"+id+"'",6);
			mc=wzlist.get(1).toString();
			pic=wzlist.get(2).toString();
			pp=wzlist.get(3).toString();jg=wzlist.get(4).toString();content=wzlist.get(5).toString(); htmlData=content;
		}
%>
<body onLoad="document.form1.infoContent.value=document.form1.content.value" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="2">&nbsp;</td>
  </tr>
  <tr>
	<td background="<%=basePath %>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr>
		  <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C4E7FB">
			  <tr>
				<td>
				  <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#FFFFFF">
					<tr>
					  <td class="font2">&nbsp;股票管理</td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
		  </td>
		</tr>
		<tr>
		  <td>
<form action="<%=basePath %>UploadAction" method="post" name="form1"  enctype="multipart/form-data" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> <input type=hidden name=method value=<%=method %>><input type=hidden name=id value=<%=id %>>
    <TR bgColor=#ffffff>
      <td class="td_bg" width="35%" height="23" align=right>股票名称：</td>
      <td class="td_bg" align=left><input type="text" name="mc" size="50" maxlength="50" value="<%=mc %>"></td>
    </tr>
    <TR bgColor=#ffffff>
      <td class="td_bg" width="35%" height="23" align=right>股票图片：</td>
      <td class="td_bg" align=left><INPUT  type=file name="pic"  maxLength=50 size=50></td>
    </tr> 
    <TR bgColor=#ffffff>
      <td class="td_bg" width="35%" height="23" align=right>股票分类：</td>
      <td class="td_bg" align=left><select name=pp>
      <%List flist=cb.getCom("select * from fenlei order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
      <option value="<%=list2.get(1).toString() %>"><%=list2.get(1).toString() %></option>
      <%}} %>
      </select></td>
    </tr>
    <TR bgColor=#ffffff>
      <td class="td_bg" width="35%" height="23" align=right>股票价格：</td>
      <td class="td_bg" align=left><input type="text" name="jg" size="50" maxlength="50" value="<%=jg %>" onKeyUp="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元
    </tr>
    <TR bgColor=#ffffff>
      <td class="td_bg" width="35%" height="23" align=right>股票介绍：</td>
      <td class="td_bg" align=left><textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%></textarea></td>
    </tr> 
    <TR bgColor=#ffffff>
      <td class="td_bg" colspan="2" height="23" align=center>
       <input type="submit" value="确定" /> </td>
    </tr> 
  </tbody>
</table>
</form>
</td>
</tr> 
	  </table>
	</td>
	<td background="images/index1_47.gif"></td>
  </tr>
  <TR bgColor=#ffffff>
	<td width="8" height="8"><img src="images/index1_91.gif" width="8" height="8" /></td>
	<td background="images/index1_92.gif">e</td>
	<td width="8" height="8"><img src="images/index1_93.gif" width="8" height="8" /></td>
  </tr>
</table>
</body>
<%} %> 
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>