<%@ page import="java.sql.*,java.util.*,java.math.*" %>
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
    
    
<%-- <%
	CalculateDistance cal = new CalculateDistance();
    String userLat = request.getParameter("latitude");
    String userLon = request.getParameter("longitude");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://172.30.1.68:3306/seoul_wifi", "beom", "eduall1881");

        String query = "SELECT 관리번호, 자치구, Y좌표, X좌표 FROM wifi_info";
        pstmt = conn.prepareStatement(query);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String id = rs.getString("관리번호");
            String userCity = rs.getString("자치구");
            double wifiLat = rs.getDouble("Y좌표");
            double wifiLon = rs.getDouble("X좌표");

            // 거리 계산 로직 (Haversine 공식)
            double distance = cal.calculateDistance(Double.parseDouble(userLat), Double.parseDouble(userLon), wifiLat, wifiLon);

            // 거리 업데이트
            String updateQuery = "UPDATE wifi_info SET 거리 = ? WHERE 관리번호 = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
            updateStmt.setDouble(1, distance);
            updateStmt.setString(2, id);
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

%> --%>
    
	<%
		WifiService wifiService = new WifiService();
		List<Instance> wifiList = wifiService.WifiList();
		LocalDate thisTime = LocalDate.now();
	%>    
    <table>
		<thead>
			<tr>
				<th>거리(Km)</th>
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
				<td><%= String.format("%.4f", member.get거리()) %></td>
				<td><%= member.get관리번호()%></td>
				<td><%= member.get자치구() %></td>
				<td><a href="detail.jsp?관리번호=<%= java.net.URLEncoder.encode(member.get관리번호(), "UTF-8") %>&와이파이명=<%= java.net.URLEncoder.encode(member.get와이파이명(), "UTF-8") %>"><%= member.get와이파이명() %></a>
</td>
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
