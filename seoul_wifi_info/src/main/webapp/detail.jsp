<%@ page import="db_for_wifi_JAVA.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8>
    <title>위치 정보 가져오기</title>
    <style>
        
        nav ul {
            list-style-type: none; 
            margin: 0;
            padding: 0;
            overflow: hidden; 
        }

        
        nav ul li {
            display: inline; 
            padding: 0 10px; 
        }

       
        nav ul li a {
            text-decoration: none; 
            color: black; 
        }

       
        nav ul li:not(:last-child):after {
            content: "|"; 
            margin-left: 10px; 
        }
        
        
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
		
		.info-message {
        text-align: center; 
        padding-top: 20px; 
        padding-bottom: 20px; 
    }

    </style>
</head>

	<h1>와이파이 정보 구하기</h1>
	<br>
	<nav>
        <ul>
            <li><a href="index.html">홈</a></li>
            <li><a href="location-history.jsp">위치 히스토리 목록</a></li>
            <li><a href="location.jsp">Open API 와이파이 정보 가져오기</a></li>
            <li><a href="open-book-mark.jsp">북마크 보기</a></li>
            <li><a href="manage-book-mark.jsp">북마크 그룹 관리</a></li>
        </ul>
    </nav>
	<br>
<body>


	<%	
		String id = request.getParameter("관리번호");
		String wifiName = request.getParameter("와이파이명");
		WifiService wifiService = new WifiService();
		Instance instance = wifiService.detail(id, wifiName);
		LocalDate thisTime = LocalDate.now();
	%>
	<h1>상세 정보</h1>
	<table>
		<colgroup>
			<col style="width: 20%;"/>
			<col style="width: 80%;"/>
		</colgroup>
		<tbody>
			<tr>
				<th>거리(Km)</th>
				<td>
					<%= instance.get거리() %>
				</td>
			</tr>
			<tr>
				<th>관리번호</th>
				<td>
					<%= instance.get관리번호() %>
				</td>
			</tr>
			<tr>
				<th>자치구</th>
				<td>
					<%= instance.get자치구() %>
				</td>
			</tr>
			<tr>
				<th>와이파이명</th>
				<td>
					<%= instance.get와이파이명() %>
				</td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td>
					<%= instance.get도로명주소() %>
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>
					<%= instance.get상세주소() %>
				</td>
			</tr>
			<tr>
				<th>설치위치</th>
				<td>
					<%= instance.get설치위치() %>
				</td>
			</tr>
			<tr>
				<th>설치유형</th>
				<td>
					<%= instance.get설치유형() %>
				</td>
			</tr>
			<tr>
				<th>설치기관</th>
				<td>
					<%= instance.get설치기관() %>
				</td>
			</tr>
			<tr>
				<th>서비스구분</th>
				<td>
					<%= instance.get서비스구분() %>
				</td>
			</tr>
			<tr>
				<th>망종류</th>
				<td>
					<%= instance.get망종류() %>
				</td>
			</tr>
			<tr>
				<th>설치년도</th>
				<td>
					<%= instance.get설치년도() %>
				</td>
			</tr>
			<tr>
				<th>실내외구분</th>
				<td>
					<%= instance.get실내외구분() %>
				</td>
			</tr>
			<tr>
				<th>wifi접속환경</th>
				<td>
					<%= instance.getWifi접속환경() %>
				</td>
			</tr>
			<tr>
				<th>X좌표</th>
				<td>
					<%= instance.getX좌표() %>
				</td>
			</tr>
			<tr>
				<th>Y좌표</th>
				<td>
					<%= instance.getY좌표() %>
				</td>
			</tr>
			<tr>
				<th>작업일자</th>
				<td>	
					<%= instance.get작업일자() %>
				</td>
			</tr>
			

		</tbody>
	</table>
</body>
</html>