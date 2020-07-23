package com.mvc.cb.model.dto;

import java.util.Date;

public class QnACommentDto {

	private int comment_No;
	private int question_No;
	private String comment_Content;
	private Date comment_Date;
	private int group_Id;
	private int parent_No;
	private int depth;
	private String user_Id;
	private String user_Pic;

	public QnACommentDto() {
		super();
	}

	public QnACommentDto(int comment_No, int question_No, String comment_Content, Date comment_Date, int group_Id,
			int parent_No, int depth, String user_Id, String user_Pic) {
		super();
		this.comment_No = comment_No;
		this.question_No = question_No;
		this.comment_Content = comment_Content;
		this.comment_Date = comment_Date;
		this.group_Id = group_Id;
		this.parent_No = parent_No;
		this.depth = depth;
		this.user_Id = user_Id;
		this.user_Pic = user_Pic;
	}

	public int getComment_No() {
		return comment_No;
	}

	public void setComment_No(int comment_No) {
		this.comment_No = comment_No;
	}

	public int getQuestion_No() {
		return question_No;
	}

	public void setQuestion_No(int question_No) {
		this.question_No = question_No;
	}

	public String getComment_Content() {
		return comment_Content;
	}

	public void setComment_Content(String comment_Content) {
		this.comment_Content = comment_Content;
	}

	public Date getComment_Date() {
		return comment_Date;
	}

	public void setComment_Date(Date comment_Date) {
		this.comment_Date = comment_Date;
	}

	public int getGroup_Id() {
		return group_Id;
	}

	public void setGroup_Id(int group_Id) {
		this.group_Id = group_Id;
	}

	public int getParent_No() {
		return parent_No;
	}

	public void setParent_No(int parent_No) {
		this.parent_No = parent_No;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getUser_Pic() {
		return user_Pic;
	}

	public void setUser_Pic(String user_Pic) {
		this.user_Pic = user_Pic;
	}

	@Override
	public String toString() {
		return "QnACommentDto [comment_No=" + comment_No + ", question_No=" + question_No + ", comment_Content="
				+ comment_Content + ", comment_Date=" + comment_Date + ", group_Id=" + group_Id + ", parent_No="
				+ parent_No + ", depth=" + depth + ", user_Id=" + user_Id + ", user_Pic=" + user_Pic + "]";
	}

	

}
