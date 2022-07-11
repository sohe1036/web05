package com.eshop.dto;

public class CartDTO {
	public int bno;
	public String uid;
	public int gno;
	public String gcolor;
	public int pieces;
	public String gimg1;
	public String bdate;
	public String gname;
	public int amount;
	
	public String price;
	
	public String getPrice() {
		return price;
	}
	
	
	public void setPrice(String price) {
		this.price = price;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGcolor() {
		return gcolor;
	}
	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}
	public int getPieces() {
		return pieces;
	}
	public void setPieces(int pieces) {
		this.pieces = pieces;
	}
	public String getGimg1() {
		return gimg1;
	}
	public void setGimg1(String gimg1) {
		this.gimg1 = gimg1;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
