package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.demo.domain.ReplyVO;
import com.demo.dto.Criteria;

/*
 Mapper Interface의 메서드 파라미터가 2개 이상일 경우에는 @Param 어노테이션을 사용해야 한다. (중요)
 */

public interface ReplyMapper {

	//댓글목록
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	//댓글개수
	public int getCountByBno(Long bno);
	
	//댓글쓰기
	public int insert(ReplyVO vo);
	
	//댓글수정
	public int modify(ReplyVO vo);
	
	//댓글삭제
	public int delete(Long rno);
}
