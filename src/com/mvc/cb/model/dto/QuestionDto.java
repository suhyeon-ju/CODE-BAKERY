package com.mvc.cb.model.dto;

import java.util.Date;

public class QuestionDto {

	private int question_No;
	private String question_Title;
	private String question_Content;
	private Date question_Date;
	private int question_Views;
	private String question_Tag;
	private String user_Id;

	public QuestionDto() {
		super();
	}

	public QuestionDto(int question_No, String question_Title, String question_Content, Date question_Date,
			int question_Views, String question_Tag, String user_Id) {
		super();
		this.question_No = question_No;
		this.question_Title = question_Title;
		this.question_Content = question_Content;
		this.question_Date = question_Date;
		this.question_Views = question_Views;
		this.question_Tag = question_Tag;
		this.user_Id = user_Id;
	}

	public int getQuestion_No() {
		return question_No;
	}

	public void setQuestion_No(int question_No) {
		this.question_No = question_No;
	}

	public String getQuestion_Title() {
		return question_Title;
	}

	public void setQuestion_Title(String question_Title) {
		this.question_Title = question_Title;
	}

	public String getQuestion_Content() {
		return question_Content;
	}

	public void setQuestion_Content(String question_Content) {
		this.question_Content = question_Content;
	}

	public Date getQuestion_Date() {
		return question_Date;
	}

	public void setQuestion_Date(Date question_Date) {
		this.question_Date = question_Date;
	}

	public int getQuestion_Views() {
		return question_Views;
	}

	public void setQuestion_Views(int question_Views) {
		this.question_Views = question_Views;
	}

	public String getQuestion_Tag() {
		return question_Tag;
	}

	public void setQuestion_Tag(String question_Tag) {
		this.question_Tag = question_Tag;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "QuestionDto [question_No=" + question_No + ", question_Title=" + question_Title + ", question_Content="
				+ question_Content + ", question_Date=" + question_Date + ", question_Views=" + question_Views
				+ ", question_Tag=" + question_Tag + ", user_Id=" + user_Id + "]";
	}

	

}
