package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.Database;

public class AdminTask {

	Database mydb = new Database();
	Connection con = mydb.getConnection();

	// not using this
	public ResultSet getOrganizersList() {

		PreparedStatement pst = null;
		ResultSet rSet;
		try {
			pst = con.prepareStatement("select user.username,ordinator_name,org_name,org_type,course,email,mob_no,"
					+ "reg_date,user.login_status from user join organizers where user.user_type='ORGANIZER' "
					+ "and user.username=organizers.username");
			rSet = pst.executeQuery();
			if (rSet.next()) {
				return rSet;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// change account status Active or Deactive
	public String changeAccStatus(String status, String unm) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("update user set login_status=? where username=?");
			pst.setString(1, status);
			pst.setString(2, unm);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	// Delete Account from Database
	public String deleteAcc(String unm) {
		PreparedStatement pst;
		try {
			pst = con.prepareStatement("delete from user where username=?");

			pst.setString(1, unm);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	public String validatePassword(String unm, String Pwd) {
		String oldpwd = "";
		try {
			PreparedStatement pst;
			pst = con.prepareStatement("Select password from user where username=?");
			pst.setString(1, unm);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {

				oldpwd = rs.getString("password");
			}
			if (Pwd.equals(oldpwd)) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return e.getMessage();
		}
	}

	// Change User Password using username
	public String changePass(String unm, String newPwd) {
		try {
			PreparedStatement pst;
			pst = con.prepareStatement("update user set password=? where username=?");
			pst.setString(1, newPwd);
			pst.setString(2, unm);
			int i = pst.executeUpdate();
			if (i > 0) {
				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	/*
	public String addDT(Date dt, String tm) {
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into test(exDate,time) values(?,?)");
			pstmt.setDate(1, dt);
			pstmt.setString(2, tm);

			int i = pstmt.executeUpdate();
			if (i > 0) {

				return "success";
			} else {
				return "fail";
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}
	*/
}
