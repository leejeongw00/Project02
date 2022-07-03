<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- View를 담당할 JSP에서 JSTL을 사용하기 위한 taglib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 축구</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<header>
		<jsp:include page="/layout/header.jsp" />
	</header>

    <h2>멤버</h2>
	<%
	//DB 연결
	JDBConnect jdbc = new JDBConnect();
	
	//정적쿼리 실행을 위한 statement객체 생성 및 쿼리문 준비
	String sql = "SELECT user_id, user_pw, user_name, user_email, user_phone, megister_date, memberlevel FROM member2";
	Statement stmt = jdbc.con.createStatement();
	
	//행에 영향을 주지 않는 쿼리문은 executeQuery()를 사용한다.
	//반환타입은 ResultSet 이다.
	ResultSet rs = stmt.executeQuery(sql);
	
	//반환받은 결과의 갯수만큼 반복하여 출력한다.
	while(rs.next()){
		//각 레코드의 컬럼 접근시 인덱스 혹은 컬럼명을 사용할 수 있다.
		//인덱스는 1부터 시작한다.
		String user_id = rs.getString(1);
		String user_pw = rs.getString(2);
		String user_name = rs.getString(3);
		String user_email = rs.getString(4);
		String user_phone = rs.getString(5);
		//컬럼명을 직접 사용한다.
		java.sql.Date megister_date = rs.getDate("megister_date");
		String memberlevel = rs.getString(7);
		
		out.println(String.format("%s %s %s %s %s", user_name, user_email, user_phone, megister_date, memberlevel)+ "<br/>");
	}
	//자원해제
	jdbc.close();
	%>
	<footer>
		<jsp:include page="/layout/footer.jsp" />
	</footer>
</body>
</html>