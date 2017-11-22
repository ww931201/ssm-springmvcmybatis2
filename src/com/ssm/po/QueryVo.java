package com.ssm.po;

/**
 * 
 * 商品包装类：根据包装类封装参数
 * @author wangwei
 *
 */
public class QueryVo {
	
	
	//包装类包装商品Items
	private Items items;
	
	//封装ckeckbox的ids数组接收参数
	private String[] ids;

	public Items getItems() {
		return items;
	}
	public void setItems(Items items) {
		this.items = items;
	}

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}
	
}
