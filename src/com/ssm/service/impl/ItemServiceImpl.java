package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.ItemsMapper;
import com.ssm.po.Items;
import com.ssm.service.ItemService;

/**
 * 
 * @author wangwei
 *
 */
@Service
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemsMapper itemsMapper;

	@Override
	public List<Items> queryListItem() {
		
		return itemsMapper.selectByExample(null);
	}

	@Override
	public Items selectItemById(Integer itemIds) {
		
		return itemsMapper.selectByPrimaryKey(itemIds);
	}

	@Override
	public void updateItemById(Items items) {
		itemsMapper.updateByPrimaryKeySelective(items);
	}

}
