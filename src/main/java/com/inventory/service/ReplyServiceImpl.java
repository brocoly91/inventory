package com.inventory.service;

import java.util.List;
 
import javax.inject.Inject;
 
import org.springframework.stereotype.Service;

import com.inventory.domain.ReplyVO;
import com.inventory.persistence.ReplyDAO;
 
 
@Service //service bean
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    private ReplyDAO dao;    //dao를 호출하기위해서 의존성을 주입
 
    
    //댓글 목록
    @Override
    public List<ReplyVO> list(int boardNo) {
        return dao.list(boardNo);
    }
    
    
    @Override
    public int count(int boardNo) {
        return 0;
    }
    
    

    //댓글 쓰기    
	@Override
	public void create(ReplyVO vo) {
		dao.create(vo);
		
	}

	//댓글수정
	@Override
	public void replyModify(ReplyVO vo) {
		dao.replyModify(vo);
	}

	//댓글삭제
	@Override
	public void deleteReply(ReplyVO vo) {
		dao.deleteReply(vo);
	}


	@Override
	public void replyInsert(ReplyVO vo) {
		dao.replyInsert(vo);
		
	}
    
}