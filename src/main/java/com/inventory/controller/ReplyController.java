package com.inventory.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.inventory.domain.MemberVO;
import com.inventory.domain.ReplyVO;
import com.inventory.service.ReplyService;
 
 
// @ResponseBody를 붙이지 않아도 뷰가 아닌 데이터 리턴 가능
@RestController // spring 4.0부터 사용 가능
@RequestMapping("/category/*") //공통적인 url pattern
public class ReplyController {
 
    @Inject        //서비스를 호출하기위해서 의존성을 주입
    ReplyService replyService;
    
    //댓글리스트를 호출할때 맵핑되는 메소드
    @RequestMapping("/list.do")
    public Object list(int boardNo, Model model ) {
    	System.out.println("list.do들어옴");
        List<ReplyVO> list = replyService.list(boardNo); 
		model.addAttribute("list", list);
        Map<String, Object> retVal = new HashMap<String, Object>();
        retVal.put("list", list);
		return retVal;
    }
    
    //댓글 목록을 ArrayList로 리턴
    @RequestMapping("list_json.do")
    public List<ReplyVO> list_json(int boardNo){
        return replyService.list(boardNo);
    }
    
    @RequestMapping("/insert.do") //세부적인 url pattern
    public void insert(ReplyVO vo, HttpSession session) {
    	System.out.println("insert.do들어옴");
        //댓글 작성자 아이디
        //현재 접속중인 사용자 아이디
//        String userid=(String)session.getAttribute("userid");
      
        
        
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId =  member.getUserId();
//		board.setUserId(userId);
		  vo.setReplyer(userId);
		System.out.println("getBoardNo===" + vo.getBoardNo());
        //댓글이 테이블에 저장됨
        replyService.create(vo);
        //jsp 페이지로 가거나 데이터를 리턴하지 않음
    }
    //댓글수정
    @RequestMapping("/replyModify.do") //세부적인 url pattern
    public void replyModify(ReplyVO vo, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId =  member.getUserId();
		vo.setReplyer(userId);
        //댓글이 테이블에 저장됨
        replyService.replyModify(vo);
        //jsp 페이지로 가거나 데이터를 리턴하지 않음
    }
    
    //답글등록
    @RequestMapping("/replyInsert.do") //세부적인 url pattern
    public void replyInsert(ReplyVO vo, HttpSession session) {
    	System.out.println("replyInsert.do들어옴");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId =  member.getUserId();
//		board.setUserId(userId);
		  vo.setReplyer(userId);
		System.out.println("getBoardNo===" + vo.getBoardNo());
		
//		깊이(redepth)는 부모 댓글에 1을 더한 값을 가지고
//
//		순서(reorder)도 부모 순서에 1 더한 값을 가진다.
//
//		부모(reparent)는 부모 댓글의 댓글 번호(reno)를 지정한다.

		vo.setRedepth(String.valueOf(vo.getRno()+1));
		vo.setReorder(vo.getRno()+1);
		vo.setReparent(String.valueOf(vo.getRno()));
		
        //댓글이 테이블에 저장됨
        replyService.replyInsert(vo);
        //jsp 페이지로 가거나 데이터를 리턴하지 않음
    }
    
    //댓글삭제
    @RequestMapping("/deleteReply.do") //세부적인 url pattern
    public void deleteReply(ReplyVO vo, HttpSession session) {
    	System.out.println("replyModify.do들어옴");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId =  member.getUserId();
	    vo.setReplyer(userId);
		System.out.println("getBoardNo===" + vo.getBoardNo());
        replyService.deleteReply(vo);
    }
}
