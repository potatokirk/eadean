package com.boot.kakao.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class kakaoDto {
	private int users_u_id;
	private String u_id;
	private String u_pwd;
	private String u_nickname;
	private String u_email;
	private String u_gender;
	private String u_phone;
	private String u_address;
	
	private String u_name;	
	private String u_login_platform;
	private String u_bank_account;
	private String u_authentication;
	private int u_temperature;
	private String access_Token;
	private String u_role;
}