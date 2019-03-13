package com.etc.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.etc.commons.JDBCUtil;
import com.etc.dao.UserManage;
import com.etc.entity.Articles;
import com.etc.entity.Notes;
import com.etc.entity.Users;

public class UserManageImpl implements UserManage {

	
	@Override
	public int checkUser(String username, String userpwd) {
		int userid = 0;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs1 = null;

		// ��ȡ���ݿ�����
		conn = JDBCUtil.getConn();

		// ����SQL���
		String sql1 = "select * from logintable where username='" + username
				+ "' and userpwd='" + userpwd + "'";
		System.out.println("sql:" + sql1);
		

		try {
			// ��ȡִ��SQL���Ķ���
			stat = conn.createStatement();

			// �������ݿ�
			rs1 = stat.executeQuery(sql1);

			while (rs1.next()) {
				userid=rs1.getInt("userid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs1);

		}
		return userid;
	}

	@Override
	public void registUser(Users user) {
		Connection conn = null;
		Statement stat = null;
		PreparedStatement pstat = null;
		 int userid=user.getUserid();
		 String type=user.getType();
		 String username=user.getUsername();
		 String name=user.getName();
		 String gender=user.getGender();
		 String userpwd=user.getUserpwd();
		 Date intake=user.getIntake();
		 Date outtake=user.getOuttake();
		 
		 
		try {
			// ��ȡ���ݿ����Ӷ���
			String table = null;
			conn = JDBCUtil.getConn();

			// ����sql���
			String sql1 = "insert into logintable(userid,username,userpwd,usertype) "
					+ "values(" +userid+ ",'"
					+ username + "','" + userpwd + "','"
					+ type+ "')";
			
			System.out.println("sql1:" + sql1);
			
			if(type.equals("student")){
				table="studentstable";
			}else if(type.equals("teacher")){
				table="teacherstable";
			}
			
			String sql2="insert into "+table+"(userid,username,usernum,gender,intake,outtake) values(?,?,?,?,?,?)";
			
			
			//��ȡִ��sql���Ķ���
			stat = conn.createStatement();
			
			pstat=conn.prepareStatement(sql2);
			
			pstat.setInt(1, userid);
			pstat.setString(2, name);
			pstat.setInt(3,userid/100);
			pstat.setString(4, gender);
			pstat.setDate(5, intake);
			pstat.setDate(6, outtake);
			
			System.out.println("sql2:" + sql2);
			//ִ�м������ݿ�
			stat.executeUpdate(sql1);
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeDB(conn, stat, null);
		}

	}
	
	@Override
	public String userType(int userid) {
		// TODO Auto-generated method stub
		Users user = new Users();
		Connection conn = null;
		Statement stat1 = null;//PreparedStatement:Ԥ�������
		ResultSet rs1 = null;
		String type=null;
		try {
			conn = JDBCUtil.getConn();
			
			String userpwd=null;
			String username=null;
			//?Ϊռλ��
			/////////////////// ��ȡ�û����͵���Ϣ start //////////////////////////
			//ռλ����ֵ
			String sql="select * from logintable where userid= "+userid;
			System.out.println("sql:" + sql);
			stat1 = conn.createStatement();
			
			
			//ִ�м������ݿ� 
			rs1 = stat1.executeQuery(sql);
			while(rs1.next()){
				username=rs1.getString("username");
				user.setUsername(username);
				userpwd=rs1.getString("userpwd");
				user.setUserpwd(userpwd);
				type=rs1.getString("usertype");
				user.setType(type);
				System.out.println("UserManageImp^^^^^^^^^^^^^^^^^^^^^^"+type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeDB(conn, stat1, rs1);
		}
		return type;
	}

	@Override
	public Users findUserById(int userid) {
		Users user = new Users();
		Connection conn = null;
		Statement stat1 = null;//PreparedStatement:Ԥ�������

		ResultSet rs1 = null;

		String table=null;
		try {
			conn = JDBCUtil.getConn();
			String type=null;
			type=userType(userid);
			
			////////////////////��ȡ�û���Ϣ  start//////////////////////
			
			if(type.equals("student")){
				table="studentstable";
			}else if(type.equals("teacher")){
				table="teacherstable";
			}
			
			//��������
			String sql="select * from "+table+" where userid= "+userid;
			
			System.out.println(sql);
			stat1 = conn.createStatement();
			
			rs1 = stat1.executeQuery(sql);
			
			while(rs1.next()){
				
				user.setUserid(rs1.getInt("userid"));
				user.setName(rs1.getString("username"));
				user.setType(type);
				user.setGender(rs1.getString("gender"));
				user.setUsernum(rs1.getInt("usernum"));
				user.setIntake(rs1.getDate("intake"));
				user.setOuttake(rs1.getDate("outtake"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeDB(conn, stat1, rs1);
		}
		return user;
	}

	@Override
	public void admupdateuser(Users user,String type) {
		Connection conn = null;
		PreparedStatement stat = null;
		String table=null;
		
		updateuser(user);
		try {
			// ��ȡ���ݿ����Ӷ���
			conn = JDBCUtil.getConn();
			
			if(type.equals("student")){
				table="studentstable";
			}else if(type.equals("teacher")){
				table="teacherstable";
			}else{
				table="admisterstable";
			}
			// ����sql���
			String sql = "update "+table+" set username=?,gender=?,intake=?,outtake=? where userid=?";
			stat = conn.prepareStatement(sql);
			

			stat.setString(1, user.getName());
			stat.setString(2, user.getGender());
			stat.setDate(3, user.getIntake());
			stat.setDate(4, user.getOuttake());
			stat.setInt(5, user.getUserid());
			
			//ִ�м������ݿ�
			stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeDB(conn, stat, null);
		}
		
	}
	
	@Override
	public boolean checkUser(String username, String userpwd, String usertype) {
		// TODO Auto-generated method stub
		boolean bl = false;
		Connection conn = null;
		Statement stat = null;
		ResultSet rs1 = null;

		// ��ȡ���ݿ�����
		conn = JDBCUtil.getConn();

		// ����SQL���
		String sql1 = "select * from logintable where username='" + username
				+ "' and userpwd='" + userpwd + "'and usertype='"+usertype+"'";
		System.out.println("sql:" + sql1);
		

		try {
			// ��ȡִ��SQL���Ķ���
			stat = conn.createStatement();

			// �������ݿ�
			rs1 = stat.executeQuery(sql1);

			while (rs1.next()) {
				bl = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs1);

		}
		return bl;
	}

	@Override
	public void updateuser(Users user) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {
			// ��ȡ���ݿ����Ӷ���
			conn = JDBCUtil.getConn();

			// ����sql���
			String sql = "update logintable set username=?,userpwd=? where userid=?";
			stat = conn.prepareStatement(sql);
			
			stat.setString(1, user.getUsername());
			stat.setString(2, user.getUserpwd());

			stat.setInt(3, user.getUserid());
			
			//ִ�м������ݿ�
			stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.closeDB(conn, stat, null);
		}
	}

	@Override
	public List<Articles> showAllArticles(int userid) {
		// TODO Auto-generated method stub
		
		List<Articles> articles = new ArrayList<Articles>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;

		String sql = "select * from articlestable where userid = "+userid+" order by publishedtime desc";

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
	public List<Notes> showAllNotes(int userid) {
		// TODO Auto-generated method stub
		List<Notes> notes=new ArrayList<Notes>();
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		String sql = "select * from notestable where userid = "+userid+" order by publishedtime desc";
		
		try {
			conn = JDBCUtil.getConn();
			stat=conn.createStatement();
			rs=stat.executeQuery(sql);
			
			while(rs.next()){
				Notes note=new Notes();
				
				note.setNoteid(rs.getInt("noteid"));
				note.setNotename(rs.getString("notename"));
				note.setPublishedtime(rs.getDate("publishedtime"));
				note.setUserid(rs.getInt("userid"));
				note.setUsername(rs.getString("username"));
				note.setNotecontent(rs.getString("notecontent"));
				
				notes.add(note);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.closeDB(conn, stat, rs);

		}

		return notes;
	}



}
