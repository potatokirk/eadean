package com.boot.users.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.users.dto.adminDto;

@Mapper
public interface adminDao {
public ArrayList<adminDto> loginYn(HashMap<String,String>param);
public void write(HashMap<String,String>param);
}
