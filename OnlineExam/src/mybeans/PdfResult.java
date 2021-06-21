package mybeans;

public class PdfResult {

	private int orgId;
	private String examName;
	private String year;
	private String sem;
	private float obtainMarks;
	private float percentage;
	private String resultStatus;
	private String fullName;

	public PdfResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PdfResult(int orgId, String examName, String year, String sem, float obtainMarks, float percentage,
			String resultStatus, String fullName) {
		super();
		this.orgId = orgId;
		this.examName = examName;
		this.year = year;
		this.sem = sem;
		this.obtainMarks = obtainMarks;
		this.percentage = percentage;
		this.resultStatus = resultStatus;
		this.fullName = fullName;
	}

	public int getOrgId() {
		return orgId;
	}

	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Override
	public String toString() {
		return "PdfResult [orgId=" + orgId + ", examName=" + examName + ", year=" + year + ", sem=" + sem
				+ ", obtainMarks=" + obtainMarks + ", percentage=" + percentage + ", resultStatus=" + resultStatus
				+ ", fullName=" + fullName + "]";
	}

}
