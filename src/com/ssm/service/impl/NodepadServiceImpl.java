package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.mapper.NodepadDao;
import com.ssm.po.Notepad;
import com.ssm.service.NodepadService;
import com.ssm.utils.Page;

/**
 * 
 * 
 * @author wangwei
 *
 */
@Service
public class NodepadServiceImpl implements NodepadService{

	@Autowired
	private NodepadDao  nodepadDao;
	
	@Override
	public List<Notepad> selectNotepadList(Notepad notepad,Page page) {
		return nodepadDao.selectNotepadList(notepad,page);
	}

	@Override
	public int selectCountTotal() {
		return nodepadDao.selectCountTotal();
	}
	
	@Override
	@Transactional
	public void saveNodepad(Notepad notepad) {
		nodepadDao.saveNodepad(notepad);
	}

	@Override
	public Notepad selectNodepadById(int nodeid) {
		// TODO Auto-generated method stub
		return nodepadDao.selectNodepadById(nodeid);
	}

}
