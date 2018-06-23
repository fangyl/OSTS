package com.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.ComBean;
import com.util.Constant;

public class TestAction {

	String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpSession session = request.getSession();	
	ComBean cBean = new ComBean();

	//���ӷ���  **********************************************�����������ϸע��
	public String addFenlei() throws Exception { 
			String mc = request.getParameter("mc");  
			int flag = cBean.comUp("insert into fenlei(mc )  values('"+mc+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "�����ɹ���");
				return "success";
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				return "success";
			} 
	}
	//ɾ������
	public String delFenlei() throws Exception {
		String id = request.getParameter("id");
		int flag = cBean.comUp("delete from fenlei where id='"+id+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
	
	//ɾ����Ʊ
	public String delSp() throws Exception {
		String id = request.getParameter("id");
		int flag = cBean.comUp("delete from sp where id='"+id+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
	//ɾ������
	public String delPl() throws Exception {
		String id = request.getParameter("id");
		int flag = cBean.comUp("delete from pl where id='"+id+"'");
		if(flag == Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
	//��ӵ����ﳵ
	public String addGw() throws Exception {
		String spid = request.getParameter("spid");   
		String sddbh=(String)session.getAttribute("ddbh");
		 
				String dj=cBean.getString("select jg from sp where id='"+spid+"'"); 
				int flag2=cBean.comUp("insert into ddinfo(ddbh,spid ) values( '"+dj+"','1' )");
				if(flag2==Constant.SUCCESS){
					request.setAttribute("message", "�ɹ���һ����Ʊ���빺�ﳵ��");
					return "success";
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					return "success";
				}
		 
	}
	 
	
	//�ύ����
	
	public String gwDd() throws Exception {
		 
			String sddbh=(String)session.getAttribute("ddbh"); 
			int flag2=cBean.comUp("update dd set ddbh='"+sddbh+"'  where ddbh='"+sddbh+"'");
			if(flag2==Constant.SUCCESS){
				session.removeAttribute("ddbh");
				request.setAttribute("message", "�����ɹ���");
				return "success";
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				return "success";
			}
		 
	}
	
	//ɾ������
	public String delDd() throws Exception {
		String id = request.getParameter("id");  
		int flag2=cBean.comUp("delete from dd  where id='"+id+"'");
		if(flag2==Constant.SUCCESS){
			request.setAttribute("message", "�����ɹ���");
			return "success";
		}
		else{
			request.setAttribute("message", "����ʧ�ܣ�");
			return "success";
		}
	}
 
	
	
	
	//����
	public String addCt() throws Exception { 
		String title = request.getParameter("title");   
		String nr = request.getParameter("nr");  
		 
				int flag = cBean.comUp("insert into gg(title,nr,sj )  values('"+title+"','"+nr+"','"+date+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					return "success";
				}
				else{ 
					request.setAttribute("message", "����ʧ�ܣ�");
					return "success";
				} 
		 
	}
	//ɾ������
	public String delCt() throws Exception {
		String id = request.getParameter("id");
		int flag = cBean.comUp("delete from gg where id='"+id+"'");
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
