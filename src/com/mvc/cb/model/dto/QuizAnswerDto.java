package com.mvc.cb.model.dto;

public class QuizAnswerDto {
	private String quiz_type;
	private String quiz_answer;
	
	public QuizAnswerDto(String quiz_type, String quiz_answer) {
		super();
		this.quiz_type = quiz_type;
		this.quiz_answer = quiz_answer;
	}

	public String getQuiz_type() {
		return quiz_type;
	}

	public void setQuiz_type(String quiz_type) {
		this.quiz_type = quiz_type;
	}

	public String getQuiz_answer() {
		return quiz_answer;
	}

	public void setQuiz_answer(String quiz_answer) {
		this.quiz_answer = quiz_answer;
	}
}
