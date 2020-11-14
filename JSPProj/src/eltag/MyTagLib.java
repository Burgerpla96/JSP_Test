package eltag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import model.BBSDao;
import model.BBSDto;

public class MyTagLib {
	//맴버변수
	private static Connection conn;
	private static ResultSet rs;
	private static PreparedStatement psmt;
	
	//[문자열이 숫자 형식이면 true,아니면 false반환]
	public static boolean isNumber(String value) {			
		for(int i=0;i < value.length();i++) {
			
			if(!(value.codePointAt(i)>='0' && value.codePointAt(i)<='9'))
				return false;
		}
		return true;
	}/////////isNumber
	
	
	
	public static String getGender(String ssn) {
		int beginIndex = ssn.indexOf("-")+1;
		int endIndex = beginIndex+1;
		String gender = ssn.substring(beginIndex, endIndex);
		switch (Integer.parseInt(gender)) {
		case 1: case 3: case 9: return "남성";
		case 0: case 2: case 4: return "여성";
		case 5: case 7: return "외국인 남성";
		case 6: case 8: return "외국인 남성";
		default: return "유효하지 않은 주민번호 입니다.";
		}
	}/////////getGender
	
	
	//javax.servlet.ServletContext
	//회원 여부 판단용
	public static boolean isMember(ServletContext context, String user, String password) {
		BBSDao dao = new BBSDao(context, "JSP", "jsp");
		boolean flag = dao.isMember(user, password);
		dao.close();
		return flag;
	}//////isMember
	
	
	
	//회원 게시판 출력용
	public static List<BBSDto> veiwSome(ServletContext context, int start, int end) {
		BBSDao dao = new BBSDao(context, "JSP", "jsp");
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<BBSDto> list = dao.selectList(map);
		dao.close();
		return list;
	}//////////
	
	
		
	
	
}// class  MyTagLib
