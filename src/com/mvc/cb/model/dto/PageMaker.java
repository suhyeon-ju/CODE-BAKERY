package com.mvc.cb.model.dto;

public class PageMaker {
   private final static int displayBlockNum = 5; // 페이지 블럭 개수 << [<] [1] [2] [3] [4] [5] [>] >> 일 때, 5 
   private int startPage = 1; // 페이지 블럭에 출력 될 시작 페이지
   private int endPage; // 페이지 블럭에 출력 될 마지막 페이지
   private boolean prev; //이전
   private boolean next; //다음
   private QnAPagingDto paging;
   
   public void setPaging(QnAPagingDto paging) {
      this.paging = paging;
      calcData();
   }
   
   private void calcData() {
      
      this.startPage = ( paging.getPage()/this.displayBlockNum-(paging.getPage()%this.displayBlockNum!=0?0:1))*this.displayBlockNum+1;
      this.endPage = this.startPage + this.displayBlockNum - 1;
               
      if(this.endPage>paging.getTotalPage()) {this.endPage=paging.getTotalPage();}
      
      // 이전 버튼 생성 여부 = 시작 페이지 번호 == 1 ? false : true (시작페이지가 1이 아니면 생김)
      prev = startPage == 1 ? false : true;
      // 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 갯수 < 총 게시글의 수 ? true: false
      next = endPage * paging.getPageSize() < paging.getTotalArticle() ? true : false;
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }

   public boolean isPrev() {
      return prev;
   }

   public void setPrev(boolean prev) {
      this.prev = prev;
   }

   public boolean isNext() {
      return next;
   }

   public void setNext(boolean next) {
      this.next = next;
   }

   public static int getDisplayblocknum() {
      return displayBlockNum;
   }

   public QnAPagingDto getPaging() {
      return paging;
   }

   @Override
   public String toString() {
      return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
            + ", paging=" + paging + "]";
   }
   
   

}