package com.etc.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.commons.JDBCUtil;
import com.etc.dao.ArticleManage;
import com.etc.entity.Articles;

public class ArticleManageImp implements ArticleManage {

	@Override
	public List<Articles> showAll() {
		// TODO Auto-generated method stub
		List<Articles> articles = new ArrayList<Articles>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		String sql = "select * from articlestable order by publishedtime desc";

		try {
			conn = JDBCUtil.getConn();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {
				Articles art = new Articles();

				art.setUsername(rs.getString("username"));
				art.setArticlename(rs.getString("articlename"));
				art.setArticleid(rs.getInt("articleid"));
				art.setPublishedtime(rs.getDate("publishedtime"));
				art.setUserid(rs.getInt("userid"));
				art.setArticlecontent(rs.getString("articlecontent"));
				articles.add(art);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs);

		}

		return articles;
	}

	@Override
	public void delete(int articleid) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		String sql1, sql2;

		try {
			// 获取数据库连接对象
			conn = JDBCUtil.getConn();
			// 声明sql语句
			sql2 = "delete from articlecommenttable where articleid=" + articleid;

			System.out.println("sql:" + sql2);

			sql1 = "delete from articlestable where articleid=" + articleid;

			System.out.println("sql:" + sql1);

			// 获取执行sql语句的对象
			stat = conn.createStatement();

			// 执行检索数据库
			stat.executeUpdate(sql2);
			stat.executeUpdate(sql1);

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		} finally {

			JDBCUtil.closeDB(conn, stat, rs);
		}

	}

	@Override
	public Articles showArticle(int articleid) {
		// TODO Auto-generated method stub
		Articles art = new Articles();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		String sql = "select * from articlestable where articleid=" + articleid;
		try {
			conn = JDBCUtil.getConn();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			while (rs.next()) {
				art.setUsername(rs.getString("username"));
				art.setArticlename(rs.getString("articlename"));
				art.setArticleid(rs.getInt("articleid"));
				art.setPublishedtime(rs.getDate("publishedtime"));
				art.setUserid(rs.getInt("userid"));
				art.setArticlecontent(rs.getString("articlecontent"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs);

		}
		return art;
	}

	@Override
	public void addArticle(Articles article) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;

		String sql;
		try {
			
			conn = JDBCUtil.getConn();
			sql = "insert into articlestable values(?,?,?,?,?,?)";

			// 获取执行sql语句的对象
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, article.getArticleid());
			pstat.setString(2, article.getArticlename());
			pstat.setDate(3, article.getPublishedtime());
			pstat.setString(4, article.getUsername());
			pstat.setInt(5, article.getUserid());
			pstat.setString(6, article.getArticlecontent());
			
			System.out.println("sql:" + sql);
			
			// 执行检索数据库
			pstat.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		} finally {

			JDBCUtil.closeDB(conn, pstat, rs);
		}
	}

}
