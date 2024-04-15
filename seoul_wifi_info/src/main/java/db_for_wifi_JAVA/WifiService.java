package db_for_wifi_JAVA;

import java.sql.*;
import java.util.*;

public class WifiService {

    public List<Instance> WifiList(){

    	
    	List<Instance> wifiList = new ArrayList<>();
        

        String url = "jdbc:mariadb://172.30.1.68:3306/seoul_wifi";
        String dbUserId = "beom";
        String dbPassword = "eduall1881";

        //1. 드라이버 로드
        //2. 커넥션 객체 생성
        //3. statement 객체 생성
        //4. 쿼리 실행
        //5. 결과 수행
        //6. 객체 연결 해제(close)
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        String place = "강서구";

        try {
            connection = DriverManager.getConnection(url, dbUserId, dbPassword);
//            statement = connection.createStatement();
            String sql =
                            " select* " +
                            " from wifi_info " +
                            " where 자치구 = ? " +
                            " order by 거리 asc " +
                            " limit 20 ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, place);

        
            rs = preparedStatement.executeQuery();
            while (rs.next()){
            	Double 거리 = rs.getDouble("거리");
                String 관리번호 = rs.getString("관리번호");
                String 자치구 = rs.getString("자치구");
                String 와이파이명 = rs.getString("와이파이명");
                String 도로명주소 = rs.getString("도로명주소");
                String 상세주소 = rs.getString("상세주소");
                String 설치위치 = rs.getString("설치위치");
                String 설치유형 = rs.getString("설치유형");
                String 설치기관 = rs.getString("설치기관");
                String 서비스구분 = rs.getString("서비스구분");
                String 망종류 = rs.getString("망종류");
                String 설치년도 = rs.getString("설치년도");
                String 실내외구분 = rs.getString("실내외구분");
                String wifi접속환경 = rs.getString("wifi접속환경");
                Double Y좌표 = rs.getDouble("Y좌표");
                Double X좌표 = rs.getDouble("X좌표");
                
                
                Instance instance = new Instance();
                instance.set거리(거리);
                instance.set관리번호(관리번호);
                instance.set자치구(자치구);
                instance.set와이파이명(와이파이명);
                instance.set도로명주소(도로명주소);
                instance.set상세주소(상세주소);
                instance.set설치위치(설치위치);
                instance.set설치유형(설치유형);
                instance.set설치기관(설치기관);
                instance.set서비스구분(서비스구분);
                instance.set망종류(망종류);
                instance.set설치년도(설치년도);
                instance.set실내외구분(실내외구분);
                instance.setWifi접속환경(wifi접속환경);
                instance.setX좌표(X좌표);
                instance.setY좌표(Y좌표);
                
                
                wifiList.add(instance);

                System.out.println(관리번호 + ", " + 자치구 + ", " + 와이파이명 + ", " + 설치유형);
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if(rs != null && !rs.isClosed()){
                    rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                if(preparedStatement != null && !preparedStatement.isClosed()){
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                if(connection != null && !connection.isClosed()){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
		return wifiList;
    }
    
    public Instance detail(String id, String wifiName){

    	
    	Instance instance = new Instance();
        

        String url = "jdbc:mariadb://172.30.1.68:3306/seoul_wifi";
        String dbUserId = "beom";
        String dbPassword = "eduall1881";

        //1. 드라이버 로드
        //2. 커넥션 객체 생성
        //3. statement 객체 생성
        //4. 쿼리 실행
        //5. 결과 수행
        //6. 객체 연결 해제(close)
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        
        try {
            connection = DriverManager.getConnection(url, dbUserId, dbPassword);
//            statement = connection.createStatement();
            String sql =
                            " select* " +
                            " from wifi_info " +
                            " where 관리번호 = ? and 와이파이명 = ? " +
                            " order by 거리 asc " +
                            " limit 20 ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, wifiName);

        
            rs = preparedStatement.executeQuery();
            if (rs.next()){
//            	instance = new Instance();
                instance.set거리(rs.getDouble("거리"));
                instance.set관리번호(rs.getString("관리번호"));
                instance.set자치구(rs.getString("자치구"));
                instance.set와이파이명(rs.getString("와이파이명"));
                instance.set도로명주소(rs.getString("도로명주소"));
                instance.set상세주소(rs.getString("상세주소"));
                instance.set설치위치(rs.getString("설치위치"));
                instance.set설치유형(rs.getString("설치유형"));
                instance.set설치기관(rs.getString("설치기관"));
                instance.set서비스구분(rs.getString("서비스구분"));
                instance.set망종류(rs.getString("망종류"));
                instance.set설치년도(rs.getString("설치년도"));
                instance.set실내외구분(rs.getString("실내외구분"));
                instance.setWifi접속환경(rs.getString("wifi접속환경"));
                instance.setX좌표(rs.getDouble("X좌표"));
                instance.setY좌표(rs.getDouble("Y좌표"));
            
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if(rs != null && !rs.isClosed()){
                    rs.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                if(preparedStatement != null && !preparedStatement.isClosed()){
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                if(connection != null && !connection.isClosed()){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return instance;	
    }
    
}
