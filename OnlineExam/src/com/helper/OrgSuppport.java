package com.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import config.Database;

public class OrgSuppport {

	Database cnf = new Database();

	Connection connection = cnf.getConnection();

	public int getTotalUserCount(int org_id) {
		PreparedStatement pst;
		ResultSet resultSet;
		int count=0;
		try {

			pst = connection.prepareStatement("select count(username) from user_info where org_id=?");
			pst.setInt(1, org_id);
			resultSet = pst.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return count;
	}
	

	public int getActiveUserCount(int org_id) {
		PreparedStatement pst;
		ResultSet resultSet;
		int count=0;
		try {

			pst = connection.prepareStatement("select count(user_info.username) from user join user_info where user_info.username=user.username and user.login_status='ACTIVE' and org_id=?");
			pst.setInt(1, org_id);
			resultSet = pst.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return count;
	}
	
	public int getDeactiveUserCount(int org_id) {
		PreparedStatement pst;
		ResultSet resultSet;
		int count=0;
		try {

			pst = connection.prepareStatement("select count(user_info.username) from user join user_info where user_info.username=user.username and user.login_status='DEACTIVE' and org_id=?");
			pst.setInt(1, org_id);
			resultSet = pst.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return count;
	}
	
	public int getExamCount(int org_id) {
		PreparedStatement pst;
		ResultSet resultSet;
		int count=0;
		try {

			pst = connection.prepareStatement("select count(exam_name) from exam where org_id=?");
			pst.setInt(1, org_id);
			resultSet = pst.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return count;
	}
	
	public static String getTimeinAMPM(String str24hour) {
		String tim12hourString = "";
		try {
			SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
			SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
			Date _24HourDt = _24HourSDF.parse(str24hour);
			tim12hourString = _12HourSDF.format(_24HourDt);

		} catch (Exception e) {
			e.getMessage();
		}
		return tim12hourString;
	}
}

