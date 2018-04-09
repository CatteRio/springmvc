package com.yy.pojo;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;

@Component
@Data
public class User {
	private String id;
	private String username;
	@JSONField(serialize=false)
	private String password;
	private String nickname;
	private String mobile;
	private String email;
	@JSONField(serialize=false)
	private String salt;
	private String role;
}
