package com.checkmate.vo;

import java.util.Date;

public class CalendarVO {


	private String title;
	private String start;
	private String end;
	private String color;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}

	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "CalendarVO [title=" + title + ", start=" + start + ", end=" + end + ", color=" + color + "]";
	}

}
