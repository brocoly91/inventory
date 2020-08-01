package com.inventory.domain;

import java.util.Date;

public class MemberVO {
//    userId       varchar2(50)    not null, 
//    userPass     varchar2(100)   not null,
//    userName     varchar2(30)    null,
//    userPhon     varchar2(20)    null,
//    userEmail    varchar2(200)   null,
//    userPosition varchar2(500)   null,
//    userAge      varchar2(20)    null,
//    userGender   varchar2(20)    null,
//    userCareer   varchar2(20)    null,
//    userAddr1    varchar2(30)    null,
//    userAddr2    varchar2(60)    null,
//    userAddr3    varchar2(60)    null,
//    regiDate     date            default sysdate,
//    verify       number          default 0,     // 권한 혹시몰라서(관리자.일반회원)
//    primary key(userId)
	private int verify;
	private Date regiDate;
	private String userId;
	private String userPass;
	private String userName;
	private String userEmail;
	private String userPosition;	
	private String userPhon;
	public String getUserPhon() {
		return userPhon;
	}
	public void setUserPhon(String userPhon) {
		this.userPhon = userPhon;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPosition() {
		return userPosition;
	}
	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserCareer() {
		return userCareer;
	}
	public void setUserCareer(String userCareer) {
		this.userCareer = userCareer;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	private String userAge;
	private String userGender;
	private String userCareer;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;	
		

	
}
