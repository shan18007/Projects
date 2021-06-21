package mybeans;

public class ResultSubjects {

	private String subjectName;
	private int minMarks;
	private int maxMarks;
	private float obtainMarks;
	
	public ResultSubjects(String subjectName, int minMarks, int maxMarks, float obtainMarks) {
		super();
		this.subjectName = subjectName;
		this.minMarks = minMarks;
		this.maxMarks = maxMarks;
		this.obtainMarks = obtainMarks;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
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

	public float getObtainMarks() {
		return obtainMarks;
	}

	public void setObtainMarks(float obtainMarks) {
		this.obtainMarks = obtainMarks;
	}

	@Override
	public String toString() {
		return "ResultSubjects [subjectName=" + subjectName + ", minMarks=" + minMarks + ", maxMarks=" + maxMarks
				+ ", obtainMarks=" + obtainMarks + "]";
	}
	
	
	
}
