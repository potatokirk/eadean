package com.boot.kakao.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.kakao.dto.kakaoDto;

@Mapper
public interface kakaoDao {
	public kakaoDto getUserInfo(int u_id);

	public ArrayList<kakaoDto> signIn(HashMap<String, String> param);
	public void signUp( HashMap<String, String> param);
	public int idChk(String u_sns_id); //아이디중복체크
	public int nickChk(String u_nickname); //닉네임 중복체크 
	public int nickModifyChk(HashMap<String, String> param);//수정페이지에서 닉네임 중복체크
    
	public ArrayList<kakaoDto> userSearch(HashMap<String, String> param);
    public void userModify(HashMap<String, String> param);
    public void userDel(HashMap<String, String> param);
    
    
//	kakao
	public String getAccessToken(String authorize_code);
	public kakaoDto getUserInfo(String access_Token);
	public void kakaoSignUp(HashMap<String, String> param);
	
	public ArrayList<kakaoDto> kakaoUserSearch(HashMap<String, String> param);
	public void kakaoUserModify(HashMap<String, String> param);
	
}