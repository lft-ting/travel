<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>注册会员 - FANGXING放心行</title>
	<link rel="stylesheet" href="<%=basePath%>css/cssreset.css">
	<link rel="shortcut icon" href="<%=basePath%>images/lvxing.png">
	<link rel="stylesheet" href="<%=basePath%>css/regist.css">
	<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
	<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
	<script type="text/javascript">
	
		var xhr = false;
	
		//校验用户名是否合法： 1.用户名不能为空   1.以1开头，第二位为[34578]，长度为11的数字      2.用户名是否重复
		function isUserNameValid()
		{
			//【客户端校验】1.用户名不能为空
			var userphone = $('#user').val();
			if(userphone == "")
			{
				$('#usernameMsg').html("用户名不能为空");
				return;
			}
			//【客户端校验】1.以1开头，第二位为[34578]，长度为11的数字  
			
			var regex = /^1[34578]\d{9}$/;
			if(!regex.test(userphone))
			{
				$('#usernameMsg').html("用户名必须由数字组成，并以1开头，第二位为[34578]，长度为11");
				return;
			}
			//document.getElementById("usernameMsg").innerHTML ="用户名合法 ";
			
			//【服务端校验】2.用户名是否重复
			$.ajax({
				   type: "post",  					//请求方式 get/post
				   url: "../ValidationServlet",   		//请求路径
				   data: "userphone="+userphone, 		//参数
				   success: function(response){  	//回调函数
				     $("#usernameMsg").html(response);
				   }
			});
		}
	
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<main>
		<div class="main_right">
			<div class="login">
				<%-- <h2>通过新浪微博加入与好友分享</h2>
				<div class="weibo">
					<a href="#"><span><img src="<%=basePath%>images/weibo.png" alt="" width=""></span>&nbsp;&nbsp;微博登录</a>
				</div>
				<div class="weixin"><a href="#"><span><img src="<%=basePath%>images/weixin.png" alt=""></span>&nbsp;&nbsp;微信登录</a></div>
				<div class="weixin"></div>
				<hr class="dividing_line"> --%>
				<div class="">
					<div class="regist">
						<h3>FANGXING 注册</h3>
						<span class="new"><a href="login.jsp">登录</a></span>
						<hr class="dividing_line">
					</div>
					<form class="formlogin" action="<%=basePath%>RegistServlet"  name="form" method="post">
						<input class="phone_or_email" type="text" placeholder="请输入邮箱或中国大陆手机号码" id="user" name="userphone" onblur="isUserNameValid()">
						<p color="red" size="-1" id="usernameMsg">${requestScope.errorMsg}</p>
						<input class="password" type="text" placeholder="密码" name="password" id="pass">
						<!-- <div id="forget">
							<a href="">忘记您的密码 ？</a>
						</div> -->
						<div class="next">
							<input class="nextbutton" type="submit" value="注册">
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
</body>
</html>