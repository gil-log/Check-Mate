package com.checkmate.vo;

import java.sql.Blob;
import java.sql.Date;

public class HomeworkVO {

	/* 
				"H_NO" NUMBER NOT NULL,
				"U_ID" VARCHAR2(30) NOT NULL,
				"G_NO" NUMBER NOT NULL,
				"H_TITLE" VARCHAR2(300) NULL,
				"H_CONTENT" VARCHAR2(4000) NULL,
				"H_FILE" BLOB NULL,
				"H_DATE" DATE NULL,
				"H_FLAG" NUMBER(5) NOT NULL,
				"A_DEADLINE" VARCHAR2(30)
	
	 */
	private int h_no;
	private String u_id;
	private int g_no;
	private String h_title;
	private String h_content;
	private Blob h_file;
	private Date h_date;
	private int h_flag;
	private Date h_deadline;
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String h_content) {
		this.h_content = h_content;
	}
	public Blob getH_file() {
		return h_file;
	}
	public void setH_file(Blob h_file) {
		this.h_file = h_file;
	}
	public Date getH_date() {
		return h_date;
	}
	public void setH_date(Date h_date) {
		this.h_date = h_date;
	}
	public int getH_flag() {
		return h_flag;
	}
	public void setH_flag(int h_flag) {
		this.h_flag = h_flag;
	}
	public Date getH_deadline() {
		return h_deadline;
	}
	public void setH_deadline(Date h_deadline) {
		this.h_deadline = h_deadline;
	}
	
	

}