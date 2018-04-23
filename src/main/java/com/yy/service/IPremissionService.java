package com.yy.service;

import java.util.List;

import com.yy.pojo.Premission;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:34
 */
public interface IPremissionService {
	int deleteByPrimaryKey(Integer id);

	int insert(Premission record);

	int insertSelective(Premission record);

	Premission selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Premission record);

	int updateByPrimaryKey(Premission record);

	List<Premission> listAll();
}
