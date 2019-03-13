package com.etc.dao;


import java.util.List;

import com.etc.entity.Articles;
import com.etc.entity.Notes;
import com.etc.entity.Users;

/**
 * 学生管理接口
 * 
 * @author Administrator
 *
 */
public interface UserManage {
	
	/**
	 * 查看个人所有文章
	 * @param userid
	 * @return
	 */
	public List<Articles> showAllArticles(int userid);
	
	/**
	 * 查看个人所有帖子
	 * @param userid
	 * @return
	 */
	public List<Notes> showAllNotes(int userid);
	
	
	/**
	 * 登陆接口，需传入用户名和密码
	 * @param username
	 * @param userpwd
	 * @return userid
	 */
	public int checkUser(String username,String userpwd);
	
	/**
	 * 用户登录检查
	 * @param username
	 * @param userpwd
	 * @param usertype
	 * @return
	 */
	public boolean checkUser(String username,String userpwd,String usertype);
	
	/**
	 * 获取用户类型
	 * @param userid
	 * @return
	 */
	public String userType(int userid);
	
	/**
	 * 增加用户的接口
	 * @param Users
	 * 
	 */
	public void registUser(Users user);
	
	/**
	 * 查找单个用户的信息
	 * @param userid
	 * 
	 * @return Users
	 */
	public Users findUserById(int userid);
	
	
	/**
	 * 修改用户信息表中的信息
	 * @param Users
	 * @param type
	 */
	public void admupdateuser(Users user,String type);
	
	/**
	 * 修改登录表中的信息
	 * @param userid
	 */
	public void updateuser(Users user);
	
}
