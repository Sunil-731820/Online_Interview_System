package com.java.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SpokenLanguageDAO {
	Connection connection;
	PreparedStatement pst;
	
	public int generateSpokenId() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "select max(spoken_id)+1 ano from spoken_language ";
		pst = connection.prepareStatement(cmd);
		ResultSet res = pst.executeQuery();
		res.next();
		int spoken_id = res.getInt("ano");
		return spoken_id;
	}
	
	public String AddSpokenLanguage(SpokenLanguage spokenLanguage) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnetion();
		String cmd = "insert into spoken_language(spoken_id,firstLanguage,secondLanguage,thirdLanguage) values(?,?,?,?)";
		pst = connection.prepareStatement(cmd);
		pst.setInt(1, spokenLanguage.getSpoken_id());
		pst.setString(2, spokenLanguage.getFirstLanguage());
		pst.setString(3, spokenLanguage.getSecondLanguage());
		pst.setString(4, spokenLanguage.getThirdLanguage());
		pst.executeUpdate();
		return "Spoken Language  Details Added SuccessFully";
	}

}
