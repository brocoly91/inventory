package com.inventory.service;


import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.inventory.domain.BoardVO;
import com.inventory.domain.MemberVO;
import com.inventory.domain.PagingVO;

public interface ContentService {
	//글쓰기 신규저장
	public void newConten(BoardVO board) throws Exception;
	
	public List<BoardVO> getBoardList() throws Exception;
	//글 상세보기
	public BoardVO getBoardContent(int boardNo) throws Exception;
	//글 수정
	public void modifyConten(BoardVO board) throws Exception;

	public int countBoard() throws Exception;
	//페이징처리후 전체 글목록 호출
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception;
	//글 삭제
	public void delConten(BoardVO board) throws Exception;

	public List<BoardVO> searchList(PagingVO vo) throws Exception;

	public int coutSearchList(String boardTitle) throws Exception;
	//검색시 count
	public int countVaKeList(Map<String, String> map) throws Exception;

	public List<BoardVO> searchVaKeList(Map<String, String> map) throws Exception;

	public int countRno(int baordNo) throws Exception;




}
