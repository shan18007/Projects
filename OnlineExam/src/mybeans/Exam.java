package mybeans;

public class Exam {
	private int examID;
	private String examname;
	private int orgid;
	private int year;
	private String sem;
	private String username;
	private String examstatus;
	private String displayStatus;
	
	public Exam() {
		
	}
	
	public Exam(String examname, int year, String sem, String examstatus) {
		super();
		this.examname = examname;
		this.year = year;
		this.sem = sem;
		this.examstatus = examstatus;
	}


	public Exam(Integer examID,String examname, int orgid, int year, String sem, String username, String examstatus) {
		super();
		this.examID= examID;
		this.examname = examname;
		this.orgid = orgid;
		this.year = year;
		this.sem = sem;
		this.username = username;
		this.examstatus = examstatus;
	}


	public int getExamID() {
		return examID;
	}


	public void setExamID(int examID) {
		this.examID = examID;
	}


	public String getExamname() {
		return examname;
	}


	public void setExamname(String examname) {
		this.examname = examname;
	}


	public int getOrgid() {
		return orgid;
	}


	public void setOrgid(int orgid) {
		this.orgid = orgid;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public String getSem() {
		return sem;
	}


	public void setSem(String sem) {
		this.sem = sem;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getExamstatus() {
		return examstatus;
	}


	public void setExamstatus(String examstatus) {
		this.examstatus = examstatus;
	}
			
	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	@Override
	public String toString() {
		return "Exam [examID=" + examID + ", examname=" + examname + ", orgid=" + orgid + ", year=" + year + ", sem="
				+ sem + ", username=" + username + ", examstatus=" + examstatus + "]";
	}


	
		
	    
	 
}
