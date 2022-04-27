<%@page import="com.java.jsp.StudentPersonalInformation"%>
<%@page import="com.java.jsp.StudentPersonalInformationDAO"%>
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
	StudentPersonalInformationDAO dao = new StudentPersonalInformationDAO();
	int student_id = dao.generateAgentNo();

%>


<form action="applyJob.jsp">
<div class="container" align="left">
 <fieldset>
  <legend>Please Fill out Personal Informations </legend>
  <center>
  <label for="student_id">Student Id:</label>
  <input type="number" id="fname" name="student_id" value=<%=student_id %>><br><br>
  </center>
  <center>
  <label for="student_firstName">Enter First name:</label>
  <input type="text" id="fname" name="student_firstName" required="required"><br><br>
  </center>
  
  <center>
  <label for="student_lastName">Enter Last name:</label>
  <input type="text" id="fname" name="student_lastName" ><br><br>
  </center>
  
  <center>
  <label for="student_emailId">Enter Email Id:</label>
  <input type="email" id="fname" name="student_emailId" ><br><br>
  </center>
  
  <center>
  <label for="student_password">Enter Password :</label>
  <input type="password" id="fname" name="student_password"><br><br>
  </center>
  
  <center>
   <label for="student_address">Enter student Address :</label>
  <input type="text" id="fname" name="student_address"><br><br>
  </center>
  
  <center>
   <label for="student_mobileNo">Enter Mobile Number :</label>
  <input type="text" id="fname" name="student_mobileNo"><br><br>
  </center>
  
  <center>
   <label for="student_pinCode">Enter Pin Code :</label>
  <input type="number" id="fname" name="student_pinCode"><br><br>
  </center>
  
  <center>
   <label for="Student_course">Enter Course  :</label>
  <input type="text" id="fname" name="Student_course"><br><br>
  </center>
  
  <center>
   <label for="student_branch">Enter Branch  :</label>
  <input type="text" id="fname" name="student_branch"><br><br>
  </center>
  
  <center>
  <input class="button1" type="submit" value="save">
 	</center>
 </fieldset>
</div>
</form>

	<%
		if(request.getParameter("student_firstName")!=null && request.getParameter("student_mobileNo")!=null
		&& request.getParameter("student_branch")!=null){
			StudentPersonalInformation student = new StudentPersonalInformation();
			student.setStudent_id(student_id);
			student.setStudent_firstName(request.getParameter("student_firstName"));
			student.setStudent_lastName(request.getParameter("student_lastName"));
			student.setStudent_emailId(request.getParameter("student_emailId"));
			student.setStudent_password(request.getParameter("student_password"));
			student.setStudent_addres(request.getParameter("student_address"));
			student.setStudent_mobileNo(request.getParameter("student_mobileNo"));
			student.setStudent_pinCode(Integer.parseInt(request.getParameter("student_pinCode")));
			student.setStudent_course(request.getParameter("Student_course"));
			student.setStudent_branch(request.getParameter("student_branch"));
			dao.addPerSonalInformation(student);
	%>
	
	<jsp:forward page="moveTocollegeDetails1.jsp"/>
	<% 
		}
    %>	


</body>
</html>