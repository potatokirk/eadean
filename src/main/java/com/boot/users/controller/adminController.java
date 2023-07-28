package com.boot.users.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.users.dto.adminDto;
import com.boot.users.service.adminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class adminController {

	@Autowired
	private adminService service;
	
	/*
	@RequestMapping("/")
	public String home() {
		log.info("@# 카카오로그인 화면" );
		return"kakao/kakakoSignIp";
	}
	*/
	
	@RequestMapping("/login")
	public String login() {
		
		return "admin/login";
	}
	
	@RequestMapping("/loginyn")
	public String loginyn(@RequestParam HashMap<String,String>param) {
		log.info("@#loginyn"+param);
		
		ArrayList<adminDto> dtos = service.loginYn(param);
		log.info("@#loginyn 나옴"+dtos);
		
		if(dtos.isEmpty()) {
			return "admin/login";
		}else {
			if(param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
				return "admin/login_ok";
			}else {
					return "admin/login";
				}
			}
		}
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@#login_ok");
		return "admin/login_ok";
	}
	/********************* 화원등록 **************************/
	@RequestMapping("/register")
	public String register() {
		log.info("@#register");
		return "admin/register";
		
	}

	@RequestMapping("registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk"+param);
		
		service.write(param);
		
		return "redirect:login";
	}
	
	/********************* 일반 로그인 (아이디 비밀번호 중복검사) **************************/
@RequestMapping("/userSignIn_yn")
public String login_yn(@RequestParam HashMap<String, String> param ,HttpServletRequest request) {
	log.info("@# userSignIn_yn");
	ArrayList<adminDto> dtos = service.loginYn(param);
	HttpSession session = request.getSession();

	if (dtos.isEmpty()) {
		return "redirect:kakaoLogin";

	} else {
		if (param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
			session.setAttribute("u_id", dtos.get(0).getU_id());
			session.setAttribute("u_nickname", dtos.get(0).getU_nickname());
			//session.setAttribute("u_role", dtos.get(0).getU_role());
			//session.setAttribute("u_sns_id", param.get("u_sns_id"));
			
			return "redirect:../admin/login";

		} else {
			return "/userSignIn";
		}
	}
}
	/********************* 카카오 로그인 **************************/



























}