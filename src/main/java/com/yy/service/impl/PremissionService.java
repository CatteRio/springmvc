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
public class PremissionService implements IPremissionService {

	@Autowired
	private PremissionMapper premissionMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return premissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Premission record) {
		// TODO Auto-generated method stub
		return premissionMapper.insert(record);
	}

	@Override
	public int insertSelective(Premission record) {
		// TODO Auto-generated method stub
		return premissionMapper.insertSelective(record);
	}

	@Override
	public Premission selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return premissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Premission record) {
		// TODO Auto-generated method stub
		return premissionMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Premission record) {
		// TODO Auto-generated method stub
		return premissionMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Premission> listAll() {
		// TODO Auto-generated method stub
		return premissionMapper.listAll();
	}

}
