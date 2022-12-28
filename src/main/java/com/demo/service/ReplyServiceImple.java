package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.ReplyVO;
import com.demo.dto.Criteria;
import com.demo.mapper.ReplyMapper;

@Service
public class ReplyServiceImple implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<ReplyVO> getListWithPaging(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		return replyMapper.getListWithPaging(cri, bno);
	}

	@Override
	public int getCountByBno(Long bno) {
		// TODO Auto-generated method stub
		return replyMapper.getCountByBno(bno);
	}

	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.modify(vo);
	}

	@Override
	public int delete(Long rno) {
		// TODO Auto-generated method stub
		return replyMapper.delete(rno);
	}
}
