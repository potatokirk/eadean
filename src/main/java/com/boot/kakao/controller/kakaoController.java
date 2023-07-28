package com.boot.kakao.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.kakao.dto.kakaoDto;
import com.boot.kakao.service.kakaoService;

import lombok.extern.slf4j.Slf4j;

@Service
@Controller
@Slf4j

public class kakaoController {

	@Autowired
	private kakaoService service;

	@Autowired
	private HttpSession session;
	
	/******************************카카오 로그인 **********************/
	// 카카오 로그인
//	토큰값을 넣어서 유저정보 확인: 회원가입 되어있으면 로그인 성공 페이지 / 가입 X면 추가 회원가입 페이지
@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
		HttpServletRequest request) throws Exception {
	System.out.println("code:" + code);
	String access_Token = service.getAccessToken(code);
	log.info(access_Token);

//        유저 정보 받아와서 가입까지 
	kakaoDto userInfo = service.getUserInfo(access_Token);
	log.info("@@@@@@@@@@카카오 로그인@@@@@@@@@@@userInfo" + userInfo);

//        폰번호 x: 처음 가입 => u_id를 가지고 추가 가입 페이지로 이동
	if (userInfo.getU_phone() == null) {
		model.addAttribute("u_id", userInfo.getU_id());
		return "/kakao/kakaoSignUp";

	} else {
		session.invalidate();
		session.setAttribute("u_id", userInfo.getU_id());
		session.setAttribute("u_nick", userInfo.getU_nick());
		session.setAttribute("access_Token", access_Token);
		session.setAttribute("u_role", userInfo.getU_role());
		return "redirect:../admin/login";
	}
}

//	카카오 추가 회원가입
@RequestMapping(value = "/kakaoSignUpOk")
public String kakaoregisterOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
	log.info("@# kakaoSignUpOk");
	service.kakaoSignUp(param);
	return "redirect:/kakao/userSignIn";
}

//	카카오 로그아웃
@RequestMapping(value = "/kakaologout")
public String kakaologout(HttpSession session) {
	service.kakaologout((String) session.getAttribute("access_Token"));
	session.invalidate();
	return "redirect:/shop/list";
}

//	카카오 회원 탈퇴 (연결 끊기)
@RequestMapping(value = "/kakaounlink")
public String unlink(HttpSession session, HashMap<String, String> param) {
	param.put("u_id", String.valueOf(session.getAttribute("u_id")));
	service.kakaounlink((String) session.getAttribute("access_Token"), param);
	System.out.println("kakaounlink@@@@@@@@@@===>" + ((String) session.getAttribute("access_Token")));
	service.userDel(param);
	session.invalidate();
	return "redirect:/shop/list";
}

}
