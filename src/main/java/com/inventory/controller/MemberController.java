package com.inventory.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inventory.domain.MemberVO;
import com.inventory.service.MemberService;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	// 회원 가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	 logger.info("get signup");
	}
	// 회원 가입 post
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	 logger.info("post signup");
	 String strPhone = vo.getUserPhon().replace("-", "");
	 vo.setUserPhon(strPhone);
	 String inputPass = vo.getUserPass();
	 String pass = passEncoder.encode(inputPass);
	 vo.setUserPass(pass);
	 service.signup(vo);
	 return "redirect:/";
	}
	
	// id 중복확인
	@RequestMapping(value = "/member/idcheck.do", method = RequestMethod.POST)
	public @ResponseBody String idDuplChk(MemberVO vo) throws Exception {
		int result = service.idDuplChk(vo);
		
	    return String.valueOf(result);
	}
	
	// 로그인 get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	 logger.info("get signin");
	}
	
	// 로그인 post
	@RequestMapping(value = "/signin.do", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post signin");
	   
	 MemberVO login = service.signin(vo);  
	 HttpSession session = req.getSession();
	 
	 if(login == null) {
		  session.setAttribute("member", null);
		  rttr.addFlashAttribute("msg", "가입하지 않은 아이디이거나,<br> 잘못된 비밀번호입니다");
		  return "redirect:/member/signin";
	 }
	 
	 boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
	 
	 if(login != null && passMatch) {
	  session.setAttribute("member", login);
	 } else {
	  session.setAttribute("member", null);
	  rttr.addFlashAttribute("msg", "비밀번호를 잘못 입력 하셧습니다.");
	  return "redirect:/member/signin";
	 }  
	 
	 return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
	 logger.info("get logout");
	 
	 service.signout(session);
	   
	 return "redirect:/";
	}
}

