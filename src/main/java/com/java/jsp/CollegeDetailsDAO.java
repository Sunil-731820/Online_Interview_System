package com.java.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollegeDetailsDAO {
	
	PreparedStatement pst ;
	Connection connection;
	
	public String addCollegeDetails(CollegeDetails collegeDetails) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "insert into college_details(college_id,college_Name,college_code,college_pinCode) values(?,?,?,?)";
		pst = connection.prepareStatement(cmd);
		pst.setInt(1, collegeDetails.getCollege_id());
		pst.setString(2, collegeDetails.getCollege_Name());
		pst.setInt(3, collegeDetails.getCollege_code());
		pst.setInt(4, collegeDetails.getCollege_pinCode());
		pst.executeUpdate();
		return "College Details Added SuccessFully";
		
	}
	
	public int generateCollegeId() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "select max(college_id)+1 ano from college_details ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int college_id = res.getInt("ano");
		return college_id;
	}

}
