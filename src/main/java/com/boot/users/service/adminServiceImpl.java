package com.boot.users.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.users.dao.adminDao;
import com.boot.users.dto.adminDto;

@Service
public class adminServiceImpl implements adminService{

	@Autowired
	private adminDao dao;
	
	@Override
	public ArrayList<adminDto> loginYn(HashMap<String, String> param) {
		ArrayList<adminDto> dtos = dao.loginYn(param);
		return dtos;
	}

	@Override
	public void write(HashMap<String, String> param) {
		dao.write(param);
		
	}
	
}
