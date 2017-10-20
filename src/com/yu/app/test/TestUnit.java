package com.yu.app.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yu.app.entity.Oil;
import com.yu.app.service.OilService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-context.xml")
public class TestUnit {
	@Autowired
	private OilService oilService;
	
	@Test
	public void test() throws JsonProcessingException {
		Oil oils = oilService.get(1);
		ObjectMapper mapper =new ObjectMapper();
		String aa = mapper.writeValueAsString(oils);
		System.out.println(aa);
		System.out.println(abc(56));
		
	}
	
	public String abc(int i){
		if (i>10){
			return"10";
		}else {
			return "1";
		}
		
	}
}
