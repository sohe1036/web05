package com.eshop.dto;

public class BoardDTO {
	
	private int seq;
	private String btitle;
	private String bcontent;
	private String uname;
	private String regdate;
	private int ck;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCk() {
		return ck;
	}
	public void setCk(int ck) {
		this.ck = ck;
	}
	
}

