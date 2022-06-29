package com.eshop.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

/*
 -AOP (Aspect-Oriented Programming): 관점지향형
 -POJO (Plain Old Java OBject) : 전동적인 자바 객체
 view에서 매번 parseInt하지않고 순수자바객체를 활용하여 controller 전에 처리하여 프로그램에 이상이 없도록 자바객체에서 처리
 (pom.xml 가서 AspectJ 아래 AspectJ weaver 1.9.7 추가)
 */



@Aspect
@Log4j
@Component
public class LogAdvice {
	@Before("execution(* com.eshop.service.SampleService*.*(..))")
	public void logBefore() {
		log.info("===");
	}
}
