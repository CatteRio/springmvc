package com.yy.pojo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;
/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:21
 */
@Component
@Data
public class User implements Serializable {
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
	@JSONField(serialize=false)
	private List<Permission> permissions;
}
