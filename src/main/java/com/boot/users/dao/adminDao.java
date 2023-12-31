package com.boot.users.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.boot.users.dto.adminDto;

@Mapper
public interface adminDao {
public ArrayList<adminDto> loginYn(HashMap<String,String>param);
public void write(HashMap<String,String>param);
public void logout(HttpSession session);
public String idChk(String u_id);
public String nickChk(String u_nick);
public void signUp( HashMap<String, String> param);

}
