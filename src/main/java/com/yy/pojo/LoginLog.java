package com.yy.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class LoginLog implements Serializable {
    private Integer id;
    private Integer userId;
    private Date loginTime;
}
