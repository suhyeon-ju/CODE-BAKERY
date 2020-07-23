package com.mvc.cb.model.dto;

import java.util.Date;

public class MentorReviewDto {

	private int review_No;
	private String review_Content;
	private Date review_Date;
	private String user_Id;
	private int mentor_No;
	
	public MentorReviewDto() {
		super();
	}

	public MentorReviewDto(int review_No, String review_Content, Date review_Date, String user_Id, int mentor_No) {
		super();
		this.review_No = review_No;
		this.review_Content = review_Content;
		this.review_Date = review_Date;
		this.user_Id = user_Id;
		this.mentor_No = mentor_No;
	}

	public int getReview_No() {
		return review_No;
	}

	public void setReview_No(int review_No) {
		this.review_No = review_No;
	}

	public String getReview_Content() {
		return review_Content;
	}

	public void setReview_Content(String review_Content) {
		this.review_Content = review_Content;
	}

	public Date getReview_Date() {
		return review_Date;
	}

	public void setReview_Date(Date review_Date) {
		this.review_Date = review_Date;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getMentor_No() {
		return mentor_No;
	}

	public void setMentor_No(int mentor_No) {
		this.mentor_No = mentor_No;
	}

	@Override
	public String toString() {
		return "MentorReviewDto [review_No=" + review_No + ", review_Content=" + review_Content + ", review_Date="
				+ review_Date + ", user_Id=" + user_Id + ", mentor_No=" + mentor_No + "]";
	}
	
	
	

}
