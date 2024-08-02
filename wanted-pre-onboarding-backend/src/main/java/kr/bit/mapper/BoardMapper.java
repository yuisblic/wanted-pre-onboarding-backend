package kr.bit.mapper;

import java.util.List;
import java.util.Map;

import kr.bit.entity.Board;
import kr.bit.entity.Company;
import kr.bit.entity.Criteria;
import kr.bit.entity.Member;

//@Mapper 는 생략가능
public interface BoardMapper {	
	public List<Board> getList(Criteria cri);
	public List<Board> hiringList(String companyName);
	public void insert(Board vo);
	public void insertSelectKey(Board vo);
	public Member login(Member vo);
	public Board read(int idx);
	public void update(Board vo);
	public void delete(int idx);
	public int totalCount(Criteria cri);
	public int applyCount(Map<String, Object> params);
	public void apply(Map<String, Object> params);
}
