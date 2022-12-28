package com.demo.service;

import java.util.List;

import com.demo.domain.BoardVO;
import com.demo.dto.Criteria;

public interface BoardService {

	public void insert(BoardVO vo);
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	//글읽기(조회)
	public BoardVO get(Long bno);
	
	//글수정하기
	public void modify(BoardVO vo);
	
	//글삭제하기
	public void remove(Long bno);
}
