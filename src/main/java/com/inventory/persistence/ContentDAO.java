package com.inventory.persistence;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.inventory.domain.BoardVO;
import com.inventory.domain.MemberVO;
import com.inventory.domain.PagingVO;

public interface ContentDAO {
	//글쓰기신규저장
	public void newConten(BoardVO vo) throws Exception;

	public List<BoardVO> getBoardList() throws Exception;
	//글상세보기
	public BoardVO getBoardContent(int boardNo);
	//글수정
	public void modifyConten(BoardVO board)throws Exception;

	public int countBoard();
	//페이징처리후 전체 글목록 호출
	public List<BoardVO> selectBoard(PagingVO vo);
	//글삭제
	public void delConten(BoardVO board);
	//글 조회수
	public void boardHit(int boardNo) throws Exception;

	public List<BoardVO> searchList(PagingVO vo)throws Exception;

	public int coutSearchList(String boardTitle)throws Exception;
	//검색시 count
	public int countVaKeList(Map<String, String> map)throws Exception;

	public List<BoardVO> searchVaKeList(Map<String, String> map)throws Exception;

	public int countRno(int baordNo) throws Exception;


}
