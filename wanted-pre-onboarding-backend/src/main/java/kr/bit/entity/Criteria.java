package kr.bit.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지에 보여줄 게시글의 수
	//검색기능에 필요한 변수
	private String type;
	private String keyword;
	public Criteria() {		// 맨 첫 페이지에서 게시글이 보여질 때
		this.page=1;
		this.perPageNum=5;	// 알아서 조정하자
	}
	// 현재 페이지의 게시글의 시작번호
	public int getPageStart() {
		// 예 : 1~10, 11~20, 21~30
		return (page-1)*perPageNum;	//mySQL에서 limit을 사용하여 값을 가져올건데, index 개념과 비슷.
									//limit #{pageStart}, #{perPageNum} 이렇게 적어도 앞에 getter로 가져옴
	}
	
}
