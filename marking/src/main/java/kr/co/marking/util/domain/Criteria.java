package kr.co.marking.util.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	   private int pageNum;    // 현재 페이지 정보
	   private int amount;     // 출력할 양
	   
	   private String type;    //검색타입
	   private String keyword; //검색어
	   
	   private String sort;    //상품페이지 정렬기준
	   
	   //처음 게시판에 진입했을때 작동 page = 1 , amount = 10    ///sort는 상품페이지의 정렬쪽
	   public Criteria() {
	      this(1,10,"1");
	   }
	   
	   // 추후 페이지 변경이나 amount 값 조절로 내가 커스텀해서 화면에 뿌리기
	   public Criteria(int pageNum, int amount) {
	      this.pageNum = pageNum;
	      this.amount = amount;
	   }
	   
	   // 추후 페이지 변경이나 amount 값 조절로 내가 커스텀해서 화면에 뿌리기 정렬포함   // 상품페이지
	   public Criteria(int pageNum, int amount, String sort) {
		      this.pageNum = pageNum;
		      this.amount = amount;
		      this.sort = sort;
	   }
	   
	   //sql each로 해야하는데 못사용함
	   //검색 조건을 배열로 만들어서 한 번에 처리하기 위함.
	   public String[] getTypeArr() {
		   return type == null ? new String[] {} : type.split("");
	   }
	   
	   
	   //UriComponentsBuilder를 이용하여 링크 생성
	   //이 메서드를 실행시키면 자동으로 url 형식으로 인코딩해줌
	   // ex) ?pageNum=3&amount=20&type=TC&keyword=%EC%83%88%EB%A1%9C
	   public String getListLink() {
		   UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				   .queryParam("pageNum", this.pageNum)
				   .queryParam("amount", this.getAmount())
				   .queryParam("type", this.getType())
				   .queryParam("keyword", this.getKeyword());
		   return builder.toUriString();
	   }
	   
	   public String getProductListLink() {
		   UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				   .queryParam("pageNum", this.pageNum)
				   .queryParam("amount", this.getAmount())
				   .queryParam("sort", this.getSort());
		   return builder.toUriString();
	   }
}
