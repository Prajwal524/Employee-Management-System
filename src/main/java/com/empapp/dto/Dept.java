package com.empapp.dto;

public class Dept {
	@Override
	public String toString() {
		return "Dept [dno=" + dno + ", dname=" + dname + ", location=" + location + "]\n";
	}


	private Integer dno;
	private String dname;
	private String location;

	public Integer getDno() {
		return dno;
	}


	public void setDno(Integer dno) {
		this.dno = dno;
	}


	public String getDname() {
		return dname;
	}


	public void setDname(String dname) {
		this.dname = dname;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
