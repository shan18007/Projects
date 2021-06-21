package mybeans;


public class Subject {
	private int sub_id;
	private int ex_id;
	private int orgid;
	private String subName;
	private String subDate;
	private String subTime;
	private int duration;
	private int minMarks;
	private int maxMarks;
	

	public Subject(int sub_id, int ex_id, int orgid, String subName, String subDate, String subTime, int duration,
			int minMarks, int maxMarks) {
		super();
		this.sub_id = sub_id;
		this.ex_id = ex_id;
		this.orgid = orgid;
		this.subName = subName;
		this.subDate = subDate;
		this.subTime = subTime;
		this.duration = duration;
		this.minMarks = minMarks;
		this.maxMarks = maxMarks;
	}
	
	


	public Subject(int ex_id, int orgid, String subName, String subDate, String subTime, int duration, int minMarks,
			int maxMarks) {
		super();
		this.ex_id = ex_id;
		this.orgid = orgid;
		this.subName = subName;
		this.subDate = subDate;
		this.subTime = subTime;
		this.duration = duration;
		this.minMarks = minMarks;
		this.maxMarks = maxMarks;
	}




	public int getMinMarks() {
		return minMarks;
	}


	public void setMinMarks(int minMarks) {
		this.minMarks = minMarks;
	}


	public int getMaxMarks() {
		return maxMarks;
	}


	public void setMaxMarks(int maxMarks) {
		this.maxMarks = maxMarks;
	}


	public int getSub_id() {
		return sub_id;
	}
	

	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	
	public int getEx_id() {
		return ex_id;
	}
	
	public void setEx_id(int ex_id) {
		this.ex_id = ex_id;
	}


	public int getOrgid() {
		return orgid;
	}

	public void setOrgid(int orgid) {
		this.orgid = orgid;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}

	public String getSubTime() {
		return subTime;
	}

	public void setSubTime(String subTime) {
		this.subTime = subTime;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}


	@Override
	public String toString() {
		return "Subject [sub_id=" + sub_id + ", ex_id=" + ex_id + ", orgid=" + orgid + ", subName=" + subName
				+ ", subDate=" + subDate + ", subTime=" + subTime + ", duration=" + duration + ", minMarks=" + minMarks
				+ ", maxMarks=" + maxMarks + ", getMinMarks()=" + getMinMarks() + ", getMaxMarks()=" + getMaxMarks()
				+ ", getSub_id()=" + getSub_id() + ", getEx_id()=" + getEx_id() + ", getOrgid()=" + getOrgid()
				+ ", getSubName()=" + getSubName() + ", getSubDate()=" + getSubDate() + ", getSubTime()=" + getSubTime()
				+ ", getDuration()=" + getDuration() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	

}
