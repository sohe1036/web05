package com.eshop.dto;

import com.eshop.util.Address;

public class UserDTO {

	private String id;
	private Address address;		//address1+address2  원핫인=> address
	private String name;
	private String email;
	
	private String[] gender;
	private String[] hobbys;	//Hobby 클래스를 활용하여 여러 데이터를 원핫인처리
	private String job;			//반대로 Code 클래스를 활용하여 코드와 레이블로 나누어 처리
	private String etc;
	private boolean contractAgreement;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String[] getGender() {
		return gender;
	}
	public void setGender(String[] gender) {
		this.gender = gender;
	}
	public String[] getHobbys() {
		return hobbys;
	}
	public void setHobbys(String[] hobbys) {
		this.hobbys = hobbys;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public boolean isContractAgreement() {
		return contractAgreement;
	}
	public void setContractAgreement(boolean contractAgreement) {
		this.contractAgreement = contractAgreement;
	}
	
	
}
