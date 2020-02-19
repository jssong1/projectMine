<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<style type="text/css">

	tr{
           width: 50px;
           height: 100px;
           text-align: center;
     }
     
</style>

<script type="text/javascript">
	
	function resTime(id) {
		var time = document.getElementById(id).value;
		document.form2.res_time.value = time;
		console.log("time>>: " + time);
	}

  	$(function(){
		var str = ['time1','time2','time3','time4','time5','time6','time7','time8','time9'];
		for(var i = 0; i < str.length; i++){ 
			time_check(str[i]);
		}
  	});
 	
 	function time_check(id) {
		
		var time = $("#"+id).val();
		var date = $("#date").val();
		console.log("time, date >>> : " + time + ", " +date )
		$.ajax({
			url : 'time_check.ssm?time='+ time+'&date=' + date,
			type : 'get',
			success : function(data) {
								
				if (data == 1) {
						$("#"+id).val("예약불가");
						$("#"+id).css("color", "red");
						$("#"+id).attr("disabled", true);
					}
		
				}, error : function(request,status,error) {
					console.log("Error "+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
	
</script>
	</head>
	<body>
	<table border="2" width="500" id="time">

	
				<input type="button" id="time1" value="10:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time2" value="11:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time3" value="12:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time4" value="14:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time5" value="15:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time6" value="16:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time7" value="17:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time8" value="18:00" onclick="resTime(this.id);"><br>
				<input type="button" id="time9" value="19:00" onclick="resTime(this.id);"><br>
	

	</table>

	<form name="form2" action="/reserve/reserveTimeOk.ssm">
		<p>&nbsp;</p>
		<input type="text" id="date" name="res_date" size="10" value="${res_date}" readonly>
		<input type="text" name="res_time" size="5">
		<p>&nbsp;</p>
		<textarea rows="10" cols="50" name="res_memo" placeholder="야호"></textarea>
		<input type="submit" value="다음">
	</form>
	</body>
</html>