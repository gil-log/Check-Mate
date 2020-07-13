package com.checkmate.vo;

public class UserVO {
	
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_email;
	private int u_flag;
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getU_flag() {
		return u_flag;
	}
	public void setU_flag(int u_flag) {
		this.u_flag = u_flag;
	}
	@Override
	public String toString() {
		return "UserVO [u_id=" + u_id + ", u_pwd=" + u_pwd + ", u_name=" + u_name + ", u_email=" + u_email + ", u_flag="
				+ u_flag + "]";
	}
}
