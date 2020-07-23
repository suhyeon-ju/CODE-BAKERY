package com.mvc.cb.model.dto;

public class TryQuizDto {
	
	private int quiz_No;
	private String code_Content;
	private String ex_Result;
	private String print_Result;
	private String user_Id;
	
	public TryQuizDto() {
		super();
	}

	public TryQuizDto(int quiz_No, String code_Content, String ex_Result, String print_Result, String user_Id) {
		super();
		this.quiz_No = quiz_No;
		this.code_Content = code_Content;
		this.ex_Result = ex_Result;
		this.print_Result = print_Result;
		this.user_Id = user_Id;
	}

	public int getQuiz_No() {
		return quiz_No;
	}

	public void setQuiz_No(int quiz_No) {
		this.quiz_No = quiz_No;
	}

	public String getCode_Content() {
		return code_Content;
	}

	public void setCode_Content(String code_Content) {
		this.code_Content = code_Content;
	}

	public String getEx_Result() {
		return ex_Result;
	}

	public void setEx_Result(String ex_Result) {
		this.ex_Result = ex_Result;
	}

	public String getPrint_Result() {
		return print_Result;
	}

	public void setPrint_Result(String print_Result) {
		this.print_Result = print_Result;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	@Override
	public String toString() {
		return "TryQuizDto [quiz_No=" + quiz_No + ", code_Content=" + code_Content + ", ex_Result=" + ex_Result
				+ ", print_Result=" + print_Result + ", user_Id=" + user_Id + "]";
	}
	
	
	

}
