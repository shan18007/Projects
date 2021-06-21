package mybeans;

public class ExamPaper {
	private int orgid;
	private int examID;
	private String examname;
	private int year;
	private String sem;
	private String examStattus;
	private int sub_id;
	private String subName;
	private String subDate;
	private String subTime;
	private int duration;
	private int minMarks;
	private int maxMarks;
	public ExamPaper() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	public ExamPaper(int examID, String examname, int year, String sem, int sub_id, String subName,
			String subDate, String subTime, int duration, int minMarks, int maxMarks) {
		super();
		this.examID = examID;
		this.examname = examname;
		this.year = year;
		this.sem = sem;
		this.sub_id = sub_id;
		this.subName = subName;
		this.subDate = subDate;
		this.subTime = subTime;
		this.duration = duration;
		this.minMarks = minMarks;
		this.maxMarks = maxMarks;
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
	public String getExamStattus() {
		return examStattus;
	}
	public void setExamStattus(String examStattus) {
		this.examStattus = examStattus;
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
	public int getSub_id() {
		return sub_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
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
	@Override
	public String toString() {
		return "ExamPaper [examID=" + examID + ", examname=" + examname + ", examStattus=" + examStattus + ", orgid="
				+ orgid + ", year=" + year + ", sem=" + sem + ", sub_id=" + sub_id + ", subName=" + subName
				+ ", subDate=" + subDate + ", subTime=" + subTime + ", duration=" + duration + ", minMarks=" + minMarks
				+ ", maxMarks=" + maxMarks + "]";
	}
	
	
	
}
