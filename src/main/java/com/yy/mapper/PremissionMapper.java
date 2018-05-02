package com.yy.mapper;

import java.util.List;

import com.yy.pojo.Premission;

public interface PremissionMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Premission record);

	int insertSelective(Premission record);

	Premission selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Premission record);

	int updateByPrimaryKey(Premission record);

	List<Premission> listAll();

	List<Premission> selectFirstGeneration();
	
	List<Premission> selectPremissionByUserId(Integer id);
	
	List<Premission> selectChildren();
	
	Premission selectByContent(String content);
}