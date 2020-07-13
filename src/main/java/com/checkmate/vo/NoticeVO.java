package com.checkmate.vo;

import java.sql.Date;

public class NoticeVO {
	
	private int n_no;
	private int g_no;
	private String u_id;
	private String n_title;
	private String n_content;
	private String n_writer;
	private Date n_date;
	private int n_flag;
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public int getN_flag() {
		return n_flag;
	}
	public void setN_flag(int n_flag) {
		this.n_flag = n_flag;
	}
	@Override
	public String toString() {
		return "NoticeVO [n_no=" + n_no + ", g_no=" + g_no + ", u_id=" + u_id + ", n_title=" + n_title + ", n_content="
				+ n_content + ", n_writer=" + n_writer + ", n_date=" + n_date + ", n_flag=" + n_flag + "]";
	}
}
