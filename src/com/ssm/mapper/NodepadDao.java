package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.po.Notepad;
import com.ssm.utils.Page;

public interface NodepadDao {

	List<Notepad> selectNotepadList(@Param("notepad")Notepad notepad,@Param("page")Page page);

	int selectCountTotal();
 
	void saveNodepad(Notepad notepad);

	Notepad selectNodepadById(int id);

	void deleteNodepad(int ids);  

}
