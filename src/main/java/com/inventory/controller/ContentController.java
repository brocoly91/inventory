package com.inventory.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.domain.BoardVO;
import com.inventory.domain.MemberVO;
import com.inventory.service.ContentService;

@Controller
@RequestMapping("/content/*")
public class ContentController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ContentController.class);
	
	@Inject
	ContentService contentService;
	
	// 새글쓰기 get
	@RequestMapping(value = "/resist", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get resist");
		System.out.println("get resist");
	}
	
	// 새글쓰기 post
//	@RequestMapping(value = "/newContent", method = RequestMethod.POST)
//	public String newContent(BoardVO board, HttpSession session ,Model model) throws Exception {
//		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		String userId =  member.getUserId();
//		board.setUserId(userId);
//		
//		contentService.newConten(board);
//		
//		List<BoardVO> list = contentService.getBoardList();
//		model.addAttribute("boardList", list);
//		
//		return "category/boardList";
//	}

	@RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("boardNo") int boardNo) throws Exception {
		BoardVO vo = contentService.getBoardContent(boardNo);
		String categoryValue = vo.getBoardCategory();
		if(categoryValue.equals("100")) {
			model.addAttribute("category", "JAVA");
		}
		else if(categoryValue.equals("200")){
			model.addAttribute("category", "JAVASCRIPT");
		}
		else if(categoryValue.equals("300")){
			model.addAttribute("category", "SPRING");
		}
		else if(categoryValue.equals("400")){
			model.addAttribute("category", "HTML/CSS");
		}
		else if(categoryValue.equals("500")){
			model.addAttribute("category", "ALGORISM");
		}
		else if(categoryValue.equals("600")){
			model.addAttribute("category", "GIT");
		}
		else if(categoryValue.equals("700")){
			model.addAttribute("category", "시사");
		}
		else if(categoryValue.equals("800")){
			model.addAttribute("category", "TIP");
		}
		else if(categoryValue.equals("900")){
			model.addAttribute("category", "DATA BASE");
		}
		else {
			
		}
		model.addAttribute("boardContent", vo);
		return "category/detailList";

	}
	

	 // 글 수 정 get
	 @RequestMapping(value = "/modify", method = RequestMethod.GET)
	 public String getModify(@RequestParam("boardNo") int boardNo, Model model) throws Exception {
	  logger.info("get modify");
	  System.out.println("get modify");
	  BoardVO vo = contentService.getBoardContent(boardNo);
	  
	  model.addAttribute("modify", vo);
	  
	  return "category/modify";

	 } 
	 
		// 글수정 post
//		@RequestMapping(value = "/modifyContent", method = RequestMethod.POST)
//		public String modifyContent(BoardVO board, HttpSession session, Model model) throws Exception {
//			
////			MemberVO member = (MemberVO)session.getAttribute("member");
////			String userId =  member.getUserId();
//			
////			board.setUserId(userId);
////			System.out.println("member=======" + board.getUserId());
//			System.out.println("board=======" + board);
//			contentService.modifyConten(board);
//			
//			List<BoardVO> list = contentService.getBoardList();
//			model.addAttribute("boardList", list);
//			
//			return "category/boardList";
//		}
		
		// 글수정 post
//		@RequestMapping(value = "/deContent", method = RequestMethod.POST)
//		public String deleteContent(BoardVO board, HttpSession session, Model model) throws Exception {
//			
//			System.out.println("board=======" + board);
//			contentService.modifyConten(board);
//			
//			List<BoardVO> list = contentService.getBoardList();
//			model.addAttribute("boardList", list);
//			
//			return "category/boardList";
//		}
		
}
