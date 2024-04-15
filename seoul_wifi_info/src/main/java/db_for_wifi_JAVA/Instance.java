package db_for_wifi_JAVA;

import java.time.LocalDate;

public class Instance {
	private double 거리;
	private String 관리번호; // 관리번호
	private String 자치구; // 자치구
	private String 와이파이명; // 와이파이명
	private String 도로명주소; // 도로명주소
	private String 상세주소; // 상세주소
	private String 설치위치; // 설치위치(층)
	private String 설치유형; // 설치유형
	private String 설치기관; // 설치기관
	private String 서비스구분; // 서비스구분
	private String 망종류; // 망종류
	private String 설치년도;
	private String 실내외구분;
	private String wifi접속환경;
	private double Y좌표;
	private double X좌표;
	LocalDate thisTime = LocalDate.now();
//	java.sql.Date sqlDate = resultSet.getDate("작업일자");
//	LocalDate localDate = sqlDate.toLocalDate();
	public double get거리() {
		return this.거리;
	}
	
	public void set거리(double 거리) {
		this.거리 = 거리;
	}
	
	public String get관리번호() {
		return this.관리번호;
	}

	public void set관리번호(String 관리번호) {
		this.관리번호 = 관리번호;
	}

	public String get자치구() {
		return this.자치구;
	}

	public void set자치구(String 자치구) {
		this.자치구 = 자치구;
	}

	public String get와이파이명() {
		return this.와이파이명;
	}

	public void set와이파이명(String 와이파이명) {
		this.와이파이명 = 와이파이명;
	}

	public String get도로명주소() {
		return this.도로명주소;
	}

	public void set도로명주소(String 도로명주소) {
		this.도로명주소 = 도로명주소;
	}

	public String get상세주소() {
		return this.상세주소;
	}

	public void set상세주소(String 상세주소) {
		this.상세주소 = 상세주소;
	}

	public String get설치위치() {
		return this.설치위치;
	}

	public void set설치위치(String 설치위치) {
		this.설치위치 = 설치위치;
	}

	public String get설치유형() {
		return this.설치유형;
	}

	public void set설치유형(String 설치유형) {
		this.설치유형 = 설치유형;
	}

	public String get설치기관() {
		return this.설치기관;
	}

	public void set설치기관(String 설치기관) {
		this.설치기관 = 설치기관;
	}

	public String get서비스구분() {
		return this.서비스구분;
	}

	public void set서비스구분(String 서비스구분) {
		this.서비스구분 = 서비스구분;
	}

	public String get망종류() {
		return this.망종류;
	}

	public void set망종류(String 망종류) {
		this.망종류 = 망종류;
	}

	public String get설치년도() {
		return this.설치년도;
	}

	public void set설치년도(String 설치년도) {
		this.설치년도 = 설치년도;
	}

	public String get실내외구분() {
		return this.실내외구분;
	}

	public void set실내외구분(String 실내외구분) {
		this.실내외구분 = 실내외구분;
	}

	public String getWifi접속환경() {
		return this.wifi접속환경;
	}

	public void setWifi접속환경(String wifi접속환경) {
		this.wifi접속환경 = wifi접속환경;
	}

	public double getY좌표() {
		return this.Y좌표;
	}

	public void setY좌표(double Y좌표) {
		this.Y좌표 = Y좌표;
	}

	public double getX좌표() {
		return this.X좌표;
	}

	public void setX좌표(double X좌표) {
		this.X좌표 = X좌표;
	}
	
	public LocalDate get작업일자() {
		return thisTime;
	}

	




	
}
