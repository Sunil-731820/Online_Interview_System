<%@page import="com.java.jsp.CollegeDetails"%>
<%@page import="com.java.jsp.CollegeDetailsDAO"%>
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
	CollegeDetailsDAO dao = new CollegeDetailsDAO();
	int college_id = dao.generateCollegeId();


%>
<form action="collegeDetails.jsp" method="get">
<div class="container" align="left">
 <fieldset>
  <legend>Please Fill out College Informations </legend>
  <center>
  <label for="college_id">college Id:</label>
  <input type="number" id="fname" name="student_id" value=<%=college_id %>><br><br>
  </center>
  <center>
  <label for="college_Name">Enter college Name </label>
  <input type="text" id="fname" name="college_Name" placeholder="Enter College Name "
  required="required"><br><br>
  </center>
  
  <center>
  <label for="college_code">Enter College Code</label>
  <input type="number" id="fname" name="college_code" ><br><br>
  </center>
  
  <center>
  <label for="college_pinCode">Enter College PinCode</label>
  <input type="number" id="fname" name="college_pinCode" ><br><br>
  </center>
 
  <center>
  <input class="button1" type="submit" value="save">
  <a href="skills.jsp">Next</a>
 	</center>
 </fieldset>
</div>
</form>

<%
	if(request.getParameter("student_id")!=null && request.getParameter("college_Name")!=null){
		CollegeDetails college = new CollegeDetails();
		college.setCollege_id(college_id);
		college.setCollege_Name(request.getParameter("college_Name"));
		college.setCollege_code(Integer.parseInt(request.getParameter("college_code")));
		college.setCollege_pinCode(Integer.parseInt(request.getParameter("college_pinCode")));
		dao.addCollegeDetails(college);
		%>
		
		<jsp:forward page="moveTocollegeDetails2.jsp"/>
<% 	
	}
%>


</body>
</html>