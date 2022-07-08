package com.eshop.controller;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EMP {

	private int sno;
	private String name;
	private String address;
	
}
//롬복으로 getter setter 생성자 처리