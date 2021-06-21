
<%@page import="com.util.MailBean"%>
<%@page import="mybeans.Organizer"%>
<%@page import="com.helper.UserBean"%>
<%@page import="java.util.Random"%>
<%@page import="mybeans.Users"%>
<%@page import="com.helper.StudentTask"%>
<jsp:useBean id="ob" class="com.helper.UserBean" scope="page" />



<%
	String value = request.getParameter("page");

if (value.equals("login")) {
	String unm = request.getParameter("u_id");
	String pwd = request.getParameter("pass");

	String usertype = ob.validate(unm, pwd);
	if (usertype.equals("ADMIN")) {

		session.setAttribute("username", unm);
		response.sendRedirect("Admin-dashboard.jsp?pgprt=view-user");
	} else if (usertype.equals("USER")) {
		StudentTask stask = new StudentTask();
		session.setAttribute("username", unm);
		Users std = stask.studentProfile(unm);
		session.setAttribute("orgID", std.getOrgid());
		response.sendRedirect("std-dashboard.jsp?pgprt=dashboard");
	} else if (usertype.equals("ORGANIZER")) {
		session.setAttribute("username", unm);
		session.setAttribute("org_id", ob.getOrgID(unm));
		response.sendRedirect("org-dashboard.jsp?pgprt=my-dashboard");
	} else if (usertype.equals("not-found")) {
		session.setAttribute("logmsg", "username or password is incorrect...!");
		response.sendRedirect("index.jsp");
	}
} else if (value.equals("org-register")) {
	String username = request.getParameter("u_name");
	String ordinator_name = request.getParameter("ord_name");
	String org_name = request.getParameter("org_name");
	String org_type = request.getParameter("org_type");
	String course_name = request.getParameter("course_name");
	int duration = Integer.parseInt(request.getParameter("duration"));
	String email = request.getParameter("email");
	String mob = request.getParameter("mob_no");
	String pass = request.getParameter("pass");

	String result = ob.addOrganizer(username, ordinator_name, org_name, org_type, course_name, duration, email, mob,
	pass);
	if (result.equals("email-exist")) {
		session.setAttribute("logmsg", "Email already exist");
		response.sendRedirect("index.jsp");
	} else if (result.equals("success")) {
		session.setAttribute("logmsg", "Registration Successfull.");
		response.sendRedirect("index.jsp");
	} else if (result.equals("fail")) {
		session.setAttribute("logmsg", "Something Went Wrong.");
		response.sendRedirect("index.jsp");
	}
} else if (value.equals("std-register")) {
	String username = request.getParameter("u_name");
	String full_name = request.getParameter("full_name");
	int org_id = Integer.parseInt(request.getParameter("org_id"));
	String sem = request.getParameter("sem");
	String email = request.getParameter("email");
	String mob = request.getParameter("mob_no");
	String pass = request.getParameter("pass");

	String result = ob.addUser(username, org_id, full_name, sem, email, mob, pass);
	if (result.equals("email-exist")) {
		session.setAttribute("logmsg", "Email already exist");
		response.sendRedirect("index.jsp");
	} else if (result.equals("success")) {
		session.setAttribute("logmsg", "Registration Successfull.");
		response.sendRedirect("index.jsp");
	} else if (result.equals("fail")) {
		session.setAttribute("logmsg", "Something Went Wrong.");
		response.sendRedirect("index.jsp");
	}

} else if (value.equals("forgot-pass")) {
	String userName = request.getParameter("username");
	session.setAttribute("unm", userName);
	String userRole = request.getParameter("user_role");
	String emailforOTP = request.getParameter("email");
	session.setAttribute("email", emailforOTP);

	out.print(userName + "---" + userRole + "---" + emailforOTP);

	//if user type is student profile 
	if (userRole.equals("Student")) {
		StudentTask st = new StudentTask();
		Users u = st.studentProfile(userName);
		if (u != null) {
	out.println(u);
	if (u.getUsername().equals(userName) && u.getEmail().equals(emailforOTP)) {
		Random obj = new Random();
		long otp = obj.nextInt(999999);
		
		out.println(otp);

		//sent mail to user of successful registration
		MailBean mail = new MailBean();
		String msg = "Hello, OTP for Recover the Password is :" + otp + " .Dont share with anyone.";
		String res = mail.sendMail(emailforOTP, "OTP", msg);
		if (res.equals("success")) {
			session.setAttribute("otpmsg", "otp sent to your email address.");
			session.setAttribute("OTP", otp);
			response.sendRedirect("process-forgot-password.jsp");
		} else {
			session.setAttribute("otpmsg", "Something went wrong.");
			response.sendRedirect("forgot-pass.jsp");
		}

	} else {
		session.setAttribute("otpmsg", "Username or Email is invalid.!");
		response.sendRedirect("forgot-pass.jsp");
	}
		} else {
	session.setAttribute("otpmsg", "Invalid username.!");
	response.sendRedirect("forgot-pass.jsp");
		}

	} else {

		UserBean ub = new UserBean();
		Organizer orz = ub.orgProfile(userName);
		if (orz != null) {

	out.println(orz + "---");
	if (orz.getUnm().equals(userName) && orz.getEmail().equals(emailforOTP)) {
		Random obj = new Random();
		long otp = obj.nextInt(999999);
		out.println(otp);
		//sent mail to user of successful registration
		MailBean mail = new MailBean();
		String msg = "Hello, OTP for Recover the Password is :" + otp + " .Dont share with anyone.";
		String res = mail.sendMail(emailforOTP, "OTP", msg);
		if (res.equals("success")) {
			session.setAttribute("otpmsg", "Otp sent to your email address.");
			session.setAttribute("OTP", otp);
			response.sendRedirect("process-forgot-password.jsp");
		} else {
			session.setAttribute("otpmsg", "Something went wrong.");
			response.sendRedirect("forgot-pass.jsp");
		}
	} else {
		session.setAttribute("otpmsg", "Username or Email is invalid.!");
		response.sendRedirect("forgot-pass.jsp");
	}
		} else {
	session.setAttribute("otpmsg", "Invalid username.!");
	response.sendRedirect("forgot-pass.jsp");
		}
	}
}
else if(value.equals("otp-verify")){
	int otp = Integer.parseInt(request.getParameter("otp"));
	int generatedOtp = Integer.parseInt(request.getParameter("generatedOtp"));
	
	if(otp==generatedOtp){
		StudentTask st = new StudentTask();
		Users u = st.studentProfile((String)session.getAttribute("unm"));
		String msg="Your Password is "+u.getPwd()+". Now login with your username and password";
		MailBean mail = new MailBean();
		String res =mail.sendMail((String)session.getAttribute("email"), "Recovered Password", msg);
		
		if (res.equals("success")) {
			session.setAttribute("logmsg", "Your password is sent to your registered email address.");
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("logmsg", "Something went wrong.");
			response.sendRedirect("index.jsp");
		}
	}
	else{
		session.setAttribute("otpmsg", "Incorrect OTP.");
		response.sendRedirect("forgot-pass.jsp");
	}

}


%>
