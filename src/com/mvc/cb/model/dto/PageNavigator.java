package com.mvc.cb.model.dto;

public class PageNavigator {
   
      private int page; // 페이지 번호 : 현재 몇 페이지 인지 << [1] [2] [3] [4] [5] >> 이런 식의 페이지 번호를 나타내는 것.
      private int totalPage; // 페이지 갯수 :  << [1] [2] [3] [4] [5] >> 총 5개의 페이지
      private int pageSize = 10; // 한 페이지 게시글 개수 : 한 페이지에 출력 될 개시글 개수
      private int totalArticle; //전체 게시글 개수
      private int startRow; // 한 페이지에 게시글 시작 행
      private int endRow; // 한 페이지에 게시글 끝 행
      // -----> 한 페이지 내에 출력되는 게시글의 개수가 10개라면, startRow + endRow 합쳐서 한 페이지 당 총 10개 보여주기. (startRow(1) + endRow(10))
      
      public PageNavigator() {
         super();
      }
         
      
      // 페이지 번호 설정
      public void setPage(int page) {
         // 페이지 번호가 없을 때 1로 맞춰줌
         if (page <= 0) {
            this.page = 1;
            return;
         }
         this.page = page;
      }

      public void setPageSize(int pageSize) {
         this.pageSize = pageSize;
      }


      // 전체 게시글 갯수
      public void setTotalArticle(int totalArticle) {
         this.totalArticle = totalArticle;
      }
      
      // 페이지 갯수
      public void setTotalPage(int totalArticle) {
         this.totalPage = this.totalArticle/this.pageSize + (this.totalArticle%this.pageSize==0?0:1);
         
         // 유효성 검사
         if(this.page <=0 || this.page > totalPage){
            this.page = 1;
         }
      }
      
      // 게시글 시작 행 설정
      public void setStartRow() {
         this.startRow = (this.page - 1) * this.pageSize + 1;
      }
      
      // 게시글 끝 행 설정
      public void setEndRow() {
         this.endRow = page * pageSize;
         if(endRow > this.totalArticle) endRow = this.totalArticle;   
      }

      public int getPage() {
         return page;
      }

      public int getTotalPage() {
         return totalPage;
      }

      public int getPageSize() {
         return pageSize;
      }

      public int getTotalArticle() {
         return totalArticle;
      }

      public int getStartRow() {
         return startRow;
      }

      public int getEndRow() {
         return endRow;
      }


      @Override
      public String toString() {
         return "Paging [page=" + page + ", totalPage=" + totalPage + ", pageSize=" + pageSize + ", totalArticle="
               + totalArticle + ", startRow=" + startRow + ", endRow=" + endRow + "]";
      }
   
   
}