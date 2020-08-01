package com.inventory.domain;


import java.util.Date;

import org.springframework.stereotype.Controller;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardVO {
	/*	
  boardNo            number    not null, 
  boardTitle           varchar2(250)    not null, 
  boardContens      varchar2(3000)    not null, 
  boardregiDate            date     default sysdate,
  boardFileNo        varchar2(250)    null,
  primary key(boardNo)
	*/
	
	private int boardNo;
	private String boardTitle;
	private String boardContens;
	private String userId;
	private String boardFileNo;
	private String boardregiDate;	
	private String boardCategory;
	public int getCntRno() {
		return cntRno;
	}
	public void setCntRno(int cntRno) {
		this.cntRno = cntRno;
	}
	private int hit;
	private int cntRno;
	
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContens() {
		return boardContens;
	}
	public void setBoardContens(String boardContens) {
		this.boardContens = boardContens;
	}
	public String getBoardFileNo() {
		return boardFileNo;
	}
	public void setBoardFileNo(String boardFileNo) {
		this.boardFileNo = boardFileNo;
	}
	public String getBoardregiDate() {
		return boardregiDate;
	}
	public void setBoardregiDate(String boardregiDate) {
		this.boardregiDate = boardregiDate;
	}


}
