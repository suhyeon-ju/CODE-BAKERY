package com.mvc.cb.model.dto;

import java.util.Date;

public class AnswerDto {

	private int answer_No;
	private String answer_Title;
	private String answer_Content;
	private Date answer_Date;
	private int question_No;
	private String user_Id;

	public AnswerDto() {
		super();
	}

	public AnswerDto(int answer_No, String answer_Title, String answer_Content, Date answer_Date, int question_No,
			String user_Id) {
		super();
		this.answer_No = answer_No;
		this.answer_Title = answer_Title;
		this.answer_Content = answer_Content;
		this.answer_Date = answer_Date;
		this.question_No = question_No;
		this.user_Id = user_Id;
	}

	public int getAnswer_No() {
		return answer_No;
	}

	public void setAnswer_No(int answer_No) {
		this.answer_No = answer_No;
	}

	public String getAnswer_Title() {
		return answer_Title;
	}

	public void setAnswer_Title(String answer_Title) {
		this.answer_Title = answer_Title;
	}

	public String getAnswer_Content() {
		return answer_Content;
	}

	public void setAnswer_Content(String answer_Content) {
		this.answer_Content = answer_Content;
	}

	public Date getAnswer_Date() {
		return answer_Date;
	}

	public void setAnswer_Date(Date answer_Date) {
		this.answer_Date = answer_Date;
	}

	public int getQuestion_No() {
		return question_No;
	}

	public void setQuestion_No(int question_No) {
		this.question_No = question_No;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "AnswerDto [answer_No=" + answer_No + ", answer_Title=" + answer_Title + ", answer_Content="
				+ answer_Content + ", answer_Date=" + answer_Date + ", question_No=" + question_No + ", user_Id="
				+ user_Id + "]";
	}

	
	
}
