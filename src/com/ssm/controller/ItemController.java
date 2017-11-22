package com.ssm.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.exception.MyException;
import com.ssm.po.Items;
import com.ssm.service.ItemService;


/**
 * 
 * 商品列表查询
 * @author wangwei
 *
 */
@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	/**
	 * 
	 * 查询所有商品信息:方式一
	 * 
	 * @return
	 */
	/*@RequestMapping("/ItemList")
	public ModelAndView ItemList(){
		
		List<Items> list= itemService.queryListItem();
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("itemList", list);
		modelAndView.setViewName("itemList");
		
		return modelAndView;
	}*/
	/**
	 * 
	 * 查询所有商品信息:方式二
	 * 
	 * @return
	 */
	 @RequestMapping("/ItemList")
	 public String ItemList(Model model){
		
		/*List<Items> list= itemService.queryListItem();
		
		model.addAttribute("itemList", list);*/
		
		return "itemList";
	 }
	/**
	 * 
	 * 根据id查询商品:方式一
	 * 
	 */
	/*@RequestMapping("/itemEdit")
	public ModelAndView itemEdit(HttpServletRequest request){
		
		String itemId = request.getParameter("id");
		
		Integer itemIds = Integer.valueOf(itemId);
		
		Items items = itemService.selectItemById(itemIds);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("item", items);
		
		modelAndView.setViewName("editItem");
		
		return modelAndView;
	}*/
	
	/**
	 * 
	 * 根据id查询商品:方式二
	 * 
	 */
	/*@RequestMapping("/itemEdit")
	public String itemEdit(int id,Model model){
		
		Integer itemIds = Integer.valueOf(id);
		
		Items items = itemService.selectItemById(itemIds);
		
		model.addAttribute("item", items);
		
		return "editItem";
	}*/
	
	/**
	 * 
	 * 根据id查询商品:方式二
	 * 
	 * 那么问题出现了@RequestParam设置了defaultValue默认值,将ItemId的值赋给ids
	 * <a href="${pageContext.request.contextPath }/itemEdit.action?id=${item.id}">修改</a>
	 * 但是前台传递的是id参数，id参数绑定在了id上面
	 * 
	 */
	/*@RequestMapping("/itemEdit")
	public String itemEdit(Model model,@RequestParam(value="ItemId", required=true, defaultValue="1") Integer ids,Integer id){
		
		Integer itemIds = Integer.valueOf(ids);
		
		Items items = itemService.selectItemById(itemIds);
		
		model.addAttribute("item", items);
		
		return "editItem";
	}*/
	
	
	/**
	 * 
	 * 修改商品：使用对象进行接收
	 * 
	 */
	/*@RequestMapping("/updateItem")
	public String updateItem(Items items){
		
		itemService.updateItemById(items);
		return "success";
	}*/
	
	/**
	 * 
	 * ***包装类型封装
	 * 
	 * 包装类型需要在前端页面的name需要写成name=“items.name”
	 * 
	 */
	/*@RequestMapping("/queryitem")
	public String queryitem(QueryVo queryVo){
		
		Integer id = queryVo.getItems().getId();
		String name = queryVo.getItems().getName();
		System.out.println("id:" + id + ",name:" + name); 
		
		return "success";
		
	}*/
	/**
	 * 数组封装
	 * 
	 * ***包装类型封装和使用数组进行封装
	 * 
	 * 包装类型需要在前端页面的name需要与pojo属性一致
	 * 数组需要将name与参数绑定对应String[] ids
	 */
	/*@RequestMapping("/queryitem")
	public String queryitem(QueryVo queryVo,String[] ids){
		
		Integer id = queryVo.getItems().getId();
		String name = queryVo.getItems().getName();
		String[] ids2 = queryVo.getIds();
		System.out.println("id:" + id + ",name:" + name + ",ids:" + ids + ",ids2:" + ids2); 
		
		return "success";
	}*/
	/**
	 * 
	 * URL路径映射：value的值是数组，可以将多个url映射到同一个方法
	 */
	/*@RequestMapping(value={"queryitem","queryitemAll"})
	public String queryitem(QueryVo queryVo){
		
		System.out.println(queryVo.getIds());
		
		return "success";
	}*/
	
	/**
	 * 请求方法限定:必须是POST方法,其他方法报错
	 * 可以配置get和post都可以
	 */
	//@RequestMapping(value={"queryitems"},method={RequestMethod.POST})
	//@RequestMapping(value={"queryitems"},method={RequestMethod.GET})
	/*@RequestMapping(value={"queryitems"},method={RequestMethod.GET,RequestMethod.POST})
	public String queryitems(QueryVo queryVo){
		
		System.out.println(queryVo.getIds());
		
		return "success";
	}*/
	/**
	 * 
	 * Controller方法返回值
	 * @throws IOException 
	 * @throws ServletException 
	 * 
	 */
	/*@RequestMapping(value={"queryitem"})
	public void queryitem(QueryVo queryVo,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		//1.请求转发到一个jsp页面
		request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
		
		//2.重定向到一个action   updateItem
		response.sendRedirect("/ssm-springmvcmybatis/sendRedirectItem.action"); 
		//3.response指定响应结果
		response.getWriter().println("{\"abc\":123}");
	}
	@RequestMapping("/sendRedirectItem")
	public String sendRedirectItem(){
		return "success";
	}*/
	
	/**
	 * 
	 * 重定向到一个url地址,一个方法重定向到另一个方法不需要项目名称
	 * return：一个字符串
	 * redirect:/itemEdit.action
	 * 
	 * 
	 * 转发到一个url地址，地址栏不变，request和response请求参数都存在
	 *  
	 * 
	 */
	/*@RequestMapping("/updateItem")
	public String updateItem(Items items,HttpServletRequest request,HttpServletResponse response){
		
		itemService.updateItemById(items); 
		
		//重定向带参数
		return "redirect:/itemEdit.action?id="+ items.getId();
		return "redirect:/ItemList.action";
		//转发
		return "forward:/itemEdit.action";
	}*/
	
	/*@RequestMapping("/itemEdit")
	public String itemEdit(Model model,Integer id){
		
		Items items = itemService.selectItemById(id);
		
		model.addAttribute("item", items);
		
		return "editItem";
	}*/
	
	
	/**
	 * 
	 * 异常处理思路：系统的dao、service、controller出现都通过throws Exception向上抛出，
	 * 			    最后由springmvc前端控制器交由异常处理器进行异常处理
	 * 
	 * HandlerExceptionResolver异常处理器
	 * @throws MyException 
	 * 
	 */
