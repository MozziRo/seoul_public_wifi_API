<%@ page import="db_for_wifi_JAVA.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>와이파이 정보 구하기</title>
<style>
table {
	width: 100%;
}

th {
	border: solid 0.5px #000;
	color: #fff;
	background-color: #0a7f25;
}

td {
	border: solid 0.5px #000;
}
</style>
</head>
<body>





	<%
		WifiService wifiService = new WifiService();
		List<Instance> wifiList = wifiService.WifiList();
		LocalDate thisTime = LocalDate.now();
	%>
	<script>
        function sendLocation() {
            if ("geolocation" in navigator) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    const userLatitude = position.coords.latitude;
                    const userLongitude = position.coords.longitude;

                    // 가정된 와이파이 위치 데이터
                    const wifiLatitude = 37.5665; 
                    const wifiLongitude = 126.9780;
					
					const myLAT = <%= wifiList.get(3).getX좌표() %>;
					const myLNT = <%= wifiList.get(3).getY좌표() %>;
						
					
                    // 거리 계산
                    const distance = calculateDistance(userLatitude, userLongitude, myLNT, myLAT);
         
                    
                    // 거리 출력
                    document.getElementById('distance').textContent = "와이파이까지의 거리: " + distance.toFixed(2) + " km";
                }, function() {
                    alert("위치 정보를 얻을 수 없습니다.");
                });
            } else {
                alert("이 브라우저는 위치 정보를 지원하지 않습니다.");
            }
        }

        function calculateDistance(lat1, lon1, lat2, lon2) {
            function toRad(x) {
                return x * Math.PI / 180;
            }

            const R = 6371; // 지구의 반지름(km)
            const dLat = toRad(lat2-lat1);
            const dLon = toRad(lon2-lon1);
            const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                      Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * 
                      Math.sin(dLon/2) * Math.sin(dLon/2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
            const d = R * c;

            return d; // km 단위
        }
    </script>
	<h1>와이파이 정보 구하기</h1>

	<h2>내 위치 정보 확인하기</h2>
	<p>
		위도: <span id="latitude"></span>
	</p>
	<p>
		경도: <span id="longitude"></span>
	</p>
	<button onclick="CurrentLocation()">위치 정보 가져오기</button>

	<script type="text/javascript" src=CurrentLocation.js>

	</script>

	<button onclick="sendLocation()">위치 정보 전송</button>
	<div id="message"></div>
	<div id="distance"></div>
	<table>
		<thead>
			<tr>
				<th>관리번호</th>
				<th>자치구</th>
				<th>와이파이명</th>
				<th>도로명주소</th>
				<th>상세주소</th>
				<th>설치위치(층)</th>
				<th>설치유형</th>
				<th>설치기관</th>
				<th>서비스구분</th>
				<th>망종류</th>
				<th>설치년도</th>
				<th>실내외구분</th>
				<th>wifi_접속환경</th>
				<th>X좌표</th>
				<th>Y좌표</th>
				<th>작업일자</th>
			</tr>
		</thead>
		<tbody>

			<%
					 // web에 보여지기 위해 out. 이라는 객체를 활용한다.
					for(Instance member : wifiList){
				%>
			<tr>
				<td><a href="detail.jsp?wifi관리번호<%= member.get관리번호() %>"> <%= member.get관리번호()%>
				</a></td>
				<td><%= member.get자치구() %></td>
				<td><%= member.get와이파이명() %></td>
				<td><%= member.get도로명주소() %></td>
				<td><%= member.get상세주소() %></td>
				<td><%= member.get설치위치() %></td>
				<td><%= member.get설치유형() %></td>
				<td><%= member.get설치기관() %></td>
				<td><%= member.get서비스구분() %></td>
				<td><%= member.get망종류() %></td>
				<td><%= member.get설치년도() %></td>
				<td><%= member.get실내외구분() %></td>
				<td><%= member.getWifi접속환경() %></td>
				<td><%= member.getX좌표() %></td>
				<td><%= member.getY좌표() %></td>
				<td><%= thisTime %></td>
			</tr>
			<% 	
					}
				%>


		</tbody>
	</table>
</body>
</html>
