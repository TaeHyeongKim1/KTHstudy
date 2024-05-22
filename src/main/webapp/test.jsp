<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backweb.vo.*"   
    %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/a00_com/a01_common.css" >
<title>Insert title here</title>

<script type="text/javascript">
function validateAge() {
    var ageAbove14 = document.getElementById('ageUp');
    var proceedButton = document.getElementById('checks');
    if (ageUp.checked) {
        proceedButton.disabled = false;
    } else {
        proceedButton.disabled = true;
    }
}
</script>
</head>
<body>
<%--
# 제목
--%>
<div>
<div>
<form id="ageForm" method="post" action="main.jsp">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:70%">만14세 이상<input type="radio" name="age" id="ageUp" onclick="validateAge()"></span></strong>
<strong><span style="font-size:70%">만14세 미만<input type="radio" name="age" id="ageDown" onclick="validateAge()"></span></strong>
</form>
</div><!-- 회원선택 내용 박스3 -->
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="submit" id="checks">선택완료</button><br>
<!-- 선택완료 버튼4 -->

</div><!-- 전체 묶음1 -->
<script type="text/javascript">
function submitForm() {
    document.getElementById('ageForm').submit();
}
</script>
</body>
</html>