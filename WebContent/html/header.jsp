<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lft.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
<header>
		<div class="container head">
			<h1><a href="<%=basePath%>ScenicServlet/selectScenic"><img src="../images/lvxing.png" alt="" height="70px"><p>放心行 | FANGXING</p></a></h1>
			<div>
				<form action="<%=basePath%>ScenicServlet/selectScenicByLabel">
					<input type="text" name="city" id="searchtxt" placeholder="目的地／酒店／邮轮">
					<input type="submit" value="" id="searchbtn">
					<span class="iconfont icon-sousuo" id="sbtn"></span>
				</form>
			</div>
		</div>
	</header>
	<div class="navbar">
		<div class="nav">
			<a href="<%=basePath%>ScenicServlet/selectScenic"><img src="../images/lvxing.png" alt="" height="60px"></a>
			<ul class="nav_left">
				<li class="menu1">
					<a href="<%=basePath%>ScenicServlet/selectProvince" class="na">目的地<span></span></a>
					<div class="menu">
						<dl>
							<dt>热门目的地</dt>
							<dd>
								<a href="html/hainan.html" class="ddone">三亚</a><a href="">成都</a><a href="">湛江</a><a href="">肇庆</a>
								<a href="">珠海</a><a href=""  class="ddone">长沙</a>
							</dd>
						</dl>
						<dl>
							<dt>广东</dt>
							<dd>
								<a href="" class="ddone">肇庆</a><a href="">广州</a><a href="">清远</a><a href="">湛江</a>
								<a href="">韶关</a><a href="" class="ddone">珠海</a><a href="">深圳</a>
								<a href="">佛山</a><a href="">云浮</a><a href="">阳江</a>
							</dd>
						</dl>
						<dl>
							<dt>四川</dt>
							<dd>
								<a href="" class="ddone">成都</a><a href="">乐山</a><a href="">德阳</a>
								<a href="">眉山</a><a href="">南充</a><a href=""  class="ddone">攀枝花</a>
								
							</dd>
						</dl>
						<dl>
							<dt>北京</dt>
							<dd>
								<a href="" class="ddone">北京</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>广西</dt>
							<dd>
								<a href="" class="ddone">北海</a><a href="">南宁</a><a href="">桂林</a><a href="">柳州</a>
								
							</dd>
						</dl>
						
						<dl>
							<dt>湖南</dt>
							<dd>
								<a href="" class="ddone">长沙</a><a href="">张家界</a><a href="">岳阳</a><a href="">常德</a>
								<a href="">湘潭</a><a href="" class="ddone">衡阳</a><a href="">株洲</a><a href="">娄底</a>
							</dd>
						</dl>
						<dl>
							<dt>海南</dt>
							<dd>
								<a href="" class="ddone">三亚</a><a href="">海口</a>
								
							</dd>
						</dl>
						<dl>
							<dt>浙江</dt>
							<dd>
								<a href="" class="ddone">温州</a><a href="">金华</a>
								<a href="">台州</a><a href="">宁波</a><a href="">嘉兴</a><a href="" class="ddone">丽水</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>云南</dt>
							<dd>
								<a href="" class="ddone">丽江</a><a href="">昆明</a><a href="">大理</a><a href="">西双版纳</a>
							</dd>
						</dl>
						
						<dl>
							<dt>上海</dt>
							<dd>
								<a href="" class="ddone">上海</a>
							</dd>
						</dl>
						<dl>
							<dt>重庆</dt>
							<dd>
								<a href="" class="ddone">重庆</a>
							</dd>
						</dl>
						<dl>
							<dt>山东</dt>
							<dd>
								<a href="" class="ddone">青岛</a><a href="">济南</a><a href="">烟台</a><a href="">聊城</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>福建</dt>
							<dd>
								<a href="" class="ddone">厦门</a><a href="">福州</a><a href="">莆田</a><a href="">漳州</a><a href="">泉州</a>
							</dd>
						</dl>
						
						<dl>
							<dt>其他</dt>
							<dd>
								<a href="" class="ddone">香港特别行政区</a><a href="">台湾</a><a href="" class="ddone">澳门特别行政区</a>
							</dd>
						</dl>
					</div>
				</li>
				<li class="menu2">
					<a href="luxury.html" class="na">预订行程<span></span></a>
					<div class="menu">
						<div class="process1">
							<div class="prop">预订行程</div>
							<ul class="process">
								<li><a href="luxury.html"><p>赞品旅程</p></a></li>
								<li><a href=""><p>自由行</p></a></li>
								<li><a href=""><p>轻奢小团</p></a></li>
								<li><a href="luxury.html"><p>大航海时代</p></a></li>
								<li><a href=""><p>限时特惠</p></a></li>
								<li><a href=""><p>精选酒店</p></a></li>
								<li><a href=""><p>精品短假</p></a></li>
								<li><a href="private.html"><p>私人定制</p></a></li>
							</ul>
						</div>
						<div class="process2">
							<a href=""><img src="../images/320x420.jpg" alt=""></a>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="na">折扣</a>
				</li>
				<li>
					<a href="private.html" class="na">私人定制</a>
				</li>
				<li>
					<a href="#" class="na">活动</a>
				</li>
			</ul>
			<c:if test="${not empty sessionScope.user && user.rule == 2}">
			<div class="nav_user">
				<p><a href="">用户：${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>html/user.jsp">用户信息</a></li>
						<li><a href="<%=basePath%>html/user.jsp">编辑个人信息</a></li>
						<li><a href="<%=basePath%>ExitServlet">退出</a></li>
					</ul>
				</div>
				<form action="<%=basePath%>ScenicServlet/selectScenicByLabel">
					<input type="text" name="city id="navs" placeholder="目的地／酒店／邮轮">
					<input type="submit" value="" id="navbtn">
					<span class="iconfont icon-sousuo" id="nbtn"></span>
				</form>
			</div>
			</c:if>
			<c:if test="${not empty sessionScope.user && user.rule == 1}">
			<div class="nav_user">
				<p><a href="">管理员:${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>Admin/index.jsp">景点管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">用户管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">订单管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">留言管理</a></li>
						<li><a href="<%=basePath%>ExitServlet">退出</a></li>
					</ul>
				</div>
				<form action="<%=basePath%>ScenicServlet/selectScenicByLabel">
					<input type="text" name="city" id="navs" placeholder="目的地／酒店／邮轮">
					<input type="submit" value="" id="navbtn">
					<span class="iconfont icon-sousuo" id="nbtn"></span>
				</form>
			</div>
			</c:if>
			<c:if test="${empty sessionScope.user}">
				<div class="nav_right">
				<p><a href="login.jsp">登录</a></p>
				<p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
				<p><a href="regist.jsp">注册</a></p>
				<form action="<%=basePath%>ScenicServlet/selectScenicByLabel">
					<input type="text" name="city" id="navs" placeholder="目的地／酒店／邮轮">
					<input type="submit" value="" id="navbtn">
					<span class="iconfont icon-sousuo" id="nbtn"></span>
				</form>
				</div>
			</c:if>
			
		</div>
	</div>
	<nav>
		<div class="nav">
			<ul class="nav_left">
				<li class="menu1">
					<a href="<%=basePath%>ScenicServlet/selectProvince" class="na">目的地<span></span></a>
					<div class="menu">
						<dl>
							<dt>热门目的地</dt>
							<dd>
								<a href="html/hainan.html" class="ddone">三亚</a><a href="">成都</a><a href="">湛江</a><a href="">肇庆</a>
								<a href="">珠海</a><a href=""  class="ddone">长沙</a>
							</dd>
						</dl>
						<dl>
							<dt>广东</dt>
							<dd>
								<a href="" class="ddone">肇庆</a><a href="">广州</a><a href="">清远</a><a href="">湛江</a>
								<a href="">韶关</a><a href="" class="ddone">珠海</a><a href="">深圳</a>
								<a href="">佛山</a><a href="">云浮</a><a href="">阳江</a>
							</dd>
						</dl>
						<dl>
							<dt>四川</dt>
							<dd>
								<a href="" class="ddone">成都</a><a href="">乐山</a><a href="">德阳</a>
								<a href="">眉山</a><a href="">南充</a><a href=""  class="ddone">攀枝花</a>
								
							</dd>
						</dl>
						<dl>
							<dt>北京</dt>
							<dd>
								<a href="" class="ddone">北京</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>广西</dt>
							<dd>
								<a href="" class="ddone">北海</a><a href="">南宁</a><a href="">桂林</a><a href="">柳州</a>
								
							</dd>
						</dl>
						
						<dl>
							<dt>湖南</dt>
							<dd>
								<a href="" class="ddone">长沙</a><a href="">张家界</a><a href="">岳阳</a><a href="">常德</a>
								<a href="">湘潭</a><a href="" class="ddone">衡阳</a><a href="">株洲</a><a href="">娄底</a>
							</dd>
						</dl>
						<dl>
							<dt>海南</dt>
							<dd>
								<a href="" class="ddone">三亚</a><a href="">海口</a>
								
							</dd>
						</dl>
						<dl>
							<dt>浙江</dt>
							<dd>
								<a href="" class="ddone">温州</a><a href="">金华</a>
								<a href="">台州</a><a href="">宁波</a><a href="">嘉兴</a><a href="" class="ddone">丽水</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>云南</dt>
							<dd>
								<a href="" class="ddone">丽江</a><a href="">昆明</a><a href="">大理</a><a href="">西双版纳</a>
							</dd>
						</dl>
						
						<dl>
							<dt>上海</dt>
							<dd>
								<a href="" class="ddone">上海</a>
							</dd>
						</dl>
						<dl>
							<dt>重庆</dt>
							<dd>
								<a href="" class="ddone">重庆</a>
							</dd>
						</dl>
						<dl>
							<dt>山东</dt>
							<dd>
								<a href="" class="ddone">青岛</a><a href="">济南</a><a href="">烟台</a><a href="">聊城</a>
							</dd>
						</dl>
						<div class="clear"></div>
						<dl>
							<dt>福建</dt>
							<dd>
								<a href="" class="ddone">厦门</a><a href="">福州</a><a href="">莆田</a><a href="">漳州</a><a href="">泉州</a>
							</dd>
						</dl>
						
						<dl>
							<dt>其他</dt>
							<dd>
								<a href="" class="ddone">香港特别行政区</a><a href="">台湾</a><a href="" class="ddone">澳门特别行政区</a>
							</dd>
						</dl>
					</div>
				</li>
				<li class="menu2">
					<a href="luxury.html" class="na">预订行程<span></span></a>
					<div class="menu">
						<div class="process1">
							<div class="prop">预订行程</div>
							<ul class="process">
								<li><a href="luxury.html"><p>赞品旅程</p></a></li>
								<li><a href=""><p>自由行</p></a></li>
								<li><a href=""><p>轻奢小团</p></a></li>
								<li><a href="luxury.html"><p>大航海时代</p></a></li>
								<li><a href=""><p>限时特惠</p></a></li>
								<li><a href=""><p>精选酒店</p></a></li>
								<li><a href=""><p>精品短假</p></a></li>
								<li><a href="private.html"><p>私人定制</p></a></li>
							</ul>
						</div>
						<div class="process2">
							<a href=""><img src="../images/320x420.jpg" alt=""></a>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="na">折扣</a>
				</li>
				<li>
					<a href="private.html" class="na">私人定制</a>
				</li>
				<li>
					<a href="#" class="na">活动</a>
				</li>
			</ul>
			<c:if test="${not empty sessionScope.user && user.rule == 2}">
			<div class="nav_user">
				<p><a href="">用户：${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>html/user.jsp">用户信息</a></li>
						<li><a href="<%=basePath%>html/user.jsp">编辑个人信息</a></li>
						<li><a href="<%=basePath%>ExitServlet">退出</a></li>
					</ul>
				</div>
			</div>
			</c:if>
			<c:if test="${not empty sessionScope.user && user.rule == 1}">
			<div class="nav_user">
				<p><a href="">管理员:${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>Admin/index.jsp">景点管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">用户管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">订单管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">留言管理</a></li>
						<li><a href="<%=basePath%>ExitServlet">退出</a></li>
					</ul>
				</div>
			</div>
			</c:if>
			<c:if test="${empty sessionScope.user}">
				<div class="nav_right">
				<p><a href="login.jsp">登录</a></p>
				<p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
				<p><a href="regist.jsp">注册</a></p>
				</div>
			</c:if>
		</div>
	</nav>
<script src="../js/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>120){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})
$('.nav_left>li').hover(function(){
    $(this).children('.menu').toggle()
})
$('.nav_user').hover(function(){
	$(this).children('.user').toggle()
})
</script>
</body>
</html>