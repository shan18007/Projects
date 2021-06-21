<%
	if (session.getAttribute("username") != null) {
%>


<meta name="viewport" content="width=device-width, initial-scale=1">



<%@page import="java.sql.ResultSet"%>
<%@page import="mybeans.Subject"%>
<%@page import="mybeans.Exam"%>
<%@page import="com.helper.OrgTask"%>
<%@page import="java.util.ArrayList"%>


<jsp:useBean id="orgTsk" class="com.helper.OrgTask" />


	<div class="card text-center col-lg-6 col-md-6 col-sm-10 col-xs-12 m-auto p-2">
		<div class="card-header bg-info">

			<h3>Add Question</h3>
		</div>
		<div class="card body">
			<form action="org-handler.jsp?prt=add-question" method="post">
				<div class="col-auto p-2">


					<div class="form-group">
						<select class="form-control" id="selExam" name="exam_id">
							<option value="" selected disabled>----Select Exam----</option>

							<%
								int oid = (Integer) session.getAttribute("org_id");
							ArrayList<Exam> list = orgTsk.getExamDetails(oid);
							Exam exam;
							if (list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									exam = (Exam) list.get(i);
							%>

							<option value="<%=exam.getExamID()%>"><%=exam.getExamname()%></option>
							<%
								}
							} else {
							%>
							<option>No Exam Found</option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<select class="form-control" id="selSubject" name="subject_id">
							<option value="" selected disabled>----Select Subject----</option>

							<%
								ArrayList<Subject> sublist = orgTsk.getSubjectDetailsByOrg(oid);
							Subject subject;
							if (sublist.size() > 0) {
								for (int j = 0; j < sublist.size(); j++) {
									subject = (Subject) sublist.get(j);
							%>

							<option value="<%=subject.getSub_id()%>"><%=subject.getSubName()%></option>
							<%
								}
							} else {
							%>
							<option>No Subject Found</option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group row text-left">
					<div class="form-group col-md-12">
						<label for="exampleFormControlTextarea1">Question</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="2" name="que" required></textarea>
							</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							 <input type="text"
								class="form-control" id="inputOption1" placeholder="Option1"
								name="op1" required>
						</div>
						<div class="form-group col-md-6">
							 <input type="text"
								class="form-control" id="inputOption2" placeholder="Option2"
								name="op2" required>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							 <input type="text"
								class="form-control" id="inputOption3" placeholder="Option3"
								name="op3" required>
						</div>
						<div class="form-group col-md-6">
							 <input type="text"
								class="form-control" id="inputOption4" placeholder="Option4"
								name="op4" required>
						</div>
					</div>

					<div class="form-group ">
						 <select onclick='ab()' class="form-control"
							name="correct_ans" required>
							<option value="" selected disabled>----Select Answer----</option>
							<option id ="op1" >Option 1</option>
							<option id ="op2" >Option 2</option>
							<option id ="op3" >Option 3</option>
							<option id ="op4" >Option 4</option>
						</select>
					</div>


					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save" />
					</div>
				</div>
			</form>
		</div>
	</div>

<%
	} else {
		session.setAttribute("logmsg", "You are not logged in Please log in First");
		%>
		<%@ include file="index.jsp" %>
<%
	}
%>

<script>
function ab(){
	a = document.getElementById('inputOption1').value;
	b = document.getElementById('inputOption2').value;
	c = document.getElementById('inputOption3').value;
	d = document.getElementById('inputOption4').value;
    document.getElementById('op1').innerHTML=a;
    document.getElementById('op2').innerHTML=b;
    document.getElementById('op3').innerHTML=c;
    document.getElementById('op4').innerHTML=d;
    
    }
</script>
