package com.demo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 테이블명 : TBL_BOARD
/*
 CREATE TABLE TBL_BOARD (
    BNO     NUMBER(10,0),       --일련번호
    TITLE   VARCHAR2(200)   NOT NULL,       -- 제목
    CONTENT VARCHAR2(2000)  NOT NULL,       -- 내용
    WRITER  VARCHAR2(50)    NOT NULL,       -- 작성자
    REGDATE DATE    DEFAULT SYSDATE,        -- 등록일자
    UPDATEDATE DATE DEFAULT SYSDATE        -- 수정일자
); 
 */

// VO클래스 생성 : 테이블명은 알맞은 이름을 정의하고, 컬럼명은 클래스의 필드명으로 동일하게 정의한다.

@Getter
@Setter
@ToString
public class BoardVO {
	//bno, title, content, writer, regdate, updatedate
	
	private Long bno;  // 기본데이타 타입인 int, long 을사용 안하고, 참조타입인 Long을 사용.
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
	/* 롬복사용 안하고, 수동으로 작업시 아래 getter, setter, ToString() 메서드 작업해야 함.
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", updatedate=" + updatedate + "]";
	}
	*/
	
	
}
