package com.mvc.cb.model.dto;

import java.sql.Date;

public class NoticeCommentDto {

	private int comment_No;
	private int notice_No;
	private String comment_Content;
	private Date comment_Date;
	private String user_Id;

	public NoticeCommentDto() {
		super();
	}

	public NoticeCommentDto(int comment_No, int notice_No, String comment_Content, Date comment_Date, String user_Id) {
		super();
		this.comment_No = comment_No;
		this.notice_No = notice_No;
		this.comment_Content = comment_Content;
		this.comment_Date = comment_Date;
		this.user_Id = user_Id;
	}

	public int getComment_No() {
		return comment_No;
	}

	public void setComment_No(int comment_No) {
		this.comment_No = comment_No;
	}

	public int getNotice_No() {
		return notice_No;
	}

	public void setNotice_No(int notice_No) {
		this.notice_No = notice_No;
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

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "NoticeCommentDto [comment_No=" + comment_No + ", notice_No=" + notice_No + ", comment_Content="
				+ comment_Content + ", comment_Date=" + comment_Date + ", user_Id=" + user_Id + "]";
	}

	

}
