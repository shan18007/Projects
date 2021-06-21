package mybeans;

import java.util.Date;

public class Organizer {
	private String unm;
	private String pwd;
	private String ordinatorName;
	private int orgID;
	private int duration;
	private String orgName;
	private String course;
	private String org_type;
	private String email;
	private String mob_no;
	private Date regDate;
	private String loginStatus;

	
	
	
	
	
	
	
	public Organizer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Organizer(int orgID, String orgName, String course) {
		super();
		this.orgID = orgID;
		this.orgName = orgName;
		this.course = course;
	}

	public Organizer(int orgID, String unm,String ordinatorName, String orgName, String org_type, String course,
			int duration, String email, String mob_no, Date regDate,String loginStatus) {
		super();
		this.unm = unm;
		this.orgID = orgID;
		this.ordinatorName=ordinatorName;
		this.duration = duration;
		this.orgName = orgName;
		this.course = course;
		this.org_type = org_type;
		this.email = email;
		this.mob_no = mob_no;
		this.regDate = regDate;
		this.loginStatus=loginStatus;
	}
	
	public Organizer(int orgID, String unm,String ordinatorName, String orgName, String org_type, String course,
			int duration, String email, String mob_no, Date regDate) {
		super();
		this.unm = unm;
		this.orgID = orgID;
		this.ordinatorName=ordinatorName;
		this.duration = duration;
		this.orgName = orgName;
		this.course = course;
		this.org_type = org_type;
		this.email = email;
		this.mob_no = mob_no;
		this.regDate = regDate;
	}


	

	//For Organizer Profile
	public Organizer(String unm, String pwd, String ordinatorName, int orgID, int duration, String orgName,
			String course, String org_type, String email, String mob_no, Date regDate) {
		super();
		this.unm = unm;
		this.pwd = pwd;
		this.ordinatorName = ordinatorName;
		this.orgID = orgID;
		this.duration = duration;
		this.orgName = orgName;
		this.course = course;
		this.org_type = org_type;
		this.email = email;
		this.mob_no = mob_no;
		this.regDate = regDate;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getUnm() {
		return unm;
	}

	public void setUnm(String unm) {
		this.unm = unm;
	}

	public int getOrgID() {
		return orgID;
	}

	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrdinatorName() {
		return ordinatorName;
	}

	public void setOrdinatorName(String ordinatorName) {
		this.ordinatorName = ordinatorName;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getOrg_type() {
		return org_type;
	}

	public void setOrg_type(String org_type) {
		this.org_type = org_type;
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

	@Override
	public String toString() {
		return "Organizer [unm=" + unm + ", ordinatorName=" + ordinatorName + ", orgID=" + orgID + ", duration="
				+ duration + ", orgName=" + orgName + ", course=" + course + ", org_type=" + org_type + ", email="
				+ email + ", mob_no=" + mob_no + ", regDate=" + regDate + ", loginStatus=" + loginStatus + "]";
	}

	
}
