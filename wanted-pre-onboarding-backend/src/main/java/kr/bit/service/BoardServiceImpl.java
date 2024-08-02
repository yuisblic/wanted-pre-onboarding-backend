package kr.bit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.bit.entity.Board;
import kr.bit.entity.Company;
import kr.bit.entity.Criteria;
import kr.bit.entity.Member;
import kr.bit.mapper.BoardMapper;

@Service	//
public class BoardServiceImpl implements BoardService {
		
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<Board> getList(Criteria cri) {
		
		//고객의 요구사항을 반영할 때, 이 곳에 반영할 로직을 구현하면 된다
		List<Board> list = boardMapper.getList(cri);
		
		return list;
	}

	@Override
	public Member login(Member vo) {
		Member mvo = boardMapper.login(vo);
		return mvo;
	}

	@Override
	public void register(Board vo) {
		boardMapper.insertSelectKey(vo);
	}

	@Override
	public Board get(int idx) {
		Board vo = boardMapper.read(idx);
		return vo;
	}

	@Override
	public void modify(Board vo) {
		boardMapper.update(vo);		
	}

	@Override
	public void remove(int idx) {
		boardMapper.delete(idx);
	}
	
	@Override
	public int totalCount(Criteria cri) {
		return boardMapper.totalCount(cri);
	}

	@Override
	public List<Board> hiringList(String companyName) {
		return boardMapper.hiringList(companyName);
	}

	@Override
	public int applyCheck(Map<String, Object> params) {
		return boardMapper.applyCount(params);
	}

	@Override
	public void apply(Map<String, Object> params) {
		boardMapper.apply(params);
	}


}
