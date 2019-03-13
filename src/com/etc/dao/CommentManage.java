package com.etc.dao;

import java.util.List;

import com.etc.entity.Comments;

public interface CommentManage {
	/**
	 * 添加评论
	 * @param Comments  评论实体类
	 * @param tablename  评论表名
	 */
	public void addComment(Comments comment,String tablename);
	/**
	 * 显示一篇文章或者帖子的所有评论
	 * @param id 文章或帖子id
	 * @param tablename 评论表名
	 * @return 返回该文章或帖子的所有评论
	 */
	public List<Comments> showAllComments(int id,String tablename);
}
