package com.eshop.util;

public class Code {
    private String code; // db에 전달될 값
    private String label; // 화면에 보여지는 값
    
    public Code() {
    } // 기본생성자
    
    public Code(String code, String label) {
        this.code = code;
        this.label = label;
    } // 인자 생성자 
 
    public String getCode() {
        return code;
    }
 
    public void setCode(String code) {
        this.code = code;
    }
 
    public String getLabel() {
        return label;
    }
 
    public void setLabel(String label) {
        this.label = label;
    }
}
