package com.ssm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.Notepad;
import com.ssm.service.NodepadService;
import com.ssm.utils.Page;

/**
 * 
 * 记事本Controller
 * @author wangwei
 *
 */
@Controller
public class NotepadController extends PageController{
	
	@Autowired
	private NodepadService nodepadService;
	
	
	@RequestMapping("/ToNotepad")
	public String ToNotepad(){
		
		return "notepad/NodepadList";
		
	}
	
	@RequestMapping("/NotepadList")
	@ResponseBody
	public Map<String, Object> NotepadList(Notepad notepad,Model model,HttpServletRequest request){
		
		Page page = new Page();
		
		page.setPageNo((getPageNo(request)-1) * getPageSize(request)); 
		page.setPagesize(getPageSize(request)); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Notepad> list =  nodepadService.selectNotepadList(notepad,page);
		
		int count = nodepadService.selectCountTotal();
		map.put("rows", list);
		map.put("pager.totalRows", count);
		
		map.put("pager.pageNo", getPageNo(request));
		
		return map;
	}
	
	@RequestMapping("/addNodepad")
	public String  addNodepad() {
		return "notepad/addNodepad";
	}
	
	/**
	 * 
	 * 保存:返回的是json
	 * @return
	 */
	
	@RequestMapping("/saveNodepad")
	public Map<String, Object> saveNodepad(Notepad notepad) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		nodepadService.saveNodepad(notepad);
		
		return map;
	}
	
	@RequestMapping("/toShowNodepad")
	public String toShowNodepad(HttpServletRequest request) {
		
		String parameter = request.getParameter("id");
		int nodeid = Integer.parseInt(parameter);
		Notepad notepad = nodepadService.selectNodepadById(nodeid);
		request.setAttribute("notepad", notepad);
		return "notepad/showNodepad";
	}
}
