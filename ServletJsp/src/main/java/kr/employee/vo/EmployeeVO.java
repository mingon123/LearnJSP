package kr.employee.vo;

import java.sql.Date;

public class EmployeeVO {
	// 프로퍼티
	private long snum;
	private String id;
	private String name;
	private String passwd;
	private int salary;
	private String job;
	private Date reg_date;
	
	// 비밀번호 
	public boolean isCheckedPassword(String userPasswd) {
		if(passwd.equals(userPasswd)) { // 비밀번호 일치
			return true;
		}
		return false; // 비밀번호 불일치
	}
	
	public long getSnum() {
		return snum;
	}
	public void setSnum(long snum) {
		this.snum = snum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
	
}
