package com.etc.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.commons.JDBCUtil;
import com.etc.dao.CommentManage;

import com.etc.entity.Comments;

public class CommentManageImp implements CommentManage {

	@Override
	public void addComment(Comments comment,String tablename) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs = null;
		
		String sql;
//		String table = null;
		int id = 0;
		try {
			//获取数据库连接对象
			conn = JDBCUtil.getConn();
			//声明sql语句
			
			if(tablename.equals("articlecommenttable")){
				
				id=comment.getArticleid();
			}else if(tablename.equals("notecommenttable")){
				id=comment.getNoteid();
			}
			
			sql="insert into "+tablename+" values(?,?,?,?,?,?)";

			//获取执行sql语句的对象
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, comment.getCommentid());
			pstat.setInt(2, id);
			pstat.setString(3, comment.getContent());
			pstat.setDate(4, comment.getCommenttime());
			pstat.setInt(5, comment.getCommentuserid());
			pstat.setString(6, comment.getUsername());
			
			System.out.println("sql:" + sql);
			//执行检索数据库
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		} finally{
			
			JDBCUtil.closeDB(conn, pstat, rs);
		}
		
	}

	@Override
	public List<Comments> showAllComments(int id ,String tablename) {
		// TODO Auto-generated method stub
		List<Comments> data= new ArrayList<Comments>();
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		
		
		String sql = "select * from "+tablename+" where id = "+id+" order by commenttime desc" ;
		
		try {
			conn = JDBCUtil.getConn();
			stat=conn.createStatement();
			rs=stat.executeQuery(sql);
			System.out.println("sql:"+sql);
			while(rs.next()){
				
				Comments comment= new Comments();
				
				comment.setCommentid(rs.getInt(1));
				comment.setArticleid(rs.getInt(2));
				comment.setNoteid(rs.getInt(2));
				comment.setContent(rs.getString(3));
				comment.setCommenttime(rs.getDate(4));
				comment.setCommentuserid(rs.getInt(5));
				comment.setUsername(rs.getString(6));
				
				data.add(comment);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs);

		}
		return data;
	}

}
