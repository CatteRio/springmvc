package com.yy.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;

@Component
@Data
public class User {
	private int id;
	private String username;
	@JSONField(serialize=false)
	private String password;
	private String nickname;
	private String mobile;
	private String email;
	@JSONField(serialize=false)
	private String salt;
	private List<Role> roles;
}
