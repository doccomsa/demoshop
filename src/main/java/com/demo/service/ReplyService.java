package com.demo.service;

import java.util.List;

import com.demo.domain.ReplyVO;
import com.demo.dto.Criteria;

public interface ReplyService {

	public List<ReplyVO> getListWithPaging(Criteria cri, Long bno);
	
	public int getCountByBno(Long bno);
	
	public int insert(ReplyVO vo);
	
	public int modify(ReplyVO vo);
	
	public int delete(Long rno);
}
