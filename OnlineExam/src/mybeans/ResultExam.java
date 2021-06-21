package mybeans;

public class ResultExam {

	private String examName;
	private String sem;
	private float obtainMarks;
	private float totalMarks;
	private float percentage;
	private String resultStatus;
	
	
	public ResultExam() {
		super();
	}

	public ResultExam(String examName, String sem, float obtainMarks,float totalMarks, float percentage, String resultStatus) {
		super();
		this.examName = examName;
		this.sem = sem;
		this.obtainMarks=obtainMarks;
		this.totalMarks = totalMarks;
		this.percentage = percentage;
		this.resultStatus = resultStatus;
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

	
	public float getObtainMarks() {
		return obtainMarks;
	}

	public void setObtainMarks(float obtainMarks) {
		this.obtainMarks = obtainMarks;
	}

	public float getTotaMarks() {
		return totalMarks;
	}

	public void setTotaMarks(float totaMarks) {
		this.totalMarks = totaMarks;
	}

	public float getPercentage() {
		return percentage;
	}

	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}

	public String getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}

	@Override
	public String toString() {
		return "ResultExam [examName=" + examName + ", sem=" + sem + ", obtainMarks=" + obtainMarks + ", totalMarks="
				+ totalMarks + ", percentage=" + percentage + ", resultStatus=" + resultStatus + "]";
	}

	
	
	
}
