package com.inventory.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inventory.domain.MemberVO;
import com.inventory.domain.ReplyVO;

import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
 
@Repository //dao bean
public class ReplyDAOImpl implements ReplyDAO {
    
    @Inject //의존관계 주입
    SqlSession sql;
    
    private static String namespace = "com.inventory.inMappers.replyMapper";
    
    //댓글 목록
    @Override
    public List<ReplyVO> list(int boardNo) {
        return sql.selectList(namespace + ".listReply", boardNo);
    }
    
    @Override
    public int count(int boardNo) {
        return 0;
    }
    
    //댓글 추가    
    @Override
    public void create(ReplyVO vo) {
    	sql.insert(namespace + ".insertReply", vo);
    }
    //댓글수정
	@Override
	public void replyModify(ReplyVO vo) {
		sql.update(namespace + ".replyModify", vo);
		
	}
	//댓글삭제
	@Override
	public void deleteReply(ReplyVO vo) {
		sql.delete(namespace + ".deleteReply", vo);
	}

	@Override
	public void replyInsert(ReplyVO vo) {
		sql.insert(namespace + ".replyInsert", vo);
	}
}
