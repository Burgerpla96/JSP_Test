package model.dataroom;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	//파일 업로드 로직
	public static MultipartRequest upload(HttpServletRequest req, String saveDirectory) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(
					req,
					saveDirectory,
					1024*1500,
					"UTF-8",
					new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mr;
	}//////////upload

	
	
	//file 삭제 로직
	public static void deleteFile(HttpServletRequest req, String uploadPath, String attachFile) {
		//서버의 물리적 경로 얻기
		String saveDirectory = req.getServletContext().getRealPath(uploadPath);
		//파일 객체 생성
		File file = new File(saveDirectory+File.separator+attachFile);
		//파일 존재 여부 판단후 삭제
		if(file.exists()) file.delete();
		
		
	}//////////////deleteFile


	//file download
	public static void download(HttpServletRequest request, HttpServletResponse response, String filename, String uploadDir) {
		
		try {
			//2) 파일이 저장된 서버의 물리적 경로 얻기
			String saveDirectory = request.getServletContext().getRealPath(uploadDir);	
			//3) file 크기를 얻기 위한 파일 객체 생성 - 다운로드시 프로그래스바를 띄우기 위함
			File file = new File(saveDirectory+File.separator+filename);//window에는 역슬래시, 리눅스에서는 슬래시로 변경됨(File.separator)
			long length = file.length();
			//////다운로드를 위한 응답헤더 설정
			//4) 다운로드창을 보여주기 위한 응답헤더 설정
			//4-1) 웹브라우저가 인식하지 못 하는 컨텐츠타입(MIME)타입 설정
			response.setContentType("application/octet-stream");
			//4-2) 다운로드시 프로그래스바를 표시하기 위한 컨텐츠 길이 설정
			response.setContentLengthLong(length);
			//4-3) 응답헤더명: Content-disposition
			//		응답헤더명에 따른 값: attachment;filename=파일명
			//		setHeader(응답헤더명,헤더값)으로 추가
			//브라우저 종류따라 한글 파일명이 깨지는 경우가 있음
			//브자우저따라 인코딩 방식을 달리하자(파일명 인코딩)
			//InternatExp... 따라서 달리하기위한 flag
			boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 || 
						   request.getHeader("user-agent").indexOf("11.0") != -1 ||
						   request.getHeader("user-agent").toUpperCase().indexOf("EDGE") != -1;
			if(isIe) {//브라우저가 인터넷 익스플로러 혹은 엣지일때
				filename = URLEncoder.encode(filename, "UTF-8");
			}
			else {//기타 브라우저
				//new String(byte[] bytes, String charset)사용
				//1) 파일명을 byte형 배열로 변환
				//2) String 클래스의 생성자에 변환한 배열과 charset은 8859_1을 지정
				filename = new String(filename.getBytes("UTF-8"), "8859_1");
			}
			response.setHeader("Content-Disposition", "attachment; filename="+filename);
			
			/*
			IO작업을 통해 서버에 있는 파일을 웹브라우저에 바로 출력
			데이터 소스: 파일-노드 스트림:FileInputStream
					필터 스트림:BufferedInputStream
			데이터 목적지: 웹브라우저-노드 스트림:response.getOutputStream()
					필터 스트림:BufferedOutputStream
			
			*/
			//5) 서버에 있는 파일에 연결할 입력스트림 생성
			BufferedInputStream bis = 
				new BufferedInputStream(new FileInputStream(file)); 
			
			
			//6) 웹브라우저에 연결할 출력 스트림 생성
			BufferedOutputStream bos =
				new BufferedOutputStream(response.getOutputStream());
			//7) bis 로 읽고 bos로 웹 브라우저에 출려
			int data;
			while((data=bis.read()) != -1){
				bos.write(data);
				bos.flush();
			}
			//8) stream 닫기
			bis.close();
			bos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}/////////FileUtils
