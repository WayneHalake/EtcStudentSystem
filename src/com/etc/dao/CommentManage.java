package com.etc.dao;

import java.util.List;

import com.etc.entity.Comments;

public interface CommentManage {
	/**
	 * �������
	 * @param Comments  ����ʵ����
	 * @param tablename  ���۱���
	 */
	public void addComment(Comments comment,String tablename);
	/**
	 * ��ʾһƪ���»������ӵ���������
	 * @param id ���»�����id
	 * @param tablename ���۱���
	 * @return ���ظ����»����ӵ���������
	 */
	public List<Comments> showAllComments(int id,String tablename);
}
