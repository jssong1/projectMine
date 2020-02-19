<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Calendar"%>
    
<%
	Calendar cal = Calendar.getInstance();
//Calendar API 이용하기

	int year = cal.get(Calendar.YEAR); //현재 년도
	int month = cal.get(Calendar.MONTH); //현재 월
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //현재 월의 마지막날짜
	
	Calendar firstday = Calendar.getInstance();
//요일 출력을 위한 Calendar 객체 하나 더 생성
	firstday.set(Calendar.YEAR , year); //현재 년도로 셋팅
	firstday.set(Calendar.MONTH , month); //현재 월로 셋팅
	firstday.set(Calendar.DAY_OF_MONTH , 1); //현재 월의 1일로 셋팅
	int week = firstday.get(Calendar.DAY_OF_WEEK);
	//현재 월의 1일의 요일 = week(일~토 : 1~7)
	System.out.println(week);
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		
			<style type="text/css">
				
				table{
					width: 500px;
					height: 500px;
					border-color:#3333FF;
				}
				
				tr{
					height: 40px;
				}
				
				td{
			            width: 50px;
			            height: 50px;
			            text-align: center;
			            font-size: 20px;
			            font-family: 굴림;
			            border:2px border-color:#3333FF;
			            border-radius: 8px;
			    }
				
			</style>
			
			<script type="text/javascript">
				
			
			//자바스크립트 함수 정의문
			
				
				function res(year, month, j){
					
					var today = new Date();
			//만약 오늘 날짜보다 이전의 날을 예약하려하면 alert
			//예약은 오늘날짜부터 가능		
					if(today.getDate() > j){
						alert("날짜를 다시 선택해주세요");
					}else{
			//"form1"의 input태그 text "res_date" 값(value)을 넘어온 파라미터 값을 이용해 설정			
			document.form1.res_date.value = year+"-"+month+"-"+j;
					}
				}
				
			 	function check(id){
				    if(!document.form1.res_date.value){
				        alert("날짜를 선택하세요.");
				        return false;
				    } //날짜선택을 하지 않을시 alert가 뜨고 submit false반환
				} 
				
				
			</script>
	</head>
	<body>
		
    <p></p>
    <h3 align="center">예약 날짜를 선택하세요.</h3>
	<table id="calendar" border="3" align="center">
	    <tr>
	        <td align="center" id="tbCalendarYM" colspan="7"><%=year %>년 <%=month+1 %>월</td>
	    </tr>
	    <tr>
	        <td align="center"><font color ="#F79DC2">일</td>
	        <td align="center">월</td>
	        <td align="center">화</td>
	        <td align="center">수</td>
	        <td align="center">목</td>
	        <td align="center">금</td>
	        <td align="center"><font color ="skyblue">토</td>
	    </tr>
		<tr>
			<%
			//달력 API를 통해 받아온 현재 월 1일의 요일에 해당하는 숫자만큼 반복하여
			//1부터 현재 월 1일의 요일 전까지는 빈칸으로 비워놓는다!
				for(int i = 1; i < week; i++){
			%>
				<td>&nbsp;</td>
			<%
				}
			%>
			<%
				//현재 년도 현재 월의 말일까지 1부터 반복하여 날짜 설정
				for(int j = 1; j <= endDay; j++){
					week++;
				//날짜가 하나 늘어날때마다 요일도 하나씩 증가
					if(week % 7 == 2){
				//일요일이 되면 행(</tr>을 닫고 새로운 행 생성
			%>	
		</tr>
		<tr>
			<%		} %>
			
			
			<%		if(week %7 ==1){ %> 
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:blue; align="center"><%=j%></td>
			<%		}else if(week % 7 ==2){%> 
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:red; align="center"><%=j%></td>
			<%		}else{ %> 
						<td onclick="javascript:res(<%=year%>,<%=month+1%>,<%=j%>)", style=color:black; align="center"><%=j%></td>
			<%		}
			
				}%>
		</tr>
	</table>
	<p>&nbsp;</p>
	<div align="center">
	<form name="form1" action="/reserve/reserveDateOk.ssm" >
		<input type="text" name="res_date" readonly="readonly">
        <input type="submit" value="다음" onclick="return check()">

	</form>
	</div>
	
	</body>
</html>