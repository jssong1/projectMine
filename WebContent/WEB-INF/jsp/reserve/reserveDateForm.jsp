<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Calendar"%>
    
<%
	Calendar cal = Calendar.getInstance();
//Calendar API �̿��ϱ�

	int year = cal.get(Calendar.YEAR); //���� �⵵
	int month = cal.get(Calendar.MONTH); //���� ��
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //���� ���� ��������¥
	
	Calendar firstday = Calendar.getInstance();
//���� ����� ���� Calendar ��ü �ϳ� �� ����
	firstday.set(Calendar.YEAR , year); //���� �⵵�� ����
	firstday.set(Calendar.MONTH , month); //���� ���� ����
	firstday.set(Calendar.DAY_OF_MONTH , 1); //���� ���� 1�Ϸ� ����
	int week = firstday.get(Calendar.DAY_OF_WEEK);
	//���� ���� 1���� ���� = week(��~�� : 1~7)
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
			            font-family: ����;
			            border:2px border-color:#3333FF;
			            border-radius: 8px;
			    }
				
			</style>
			
			<script type="text/javascript">
				
			
			//�ڹٽ�ũ��Ʈ �Լ� ���ǹ�
			
				
				function res(year, month, j){
					
					var today = new Date();
			//���� ���� ��¥���� ������ ���� �����Ϸ��ϸ� alert
			//������ ���ó�¥���� ����		
					if(today.getDate() > j){
						alert("��¥�� �ٽ� �������ּ���");
					}else{
			//"form1"�� input�±� text "res_date" ��(value)�� �Ѿ�� �Ķ���� ���� �̿��� ����			
			document.form1.res_date.value = year+"-"+month+"-"+j;
					}
				}
				
			 	function check(id){
				    if(!document.form1.res_date.value){
				        alert("��¥�� �����ϼ���.");
				        return false;
				    } //��¥������ ���� ������ alert�� �߰� submit false��ȯ
				} 
				
				
			</script>
	</head>
	<body>
		
    <p></p>
    <h3 align="center">���� ��¥�� �����ϼ���.</h3>
	<table id="calendar" border="3" align="center">
	    <tr>
	        <td align="center" id="tbCalendarYM" colspan="7"><%=year %>�� <%=month+1 %>��</td>
	    </tr>
	    <tr>
	        <td align="center"><font color ="#F79DC2">��</td>
	        <td align="center">��</td>
	        <td align="center">ȭ</td>
	        <td align="center">��</td>
	        <td align="center">��</td>
	        <td align="center">��</td>
	        <td align="center"><font color ="skyblue">��</td>
	    </tr>
		<tr>
			<%
			//�޷� API�� ���� �޾ƿ� ���� �� 1���� ���Ͽ� �ش��ϴ� ���ڸ�ŭ �ݺ��Ͽ�
			//1���� ���� �� 1���� ���� �������� ��ĭ���� ������´�!
				for(int i = 1; i < week; i++){
			%>
				<td>&nbsp;</td>
			<%
				}
			%>
			<%
				//���� �⵵ ���� ���� ���ϱ��� 1���� �ݺ��Ͽ� ��¥ ����
				for(int j = 1; j <= endDay; j++){
					week++;
				//��¥�� �ϳ� �þ������ ���ϵ� �ϳ��� ����
					if(week % 7 == 2){
				//�Ͽ����� �Ǹ� ��(</tr>�� �ݰ� ���ο� �� ����
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
        <input type="submit" value="����" onclick="return check()">

	</form>
	</div>
	
	</body>
</html>