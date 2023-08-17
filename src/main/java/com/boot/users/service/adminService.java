package com.boot.users.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.boot.users.dto.adminDto;

public interface adminService {
	public ArrayList<adminDto> loginYn(HashMap<String,String>param);
	public void write(HashMap<String,String>param);
	public void logout(HttpSession session);
	public String idChk(String u_id);
	public String nickChk(String u_nick);
	public void signUp( HashMap<String, String> param);
	
	
	}
