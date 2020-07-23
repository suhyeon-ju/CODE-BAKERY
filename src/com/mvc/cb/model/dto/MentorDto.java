package com.mvc.cb.model.dto;

public class MentorDto {

	private String user_Id;
	private int mentor_No;
	private String mentor_Career;
	private String mentor_Content;
	private String user_Pw;
	private String user_Grade;
	private String user_Name;
	private String user_Phone;
	private String user_Mail;
	private int user_Point;
	private String user_Pic;
	private String user_Lang;

	public MentorDto() {
		super();
	}

	public MentorDto(String user_Id, int mentor_No, String mentor_Career, String mentor_Content, String user_Pw,
			String user_Grade, String user_Name, String user_Phone, String user_Mail, int user_Point,
			String user_Pic, String user_Lang) {
		super();
		this.user_Id = user_Id;
		this.mentor_No = mentor_No;
		this.mentor_Career = mentor_Career;
		this.mentor_Content = mentor_Content;
		this.user_Pw = user_Pw;
		this.user_Grade = user_Grade;
		this.user_Name = user_Name;
		this.user_Phone = user_Phone;
		this.user_Mail = user_Mail;
		this.user_Point = user_Point;
		this.user_Pic = user_Pic;
		this.user_Lang = user_Lang;
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

	public String getMentor_Career() {
		return mentor_Career;
	}

	public void setMentor_Career(String mentor_Career) {
		this.mentor_Career = mentor_Career;
	}

	public String getMentor_Content() {
		return mentor_Content;
	}

	public void setMentor_Content(String mentor_Content) {
		this.mentor_Content = mentor_Content;
	}

	public String getUser_Pw() {
		return user_Pw;
	}

	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}

	public String getUser_Grade() {
		return user_Grade;
	}

	public void setUser_Grade(String user_Grade) {
		this.user_Grade = user_Grade;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getUser_Phone() {
		return user_Phone;
	}

	public void setUser_Phone(String user_Phone) {
		this.user_Phone = user_Phone;
	}

	public String getUser_Mail() {
		return user_Mail;
	}

	public void setUser_Mail(String user_Mail) {
		this.user_Mail = user_Mail;
	}

	public int getUser_Point() {
		return user_Point;
	}

	public void setUser_Point(int user_Point) {
		this.user_Point = user_Point;
	}

	public String getUser_Pic() {
		return user_Pic;
	}

	public void setUser_Pic(String user_Pic) {
		this.user_Pic = user_Pic;
	}

	public String getUser_Lang() {
		return user_Lang;
	}

	public void setUser_Lang(String user_Lang) {
		this.user_Lang = user_Lang;
	}

	@Override
	public String toString() {
		return "MentorDto [user_Id=" + user_Id + ", mentor_No=" + mentor_No + ", mentor_Career=" + mentor_Career
				+ ", mentor_Content=" + mentor_Content + ", user_Pw=" + user_Pw + ", user_Grade=" + user_Grade
				+ ", user_Name=" + user_Name + ", user_Phone=" + user_Phone + ", user_Mail=" + user_Mail
				+ ", user_Point=" + user_Point + ", user_Pic=" + user_Pic + ", user_Lang=" + user_Lang + "]";
	}

}
