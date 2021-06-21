package mybeans;

import java.sql.Date;

public class ExamSubject {
	
	private int examId;
	private String examName;
	private String sem;
	private int year;
	private int subjectId;
	private String subName;
	private Date subDate;
	private String subTime;
	private int duration;
	private int minMark;
	private int maxMark;
	
	
	
	public ExamSubject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExamSubject(int examId, String examName, String sem, int year, int subjectId, String subName, Date subDate,
			String subTime, int duration, int minMark, int maxMark) {
		super();
		this.examId = examId;
		this.examName = examName;
		this.sem = sem;
		this.year = year;
		this.subjectId = subjectId;
		this.subName = subName;
		this.subDate = subDate;
		this.subTime = subTime;
		this.duration = duration;
		this.minMark = minMark;
		this.maxMark = maxMark;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getSem() {
		return sem;
	}

	public void setSem(String sem) {
		this.sem = sem;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public Date getSubDate() {
		return subDate;
	}

	public void setSubDate(Date subDate) {
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

	public int getMinMark() {
		return minMark;
	}

	public void setMinMark(int minMark) {
		this.minMark = minMark;
	}

	public int getMaxMark() {
		return maxMark;
	}

	public void setMaxMark(int maxMark) {
		this.maxMark = maxMark;
	}

	@Override
	public String toString() {
		return "ExamSubject [examId=" + examId + ", examName=" + examName + ", sem=" + sem + ", year=" + year
				+ ", subjectId=" + subjectId + ", subName=" + subName + ", subDate=" + subDate + ", subTime=" + subTime
				+ ", duration=" + duration + ", minMark=" + minMark + ", maxMark=" + maxMark + "]";
	}
	
	

}
