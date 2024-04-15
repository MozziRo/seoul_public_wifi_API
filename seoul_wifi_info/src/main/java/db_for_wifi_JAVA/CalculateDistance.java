package db_for_wifi_JAVA;

public class CalculateDistance {
	public double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
	    final int R = 6371; // 지구의 반지름 (킬로미터 단위)
	
	    double latDistance = Math.toRadians(lat2 - lat1);
	    double lonDistance = Math.toRadians(lon2 - lon1);
	    double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
	            + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
	            * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	
	    double distance = R * c; // 거리 계산
	
	    return distance;
	}
}