/*	@RequestMapping("/ItemList")
	public String ItemList(Model model,Integer id) throws MyException{
			//自定义异常：向上抛出异常信息
		
			if(true){ 
				throw new MyException("自定义异常！");
			}
			
			int a = 1 / 0;
			
			System.out.println(a); 
			
			
			List<Items> list= itemService.queryListItem();
			
			model.addAttribute("itemList", list);
			
			return "itemList";
		 }*/
	
	
	 @RequestMapping("/itemEdit")
	 public String itemEdit(Integer id,HttpServletRequest request,HttpServletResponse response,Model model){
		 
		 	Items item = itemService.selectItemById(id);
			
			model.addAttribute("item", item);
			
			return "editItem";
	}
	 
 	/**
	 * 
	 *  上传图片：配置虚拟目录 
	 */
	 @RequestMapping("updateItems")
	 public String updateItems(@RequestBody Items items,MultipartFile multipartFile,HttpServletRequest request) throws IllegalStateException, IOException{
		 
		 String UUID = java.util.UUID.randomUUID().toString();
		 
		 String originalFilename = multipartFile.getOriginalFilename();
		 
		 String extName  = originalFilename.substring(originalFilename.lastIndexOf(".")); 
		 File file = new File("D:/image/" + UUID + extName);
		 
		 if(!file.exists()){
			 
			 file.mkdirs();
			 
		 }
		 	multipartFile.transferTo(file);
		 
		 	items.setPic(UUID + extName);
		 	
			itemService.updateItemById(items); 
			
			return "redirect:/itemEdit.action?id="+items.getId() ;
		}
 	/**
 	 * 
 	 * json数据交互:@RequestBody,将json数据转为对象
 	 * 			  @ResponseBody,对象转为Json数据
 	 * HttpMessageConverter接口转换
 	 * 
 	 */
 
	 /**
	  * 
	  * RESTful：方式实现商品信息查询，返回json数据
	  * 如果@RequestMapping中表示为"item/{id}"，id和形参名称一致，@PathVariable不用指定名称。
	  * 如果不一致，例如"item/{ItemId}"则需要指定名称@PathVariable("itemId")。
	  * @ResponseBody不走视图解析器
	  */
	 @RequestMapping("itemEdit/{id}")
	 @ResponseBody
	 public Items queryItemById(@PathVariable() String id) {
		 
	 	Items item = this.itemService.selectItemById(Integer.valueOf(id));
	 	
	 	return item;
	 }
	 
}



	
