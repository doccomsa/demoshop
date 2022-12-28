package com.demo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {

	/*
	 CREATE TABLE TBL_REPLY (
    RNO     NUMBER(10,0),
    BNO     NUMBER(10,0) NOT NULL,
    REPLY   VARCHAR2(1000)  NOT NULL,
    REPLYER VARCHAR2(50)    NOT NULL,
    REPLYDATE   DATE    DEFAULT SYSDATE,
    UPDATEDATE  DATE    DEFAULT SYSDATE
);
	 */
	
	// rno, bno, reply, replyer, replydate, updatedate
	
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
}
