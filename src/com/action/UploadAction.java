package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

public class UploadAction extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public UploadAction() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = "";;HttpSession session = request.getSession();
		 ComBean cb = new ComBean(); 
		 SmartUpload mySmartUpload = new SmartUpload();//init
		 int count = 0;
		 try{
			 mySmartUpload.initialize(config,request,response);
            mySmartUpload.upload(); 
            method = mySmartUpload.getRequest().getParameter("method").trim();
           if(method.equals("addhh")){//增加   
        	   //String mc="";String pic="";String pp="";String jg="";String content="";
           		String mc = mySmartUpload.getRequest().getParameter("mc");
				String pp = mySmartUpload.getRequest().getParameter("pp");
				String jg = mySmartUpload.getRequest().getParameter("jg");
				String content = mySmartUpload.getRequest().getParameter("content1"); 
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                    //System.out.print(">>>>>>>>>>");
                   	int ff = cb.comUp("insert into sp(mc,pic,pp,jg,content,sj )" +
	                		" values('"+mc+"','"+path+"/"+file.getFileName()+"','"+pp+"','"+jg+"','"+content+"','"+date2+"' )");
						if(ff == Constant.SUCCESS){
							request.setAttribute("message", "增加成功！");
							request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response);
						}
                   }
				 							
           else if(method.equals("uphh")){//修改  
        	   String id = mySmartUpload.getRequest().getParameter("id");
        	   String mc = mySmartUpload.getRequest().getParameter("mc");
				String pp = mySmartUpload.getRequest().getParameter("pp");
				String jg = mySmartUpload.getRequest().getParameter("jg");
				String content = mySmartUpload.getRequest().getParameter("content1");
				 
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                   	int ff = cb.comUp("update sp set mc='"+mc+"',pic='"+path+"/"+file.getFileName()+"'," +
                   			"pp='"+pp+"',jg='"+jg+"',content='"+content+"' where id='"+id+"' ");
						if(ff == Constant.SUCCESS){
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response);
						}
						else{
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/sp/index.jsp").forward(request, response);
						}
                   }
		 }catch(Exception e){
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
