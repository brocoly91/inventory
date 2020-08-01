package com.inventory.persistence;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inventory.domain.BoardVO;
import com.inventory.domain.PagingVO;
@Repository
public class ContentDAOImpl implements ContentDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.inventory.inMappers.contentMapper";
	
	//글쓰기신규저장
	@Override
	public void newConten(BoardVO vo) throws Exception {
		sql.insert(namespace + ".newConten", vo);
	}

	@Override
	public List<BoardVO> getBoardList() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}
	//글 조회수
	@Override
	public void boardHit(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".boardHit" , boardNo);
	}
	//글 상세보기
	@Override
	public BoardVO getBoardContent(int boardNo) {
		return sql.selectOne(namespace + ".getBoardContent" , boardNo);
	}
	//글수정
	@Override
	public void modifyConten(BoardVO board) throws Exception {
		sql.update(namespace + ".modifyBoardContent" , board);
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
//		return sql.selectList(namespace + ".countBoard");
		return sql.selectOne(namespace + ".countBoard");
	}
	//페이징처리후 전체 글목록 호출
	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub.
		System.out.println("selectBoard dao!! ===" + vo);
		return sql.selectList(namespace + ".selectBoard" , vo);
	}
	//글삭제
	@Override
	public void delConten(BoardVO board) {
		sql.delete(namespace + ".delBoard" , board);
	}

	@Override
	public List<BoardVO> searchList(PagingVO vo) throws Exception {
		return sql.selectList(namespace + ".searchList" , vo);
	}

	@Override
	public int coutSearchList(String boardTitle) throws Exception {
		return sql.selectOne(namespace + ".coutSearchList" , boardTitle);
	}
	//검색시 count
	@Override
	public int countVaKeList(Map<String, String> map) throws Exception {
		return sql.selectOne(namespace + ".countVaKeList" ,map);
	}
	//검색시 글목록
	@Override
	public List<BoardVO> searchVaKeList(Map<String, String> map) throws Exception {
		return sql.selectList(namespace + ".searchVaKeList" , map);
	}

	@Override
	public int countRno(int baordNo) throws Exception {
		return sql.selectOne(namespace + ".countRno" ,baordNo);
	}

}
