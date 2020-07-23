package com.mvc.cb.model.dto;

import java.sql.Date;

public class NoticeDto {

	private int notice_No;
	private String notice_Title;
	private String notice_Content;
	private Date notice_Date;
	private int notice_Views;
	private String user_Id;

	public NoticeDto() {
		super();
	}

	public NoticeDto(int notice_No, String notice_Title, String notice_Content, Date notice_Date, int notice_Views,
			String user_Id) {
		super();
		this.notice_No = notice_No;
		this.notice_Title = notice_Title;
		this.notice_Content = notice_Content;
		this.notice_Date = notice_Date;
		this.notice_Views = notice_Views;
		this.user_Id = user_Id;
	}

	public int getNotice_No() {
		return notice_No;
	}

	public void setNotice_No(int notice_No) {
		this.notice_No = notice_No;
	}

	public String getNotice_Title() {
		return notice_Title;
	}

	public void setNotice_Title(String notice_Title) {
		this.notice_Title = notice_Title;
	}

	public String getNotice_Content() {
		return notice_Content;
	}

	public void setNotice_Content(String notice_Content) {
		this.notice_Content = notice_Content;
	}

	public Date getNotice_Date() {
		return notice_Date;
	}

	public void setNotice_Date(Date notice_Date) {
		this.notice_Date = notice_Date;
	}

	public int getNotice_Views() {
		return notice_Views;
	}

	public void setNotice_Views(int notice_Views) {
		this.notice_Views = notice_Views;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "NoticeDto [notice_No=" + notice_No + ", notice_Title=" + notice_Title + ", notice_Content="
				+ notice_Content + ", notice_Date=" + notice_Date + ", notice_Views=" + notice_Views + ", user_Id="
				+ user_Id + "]";
	}

	
}
