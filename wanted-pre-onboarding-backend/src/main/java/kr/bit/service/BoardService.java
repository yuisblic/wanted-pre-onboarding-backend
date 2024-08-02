package kr.bit.service;

import java.util.List;
import java.util.Map;

import kr.bit.entity.Board;
import kr.bit.entity.Company;
import kr.bit.entity.Criteria;
import kr.bit.entity.Member;

public interface BoardService {

	public List<Board> getList(Criteria cri);
	public List<Board> hiringList(String companyName);
	public Member login(Member vo);
	public void register(Board vo);
	public Board get(int idx);
	public void modify(Board vo);
	public void remove(int idx);
	public int totalCount(Criteria cri);
	public int applyCheck(Map<String, Object> params);
	public void apply(Map<String, Object> params);
}
