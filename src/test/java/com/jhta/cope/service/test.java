package com.jhta.cope.service;

import com.jhta.cope.vo.User;

public class test {

	public static void main(String[] args) {
		User user = new User();
		
		user.setId("dasdsa");
		user.setName("이름");
		user.setPassword("zxx");
		user.setEmail("zz");
		System.out.println(user);
	}
}
