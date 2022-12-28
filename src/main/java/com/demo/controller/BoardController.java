package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.BoardVO;
import com.demo.dto.Criteria;
import com.demo.dto.PageDTO;
import com.demo.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller	// boardController bean 으로 생성.  메서드의 기본특징은 jsp로 처리
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//글쓰기 폼.  /board/write
	@GetMapping("/write")  
	public void write() {
		log.info("write called...");
	}
	
	//글저장
	@PostMapping("/write")
	public String write(BoardVO vo, RedirectAttributes rttr) {
		
		log.info("입력데이타: " + vo);
		
		boardService.insert(vo);
		
		rttr.addFlashAttribute("msg", "write");
		
		return "redirect:/board/list";
	}
	
	
	// 오라클 인덱스 힌트 : https://gent.tistory.com/306
	//리스트(목록). 데이타를 JSP에 전달하여 출력
	/*
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list called...");
		
		List<BoardVO> list = boardService.getList();
		model.addAttribute("list", list);
	}
	*/
	// pageNum, amount
	@GetMapping("/list")		// 1	2	3	4	5
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
		
		List<BoardVO> list = boardService.getListWithPaging(cri);  // pageNum=1, amount=10, type=  , keyword=
		model.addAttribute("list", list);
		
		
		//페이징 기능.  1	2	3	4	5
		int total = boardService.getTotalCount(cri);
		
		PageDTO pageDTO = new PageDTO(total, cri);
		model.addAttribute("pageMaker", pageDTO);
		
	}
	
	
	
	//게시물읽기및 수정폼. 데이타를 JSP에 전달하여 출력. 
	// 요청주소 읽기주소   /board/get?bno=3         수정폼주소 /board/modify?bno=3
	//@GetMapping("/get")
	@GetMapping(value = {"/get", "/modify"})
	public void get(Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("게시물번호: " + bno);
		
		BoardVO board = boardService.get(bno);
		model.addAttribute("board", board);
	}
	
	//글 수정하기
	@PostMapping("/modify")
	public String modify(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
		
		log.info("수정 내용: " + vo);
		
		//db연동작업
		boardService.modify(vo);
		/*
		1)rttr.addAttribute(attributeName, attributeValue);
	    -> 이동하는 주소의 메서드에 파라미터 값을 전달목적으로 사용.
	    예> 
	    rttr.addAttribute("bno", 1);  
	    rttr.addAttribute("title", "제목");
	    
	    주소의 모습 : /board/list?bno=1&title=제목
		
		2)rttr.addFlashAttribute(attributeName, attributeValue);
		예>
		 rttr.addFlashAttribute("msg", "ok");
		주소 /board/list 에서 사용하는 jsp에서 변수값을 참조할수가 있다.
		*/
		
		rttr.addFlashAttribute("msg", "modify");
		
		//리스트주소에 필요한 파라미터 작업
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		// /board/list?pageNum=7&amount=10&type=W&keyword=user04
		return "redirect:/board/list";
	}
	
	//게시물 삭제
	@GetMapping("/remove")
	public String remove(Long bno, Criteria cri, RedirectAttributes rttr) {
		
		log.info("삭제 글번호: " + bno);
		
		boardService.remove(bno);
		
		//리스트주소에 필요한 파라미터 작업
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
}
