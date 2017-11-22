package com.ssm.service;

import java.util.List;

import com.ssm.po.Items;

public interface ItemService {
 
	List<Items> queryListItem();

	Items selectItemById(Integer itemId);

	void updateItemById(Items items);  

}
