<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
	var seconds =0;
	function displayseconds(){
		seconds +=1;
		//document.getElementById("secondsdisplay").innerHTML="Just A Moment ";
		}
//	setInterval(displayseconds,1000);

	function redirectpage(){
		window.location="skills.jsp"
		}
	setTimeout("redirectpage()",2000);


</script>

<style>
#secondsdisplay{
	width: 200;
	height: 100px;
	border-radius: 20px;
	align:center;
}

</style>
</head>
<body>
<div id="secondsdisplay" >
	<img id="image-1" alt="images" src="loader1.gif"/>

</div>
</body>
</html>