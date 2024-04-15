<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8>
    <title>위치 정보 가져오기</title>
    <style>
        /* 네비게이션 바 스타일 */
        nav ul {
            list-style-type: none; /* 기본 목록 스타일 제거 */
            margin: 0;
            padding: 0;
            overflow: hidden; /* 넘치는 내용 숨김 */
        }

        /* 각 항목 스타일 */
        nav ul li {
            display: inline; /* 항목들을 가로로 정렬 */
            padding: 0 10px; /* 양쪽 패딩 */
        }

        /* 링크 스타일 */
        nav ul li a {
            text-decoration: none; /* 밑줄 제거 */
            color: black; /* 텍스트 색상 */
        }

        /* 링크 뒤에 '|' 추가 */
        nav ul li:not(:last-child):after {
            content: "|"; 
            margin-left: 10px; 
        }
        
        
		table {
			width: 100%;
			border-collapse: collapse;
		}
		
		th {
			border: solid 0.5px #000;
			color: #fff;
			background-color: #0a7f25;
			
		}
		
		td {
			border: solid 0.5px #000;
			
		}
		
		tr {
			height: 40px;
		}
		
		input[type="text"], input[type="number"] {
	        height: 20px; 
	        font-size: 16px; 
    	}

    </style>
</head>
<body>
	<h1>북마크 그룹 추가</h1>
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


	<% 
		LocalDate thisTime = LocalDate.now();
		java.sql.Date now = java.sql.valueOf(thisTime);
	    String book_name = request.getParameter("bookmarkName");
	    String orderStr = request.getParameter("order");
	
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
	    try {
	        Class.forName("org.mariadb.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mariadb://172.30.1.68:3306/seoul_wifi", "beom", "eduall1881");
	        String updateQuery = " INSERT INTO bookmark_names (bookmark_name, enrolled, modified) VALUES (?, ?, ?) ";
	        PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
	        updateStmt.setString(1, book_name);
	        updateStmt.setDate(2, now);
	        updateStmt.setDate(3, now);
	        updateStmt.executeUpdate();
	        updateStmt.close();
	        }
	    } catch (Exception e) {
	        out.println("오류 발생: " + e.getMessage());
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
    %>
    
</body>
</html>
