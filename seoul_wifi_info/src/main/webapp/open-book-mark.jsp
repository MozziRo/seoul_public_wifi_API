<%@ page import="db_for_wifi_JAVA.*" %>
<%@ page import="java.time.LocalDate"%>
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

    </style>
</head>
<body>
	<h1>와이파이 정보 구하기</h1>
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
	<form action="add-bookmark.jsp" method="post">
	    <table>
	        <colgroup>
	            <col style="width: 20%;">
	            <col style="width: 80%;">
	        </colgroup>
	        <tbody>
	            <tr>
	                <th>북마크 이름</th>
	                <td>
	                    <input type="text" id="bookmarkName" name="bookmarkName" required>
	                </td>
	            </tr>
	            <tr>
	                <th>순서</th>
	                <td>
	                    <input type="number" id="order" name="order" required>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <br>
	    <button type="submit">북마크 추가</button>
	</form>

	
	
</body>
</html>