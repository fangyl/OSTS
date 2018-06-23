package com.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.ComBean;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport; 
import com.util.Constant;

public class MemberAction extends ActionSupport implements Action{
	
	String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();	
	ComBean cBean = new ComBean();

	//��Աע��
	public String regMember() throws Exception {
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		String realname = request.getParameter("realname"); 
		String sex = request.getParameter("sex"); 
		String age = request.getParameter("age"); 
		String address = request.getParameter("address"); 
		String email = request.getParameter("email");
		String str=cBean.getString("select id from member where username='"+username+"'");
		if(str==null){
			int flag=cBean.comUp("insert into member(username,password,realname,sex,age,address,email,regtime) " +
					"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+email+"','"+date+"')");
			if(str == null){
				request.setAttribute("message", "ע��ɹ����¼��");
				return "success";
			}
			else{
				session.setAttribute("member", username);
				request.setAttribute("message", "����ʧ�ܣ�");
				return "success";
			}
		}
		else{
			request.setAttribute("message", "���û����Ѵ��ڣ�");
			return "success";
		} 
	}
	//��Ա�޸�
	public String upMember() throws Exception {
		String member=(String)session.getAttribute("member"); 
		String realname = request.getParameter("realname"); 
		String sex = request.getParameter("sex"); 
		String age = request.getParameter("age"); 
		String address = request.getParameter("address"); 
		String email = request.getParameter("email"); 
		int flag=cBean.comUp("update member set realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
				"address='"+address+"',email='"+email+"' where username='"+member+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
	//��Ա�޸�
	public String pwdMember() throws Exception {
		String member=(String)session.getAttribute("member"); 
		String oldpwd = request.getParameter("oldpwd"); 
		String newpwd = request.getParameter("newpwd"); 
		String str=cBean.getString("select id from member where username='"+member+"' and  password='"+oldpwd+"'");
		if(str==null){
			request.setAttribute("message", "ԭʼ������Ϣ����");
			return "success"; 
		}
		else{
			int flag=cBean.comUp("update member set password='"+newpwd+"' where username='"+member+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				return "success"; 
			}
			else { 
				request.setAttribute("message", "����ʧ�ܣ�");
				return "success"; 
			}
		} 
	}
	//��Ա��¼
	public String loginMember() throws Exception {
		String username=request.getParameter("username");
		String password = request.getParameter("password"); 
		String str=cBean.getString("select id from member where username='"+username+"' and password ='"+password+"' and ifuse='����'");
		if(str == null){
			request.setAttribute("message", "��¼��Ϣ����");
			return "success";
		}
		else{
			session.setAttribute("member", username);
			request.setAttribute("message", "��¼�ɹ���");
			return "success";
		}
	}
	public String loginMember2() throws Exception {
		String username=request.getParameter("username");
		String password = request.getParameter("password"); 
		String str=cBean.getString("select id from member where username='"+username+"' and password ='"+password+"' and ifuse='����'");
		if(str == null){
			request.setAttribute("message", "��¼��Ϣ����");
			return "success";
		}
		else{
			session.setAttribute("member", username);
			request.setAttribute("message", "��¼�ɹ���");
			return "success";
		}
	}
	
	//��Ա�һ�����
	public String lostPwd() throws Exception {
		request.setAttribute("message", "�������Ѿ���������������ע����գ�");
		return "success"; 
	}
	//��Ա�˳���¼
	public String exitMember() throws Exception {
		session.removeAttribute("member");
		return "success";
	}
	
	
	//������Ա
	public String useMember() throws Exception {
		String id = request.getParameter("id");  
		String sql="";
		String str=cBean.getString("select ifuse from member where id='"+id+"'");
		if(str.equals("����")){
			sql="update member set ifuse='ͣ��' where id='"+id+"'";
		}
		else{
			sql="update member set ifuse='����' where id='"+id+"'";
		}
		int flag=cBean.comUp(sql);
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
	//ɾ����Ա
	public String delMember() throws Exception {
		String id = request.getParameter("id");  
		int flag=cBean.comUp("delete from member where id='"+id+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
}
