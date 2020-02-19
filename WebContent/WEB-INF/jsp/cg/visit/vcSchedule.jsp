<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ssm.mi.member.vo.VisitCounsel_RsvVO"%>
<%@ page import = "java.util.ArrayList"%>
 <% request.setCharacterEncoding("EUC-KR"); 
	
	Object obj = request.getAttribute("timeList");
	System.out.println("obj1 >>> : " +obj);

	
		ArrayList<VisitCounsel_RsvVO> aList = (ArrayList<VisitCounsel_RsvVO>) obj;
		System.out.println("jsp timeList>>>: "+ aList);
		VisitCounsel_RsvVO rsvVO = aList.get(0);
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>cacacacal</title>
		<link href="https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css" rel="stylesheet">
		<link href="https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css" rel="stylesheet">
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js"></script>
		<script src="https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js"></script>
		<script src="https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js"></script>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				
				  var calendarEl = document.getElementById('calendar');
				  var calendar = new FullCalendar.Calendar(calendarEl, {
				    plugins: [ 'interaction', 'dayGrid' ],
				    timeZone: 'local', // 시간 <- 현재지역 시간으로 설정
				    defaultView: 'dayGridWeek',
				    hiddenDays: [ 0, 6 ],
				    selectable : true,
				    header: {
				      left: 'prev,next',
				      center: 'title',
				      right: 'dayGridWeek'
				    },
				    dateClick : function(click){
				    	alert("데이터");
				    	alert(click.dateStr);
				    	dateInsert();
				    },
				    editable: false,
				    events: [
				    {
				    	groupId : 'counseling0',
					    daysOfWeek : [1,2,3,4,5],
				    	title : '<%=aList.get(0).getVrTime()%>'
				    },
				    {
				    	groupId : 'counseling1',
					    daysOfWeek : [1,3,5],
				    	title : '<%=aList.get(1).getVrTime()%>'
				    },
				    {
				    	groupId : 'counseling2',
					    daysOfWeek : [1,2,3,4,5],
				    	title : '<%=aList.get(2).getVrTime()%>'
				    },
				    {
				    	groupId : 'counseling3',
					    daysOfWeek : [1,2,4,5],
				    	title : '<%=aList.get(3).getVrTime()%>'
				    },
				    {
				    	groupId : 'counseling4',
					    daysOfWeek : [1,2,3,4,5],
				    	title : '<%=aList.get(4).getVrTime()%>'
				    }
			    	],
			    	eventClick:function(info) {
		                var eventObj = info.event;
		                alert("Clicked >>> : " + eventObj.title);
		                log.console("");
		            }
				  });
	
				  calendar.render();
				});
			
			function dateInsert(){
				alert(">>>");
				$ajax({
					url : ''
				});
			}
		</script>
		<style>
			html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 7px;
			}
			
			#calendar {
			  max-width: 900px; /* max-width : width의 값이 설정한 값보다 커지는 것을 방지 */
			  width : 500px;
			  margin: 40px auto;
			  text-align : center;
			}
			
		</style>
	</head>
	<body>
		<div id="calendar"></div>
	</body>
</html>