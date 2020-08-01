package com.inventory.persistence;

import java.util.List;

import com.inventory.domain.ReplyVO;

 
public interface ReplyDAO {
    public List<ReplyVO> list(int boardNo); //댓글 목록
    public int count(int boardNo);           //댓글 수
    public void create(ReplyVO vo);    //댓글 작성
	public void replyModify(ReplyVO vo); //댓그수정
	public void deleteReply(ReplyVO vo); //댓글삭제
	public void replyInsert(ReplyVO vo);
}