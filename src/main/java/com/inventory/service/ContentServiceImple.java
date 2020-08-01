package com.inventory.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;import org.springframework.web.bind.annotation.RequestParam;

import com.inventory.domain.BoardVO;
import com.inventory.domain.PagingVO;
import com.inventory.persistence.ContentDAO;
@Service
public class ContentServiceImple implements ContentService {
	
	@Inject
	private ContentDAO dao;
	//글쓰기 신규저장
	@Override
	public void newConten(BoardVO vo) throws Exception {
		dao.newConten(vo);
	}
	
	public List<BoardVO> getBoardList() throws Exception {
		return dao.getBoardList();

	}
	//글 상세보기
	public BoardVO getBoardContent(int boardNo) throws Exception{
				dao.boardHit(boardNo);
		return dao.getBoardContent(boardNo);
	}
	//글수정
	@Override
	public void modifyConten(BoardVO board) throws Exception {
		dao.modifyConten(board);
	}

	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return dao.countBoard();
	}
	//페이징처리후 전체 글목록 호출
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) throws Exception {
		return dao.selectBoard(vo);
	}
	//글삭제
	@Override
	public void delConten(BoardVO board) throws Exception {
		dao.delConten(board);
	}

	@Override
	public List<BoardVO> searchList(PagingVO vo) throws Exception {
		return dao.searchList(vo);
	}

	@Override
	public int coutSearchList(String boardTitle) throws Exception {
		return dao.coutSearchList(boardTitle);
	}
	//검색시 count
	@Override
	public int countVaKeList(Map<String, String> map) throws Exception {
		return dao.countVaKeList(map);
	}

	@Override
	public List<BoardVO> searchVaKeList(Map<String, String> map) throws Exception {
		return dao.searchVaKeList(map);
	}

	@Override
	public int countRno(int baordNo) throws Exception {
		return dao.countRno(baordNo);
	}




}
