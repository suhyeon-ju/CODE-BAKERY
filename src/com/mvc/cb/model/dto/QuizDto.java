package com.mvc.cb.model.dto;

import java.util.Date;

public class QuizDto {
	
	private int quiz_No;
	private String quiz_Title;
	private String quiz_Content;
	private Date quiz_Date;
	private int correct_User;
	private int try_User;
	private double correct_Rate;
	private int quiz_Views;
	private String input_Explanation;
	private String output_Explanation;
	private String input_Sample;
	private String output_Sample;
	private String user_Id;

	public QuizDto() {
		super();
	}

	public QuizDto(int quiz_No, String quiz_Title, String quiz_Content, Date quiz_Date, int correct_User, int try_User,
			double correct_Rate, int quiz_Views, String input_Explanation, String output_Explanation, String input_Sample, String output_Sample, String user_Id) {
		super();
		this.quiz_No = quiz_No;
		this.quiz_Title = quiz_Title;
		this.quiz_Content = quiz_Content;
		this.quiz_Date = quiz_Date;
		this.correct_User = correct_User;
		this.try_User = try_User;
		this.correct_Rate = correct_Rate;
		this.quiz_Views = quiz_Views;
		this.input_Explanation = input_Explanation;
		this.output_Explanation  = output_Explanation;
		this.input_Sample = input_Sample;
		this.output_Sample = output_Sample;
		this.user_Id = user_Id;
	}

	public int getQuiz_No() {
		return quiz_No;
	}

	public void setQuiz_No(int quiz_No) {
		this.quiz_No = quiz_No;
	}

	public String getQuiz_Title() {
		return quiz_Title;
	}

	public void setQuiz_Title(String quiz_Title) {
		this.quiz_Title = quiz_Title;
	}

	public String getQuiz_Content() {
		return quiz_Content;
	}

	public void setQuiz_Content(String quiz_Content) {
		this.quiz_Content = quiz_Content;
	}

	public Date getQuiz_Date() {
		return quiz_Date;
	}

	public void setQuiz_Date(Date quiz_Date) {
		this.quiz_Date = quiz_Date;
	}

	public int getCorrect_User() {
		return correct_User;
	}

	public void setCorrect_User(int correct_User) {
		this.correct_User = correct_User;
	}

	public int getTry_User() {
		return try_User;
	}

	public void setTry_User(int try_User) {
		this.try_User = try_User;
	}

	public double getCorrect_Rate() {
		return correct_Rate;
	}

	public void setCorrect_Rate(double correct_Rate) {
		this.correct_Rate = correct_Rate;
	}

	public int getQuiz_Views() {
		return quiz_Views;
	}

	public void setQuiz_Views(int quiz_Views) {
		this.quiz_Views = quiz_Views;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getInput_Sample() {
		return input_Sample;
	}

	public void setInput_Sample(String input_Sample) {
		this.input_Sample = input_Sample;
	}

	public String getOutput_Sample() {
		return output_Sample;
	}

	public void setOutput_Sample(String output_Sample) {
		this.output_Sample = output_Sample;
	}

	public String getInput_Explanation() {
		return input_Explanation;
	}

	public void setInput_Explanation(String input_Explanation) {
		this.input_Explanation = input_Explanation;
	}

	public String getOutput_Explanation() {
		return output_Explanation;
	}

	public void setOutput_Explanation(String output_Explanation) {
		this.output_Explanation = output_Explanation;
	}

	@Override
	public String toString() {
		return "QuizDto [quiz_No=" + quiz_No + ", quiz_Title=" + quiz_Title + ", quiz_Content=" + quiz_Content
				+ ", quiz_Date=" + quiz_Date + ", correct_User=" + correct_User + ", try_User=" + try_User
				+ ", correct_Rate=" + correct_Rate + ", quiz_Views=" + quiz_Views + ", user_Id=" + user_Id + "]";
	}
	
	

}
