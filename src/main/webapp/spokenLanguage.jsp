<%@page import="com.java.jsp.SpokenLanguage"%>
<%@page import="com.java.jsp.SpokenLanguageDAO"%>
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
	SpokenLanguageDAO dao = new SpokenLanguageDAO();
	int spoken_id = dao.generateSpokenId();

%>
<form action="spokenLanguage.jsp" method="get">
<div class="container" align="left">
 <fieldset>
  <legend>Please Fill out Spoken Language Informations </legend>
  <center>
  <label for="spoken_id">Spoken  Id:</label>
  <input type="number" id="fname" name="spoken_id" value=<%=spoken_id %>><br><br>
  </center>
  <center>
  <label for="firstLanguage">Enter First Spoken Language </label>
  <input type="text" id="fname" name="firstLanguage" placeholder=""><br><br>
  </center>
  
  <center>
  <label for="secondLanguage">Enter Second spoken Language</label>
  <input type="text" id="fname" name="secondLanguage" ><br><br>
  </center>
  
  <center>
  <label for="thirdLanguage">Enter Other spoken Language</label>
  <input type="text" id="fname" name="thirdLanguage" ><br><br>
  </center>
 
  <center>
  <input class="button1" type="submit" value="save">
 	</center>
 </fieldset>
</div>
</form>

<%
	if(request.getParameter("spoken_id")!=null && request.getParameter("firstLanguage")!=null){
		SpokenLanguage language = new SpokenLanguage();
		language.setSpoken_id(spoken_id);
		language.setFirstLanguage(request.getParameter("firstLanguage"));
		language.setSecondLanguage(request.getParameter("secondLanguage"));
		language.setThirdLanguage(request.getParameter("thirdLanguage"));
		dao.AddSpokenLanguage(language);
%>
		<jsp:forward page="HomePageLoader.jsp"/>
<%
	}
%>	



</body>
</html>