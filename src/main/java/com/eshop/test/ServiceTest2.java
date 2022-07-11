package com.eshop.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eshop.dto.MemberDTO;

@Service
public class ServiceTest2 {

	@Autowired
	DAOTest2 daoTest;
	
	@Test
	public void test() {
		System.out.println("Service Test~!");
	}
	
	public List<MemberDTO> sampleList(){
		return daoTest.sampleList();
	}
	
	public int sampleCount(){
		return daoTest.sampleCount();
	}
}