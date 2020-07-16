package com.checkmate.vo;

public class AttendListVO {
	
	private String a_date;
	private String u_id;
	private int g_no;
	private int a_flag;
	private int g_flag;
	
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
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
	public int getA_flag() {
		return a_flag;
	}
	public void setA_flag(int a_flag) {
		this.a_flag = a_flag;
	}
	public int getG_flag() {
		return g_flag;
	}
	public void setG_flag(int g_flag) {
		this.g_flag = g_flag;
	}
	@Override
	public String toString() {
		return "AttendListVO [a_date=" + a_date + ", u_id=" + u_id + ", g_no=" + g_no 
					 + ", a_flag=" + a_flag + ", g_flag=" + g_flag + "]";
	}
}