package com.demo.dto;

import lombok.Getter;

// 클래스 목적?   [prev] 1	 2	3	4	5 [next ] 페이지 번호,이전,다음 표시을 위한 정보를 구성.

@Getter
public class PageDTO {

	private int startPage; // 각 블럭의 시작페이지 번호
	private int endPage; // 각 블럭의 마지막페이지 번호
	
	// 이전, 다음 표시여부
	private boolean prev, next;
	
	//게시판테이블의 데이터 총 개수. db에서 정보를 가져와야 한다.
	private int total;
	
	private Criteria cri;  // pageNum, amount, type, keyword

	public PageDTO(int total, Criteria cri) {
		super();
		this.total = total;
		this.cri = cri;
		
		/*
		 total(총 데이타 개수) : 13
		 amount(게시물 출력건 수) : 5
		 페이지수 : 3  예> 1 2 3 
		 */
		
		
		// 블럭에 출력된 페이지 번호의 개수
		int pageSize = 10;		
		//	 첫번째 블럭	1	2	3	4	5  [next]  
		//   두번째 블럭   [prev]  6	   7	8	9	10
		
		int endPageInfo = pageSize - 1;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		this.startPage = this.endPage - endPageInfo;
		
		//실제 데이타수에 따른 페이지.
		int realEnd = (int) ( Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	
		
	}
	
	
	
}
