package com.yy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.mapper.PremissionMapper;
import com.yy.pojo.Premission;
import com.yy.service.IPremissionService;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:46
 */
@Service
public class PermissionServiceImpl implements IPremissionService {

	@Autowired
	private PremissionMapper premissionMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return premissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Premission record) {
		return premissionMapper.insert(record);
	}

	@Override
	public int insertSelective(Premission record) {
		return premissionMapper.insertSelective(record);
	}

	@Override
	public Premission selectByPrimaryKey(Integer id) {
		return premissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Premission record) {
		return premissionMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Premission record) {
		return premissionMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Premission> listAll() {
		return premissionMapper.listAll();
	}

	@Override
	public List<Premission> selectFirstGeneration() {
		return premissionMapper.selectFirstGeneration();
	}

	@Override
	public List<Premission> selectPremissionByUserId(Integer id) {
		return premissionMapper.selectPremissionByUserId(id);
	}

	@Override
	public Premission selectByContent(String content) {
		return premissionMapper.selectByContent(content);
	}

}
