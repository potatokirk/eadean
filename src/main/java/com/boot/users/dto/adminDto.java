package com.boot.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class adminDto {
public String u_id;
public String u_pwd;
public String u_nickname;
public String u_email;
public String u_gender;
}
