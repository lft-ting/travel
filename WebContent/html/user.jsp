<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户信息 - FANGXING放心行</title>
	<link rel="shortcut icon" href="../images/lvxing.png">
	<link rel="stylesheet" href="../css/user.css">
	<link rel="stylesheet" href="../css/iconfont.css">
	<script src="../js/jquery-3.2.1.js"></script>
	<script>
	$('.about-left li').click(function(event) {
		$(this).css('background', '#CC5978').siblings('li').css('background', '#8DA7C2');
	});
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
<%-- <form name="form1" method="post" enctype="multipart/form-data"  target="_top" action="${pageContext.request.contextPath}/UploadServlet"> --%>	
	<section class="container">
		<div>
			<ul class="about-left">
				<li>
					<a href="<%=basePath%>html/userMsg.jsp" target="mainFrame">
						<div class="about-icon"></div>
						<div class="mg-top-10px">
							<strong>用户信息</strong>
						</div>
					</a>
				</li>
				<li>
					<a href="<%=basePath%>html/userMsg_Edd.jsp" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>编辑用户信息</strong>
							<small>个人信息</small>
						</div>
					</a>
				</li>
				<li>
					<a href="<%=basePath%>html/userManage.jsp" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>帐号管理</strong>
							<small>手机.邮箱.密码.社交帐户</small>
						</div>
					</a>
				</li>
				<li>
					<a href="<%=basePath%>OrderSerclet/selectOrder" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>我的预订</strong>
							<small>认识我们的团队</small>
						</div>
					</a>
				</li>
				<li>
					<a href="" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>我的赞享</strong>
							<small>认识我们的团队</small>
						</div>
					</a>
				</li>
				<li>
					
						<div class="about-icon"></div>
						<div>
							<strong>我的想去</strong>
							<small>认识我们的团队</small>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div class="about-right">
		<iframe src="<%=basePath%>html/userMsg.jsp" name="mainFrame" frameborder="1" width="100%" height="580px">
			
		</div>
		<!-- <div class="clear"></div> -->
	</section>
<!-- </form> -->
	<%@ include file="footer2.jsp" %>
	
	<script src="../js/about-us.js"></script>
</body>
</html>