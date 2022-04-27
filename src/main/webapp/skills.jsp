<%@page import="com.java.jsp.ProgrammingDetails"%>
<%@page import="com.java.jsp.ProgrammingDetailsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 body{
 background-color: grey;
 }
fieldset {
  background-color: #eeeeee;
}

legend {
  background-color: gray;
  color: white;
  padding: 20px;
}

input {
  margin: 8px;
  width: 400px;
  height: 30px
}

#fname{
border-radius: 30px;


}

.container{
width: 800px;
height: 800px;
border-radius: 80px;

}

.button1 {
background-color: red;
}
</style>
</head>
<body>
<%
	ProgrammingDetailsDAO dao = new ProgrammingDetailsDAO();
	int programming_id = dao.generateProgrammingId();

%>

<form action="skills.jsp" method="get">
<div class="container" align="left">
 <fieldset>
  <legend>Please Fill out Programming Informations </legend>
  <center>
  <label for="programming_id">programming Id:</label>
  <input type="number" id="fname" name="programming_id" value=<%=programming_id %>><br><br>
  </center>
  <center>
  <label for="firstProgramming">Enter First Programming  Language </label>
  <input type="text" id="fname" name="firstProgramming" placeholder=" "><br><br>
  </center>
  
  <center>
  <label for="secondProgramming">Enter second Programming  Language</label>
  <input type="text" id="fname" name="secondProgramming" ><br><br>
  </center>
  
  <center>
  <label for="thirdProgramming">Enter third Programming  Language</label>
  <input type="text" id="fname" name="thirdProgramming" ><br><br>
  </center>
 
 <center>
  <label for="fourthProgramming">Enter Other Programming  Language</label>
  <input type="text" id="fname" name="fourthProgramming" ><br><br>
  </center>
  <center>
  <input class="button1" type="submit" value="Next">
 	</center>
 </fieldset>
</div>
</form>
<%
	if(request.getParameter("programming_id")!=null && request.getParameter("firstProgramming")!=null &&
	request.getParameter("secondProgramming")!=null){
		
		ProgrammingDetails programming = new ProgrammingDetails();
		programming.setProgramming_id(programming_id);
		programming.setFirstProgramming(request.getParameter("firstProgramming"));
		programming.setSecondProgramming(request.getParameter("secondProgramming"));
		programming.setThirdProgramming(request.getParameter("thirdProgramming"));
		programming.setFourthProgramming(request.getParameter("fourthProgramming"));
		dao.AddProgrammingDetails(programming);
		%>
		
		<jsp:forward page="moveTocollegeDetails3.jsp"/>
<% 
	}
%>

 
</body>
</html>