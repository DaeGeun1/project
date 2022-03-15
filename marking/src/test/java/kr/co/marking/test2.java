package kr.co.marking;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class test2 {
	public static void main(String[] args) throws IOException, ParseException {
		// 1. URL을 만들기 위한 StringBuilder.
		StringBuilder urlBuilder2 = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); //지역 기반 조회
		// 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
		urlBuilder2.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=fYqYq7FH3nWA763DVeV5nptlDiXOEtbA47wpLGUYnDCWvxIOLbScdoUOv6spTZsg0jQmTFa0swTSURZ4zIqWwg%3D%3D");             //서비스 키
		
		urlBuilder2.append( "&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8"));             //OS 구분 필수                                                        
		
		urlBuilder2.append( "&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8"));        //서비스명 필수   
		
		urlBuilder2.append( "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("99999", "UTF-8"));        //한페이지 출력 수
		
		urlBuilder2.append( "&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));               //제이슨타입 설정
		
		urlBuilder2.append( "&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));            //지역코드 
		
		urlBuilder2.append( "&" + URLEncoder.encode("sigunguCode", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));         //시군구 설정

		// 3. URL 객체 생성.
		URL url2 = new URL(urlBuilder2.toString());
		// 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
		HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
		// 5. 통신을 위한 메소드 SET.
		conn2.setRequestMethod("GET");
		// 6. 통신을 위한 Content-type SET.
		conn2.setRequestProperty("Content-type", "application/json");
		// 7. 통신 응답 코드 확인.
		System.out.println("Response code: " + conn2.getResponseCode());
		// 8. 전달받은 데이터를 BufferedReader 객체로 저장.
		BufferedReader rd2;
		if (conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
			rd2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		} else {
			rd2 = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
		}
		// 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
		StringBuilder sb2 = new StringBuilder();
		String line2;
		while ((line2 = rd2.readLine()) != null) {
			sb2.append(line2);
		}
		// 10. 객체 해제.
		rd2.close();
		conn2.disconnect();
		// 11. 전달받은 데이터 확인.
		//System.out.println(urlBuilder2);
		
		
		
		JSONParser jParser = new JSONParser();
		
		JSONObject jobj = (JSONObject)jParser.parse(sb2.toString());
		System.out.println(jobj);
		jobj = (JSONObject)jobj.get("response");
		System.out.println(jobj);
		jobj = (JSONObject)jobj.get("body");
		System.out.println(jobj);
		jobj = (JSONObject)jobj.get("items");
		System.out.println(jobj);
		JSONArray array = (JSONArray)jobj.get("item");
		
		for (int i = 0; i < array.size(); i++) {
			System.out.println(array.get(i));
		}
		
		JSONObject jobj1 = (JSONObject)jParser.parse(array.get(2).toString());
		System.out.println(jobj1.get("addr1"));
		
		

	}
}
