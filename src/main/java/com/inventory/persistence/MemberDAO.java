package com.inventory.persistence;

import java.util.List;

import com.inventory.domain.MemberVO;
import com.inventory.domain.ReplyVO;

 
public interface MemberDAO {

	void signup(MemberVO vo) throws Exception;

	MemberVO signin(MemberVO vo) throws Exception;

	int idDuplChk(MemberVO vo) throws Exception;

}