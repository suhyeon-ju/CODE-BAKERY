package com.mvc.cb.model.dto;

public class PointDto {
   private int rownum;
   private int point_No;
   private String point_Date;
   private String point_Charge;
   private String point_Use;
   private String point_History;
   private String user_Id;
   public PointDto() {
      super();
      // TODO Auto-generated constructor stub
   }
   public PointDto(int rownum, int point_No, String point_Date, String point_Charge, String point_Use,
         String point_History, String user_Id) {
      super();
      this.rownum = rownum;
      this.point_No = point_No;
      this.point_Date = point_Date;
      this.point_Charge = point_Charge;
      this.point_Use = point_Use;
      this.point_History = point_History;
      this.user_Id = user_Id;
   }
   public int getRownum() {
      return rownum;
   }
   public void setRownum(int rownum) {
      this.rownum = rownum;
   }
   public int getPoint_No() {
      return point_No;
   }
   public void setPoint_No(int point_No) {
      this.point_No = point_No;
   }
   public String getPoint_Date() {
      return point_Date;
   }
   public void setPoint_Date(String point_Date) {
      this.point_Date = point_Date;
   }
   public String getPoint_Charge() {
      return point_Charge;
   }
   public void setPoint_Charge(String point_Charge) {
      this.point_Charge = point_Charge;
   }
   public String getPoint_Use() {
      return point_Use;
   }
   public void setPoint_Use(String point_Use) {
      this.point_Use = point_Use;
   }
   public String getPoint_History() {
      return point_History;
   }
   public void setPoint_History(String point_History) {
      this.point_History = point_History;
   }
   public String getUser_Id() {
      return user_Id;
   }
   public void setUser_Id(String user_Id) {
      this.user_Id = user_Id;
   }
   
   
   
   
}