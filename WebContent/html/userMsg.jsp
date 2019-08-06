<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/user.css">
<style type="text/css">
body, html {
	min-width: 690px;
}
body{
	background: #ececec;
}
</style>
</head>
<body>
			<div class="current">
				<div class="news">
					<div class="news-left">
						<div class="touxiang">
							<img src="${user.imagePath}" alt="">
						</div>
					</div>
					<div class="news-right">
						<h3>${user.username}</h3>
						<p>性别：保密&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;来访：0	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<span><fmt:formatDate value="${user.registDate}" pattern="yyyy-MM-dd"/>&nbsp;加入</span></p>
						<p><span></span>我想去：0</p>
						<hr>
					</div>
				</div>
				<h3>我的心愿单</h3>
				<div class="news">
					<p>还没有任何选择</p>
				</div>				
			</div>
</body>
</html>