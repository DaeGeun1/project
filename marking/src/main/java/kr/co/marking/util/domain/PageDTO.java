package kr.co.marking.util.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;  // 시작페이지
	private int endPage;	// 끝페이지
	private boolean prev;	// 이전 페이지 유무
	private boolean next;	// 다음 페이지 유무
	private int total;      // 게시글 총 수
	private Criteria cri;
	private int realEnd;    // 실제 끝
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0)) * 5;   // 여기가 페이지 몇개씩 출력
		this.startPage = this.endPage - 4;								 // 여기가 페이지 몇개씩 출력
		
		realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));     // 실제 끝 페이지 
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}
