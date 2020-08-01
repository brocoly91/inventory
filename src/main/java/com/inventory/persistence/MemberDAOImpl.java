package com.inventory.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.inventory.domain.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.inventory.inMappers.memberMapper";
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}
	
	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		System.out.println("들어옴");
		return sql.selectOne(namespace + ".signin", vo);
	}
	// 아이디 중복검사
	@Override
	public int idDuplChk(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".idDuplChk", vo);
	}
}
