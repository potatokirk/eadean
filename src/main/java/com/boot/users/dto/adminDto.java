package com.boot.users.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class adminDto {
	private String u_id;
	private String u_pwd;
	private String u_nick;
	private String u_email;
	private String u_gender;
	private String u_sns_id;
	private Timestamp u_created;
}
