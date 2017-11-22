package com.ssm.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.ssm.utils.Page;
/**
 * 
 * 记事本实体bean
 * @author wangwei
 *
 */
public class Notepad extends Page implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//id
	private int id;
	//标题
	private String headlined;
	//分类
	private String classifies;
	//创建时间
	private Date createtimes;
	//游玩时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date playtime;
	//地点
	private String sitename;
	//作者
	private String author;
	//正文内容
	private String content;
	//照片地址
	private String photoaddr;
	//预留字段1
	private String field1;
	//预留字段2
	private String field2;
	//预留字段3
	private String field3;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHeadlined() {
		return headlined;
	}
	public void setHeadlined(String headlined) {
		this.headlined = headlined;
	}
	public String getClassifies() {
		return classifies;
	}
	public void setClassifies(String classifies) {
		this.classifies = classifies;
	}
	public Date getCreatetimes() {
		return createtimes;
	}
	public void setCreatetimes(Date createtimes) {
		this.createtimes = createtimes;
	}
	public Date getPlaytime() {
		return playtime;
	}
	public void setPlaytime(Date playtime) {
		this.playtime = playtime;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhotoaddr() {
		return photoaddr;
	}
	public void setPhotoaddr(String photoaddr) {
		this.photoaddr = photoaddr;
	}
	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public String getField2() {
		return field2;
	}
	public void setField2(String field2) {
		this.field2 = field2;
	}
	public String getField3() {
		return field3;
	}
	public void setField3(String field3) {
		this.field3 = field3;
	}

}
