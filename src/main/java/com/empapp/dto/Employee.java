package com.empapp.dto;

public class Employee {
	private Integer id;
	private String name;
	private String job; 
	private Double salary;
	private Integer dno;
	private String createdAt;
	private String mail;
	
	@Override
	public String toString() {
		return "id=" + id + ", name=" + name + ", job=" + job + ", salary=" + salary + ", dno=" + dno
				+ ", createdAt=" + createdAt + ", mail=" + mail + ", password=" + password + "\n";
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public Double getSalary() {
		return salary;
	}


	public void setSalary(Double salary) {
		this.salary = salary;
	}


	public Integer getDno() {
		return dno;
	}


	public void setDno(Integer dno) {
		this.dno = dno;
	}


	public String getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	private String password;
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}
