package com.checkmate.vo;

public class GroupVO {
	
	private int g_no;
	private String u_id;
	private String g_name;
	private int g_flag;
	private int u_point;
	private String g_socket;

	public String getG_socket() {
		return g_socket;
	}
	public void setG_socket(String g_socket) {
		this.g_socket = g_socket;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
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
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_flag() {
		return g_flag;
	}
	public void setG_flag(int g_flag) {
		this.g_flag = g_flag;
	}
	@Override
	public String toString() {
		return "GroupVO [g_no=" + g_no + ", u_id=" + u_id + ", g_name=" + g_name + ", g_flag=" + g_flag + ", u_point="
				+ u_point + ", g_socket=" + g_socket + "]";
	}
}
