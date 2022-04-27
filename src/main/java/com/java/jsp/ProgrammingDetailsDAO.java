package com.java.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProgrammingDetailsDAO {
	Connection connection;
	PreparedStatement pst;
	
	public int generateProgrammingId() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "select max(programming_id)+1 ano from programming_language ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int programming_id = res.getInt("ano");
		return programming_id;
	}

	
	public String AddProgrammingDetails(ProgrammingDetails programmingDetails) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "insert into programming_language(programming_id,firstProgramming,secondProgramming,thirdProgramming,fourthProgramming) values(?,?,?,?,?)";
		pst = connection.prepareStatement(cmd);
		pst.setInt(1, programmingDetails.getProgramming_id());
		pst.setString(2, programmingDetails.getFirstProgramming());
		pst.setString(3, programmingDetails.getSecondProgramming());
		pst.setString(4, programmingDetails.getThirdProgramming());
		pst.setString(5, programmingDetails.getFourthProgramming());
		pst.executeUpdate();
		return "Prgramming Details Added SuccessFully";
		
	}

}
