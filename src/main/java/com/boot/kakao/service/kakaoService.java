package com.boot.kakao.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.kakao.dto.kakaoDto;

public interface kakaoService {
//	kakao
	public String getAccessToken(String authorize_code);
	public kakaoDto getUserInfo(String access_Token);
	public void kakaoSignUp(HashMap<String, String> param);
	
	public ArrayList<kakaoDto> kakaoUserSearch(HashMap<String, String> param);
	public void kakaoUserModify(HashMap<String, String> param);
	
	public void kakaologout(String access_Token);
	public void kakaounlink(String access_Token, HashMap<String, String> param);
	public void userDel(HashMap<String, String> param);
}
