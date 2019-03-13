package com.etc.serverse;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.etc.dao.ArticleManage;
import com.etc.dao.CommentManage;
import com.etc.dao.NoteManage;
import com.etc.dao.impl.ArticleManageImp;
import com.etc.dao.impl.CommentManageImp;
import com.etc.dao.impl.NoteManageImp;
import com.etc.entity.Articles;
import com.etc.entity.Comments;
import com.etc.entity.Notes;

public class CommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type=request.getParameter("type");
		
		
		String action=request.getParameter("action");
		if(type!=null){
			if(type.equals("article")){
				//展示指定文章所有评论
				showAllComment(request, response, "articlecommenttable");
			}else if(type.equals("note")){
				//展示指定帖子所有评论
				showAllComment(request, response, "notecommenttable");
			}
		}
		if(action!=null){
			if(action.equals("add")){
				//评论文章和帖子
				try {
					addComment(request, response);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
	}

	public void addComment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {

		int articleid=0;
		int noteid=0;
		String commenttype = request.getParameter("commenttype");
		String username = request.getParameter("username");
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		if(commenttype.equals("articlecommenttable")){
			articleid = Integer.parseInt(request.getParameter("id"));
		}
		else if(commenttype.equals("notecommenttable")){
			noteid = Integer.parseInt(request.getParameter("id"));
		}
		
		String commentcontent = request.getParameter("commentcontent");

		// 获取当前时间
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String publishedtime = df.format(date);

		// 获取当前时间作为commentid;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int commentid = calendar.get(Calendar.MINUTE) * 10000 + calendar.get(Calendar.MINUTE) * 100
				+ calendar.get(Calendar.SECOND) * 10;

		// 将要添加进评论表的值进行封装
		Comments comment = new Comments();
		comment.setArticleid(articleid);
		comment.setNoteid(noteid);
		comment.setUsername(username);
		comment.setContent(commentcontent);
		comment.setCommentuserid(userid);
		comment.setCommentid(commentid);
		comment.setCommenttime(new java.sql.Date(df.parse(publishedtime).getTime()));

		CommentManage cm = new CommentManageImp();
		cm.addComment(comment, commenttype);

		showAllComment(request, response, commenttype);

	}

	public void showAllComment(HttpServletRequest request, HttpServletResponse response, String tablename)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		// 查询指定文章或帖子的所有评论
		CommentManage cm = new CommentManageImp();
		List<Comments> commentlist = new ArrayList<Comments>();
		commentlist = cm.showAllComments(id, tablename);

		System.out.println(commentlist);

		// 判断查询出来的是帖子还是文章
		if (tablename.equals("articlecommenttable")) {
			// Articles实体类保存文章
			ArticleManage am = new ArticleManageImp();
			Articles art = new Articles();

			art = am.showArticle(id);
			request.setAttribute("singlearticle", art);

			request.setAttribute("commentlist", commentlist);
			request.getRequestDispatcher("./singlearticle.jsp").forward(request, response);

		} else {
			// Notes实体类保存帖子
			NoteManage nm = new NoteManageImp();
			Notes note = new Notes();

			note = nm.shownote(id);
			request.setAttribute("singlenote", note);

			request.setAttribute("commentlist", commentlist);
			request.getRequestDispatcher("./singlenote.jsp").forward(request, response);
		}

	}

}
