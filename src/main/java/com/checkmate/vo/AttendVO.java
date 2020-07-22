package com.checkmate.vo;

public class AttendVO {
	private String a_date;
	private String u_id;
	private int g_no;
	private int a_flag;
	private String a_deadLine;
	

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
	public String getA_deadLine() {
		return a_deadLine;
	}
	public void setA_deadLine(String a_deadLine) {
		this.a_deadLine = a_deadLine;
	}
	
	@Override
	public String toString() {
		return "AttendVO [a_date=" + a_date + ", u_id=" + u_id + ", g_no=" + g_no + 
						  ", a_flag=" + a_flag + ", a_deadLine=" + a_deadLine + "]";
	}
}