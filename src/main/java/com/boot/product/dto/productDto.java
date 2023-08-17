package com.boot.product.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class productDto {
	private String i_id;
	private String i_img;
	private String i_price;
	private String i_size;
	private String i_color;
	private String i_comm;
	private Timestamp u_created;

}
