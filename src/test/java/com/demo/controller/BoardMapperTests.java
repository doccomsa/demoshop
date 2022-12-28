package com.demo.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.demo.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		/*
		List<BoardVO> list = mapper.getList();
		
		for(int i=0; i <list.size(); i++) {
			log.info(list.get(i));
		}
		*/
		
		//함수적인터페이스
		mapper.getList().forEach(board -> log.info(board));
	}
	
	
	@Test
	public void testGetList2() {
		/*
		List<BoardVO> list = mapper.getList2();
		
		for(int i=0; i <list.size(); i++) {
			log.info(list.get(i));
		}
		*/
		
		//함수적인터페이스
		mapper.getList2().forEach(board -> log.info(board));
	}
}
