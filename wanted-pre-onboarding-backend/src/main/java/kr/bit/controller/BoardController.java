package kr.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.bit.entity.ApplyList;
import kr.bit.entity.Board;
import kr.bit.entity.Criteria;
import kr.bit.entity.PageMaker;
import kr.bit.service.BoardService;

@Controller	//POJO
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list")
	public String getList(Criteria cri, Model model) {
		List<Board> list = boardService.getList(cri);
		//객체바인딩
		model.addAttribute("list", list);
		//페이징 처리에 필요한 부분
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); //몇페이지를 선택했을지에 따라서 cri 안에 정보가 바뀌기 때문에 파라미터로 받는다
		pageMaker.setTotalCount(boardService.totalCount(cri));	//전체게시물수
		//페이징 처리 객체바인딩
		model.addAttribute("pageMaker",pageMaker);
		
		return "board/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/board/register";
	}
	
	//게시물등록
	@PostMapping("/register")
	public String register(Board vo,HttpSession session, RedirectAttributes rttr, Model model) {	//파라메터수집(한글인코딩이 xml에 작성되어있어야함)
		//null 값으로 전달됐을 값에 세션에 저장해둔 값을 저장해줌
		vo.setCompanyID(session.getAttribute("companyID").toString());
		vo.setCompanyName(session.getAttribute("companyName").toString());
		vo.setNation(session.getAttribute("nation").toString());
		vo.setRegion(session.getAttribute("region").toString());
		boardService.register(vo);
		model.addAttribute("board", vo);
		rttr.addFlashAttribute("result", vo.getIdx()); //${result} 형태로 jsp에서 출력가능
		return "redirect:/board/list";
	}
	
	//게시물열기
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model,@ModelAttribute("cri") Criteria cri) {
		Board vo = boardService.get(idx);
		model.addAttribute("vo", vo);	//객체바인딩
		return "board/get";	// = /WEB-INF/views/board/get.jsp -> ${cri.page}
	}
	
	//게시물수정 jsp로 이동
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		return "board/modify";
	}
	
	//게시물수정 db
	@PostMapping("/modify")
	public String modify(Board vo, Criteria cri, RedirectAttributes rttr) {
		boardService.modify(vo);	//수정
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list"; // ?page=2&perPageNum=4 로 넘어가게될것
	}
	
	//게시물삭제
	@GetMapping("/remove")
	public String remove(int idx, Criteria cri, RedirectAttributes rttr) {
		boardService.remove(idx);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/hiring")
	public @ResponseBody List<Board> hiring(@RequestParam("companyName") String companyName) {
		List<Board> list = boardService.hiringList(companyName);
		return list;
	}
	
	@RequestMapping("/apply")
	public @ResponseBody int apply(@RequestParam("memID") String memID, @RequestParam("idx") int idx) {
		Map<String, Object> params = new HashMap<>();
	    params.put("idx", idx);
	    params.put("memID", memID);
        int applyResult = boardService.applyCheck(params);
	    if(applyResult == 0) {
	    	boardService.apply(params);
	    };
	    System.out.println("applyResult="+applyResult);
		return applyResult;
	}
}
