<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#aa {
		position:absolute;
		left:100px;
		top:200px;
		width:140px;
		height:140px;
		background:orange;
	}
</style>
<script>
	var left = 100;
	var ss;
	function leftMove() {
		left--;
		document.getElementById('aa').style.left = left+"px";
		document.getElementById('aa').innerText = left+"px";
		if(left == 100) {
			clearInterval(ss);
			ss = setInterval(rightMove,10);
		}
	}
	function rightMove() {
		left++;
		document.getElementById('aa').style.left = left+"px";
		document.getElementById('aa').innerText = left+"px";
		if(left == 400) {
			clearInterval(ss);
			ss = setInterval(leftMove,10);
		}
	}
	function start() {
		ss = setInterval(rightMove,10);
	}
</script>
</head>
<body>
	
	<div id="aa"></div>
	<input type="button" value="Click Me to Start!" onclick="start()"><br>
	
</body>
</html>