<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_apply</title>
</head>
<body>
	<c:if test="${ null eq sessionScope.memId }">
		<script>
			alert('로그인을 먼저 진행해주세요!');
			location.href='main.do';
		</script>
	</c:if>
	<div align="center">
		<h1>자바 개발자 지원서</h1>
		<p>Java, JSP, Spring에 대한 기술적 이해와 경험이 있는 분을 찾습니다.</p>
		<hr>
		<form action="applyAction.do" method="post">
			<h4>개인 정보</h4>
			<label>이름</label> <input type="text" name="name" value="${ mdto.name }" > 
			<br>
			<label>연락처</label> <input type="text" name="tel" value="${ mdto.tel }"> 
			<br> 
			<label>이메일</label><input type="email" name="email" value="${ mdto.email }">
			<hr>
			<h4>지원 분야</h4>
			<label> <input type="radio" name="field" value="publishing">웹 퍼블리싱</label> 
			<label> <input type="radio" name="field" value="frontend">프론트앤드</label> 
			<label> <input type="radio" name="field" value="application">웹 애플리케이션 개발</label>
			<hr>
			<h4>기술 능력</h4>
			<label><input type="checkbox" name="skill" value="html">HTML</label> 
			<label><input type="checkbox" name="skill" value="css">CSS</label> 
			<label><input type="checkbox" name="skill" value="javascript">JavaScript</label> 
			<label><input type="checkbox" name="skill" value="java">Java </label> 
			<label><input type="checkbox" name="skill" value="jsp">JSP </label> 
			<label><input type="checkbox" name="skill" value="spring">Spring</label>
			<hr>
			<h4>전공 분야</h4>
			<label>학과</label> 
			<select id="major" name="major">
				<option value="computer">컴퓨터공학과</option>
				<option value="elec">전기전자공학과</option>
				<option value="mechanic">기계공학과</option>
				<option value="indust">산업공학과</option>
			</select> <br>
			<br>
			<hr>
			<div>
				<input type="submit" value="접수하기"> <input type="reset" value="다시 쓰기">
			</div>
		</form>
	</div>
</body>
</html>