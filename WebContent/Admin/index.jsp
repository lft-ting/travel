<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>管理员界面 - FANGXING放心行</title>
	<link rel="stylesheet" href="">
	<link rel="shortcut icon" href="../images/lvxing.png">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="../css/iconfont.css">

    </head>
    <body>
    <%@ include file="header.jsp" %>
    <section>
    	<div>
			<ul class="about-left">
				<li>
					<a href="<%=basePath%>ScenicServlet/selectAllScenic" target="mainFrame">
						<div class="about-icon"></div>
						<div class="mg-top-10px">
							<strong>景点管理</strong>
							<small>对景点分类查询、修改等</small>
						</div>
					</a>
				</li>
				<li>
					<a href="" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>用户管理</strong>
							<small>查看、分类新老用户</small>
						</div>
					</a>
				</li>
				<li>
					<a href="<%=basePath%>OrderSerclet/selectOrderBy" target="mainFrame">
						<div class="about-icon"></div>
						<div>
							<strong>订单管理</strong>
							<small>查看所有订单</small>
						</div>
					</a>
				</li>
				<li>
					<a href="">
						<div class="about-icon" target="mainFrame"></div>
						<div>
							<strong>留言管理</strong>
							<small>查看用户留言</small>
						</div>
					</a>
				</li>
				<li>
					<a href="">
						<div class="about-icon" target="mainFrame"></div>
						<div>
							<strong>关于我们</strong>
							<small>认识我们的团队</small>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<!-- <frame src="" name="mainFrame"> -->
		<div class="about-right">
			<iframe src="../ScenicServlet/selectAllScenic" name="mainFrame" frameborder="1" width="100%" height="646px">
		</div>
    </section>
   
    
    </body>
</html>