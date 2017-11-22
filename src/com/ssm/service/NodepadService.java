package com.ssm.service;

import java.util.List;

import com.ssm.po.Notepad;
import com.ssm.utils.Page;

public interface NodepadService {

	List<Notepad> selectNotepadList(Notepad notepad,Page page);

	int selectCountTotal();

	void saveNodepad(Notepad notepad);

	Notepad selectNodepadById(int nodeid); 

}
