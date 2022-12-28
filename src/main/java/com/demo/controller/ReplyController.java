package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.domain.ReplyVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.ReplyService;

import lombok.extern.log4j.Log4j;

//댓글기능 : Ajax방식과 REST방식으로 구현.
//   /board/get.jsp 파일에서 모든작업이 진행(댓글목록, 쓰기, 수정, 삭제)

@RequestMapping("/replies/*")
// 메서드의 리턴타입은 jsp파일명으로 해석되는 것이 아니라, 리턴 값 . 그자체 데이터로 클라이언트에게 보내진다.
// 리턴값이 문자열이면 그냥 보내지고, 객체면 json으로 변환되어 보내진다.
@RestController  // @Controller + @ResponseBody
@Log4j
public class ReplyController {

	/*
	 REST 설계구현 
	 1)@RestController
	 2)ResponseEntity클래스? 1)결과값(리턴값) 2)헤더작업 3)HTTP상태코드
	 3)주소 : 자원을 나타내는 의미로 정의
	 4) 데이타 생성 주소 : Post, 데이타 조회 주소 : Get, 데이타 삭제 주소 : Delete, 데이타 수정 주소 : Put
	 5) JSP와 같은 뷰를 리턴하는 것이 아니라, 데이타 그 자체를 리턴. -> 다양한 클라이언트 기기에 표준 데이타를 제공하여 서비스함.
	 
	  3,4,5 REST 이론.
	 */
	@Autowired
	private ReplyService replyService;
	
	
	//특정게시물에 의한 댓글목록.   bno :게시물번호, page :페이지번호
	// @Controller 방식으로 리턴값을 jsp로 할 경우
	/*
	@GetMapping("/replyList")
	public void replyList(Long bno, Criteria cri, Model model) {
		
	}
	*/
	
	// @RestController 방식으로 메서드의 리턴값을 그 데이타를 클라이언트에 반환
	// 1)클라이언트쪽에 댓글 목록과 2)댓글페이징정보. 2개의 정보를 Map컬렉션으로 작업하여, 클라이언트에게 보낸다.
	// 작업정보가 1개 인경우는 List컬렉션으로 작업하여, 클라이언트에게 보낸다.
	// 일반주소  /replies/pages/?bno=2562&page=1
	// REST주소  http://localhost:8888/replies/pages/2562/1.json
	@GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("bno") Long bno, @PathVariable("page") int page ) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		//1)댓글 목록
		Criteria cri = new Criteria(page, 5);
		// mapper인터페이스에 파라미터 전달시 cri, bno 파라미터 2개 전달
		List<ReplyVO> reList = replyService.getListWithPaging(cri, bno);
		
		map.put("replyList", reList);  //작업1
		
		//2)댓글페이징작업
		int total = replyService.getCountByBno(bno);
		PageDTO pageDTO = new PageDTO(total, cri);
		
		map.put("pageMaker", pageDTO); //작업2
		
		
		//최종 리턴되는 데이타작업
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
		
		return entity; // jsp파일명으로 해석되는 것이 아니라, json으로 변환되어 클라이언트에게 보내진다.
		
	}
	
	//consumes = "application/json" : 클라이언트에서 보내는 데이타는 json문자열 포맷.
	//produces = {MediaType.TEXT_PLAIN_VALUE} : 메서드의 리턴값은 String 
	//@RequestBody ReplyVO vo : 클라이언트에서 보낸 JSON문자열 데이터를 ReplyVO객체로 변환하는 기능
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		
		//ResponseEntity<String> entity = null;
		
		int count = replyService.insert(vo);
		
		return (count == 1) ? new ResponseEntity<String>("success", HttpStatus.OK)
								: new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글수정하기. 클라이언트로 부터 댓글번호(rno), 댓글내용(reply)
	@PutMapping(value = "/modify/{rno}")  //  /replies/modify/1
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo)
	{
		log.info("댓글수정 : " + vo);
		
		int count = replyService.modify(vo);
		
		return (count == 1) ? new ResponseEntity<String>("success", HttpStatus.OK)
								: new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@DeleteMapping(value = "/delete/{rno}")  // /replies/delete/1
	public ResponseEntity<String> delete(@PathVariable("rno") Long rno)
	{
		
		int count = replyService.delete(rno);
		
		return (count == 1) ? new ResponseEntity<String>("success", HttpStatus.OK)
								: new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
