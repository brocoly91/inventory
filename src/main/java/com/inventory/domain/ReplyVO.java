package com.inventory.domain;


import java.util.Date;

public class ReplyVO {

   private int rno; //댓글 번호
   private int boardNo; //게시물 번호
   private String replytext; //댓글 내용
   private String replyer; //댓글 작성자 id
   private String name; //댓글 작성자 이름
   private String regdate; //java.util.Date, 작성일자
   private String updatedate; //수정일자
   private String secret_reply; //비밀댓글 여부
   private String writer; //member 테이블의 id
   private String reparent;
   private String redepth;
   private Integer reorder;

   //getter,setter,toString()

   public int getRno() {
       return rno;
   }
   public void setRno(int rno) {
       this.rno = rno;
   }
   public int getBoardNo() {
       return boardNo;
   }
   public void setBoardNo(int boardNo) {
       this.boardNo = boardNo;
   }
   public String getReplytext() {
       return replytext;
   }
   public void setReplytext(String replytext) {
       this.replytext = replytext;
   }
   public String getReplyer() {
       return replyer;
   }
   public void setReplyer(String replyer) {
       this.replyer = replyer;
   }
   public String getReparent() {
	return reparent;
}
public void setReparent(String reparent) {
	this.reparent = reparent;
}
public String getRedepth() {
	return redepth;
}
public void setRedepth(String redepth) {
	this.redepth = redepth;
}
public Integer getReorder() {
	return reorder;
}
public void setReorder(Integer reorder) {
	this.reorder = reorder;
}
public String getName() {
       return name;
   }
   public void setName(String name) {
       this.name = name;
   }
   public String getRegdate() {
       return regdate;
   }
   public void setRegdate(String regdate) {
       this.regdate = regdate;
   }
   public String getUpdatedate() {
       return updatedate;
   }
   public void setUpdatedate(String updatedate) {
       this.updatedate = updatedate;
   }
   public String getSecret_reply() {
       return secret_reply;
   }
   public void setSecret_reply(String secret_reply) {
       this.secret_reply = secret_reply;
   }
   public String getWriter() {
       return writer;
   }
   public void setWriter(String writer) {
       this.writer = writer;
   }
   @Override
   public String toString() {
       return "ReplyVO [rno=" + rno + ", boardNo=" + boardNo + ", replytext=" + replytext + ", replyer=" + replyer + ", name="
               + name + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secret_reply=" + secret_reply + ", writer="
               + writer + "]";
   }
   
}