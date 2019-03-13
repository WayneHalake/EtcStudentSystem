package com.etc.serverse;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.dao.ArticleManage;
import com.etc.dao.NoteManage;
import com.etc.dao.UserManage;
import com.etc.dao.impl.ArticleManageImp;
import com.etc.dao.impl.NoteManageImp;
import com.etc.dao.impl.UserManageImpl;
import com.etc.entity.Articles;
import com.etc.entity.Notes;
import com.etc.entity.Users;

public class UserServlet extends HttpServlet {
	
	HttpSession session;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=req.getParameter("action");
		String userid=req.getParameter("userid");
		System.out.println("action:"+action);
		
		if("login".equals(action)){
			checkLogin(req, resp);
		}
		else if("regist".equals(action)){
			//�û�ע��
			try {
				regist(req, resp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("update".equals(action)){
			//�����û���Ϣ
			try {
				updateuserMessage(req, resp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("loginout".equals(action)){
			//��ȫ�˳�
			dropUserName(req, resp);
		}
		else if("showmessage".equals(action)){
			//����������ģ���ʾ������Ϣ
			showUserMessage(req, resp,userid);
		}
		else if("addsingle".equals(action)){
			//�������º�����
			
			try {
				addSingle(req, resp);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if("myarticles".equals(action)){
			//�ҵ�����
			try {
				showAllArticles(req, resp,null);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("mynotes".equals(action)){
			//�ҵ�����
			try {
				showAllNotes(req, resp,null);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//��ȡ�û���Ϣ��������session
	public void getUserName(HttpServletRequest req, HttpServletResponse resp,String userName,int userid) throws ServletException, IOException {
		session=req.getSession();
		session.setAttribute("userName", userName);
		session.setAttribute("userId", userid);
	}
	//�û��˳�ʱ��ɾ��session
	public void dropUserName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		session=req.getSession();
		session.invalidate();
		resp.sendRedirect("./index.jsp");
	}
	//�û�ע��
	public void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
		
		String userName=req.getParameter("userName");
		String userPwd=req.getParameter("Pwd");
		String type=req.getParameter("userType");
		String name=req.getParameter("Name");
		String intake=req.getParameter("intake");
		String outtake=req.getParameter("outtake");
		String gender=req.getParameter("gender");
		
		
		
		Users user=new Users();
		
		Date date=new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		//��ȡ��ǰʱ����Ϊuserid;
		int userid=calendar.get(Calendar.MINUTE)*10000+calendar.get(Calendar.MINUTE)*100+calendar.get(Calendar.SECOND)*10;
		
		user.setUserid(userid);
		user.setUsername(userName);
		user.setUserpwd(userPwd);
		user.setType(type);
		user.setName(name);
		user.setGender(gender);
		
		user.setIntake(new java.sql.Date(sdf.parse(intake).getTime()));
		user.setOuttake(new java.sql.Date(sdf.parse(outtake).getTime()));
		
		UserManage um=new UserManageImpl();
		um.registUser(user);
		
		//ע��������������棬����session�м���userName��ֵ
		getUserName(req, resp, userName,userid);
		resp.sendRedirect("./index.jsp");
	}
	
	//����¼��Ϣ
	public void checkLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName =req.getParameter("userName");
		String userPwd=req.getParameter("userPwd");
		System.out.println("userName:"+userName);
		System.out.println("userPwd:"+userPwd);
		UserManage um=new UserManageImpl();
		
		int userid=um.checkUser(userName, userPwd);
		
		if(userid!=0){
			System.out.println("��¼�ɹ�������");
			getUserName(req, resp, userName,userid);
			resp.sendRedirect("index.jsp");	
		}
		else{
			System.out.println("��¼ʧ�ܣ�����");
			resp.sendRedirect("login.jsp");	
		}
	}
		
	
	//��ѯ�û���Ϣ
	public void showUserMessage(HttpServletRequest req, HttpServletResponse resp,String userid) throws ServletException, IOException {
		
		
		UserManage um=new UserManageImpl();
		
		System.out.println(userid);
		Users user=um.findUserById(Integer.parseInt(userid));
		
		String type=user.getType();
		System.out.println("##################################"+type);
		req.setAttribute("user", user);
		if(type.equals("student")){
			req.getRequestDispatcher("./updateformstu.jsp").forward(req, resp);
		}else if(type.equals("teacher")){
			req.getRequestDispatcher("./updateformtea.jsp").forward(req, resp);
		}
	}
	
	/**
	 * ���������б�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void showAllArticles(HttpServletRequest req, HttpServletResponse resp,String userid) throws ServletException, IOException, ParseException {
		UserManage um=new UserManageImpl();
		if(userid==null){
			userid=req.getParameter("userid");
		}
		System.out.println(userid);
		List<Articles> articledata=new ArrayList<Articles>();
		articledata=um.showAllArticles(Integer.parseInt(userid));
		req.setAttribute("articles", articledata);
		System.out.println(articledata);
		req.getRequestDispatcher("./articlelist.jsp").forward(req, resp);
	}
	/**
	 * ���������б�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void showAllNotes(HttpServletRequest req, HttpServletResponse resp,String userid) throws ServletException, IOException, ParseException {
		UserManage um=new UserManageImpl();
		if(userid==null){
			userid=req.getParameter("userid");
		}
		List<Notes> notedata=new ArrayList<Notes>();
		notedata=um.showAllNotes(Integer.parseInt(userid));
		req.setAttribute("notes", notedata);
		req.getRequestDispatcher("./notelist.jsp").forward(req, resp);
	}
	
	/**
	 * �������»�����
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	public void addSingle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
		
		String userid=req.getParameter("userid");
		String username=req.getParameter("username");
		String name=req.getParameter("name");
		String type=req.getParameter("type");
		String content=req.getParameter("content");
		
		//��ȡ��ǰʱ�䣬����ʱ�䡢����id
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// �������ڸ�ʽ
		String publishedtime = df.format(date);
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int id = calendar.get(Calendar.MINUTE) * 10000 + calendar.get(Calendar.MINUTE) * 100
				+ calendar.get(Calendar.SECOND) * 10;
		
		//�ж�type��ֵ����Ϊarticle����Ϣ��װ����Aritlestable��
		//��Ϊnote����Ϣ��װ����Notestable
		if(type.equals("article")){
			ArticleManage am=new ArticleManageImp();
			Articles article=new Articles();
			
			article.setUserid(Integer.parseInt(userid));
			article.setUsername(username);
			article.setArticlename(name);
			article.setArticlecontent(content);
			article.setPublishedtime(new java.sql.Date(df.parse(publishedtime).getTime()));
			article.setArticleid(id);
			
			am.addArticle(article);
			//��ת�����������б�
			showAllArticles(req, resp,userid);
		}else if(type.equals("note")){
			NoteManage nm=new NoteManageImp();
			Notes note =new Notes();
			
			note.setUserid(Integer.parseInt(userid));
			note.setUsername(username);
			note.setNotename(name);
			note.setNotecontent(content);
			note.setPublishedtime(new java.sql.Date(df.parse(publishedtime).getTime()));
			note.setNoteid(id);
			
			nm.addNote(note);
			//��ת�����������б�
			showAllNotes(req, resp,userid);
		}
	}
	
	
	//�����û���Ϣ
	public void updateuserMessage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ParseException {
		
		String pwd=req.getParameter("Pwd");
		String type=req.getParameter("userType");
		String username=req.getParameter("userName");
		String name=req.getParameter("Name");
		String gender=req.getParameter("gender");
		String intake=req.getParameter("intake");
		String outtake=req.getParameter("outtake");
		String userid=req.getParameter("userid");
		
		UserManage um=new UserManageImpl();
		Users user= new Users();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		user.setUserpwd(pwd);
		user.setUsername(username);
		user.setName(name);
		user.setGender(gender);
		user.setIntake(new java.sql.Date(sdf.parse(intake).getTime()));
		user.setOuttake(new java.sql.Date(sdf.parse(outtake).getTime()));
		user.setUserid(Integer.parseInt(userid));
		
		um.admupdateuser(user, type);
		
		//������Ϣ֮����ʾ����֮�����Ϣ
		showUserMessage(req, resp,userid);
	}
	
}
