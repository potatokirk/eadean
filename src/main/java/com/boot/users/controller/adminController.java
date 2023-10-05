package com.boot.users.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.users.dto.adminDto;
import com.boot.users.service.adminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class adminController {

	@Autowired
	private adminService service;
	
	
	
	@RequestMapping("/")
	public String home() {
		log.info("@# 메인 화면" );
		return"mainPage";
	}

	//로그인 페이지 
	@RequestMapping("/login")
	public String login() {
		log.info("login");
		return "admin/login";
	}
	
	/********************* 일반 로그인 **************************/

	@RequestMapping("/loginyn")
	public ResponseEntity<Integer> loginyn(@RequestParam HashMap<String,String>param, HttpSession session) {
		log.info("@#loginyn"+param);
		
		ArrayList<adminDto> dtos = service.loginYn(param);
	//	HttpSession session = request.getSession();
		log.info("@#loginyn 나옴"+dtos);
		
		if(dtos.isEmpty()) {
			return ResponseEntity.status(HttpStatus.OK).body(500); 
		}else {
			if(param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
				session.setAttribute("u_id",dtos.get(0).getU_id());
				session.setAttribute("u_nick",dtos.get(0).getU_nick());
			//	session.setAttribute("adminDto",dtos.get(0));
				session.setMaxInactiveInterval(1800);
				return ResponseEntity.status(HttpStatus.OK).body(200);
			}else {
				return ResponseEntity.status(HttpStatus.OK).body(400); 
				}
			}
		}
		
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@#login_ok");
		return "admin/login_ok";
	}
	/********************* 화원등록 **************************/
	@RequestMapping("/signup")
	public String register() {
		log.info("@#signup");
		return "kakao/signup";
		
	}

	@RequestMapping("registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk"+param);
		
		service.write(param);
		
		return "redirect:login";
	}
	
/********************* 로그아웃 **************************/
@RequestMapping("/logout")
public String logout(HttpSession session) {
	log.info("@#일반 로그아웃 " + session);
	service.logout(session);
	return "redirect:/";
}
//아이디 중복 체크
@RequestMapping("idChk")
public @ResponseBody int idChk(@RequestParam("u_id") String u_id) {
	if(service.idChk(u_id)==null) {
		return 1;
	}else {
		return 0;
	}
}

//닉네임 중복 체크
@RequestMapping("nickChk")
public @ResponseBody String nickChk(@RequestParam("u_nick") String u_nick){
	return service.nickChk(u_nick);
}

//일반 회원가입 로직
@RequestMapping("/signUpOk")
public String registerOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
log.info("@# signUpOk");
service.signUp(param);
//	return "redirect:/users/main";
//	return "/users/main";
log.info("@#회원가입 로직 Referer" + request.getHeader("Referer"));
return "redirect:/users/userSignIn";
}
























}