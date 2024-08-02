package kr.bit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.bit.entity.Board;
import lombok.extern.log4j.Log4j;

@Log4j	
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void testInsert() {
		Board vo = new Board();
		vo.setIdx(7);
		vo.setCompanyID("yanolja");
		vo.setCompanyName("야놀자");
		vo.setNation("한국");
		vo.setRegion("서울");
		vo.setPosition("백엔드 개발자");
		vo.setReward("1000000");
		vo.setSkill("java");
		vo.setContent("자바로 백엔드 개발하실분 구해요");
		boardMapper.insertSelectKey(vo);
		log.info(vo);
	}
	
	
}
