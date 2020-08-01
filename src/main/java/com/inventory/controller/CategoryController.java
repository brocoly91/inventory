package com.inventory.controller;

import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.domain.BoardVO;
import com.inventory.domain.MemberVO;
import com.inventory.domain.PagingVO;
import com.inventory.service.ContentService;

@Controller
@RequestMapping("/category/*")
public class CategoryController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Inject
	ContentService contentService;
	
	// 글목록 get
//	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
//	public String getBoardList(Model model) throws Exception {
//		logger.info("get goods list");
//		System.out.println("get goods list==");
//		List<BoardVO> list = contentService.getBoardList();
//		model.addAttribute("boardList", list);
//		
//		return "/category/boardList";
//	}
	
	// 글목록 get
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String getBoardList(BoardVO board,PagingVO vo, Model model ,HttpSession session
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="boardTitle", required=false)String boardTitle
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="searchValue", required=false)String searchValue
			, @RequestParam(value="searchKey", required=false)String searchKey
			, @RequestParam(value="n", required=false)int n) throws Exception {
		if(n == 100) {
			
			int total = contentService.coutSearchList(boardTitle);	
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1" ;
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			
			vo = new PagingVO(total,Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			vo.setBoardTitle(boardTitle);
			model.addAttribute("paging", vo);
			
			List<BoardVO> list = contentService.searchList(vo);
			extracted(list);
			model.addAttribute("boardList", list);
			model.addAttribute("testn", 100);
			model.addAttribute("boardTitle", boardTitle);
			return "/category/boardList";
		}else if(n == 200){
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchValue",searchValue);
			map.put("searchKey",searchKey);
			int total = contentService.countVaKeList(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1" ;
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total,Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			vo.setBoardTitle(searchValue);
			map.put("start",String.valueOf(vo.getStart()));
			map.put("end",String.valueOf(vo.getEnd()));
			List<BoardVO> list = contentService.searchVaKeList(map);
			extracted(list);
			model.addAttribute("boardList", list);
			model.addAttribute("testn", 200);
			model.addAttribute("searchValue", searchValue);
			model.addAttribute("searchKey", searchKey);
			return "/category/boardList";
		}else{
			if(n == 0) {
				MemberVO member = (MemberVO)session.getAttribute("member");
				String userId =  member.getUserId();
				board.setUserId(userId);
				//신규저장
				contentService.newConten(board);
				//수정
			}else if(n == 2){
				contentService.modifyConten(board);
				//삭제
			}else if(n == 3){
				contentService.delConten(board);
			}else {
				
			}
			int total = contentService.countBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1" ;
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			List<BoardVO> list = contentService.selectBoard(vo);
			extracted(list);
			
			model.addAttribute("boardList", list);
			model.addAttribute("testn", 300);
			return "/category/boardList";
		}
			
	}
	
	 // new 게시판 작성
	 @RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	 public String boardInsert(BoardVO board,PagingVO vo, Model model ,HttpSession session
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="boardTitle", required=false)String boardTitle
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			 ) throws Exception {
			MemberVO member = (MemberVO)session.getAttribute("member");
			String userId =  member.getUserId();
			board.setUserId(userId);
			//신규저장
			contentService.newConten(board);
			
			int total = contentService.countBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1" ;
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			List<BoardVO> list = contentService.selectBoard(vo);
			extracted(list);
			
			model.addAttribute("boardList", list);
			
			return "/category/boardList";	
	 } 
	 
	     // new 게시판 수정
		 @RequestMapping(value = "/boardModify", method = RequestMethod.POST)
		 public String boardModify(BoardVO board,PagingVO vo, Model model ,HttpSession session
					, @RequestParam(value="nowPage", required=false)String nowPage
					, @RequestParam(value="boardTitle", required=false)String boardTitle
					, @RequestParam(value="cntPerPage", required=false)String cntPerPage
				 ) throws Exception {
				MemberVO member = (MemberVO)session.getAttribute("member");
				String userId =  member.getUserId();
				board.setUserId(userId);
				//신규저장
				contentService.modifyConten(board);
				
				int total = contentService.countBoard();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1" ;
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging", vo);
				List<BoardVO> list = contentService.selectBoard(vo);
				extracted(list);
				
				model.addAttribute("boardList", list);
				
				return "/category/boardList";	
		 } 
	
	     // new 게시판 삭제
		 @RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
		 public String boardDel(BoardVO board,PagingVO vo, Model model ,HttpSession session
					, @RequestParam(value="nowPage", required=false)String nowPage
					, @RequestParam(value="boardTitle", required=false)String boardTitle
					, @RequestParam(value="cntPerPage", required=false)String cntPerPage
				 ) throws Exception {
				MemberVO member = (MemberVO)session.getAttribute("member");
				String userId =  member.getUserId();
				board.setUserId(userId);
				//신규저장
				contentService.delConten(board);
				
				int total = contentService.countBoard();
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1" ;
					cntPerPage = "5";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "5";
				}
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addAttribute("paging", vo);
				List<BoardVO> list = contentService.selectBoard(vo);
				extracted(list);
				
				model.addAttribute("boardList", list);
				
				return "/category/boardList";	
		 } 
		 
	private void extracted(List<BoardVO> list) {
		for(int i=0; i<list.size();i++) {
			if(list.get(i).getBoardCategory().equals("100")) {
				list.get(i).setBoardCategory("JAVA");
			}
			else if(list.get(i).getBoardCategory().equals("200")) {
				list.get(i).setBoardCategory("JAVASCRIPT");
			}
			else if(list.get(i).getBoardCategory().equals("300")) {
				list.get(i).setBoardCategory("SPRING");
			}
			else if(list.get(i).getBoardCategory().equals("400")) {
				list.get(i).setBoardCategory("HTML/CSS");
			}
			else if(list.get(i).getBoardCategory().equals("500")) {
				list.get(i).setBoardCategory("ALGORISM");
			}
			else if(list.get(i).getBoardCategory().equals("600")) {
				list.get(i).setBoardCategory("GIT");
			}
			else if(list.get(i).getBoardCategory().equals("700")) {
				list.get(i).setBoardCategory("시사");
			}
			else if(list.get(i).getBoardCategory().equals("800")) {
				list.get(i).setBoardCategory("TIP");
			}
			else if(list.get(i).getBoardCategory().equals("900")) {
				list.get(i).setBoardCategory("DATABASE");
			}
		}
	}
		
}
