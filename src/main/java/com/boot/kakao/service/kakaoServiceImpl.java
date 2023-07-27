package com.boot.kakao.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.kakao.dao.kakaoDao;
import com.boot.kakao.dto.kakaoDto;
import com.boot.kakao.kakao.MemberRepository;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class kakaoServiceImpl implements kakaoService {

	@Autowired
	private MemberRepository mr;
	
	@Autowired
	private kakaoDao dao;

//	kakao에서 액세스 토큰값 얻어오기

//	첫 가입(추가정보가 없을 경우) 추가가입 (update로)
	@Override
	public void kakaoSignUp(HashMap<String, String> param) {
		mr.kakaoSignUp(param);
	}
	
	// 카카오회원 정보 수정
	@Override
	public void kakaoUserModify(HashMap<String, String> param) {
		mr.kakaoUserModify(param);
	}
	
	//카카오 유저 정보 가져오기 
	@Override
	public ArrayList<kakaoDto> kakaoUserSearch(HashMap<String, String> param) {		
		ArrayList<kakaoDto> dtos= dao.kakaoUserSearch(param);
		return dtos;
	}
	
	//	액세스 토큰을 이용해서 유저 정보 불러오기
	@Override
	public kakaoDto getUserInfo(String access_Token) {
		 HashMap<String, Object> userInfo = new HashMap<String, Object>();
	        
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	           
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	            String name = properties.getAsJsonObject().get("nickname").getAsString();
	            String id = kakao_account.getAsJsonObject().get("email").getAsString();
	            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	            System.out.println("@### ServeiceImpl gender1===>>"+ gender);
	            
	            if(gender.equals("female")) {
	            	gender="F";
	            }else if(gender.equals("male")) {
	            	gender="M";
	            }
	            System.out.println("@### gender===>>"+ gender);
	            userInfo.put("name", name);
	            userInfo.put("id", id);
	            userInfo.put("gender", gender);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	        System.out.println("@@@@@@ userInfo =====>"+userInfo);
	        kakaoDto result = mr.findkakao(userInfo);
	        
	        System.out.println("S:" + result);
	        
	        if(result==null) {
	        	
	        	mr.kakaoinsert(userInfo);
	        	return mr.findkakao(userInfo);
	        	
	        } else {
	        	return result;
	        }
	       
		}

//카카오 유저 로그아웃 
	@Override
	public void kakaologout(String access_Token) {
		 String reqURL = "https://kapi.kakao.com/v1/user/logout";
		 
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println(result);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		

	}

	//카카오 유저 완전 탈퇴
	@Override
	public void kakaounlink(String access_Token, HashMap<String, String> param) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        System.out.println("@@#####@@@@kakaounlink SImpl ==> access_Token===>"+access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}



@Override
public String getAccessToken(String authorize_code) {
	String access_Token = "";
	String refresh_Token = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";
	
	try {
		URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		//    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
		
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		
		//    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=01ca1a5b4ae88407008da4b96f448cbc"); // REST_API키 
		sb.append("&redirect_uri=http://localhost:8282/"); // REDIRECT_URI
		sb.append("&code=" + authorize_code);
		bw.write(sb.toString());
		bw.flush();
		
//			    결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		
		//    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);
		
		//    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		
		access_Token = element.getAsJsonObject().get("access_token").getAsString();
		refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
		
		System.out.println("access_token : " + access_Token);
		System.out.println("refresh_token : " + refresh_Token);
		
		br.close();
		bw.close();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	return access_Token;
}

@Override
public void userDel(HashMap<String, String> param) {
	dao.userDel(param);
	
}


}