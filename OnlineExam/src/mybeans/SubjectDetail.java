package mybeans;
public class SubjectDetail {

	private int examId;
	private String examName;
	private int subjectId;
	private String subName;

	public SubjectDetail(int examId, String examName, int subjectId,String subName) {
		super();
		this.examId = examId;
		this.examName = examName;
		this.subjectId = subjectId;
		this.subName = subName;
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

	@Override
	public String toString() {
		return "SubjectDetail [examId=" + examId + ", examName=" + examName + ", subjectId=" + subjectId + ", subName="
				+ subName + "]";
	}

}
