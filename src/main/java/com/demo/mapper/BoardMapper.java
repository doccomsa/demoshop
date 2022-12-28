package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.demo.domain.BoardVO;
import com.demo.dto.Criteria;

// Mapper Interface는  1)XML 이용 2) Annotation 이용
// 프록시 클래스가 bean 생성
public interface BoardMapper {
	
	// 1)XML 이용(전통적인 SI업체에서는 자주 사용)
	// mapper xml파일의 메서드명과 일치되는 id를 참조한다.
	// 리스트(목록)
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri); // pageNum, amount, type, keyword
	
	public int getTotalCount(Criteria cri);
	
	// 2)Annotation 이용
	@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList2();
	
	//글저장하기
	public void insert(BoardVO vo);
	
	//글읽기(조회)
	public BoardVO get(Long bno);
	
	//글수정하기
	public void modify(BoardVO vo);
	
	//글삭제하기
	public void remove(Long bno);
	

	
	
}
