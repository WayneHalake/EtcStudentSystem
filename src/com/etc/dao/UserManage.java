package com.etc.dao;


import java.util.List;

import com.etc.entity.Articles;
import com.etc.entity.Notes;
import com.etc.entity.Users;

/**
 * ѧ������ӿ�
 * 
 * @author Administrator
 *
 */
public interface UserManage {
	
	/**
	 * �鿴������������
	 * @param userid
	 * @return
	 */
	public List<Articles> showAllArticles(int userid);
	
	/**
	 * �鿴������������
	 * @param userid
	 * @return
	 */
	public List<Notes> showAllNotes(int userid);
	
	
	/**
	 * ��½�ӿڣ��贫���û���������
	 * @param username
	 * @param userpwd
	 * @return userid
	 */
	public int checkUser(String username,String userpwd);
	
	/**
	 * �û���¼���
	 * @param username
	 * @param userpwd
	 * @param usertype
	 * @return
	 */
	public boolean checkUser(String username,String userpwd,String usertype);
	
	/**
	 * ��ȡ�û�����
	 * @param userid
	 * @return
	 */
	public String userType(int userid);
	
	/**
	 * �����û��Ľӿ�
	 * @param Users
	 * 
	 */
	public void registUser(Users user);
	
	/**
	 * ���ҵ����û�����Ϣ
	 * @param userid
	 * 
	 * @return Users
	 */
	public Users findUserById(int userid);
	
	
	/**
	 * �޸��û���Ϣ���е���Ϣ
	 * @param Users
	 * @param type
	 */
	public void admupdateuser(Users user,String type);
	
	/**
	 * �޸ĵ�¼���е���Ϣ
	 * @param userid
	 */
	public void updateuser(Users user);
	
}
