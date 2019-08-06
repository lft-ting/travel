<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>会员登录 - FANGXING放心行</title>
	<link rel="stylesheet" href="<%=basePath%>css/cssreset.css">
	<link rel="shortcut icon" href="<%=basePath%>images/lvxing.png">
	<link rel="stylesheet" href="<%=basePath%>css/login.css">
	<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<main>
		<div class="main_right">
			<div class="login">
				<h2>通过新浪微博加入与好友分享</h2>
				<div class="weibo">
					<a href="#"><span><img src="<%=basePath%>images/weibo.png" alt="" width=""></span>&nbsp;&nbsp;微博登录</a>
				</div>
				<div class="weixin"><a href="#"><span><img src="<%=basePath%>images/weixin.png" alt=""></span>&nbsp;&nbsp;微信登录</a></div>
				<div class="weixin"></div>
				<hr class="dividing_line">
				<div class="">
					<div class="regist">
						<h3>FANGXING 登录</h3>
						<span class="new"><a href="regist.jsp">注册新用户</a></span>
					</div>
					<form class="formlogin" action="<%=basePath%>LoginServlet"  name="form" method="post">
						<input class="phone_or_email" type="text" placeholder="请输入邮箱或中国大陆手机号码" id="user" name="userphone" >
						<font color="red" size="-1">${requestScope.errorMsg}</font>
						<input class="password" type="text" placeholder="密码" name="password" id="pass">
						<div id="forget">
							<a href="">忘记您的密码 ？</a>
						</div>
						<div class="next">
							<input class="nextbutton" type="submit" value="登录">
							<span class="pink1"></span>
							<span class="pink2"></span>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br class="clear">
	</main>
	<%@ include file="footer2.jsp" %>
	<script src="<%=basePath%>js/jquery-3.2.1.js"></script>
	<script src="<%=basePath%>js/login.js"></script>
</body>
</html>