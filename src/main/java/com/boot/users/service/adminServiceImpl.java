package com.boot.users.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.users.dao.adminDao;
import com.boot.users.dto.adminDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class adminServiceImpl implements adminService{

	@Autowired
	private adminDao dao;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<adminDto> loginYn(HashMap<String, String> param) {
		ArrayList<adminDto> dtos = dao.loginYn(param);
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		dao.write(param);
		
	}
	@Override
	public void logout(HttpSession session) {
		 session.invalidate();
	}
//아이디 찾기 :회원가입시 
	@Override
	public int idChk(String u_sns_id) {
		adminDao dao = sqlSession.getMapper(adminDao.class);
		return dao.idChk(u_sns_id);
	}
//닉네임 중복 확인 
	@Override
	public int nickChk(String u_nick) {
		adminDao dao = sqlSession.getMapper(adminDao.class);
		return dao.nickChk(u_nick);
	}

	@Override
	public void signUp(HashMap<String, String> param) {
		log.info("@# UserServiceImpl.signUp() start");
		adminDao dao = sqlSession.getMapper(adminDao.class);
		dao.signUp(param);
		log.info("@# UserServiceImpl.signUp() end");	
	}
	
	
}
