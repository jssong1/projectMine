<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>INDEX 첫 페이지</title>
		<style type="text/css">
		div{
			font: 20px "굴림";
		}
		
		a{text-decoration: none;}
		</style>
	</head>
	<body> 
	
		<div>
		<a href="/tMember/insertFormTMember.ssm">[관리자 교사 입력]</a>&nbsp;&nbsp;
		<a href="/tMember/listTMemberN.ssm">[관리자 미가입교사 확인]</a>&nbsp;&nbsp;<br><br>
		<a href="/tMember/checkFormTMember.ssm">[교사 회원가입]</a>&nbsp;&nbsp;
		<a href="/tMember/listTMemberY.ssm">[관리자 가입교사 승인]</a>&nbsp;&nbsp;<br><br>
		<a href="/reserve//reserveDateForm.ssm">[예약]</a>
		<a href="/visitCounsel/vcScheduleList.ssm">[스케줄]</a>
		
		</div>
	</body>
</html>