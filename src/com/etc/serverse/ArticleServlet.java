package com.etc.serverse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.dao.ArticleManage;
import com.etc.dao.NoteManage;
import com.etc.dao.impl.ArticleManageImp;
import com.etc.dao.impl.NoteManageImp;
import com.etc.entity.Articles;
import com.etc.entity.Notes;

public class ArticleServlet extends HttpServlet {
	HttpSession session;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		if(action==null){
			action="init";
		}
		
		if (action.equals("showall")) {
			// 显示所有文章和帖子
			showall(request, response);

		} else if (action.equals("delete")) {
			// 删除文章
			deletearticle(request, response);
		}
		else {
			// 默认将文章加入session中
			init(request, response);
		}
	}

	public void init(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		if (session.isNew()) {

			// 将Articlelist加入session
			ArticleManage am = new ArticleManageImp();
			List<Articles> Articlelist = new ArrayList<Articles>();

			Articlelist = am.showAll();
			session.setAttribute("Articlelist", Articlelist);
			System.out.println("------==-=-=-=-=-=----" + Articlelist);

			// 将Notelist加入session
			NoteManage nm = new NoteManageImp();
			List<Notes> Notelist = new ArrayList<Notes>();

			Notelist = nm.showAll();
			session.setAttribute("Notelist", Notelist);
			
			//response.sendRedirect("./index.jsp");
			request.getRequestDispatcher("./index.jsp").forward(request, response);
		} else {
			session.invalidate();
		}
	}

	public void showall(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

		if (type.equals("article")) {
			ArticleManage am = new ArticleManageImp();
			List<Articles> list = new ArrayList<Articles>();

			list = am.showAll();
			request.setAttribute("articles", list);
			request.getRequestDispatcher("./articlelist.jsp").forward(request, response);
			
		} else if (type.equals("note")) {
			NoteManage nm = new NoteManageImp();
			List<Notes> list = new ArrayList<Notes>();

			list = nm.showAll();
			request.setAttribute("notes", list);
			request.getRequestDispatcher("./notelist.jsp").forward(request, response);
		}
	}

	public void deletearticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		if (type.equals("article")) {
			ArticleManage am = new ArticleManageImp();
			String articleid = request.getParameter("articleid");
			am.delete(Integer.parseInt(articleid));
			showall(request, response);
		} else if (type.equals("note")) {
			NoteManage nm = new NoteManageImp();
			String noteid = request.getParameter("noteid");

			nm.delete(Integer.parseInt(noteid));
			showall(request, response);
		}
	}

}
