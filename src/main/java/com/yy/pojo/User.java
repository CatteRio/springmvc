package com.yy.pojo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class User {
	private String id;
	private String nickname;
	private String username;
	private String password;
	private String role;

}
