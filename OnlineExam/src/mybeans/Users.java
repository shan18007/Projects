package mybeans;

import java.sql.Date;

public class Users {
	public int uinfoID;
	public String username;
	private String fullname;
	private String sem;
	private String email;
	private String mob_no;
	private Date regDate;
	private String loginStatus;
	private int orgid;
	private String pwd;
	
	
	public Users(String username,String fullname, String sem, String email, String mob_no, Date regDate, String loginStatus) {
		super();
		this.username= username;
		this.fullname = fullname;
		this.sem = sem;
		this.email = email;
		this.mob_no = mob_no;
		this.regDate = regDate;
		this.loginStatus = loginStatus;
	}
	
	//For student Profile
	public Users(int orgid,int uinfoID,String username,String fullname, String sem, String email, String mob_no, Date regDate,String pwd) {
		super();
		this.orgid= orgid;
		this.uinfoID= uinfoID;
		this.username= username;
		this.fullname = fullname;
		this.sem = sem;
		this.email = email;
		this.mob_no = mob_no;
		this.regDate = regDate;
		this.pwd=pwd;
	}
	
	
	
	
	public int getOrgid() {
		return orgid;
	}

	public void setOrgid(int orgid) {
		this.orgid = orgid;
	}

	public int getUinfoID() {
		return uinfoID;
	}

	public void setUinfoID(int uinfoID) {
		this.uinfoID = uinfoID;
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMob_no() {
		return mob_no;
	}
	public void setMob_no(String mob_no) {
		this.mob_no = mob_no;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}


	@Override
	public String toString() {
		return "Users [username=" + username + ", fullname=" + fullname + ", sem=" + sem + ", email=" + email
				+ ", mob_no=" + mob_no + ", regDate=" + regDate + ", loginStatus=" + loginStatus + "]";
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
	
	
	
	
	

}
