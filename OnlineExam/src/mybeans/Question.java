package mybeans;

public class Question {
private int orgID;
private int exID;
private int subID;
private int queID;
private String que;
private String op1;
private String op2;
private String op3;
private String op4;
private String correctAns;

public Question(int orgID, int exID, int subID, int queID, String que, String op1, String op2, String op3, String op4,
		String correctAns) {
	super();
	this.orgID = orgID;
	this.exID = exID;
	this.subID = subID;
	this.queID = queID;
	this.que = que;
	this.op1 = op1;
	this.op2 = op2;
	this.op3 = op3;
	this.op4 = op4;
	this.correctAns = correctAns;
}
public int getOrgID() {
	return orgID;
}
public void setOrgID(int orgID) {
	this.orgID = orgID;
}
public int getExID() {
	return exID;
}
public void setExID(int exID) {
	this.exID = exID;
}
public int getSubID() {
	return subID;
}
public void setSubID(int subID) {
	this.subID = subID;
}
public int getQueID() {
	return queID;
}
public void setQueID(int queID) {
	this.queID = queID;
}
public String getQue() {
	return que;
}
public void setQue(String que) {
	this.que = que;
}
public String getOp1() {
	return op1;
}
public void setOp1(String op1) {
	this.op1 = op1;
}
public String getOp2() {
	return op2;
}
public void setOp2(String op2) {
	this.op2 = op2;
}
public String getOp3() {
	return op3;
}
public void setOp3(String op3) {
	this.op3 = op3;
}
public String getOp4() {
	return op4;
}
public void setOp4(String op4) {
	this.op4 = op4;
}
public String getCorrectAns() {
	return correctAns;
}
public void setCorrectAns(String correctAns) {
	this.correctAns = correctAns;
}
@Override
public String toString() {
	return "Question [orgID=" + orgID + ", exID=" + exID + ", subID=" + subID + ", queID=" + queID + ", que=" + que
			 + ", op1=" + op1 + ", op2=" + op2 + ", op3=" + op3 + ", op4=" + op4 + ", correctAns="
			+ correctAns + "]";
}




}
