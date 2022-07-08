package com.eshop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;


@RestController
@Log4j
@RequestMapping("/ajax/")
public class AjaxController {

	@Autowired
	ResourceLoader rsLoader;
	//String
	@ResponseBody
	@RequestMapping(value="/ajax0.do",produces="text/plain; charset=UTF-8")	
	public String ajax0() {
		log.info("MIME TYPE :" + MediaType.TEXT_PLAIN_VALUE);
		return "<h2>안녕하세요 AJAX</h2>";
	}
	//객체		//MediaType으로 xml로변환
	@ResponseBody
	@RequestMapping(value="/ajax1.do" ,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})	
	public EMP ajax1() {
		return new EMP(1111,"임소희","경기도");
	}
	//컬렉션			//리스트타입
	@ResponseBody
	@RequestMapping(value="/ajax2.do")	
	public List<EMP> ajax2() {
		return IntStream.range(1, 10).mapToObj(i -> new EMP(i, "name"+i,"addr"+i)).collect(Collectors.toList());
	}
	
	//map
	@ResponseBody
	@RequestMapping(value="/ajax3.do")	
	public Map<String, EMP> ajax3() {
		Map<String,EMP> map = new HashMap<>();
		map.put("first", new EMP(1111,"임소희","경기도"));
		map.put("second", new EMP(2222,"홍길동","서울"));
		return map;
	}
	
	//매개변수에 의한 데이터처리(단일변수)		//주소에 ajax/ajax4.do?name=lim&address=경기도
	@ResponseBody
	@RequestMapping(value="/ajax4.do", params= {"name","address"})	
	public ResponseEntity<EMP> ajax4(String name, String address) {
		EMP dto = new EMP(1111, name, address);
		ResponseEntity<EMP> result = null;
		if(name.contentEquals("lim")) {
			result = ResponseEntity.status(HttpStatus.OK).body(dto);
		} else {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(dto);
		}
		return result;
	}
	
	//@PathVariable 이용			//주소에 ajax/ajax5.do/lim/경기도
	@ResponseBody
	@RequestMapping(value="/ajax5.do/{name}/{address}")	
	public String[] ajax5(@PathVariable("name") String name, @PathVariable("address") String address) {
		
		return new String[] {"name:"+name,"address:"+address };
	}
	

	
	@ResponseBody
	@RequestMapping(value="ajaxpro2.do",method= RequestMethod.POST)
	public String ajaxpor1() throws Exception {
		
		return "redirect:/";
	}

	
	
}
