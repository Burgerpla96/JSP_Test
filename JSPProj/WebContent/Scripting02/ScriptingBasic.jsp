<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	/*
	선언(declaration)부
	
	 형태는   <!자바코드>
	 멤버변수의 선언 
	   또는 멤버 메서드를 선언하는 용도로 사용한다.
	 _jspService() 메소드 외부에 선언된다.
	*/
					
	public static final int INT_MAX = Integer.MAX_VALUE;
	String mVariable = "<h3>선언부에서 선언한 변수</h3>";
	int getMaxNumber(int num1, int num2){
		return num1>num2 ? num1 : num2;
	}
	
	//방법1) 내장타입과 같은 맴버 변수 생성
	JspWriter out;
	// scriptlet 에 있는 out과는 다르다.
	void showMessage(String message){
		try{
			out.println(message);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//방법2) 매개변수로 전달받기
	void showMessage(String message,JspWriter out){
		try{
			out.println(message);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptingBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소(원소)</legend>
		<% 
			/*
			스크립트렛(scriptlet)
	
			 형태는  <자바코드>
			 사용자의 요청에 따른 실행가능한 자바 코드를 작성.
			 _jspService() 메소드내에 삽입된다.
			 이 안에서는 메소드를 구성할 수 없다
			 html 및 자바스크립트 코드 및 css코드안에도 사용가능
			*/
			String localVariable = "<h4>스크립트릿 안에서 언언한 변수</h4>";
			out.println(INT_MAX);
			out.println(mVariable);
			out.println(localVariable);
			out.println("최대값: "+getMaxNumber(10, 100));
			//선언부에서 선언된 out에  _jspService() method의 out 대입
			this.out = out;
			showMessage("<h4>this.out = out 방식으로 선언부에 선언한 내장객체 전달</h4>");
			showMessage("<h4>매개변수로 내장객체 전달</h4>",out);
			
		%>
		<!--  
		표현식(expression)
					
		- 형태는 <=자바코드>
		- _jspService method 내의 자바 코드로 변환된다
		- 문장의 끝에 세미콜론(;)을 붙이지 않느다 out.print()안에 ;을 넣는것과 같다.
		- 결과를 화면에 출력한다.
		- 단순 표현식 외에 데이터의 연산이나 함수를 호출하는 것도 가능하다
		- html 및 자바스크립트 코드 및 css코드안에도 사용가능
		-->
		<h3>표현식으로 출력</h3>
		<%= INT_MAX %>   <!--  out.print(INT_MAX); 로 변환된다. -->
		<%= mVariable %>
		<%= localVariable %>
		<%= "최대값: "+getMaxNumber(10, 100) %>
		
	</fieldset>

</body>
</html>