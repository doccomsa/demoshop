package com.demo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	//필수요소
	private int pageNum; // 페이지번호.		1	2	3	4	5
	private int amount; // 페이지별 게시물 출력건 수
	
	//선택적 요소
	private String type; // 검색종류(제목:T, 내용:C, 작성자:W, 제목+내용: TC, 제목+작성자:TW, 제목+작성자+내용:TCW)
	private String keyword; //검색어
	
	
	public Criteria() {
		this(1, 10);
	}

	// 댓글 목록에서 호출하는 목적으로 정의함.
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// mybatis에서 참조하기위하여, type필드의 정보를 가공. getter메서드 형식
	// 검색항목에서 [제목 or 작성자] 선택.  type ="TW"
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");  // {"T", "W"}
	}
	
	
	
}
