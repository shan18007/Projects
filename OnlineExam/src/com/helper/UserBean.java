package com.helper;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import config.Database;
import mybeans.Organizer;
import mybeans.Users;

public class UserBean {

	Database dbDatabase = new Database();
	Connection connection = dbDatabase.getConnection();

	
	// validate the login details from database
	public String validate(String unm, String pwd) {

		try {

			PreparedStatement pStatement = connection
					.prepareStatement("select * from user where username=? and password=? and login_status='ACTIVE'");
			pStatement.setString(1, unm);
			pStatement.setString(2, pwd);
			ResultSet rSet = pStatement.executeQuery();

			if (rSet.next()) {
				if (unm.equals(rSet.getString("username")) && pwd.equals(rSet.getString("password"))) {
					String userType = rSet.getString("user_type");
					return userType;
				} else {
					return "not-found";
				}
			}
		} catch (Exception e) {

			System.out.println(e.toString());
		}

		return "not-found";
	}

	// This method returns Current Date
	public Date getDate() {

		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		return date;
	}

	
	// register new organizer in database
	public String addOrganizer(String unm, String ordinatorName, String orgName, String orgType, String cName,
			int duration, String email, String mob, String pwd) {

		PreparedStatement pstmt;

		CallableStatement cst1;

		try {

			pstmt = connection.prepareStatement("select email from organizers where email=?");
			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return "email-exist";
			} else {

				String userType = "ORGANIZER";
				// String loginStatus = "DEACTIVE";
				cst1 = connection.prepareCall("{call insert_organizer(?,?,?,?,?,?,?,?,?,?,?)}");

				cst1.setString(1, unm);
				cst1.setString(2, pwd);
				cst1.setString(3, userType);
				cst1.setString(4, ordinatorName);
				cst1.setString(5, orgName);
				cst1.setString(6, orgType);
				cst1.setString(7, cName);
				cst1.setInt(8, duration);
				cst1.setString(9, email);
				cst1.setString(10, mob);
				cst1.setDate(11, getDate());

				int res = cst1.executeUpdate();

				if (res > 0) {
					return "success";
				} else {
					return "fail";
				}
			}
		} catch (Exception e) {

			return e.getMessage();
		}

	}

	
	// This method register new user
	public String addUser(String u_name, int orgId, String full_name, String sem, String email, String mob_no,
			String pass) {

		PreparedStatement pstmt;

		CallableStatement cst1;

		try {

			pstmt = connection.prepareStatement("select email from user_info where email=?");
			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return "email-exist";
			} else {

				String userType = "USER";
				// String loginStatus = "DEACTIVE";
				cst1 = connection.prepareCall("{call insert_User(?,?,?,?,?,?,?,?,?)}");

				cst1.setString(1, u_name);
				cst1.setString(2, pass);
				cst1.setString(3, userType);
				cst1.setInt(4, orgId);
				cst1.setString(5, full_name);
				cst1.setString(6, sem);
				cst1.setString(7, email);
				cst1.setString(8, mob_no);
				cst1.setDate(9, getDate());

				int res1 = cst1.executeUpdate();

				if (res1 > 0) {
					return "success";
				} else {
					return "fail";
				}
			}
		} catch (Exception e) {

			return e.getMessage();
		}
	}

	// return all registered  organizers
	public ArrayList<Organizer> orgDetails() {

		ArrayList<Organizer> list = new ArrayList<Organizer>();
		ResultSet rs = null;
		Organizer organizer;

		try {
			PreparedStatement pStatement = connection.prepareStatement(
					"select user.username,org_id,ordinator_name,org_name,org_type,course,duration,email,mob_no,"
							+ "reg_date,user.login_status from user join organizers where user.user_type='ORGANIZER' "
							+ "and user.username=organizers.username");
			rs = pStatement.executeQuery();
			while (rs.next()) {
				organizer = new Organizer(rs.getInt("org_id"), rs.getString("username"), rs.getString("ordinator_name"),
						rs.getString("org_name"), rs.getString("org_type"), rs.getString("course"),
						rs.getInt("duration"), rs.getString("email"), rs.getString("mob_no"), rs.getDate("reg_date"),
						rs.getString("login_status"));
				list.add(organizer);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

    // return users registered with specific organizer using org_id
	public ArrayList<Users> userDetails(int orgID) {

		ArrayList<Users> list = new ArrayList<Users>();
		ResultSet rs = null;
		Users users;

		try {
			PreparedStatement pStatement = connection.prepareStatement(
					"select sem,full_name,email,mob_no,reg_date,user.username,login_status from user join user_info where org_id= ? and user.user_type='USER' and user.username=user_info.username");
			pStatement.setInt(1, orgID);
			rs = pStatement.executeQuery();
			while (rs.next()) {
				users = new Users(rs.getString("username"), rs.getString("full_name"), rs.getString("sem"),
						rs.getString("email"), rs.getString("mob_no"), rs.getDate("reg_date"),
						rs.getString("login_status"));
				list.add(users);
			}
			pStatement.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	
	// Organizer Profile by Organizer Bean
	public Organizer orgProfile(String unm){
		Organizer organizer=null;
		ResultSet rSet;
		PreparedStatement pstmt;
		try {
			pstmt = connection.prepareStatement("select * from organizers where username=?");
			pstmt.setString(1, unm);
			rSet = pstmt.executeQuery();
			
			if(rSet.next()) {
				organizer = new Organizer(rSet.getInt("org_id"), rSet.getString("username"), rSet.getString("ordinator_name"), rSet.getString("org_name"), rSet.getString("org_type"), rSet.getString("course"), rSet.getInt("duration"), rSet.getString("email"), rSet.getString("mob_no"), rSet.getDate("reg_date"));
				return organizer; 
			}
		} catch (Exception e) {
			e.toString();
		}
		return organizer;
	}
	
	// This method returns organization id 
	public int getOrgID(String orgUnm) {
		PreparedStatement pst;
		int id = 0;
		try {
			pst = connection.prepareStatement("select org_id from organizers where username = ?");
			pst.setString(1, orgUnm);
			ResultSet rSet = pst.executeQuery();
			if (rSet.next()) {
				id = rSet.getInt("org_id");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

}
