package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.BoardVO;
import com.demo.dto.Criteria;
import com.demo.mapper.BoardMapper;

@Service  // boardServiceImpl bean 생성
public class BoardServiceImpl implements BoardService {

	// Mapper Interface의 메서드 호출하는 작업
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public void insert(BoardVO vo) {
		boardMapper.insert(vo);
		
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return boardMapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.get(bno);
	}

	@Override
	public void modify(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.modify(vo);
	}

	@Override
	public void remove(Long bno) {
		// TODO Auto-generated method stub
		boardMapper.remove(bno);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCount(cri);
	}

}
