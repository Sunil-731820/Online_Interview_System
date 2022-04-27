package com.java.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentPersonalInformationDAO {
	
	PreparedStatement pst;
	Connection connection;
	
	public String addPerSonalInformation(StudentPersonalInformation studentPersonalInformation) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "insert into personal_informations(student_id,student_firstName,student_lastName,student_emailId,student_password,"
				+ "student_address,student_mobileNo,student_pinCode,"
				+ "Student_course,student_branch) values(?,?,?,?,?,?,?,?,?,?)";
		pst = connection.prepareStatement(cmd);
		pst.setInt(1, studentPersonalInformation.getStudent_id());
		pst.setString(2, studentPersonalInformation.getStudent_firstName());
		pst.setString(3, studentPersonalInformation.getStudent_lastName());
		pst.setString(4, studentPersonalInformation.getStudent_emailId());
		pst.setString(5, studentPersonalInformation.getStudent_password());
		pst.setString(6, studentPersonalInformation.getStudent_addres());
		pst.setString(7, studentPersonalInformation.getStudent_mobileNo());
		pst.setInt(8, studentPersonalInformation.getStudent_pinCode());
		pst.setString(9, studentPersonalInformation.getStudent_course());
		pst.setString(10, studentPersonalInformation.getStudent_branch());
		pst.executeUpdate();
		return "PerSonal Information part1 is added SuceesFully";
	}
	
//	this is the function to generate the agent id Automatically
	
	public int generateAgentNo() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "select max(student_id)+1 ano from personal_informations ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int student_id = res.getInt("ano");
		return student_id;
	}

}
