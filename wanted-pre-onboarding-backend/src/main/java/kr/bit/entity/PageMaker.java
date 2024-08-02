package kr.bit.entity;

import lombok.Data;

//페이징처리를 만드는 클래스 (vo)
@Data
public class PageMaker {
	private Criteria cri;	//기준이 되는 정보가 필요하기 때문에
	private int totalCount; //총 게시글의 수
	private int startPage;	//시작페이지 번호 = 예: 1,2,...,10 에서 1을 의미/ 11,12,...,20 에서 11  
	private int endPage;	//끝페이지 번호 = 예: 1,...,10 에서 10을 의미/ 11,...,20 에서 20
							//끝페이지가 8까지라면? 10이 아니라 8로 "조정"이 되어야한다
	private boolean prev;	//◀ 이전버튼(true or false)
	private boolean next;	//▶ 다음버튼(true or false)
	private int displayPageNum = 5; //페이징번호를 몇개씩 보여줄건지
	//총 게시글의 수를 구하는 메서드
	public void setTotalCount(int totalCount) {	//재정의식
		this.totalCount = totalCount;
		makePaging();
	}
	private void makePaging() {	//totalCount 값을 가져와서 본격적인 페이징처리를 해보자
		// 예: 1 2 3 4 5 6 7 8 9 10
		// 1. 화면에 보여질 마지막 페이지 번호 = 10, 현재페이지번호가 7이라고 가정.
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		// 2. 화면에 보여질 시작 페이지 번호 = 1
		startPage = (endPage-displayPageNum)+1;
		if(startPage<=0) startPage=1;
		// 3. 실제 마지막 게시물이 있는 페이지 계산 = 전체게시물수가 88이라면 마지막페이지가 8가 된다. 81~90이 8페이지니까
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		// 4. 화면에 보여질 마지막 페이지 유효성 체크
		if(tempEndPage<endPage) {
			//화면에 보여질 마지막 페이지가 10이고 실제 마지막 게시물이 있는 페이지가 9이므로
			//화면에 보여질 마지막 페이지를 실제 페이지로 바꿔줘야한다
			endPage=tempEndPage;
		}
		// 5. 이전버튼 존재 여부
		prev = (startPage==1)?false:true;	//1이면 false 아니면 true
		// 6. 다음버튼 존재 여부 = 가상의 페이징 마지막 번호 < 실제 페이징 마지막 번호
		next = (endPage<tempEndPage)?true:false;
	}
}
