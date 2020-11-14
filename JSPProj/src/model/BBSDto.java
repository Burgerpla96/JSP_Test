package model;

import java.sql.Date;

/*
 * DTO : (Data Transfer Object): 
 * 데이터를 전송하는 객체로 테이블의 레코드 하나를 저장 할 수 있는 자료구조
 * 
 */

public class BBSDto {
	private String no;
	private String id;
	private String title;
	private String content;
	private String visitcount;
	private java.sql.Date postDate;
/*
 * DB의 desc참고해서 순서 따라해 만들기!!	
	---------- -------- --------------- 
	NO         NOT NULL NUMBER          
	ID                  VARCHAR2(10)    
	TITLE      NOT NULL NVARCHAR2(50)   
	CONTENT    NOT NULL NVARCHAR2(2000) 
	VISITCOUNT          NUMBER          
	POSTDATE            DATE
*/
	//프로그램의 효율성을 위한 속성 추가
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	//생성자
	public BBSDto() {}
	public BBSDto(String no, String id, String title, String content, String visitcount, Date postDate) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.visitcount = visitcount;
		this.postDate = postDate;
	}
	
	//getter, setter
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}   
	
	
	
}
