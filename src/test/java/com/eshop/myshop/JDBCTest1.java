package com.eshop.myshop;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class JDBCTest1 {
	private static final Logger log = LoggerFactory.getLogger(JDBCTest1.class);
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("드라이버 연결 성공");
		}catch(Exception e) {
			System.out.println("드라이버 연결 실패");
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myshop?useSSL=false&serverTimezone=UTC","root","a1234");
			System.out.println("연결성공");	
		}catch(Exception e) {
			System.out.println("연결실패");	
		}
	}

}
