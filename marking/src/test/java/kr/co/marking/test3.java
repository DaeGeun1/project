package kr.co.marking;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class test3 {
	public static void main(String[] args) throws IOException, ParseException {
		String[] areaCodeArr = {"1", "2", "3", "4", "5", "6", "7", "31", "32", "33", "34", "35", "36", "37", "38", "39"};
		
		for (int i = 0; i < areaCodeArr.length; i++) {
			
			// 1. URL을 만들기 위한 StringBuilder.
			StringBuilder urlBuilder = new StringBuilder(
					"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /* URL */
			// 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
			+ "=fYqYq7FH3nWA763DVeV5nptlDiXOEtbA47wpLGUYnDCWvxIOLbScdoUOv6spTZsg0jQmTFa0swTSURZ4zIqWwg%3D%3D"); 
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
					+ URLEncoder.encode("ETC", "UTF-8")); 
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
					+ URLEncoder.encode("AppTest", "UTF-8"));
			urlBuilder.append(
					"&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
			urlBuilder.append(
					"&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCodeArr[i], "UTF-8")); 
			urlBuilder.append(
					"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("99999", "UTF-8")); 
			
			// 3. URL 객체 생성.
			URL url = new URL(urlBuilder.toString());
			// 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// 5. 통신을 위한 메소드 SET.
			conn.setRequestMethod("GET");
			// 6. 통신을 위한 Content-type SET.
			conn.setRequestProperty("Content-type", "application/json");
			// 7. 통신 응답 코드 확인.
			System.out.println("Response code: " + conn.getResponseCode());
			// 8. 전달받은 데이터를 BufferedReader 객체로 저장.
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			// 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			// 10. 객체 해제.
			rd.close();
			conn.disconnect();
			// 11. 전달받은 데이터 확인.
			//System.out.println(urlBuilder);
			
			
			
			JSONParser jParser = new JSONParser();
			
			JSONObject jobj = (JSONObject)jParser.parse(sb.toString());
			System.out.println(jobj);
			jobj = (JSONObject)jobj.get("response");
			System.out.println(jobj);
			jobj = (JSONObject)jobj.get("body");
			System.out.println(jobj);
			jobj = (JSONObject)jobj.get("items");
			System.out.println(jobj);
			JSONArray array = (JSONArray)jobj.get("item");
			
			for (int j = 0; j < array.size(); j++) {
				JSONObject jobj1 = (JSONObject)jParser.parse(sb.toString());
				jobj1 = (JSONObject)jobj1.get("response");
				jobj1 = (JSONObject)jobj1.get("body");
				jobj1 = (JSONObject)jobj1.get("items");
				JSONArray array2 = (JSONArray)jobj.get("item");
				System.out.println(array2);
				jobj1 = (JSONObject)jParser.parse(array2.get(j).toString());
				System.out.println("지역코드 = " + areaCodeArr[i]);
				System.out.println("시군구 코드 = " + jobj1.get("code"));
				System.out.println("시군구 이름 = " + jobj1.get("name"));
				String codee = jobj1.get("code").toString();
				System.out.println(codee);
				//여기까지가 시군구 셋팅 끝났어요
				
				
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
				
				urlBuilder2.append( "&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCodeArr[i], "UTF-8"));            //지역코드 
				
				urlBuilder2.append( "&" + URLEncoder.encode("sigunguCode", "UTF-8") + "=" + URLEncoder.encode(codee, "UTF-8"));         //시군구 설정

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
				
				
				System.out.println(sb2.toString());
				
				
				
				
			}
		}
		
		
	}	
}
