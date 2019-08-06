<%@page import="com.lft.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>【放心行官网】高端旅游服务-高端线上旅行服务及生活方式媒体</title>
	<link rel="shortcut icon" href="images/lvxing.png">
	<link rel="stylesheet" href="">
	<link rel="stylesheet" href="css/cssreset.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/iconfont1.css">
	<link href="css/foundation.min.css" rel="stylesheet" type="text/css">
	<link href="css/foundation-datepicker.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<div id="left"></div>
		<div id="right"></div>
		<ul class="header_pic">
			<li><a href=""><img src="images/header01.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header02.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header03.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header04.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header05.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header06.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header07.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header08.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header09.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header10.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header11.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header12.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header13.jpg" alt="" width="100%"></a></li>
			<li><a href=""><img src="images/header14.jpg" alt="" width="100%"></a></li>
		</ul>
		<ol>
			<li class="current"></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol>
		<div class="header_center">
			<h1><a href="<%=basePath%>ScenicServlet/selectScenic"><img src="images/lvxing.png" alt="" height="70px"><p>放心行 | FANGXING</p></a></h1>
			<form class="search" action="<%=basePath%>ScenicServlet/selectScenicByLabel">
				<div class="searchbar">
					<input type="text" name="city" id="" placeholder="目的地／酒店／邮轮">
					<span class="iconfont icon-ditu-dibiao"></span>
				</div>
				<div class="checkin" id="cin">
					<input type="text" class="checkindate span2" id="dpd1" placeholder="入住日期">
					<span class="date"></span>
				</div>
				<div class="checkout">
					<input type="text" class="checkoutdate span2" id="dpd2" placeholder="退房日期">
					<span class="date"></span>

				</div>
				<div class="searchdot">
					<input type="submit" value="">
					<span class=""><img src="images/search.png" alt="" width="14px"></span>
				</div>			
			</form>
		</div>
	</header>
	<div class="navbar">
		<div class="nav">
			<a href="<%=basePath%>ScenicServlet/selectScenic"><img src="images/lvxing.png" alt="" height="60px"></a>
			<ul class="nav_left">
				<li class="menu1">
					<a href="<%=basePath%>ScenicServlet/selectProvince" class="na">目的地<span></span></a>
					<div class="menu">
						<dl>
							<dt>热门目的地</dt>
							<dd>
								<a href="html/hainan.html" class="ddone">三亚</a><a href="<%=basePath%>ScenicServlet/selectDetails?id=1">成都</a><a href="">湛江</a><a href="">肇庆</a>
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
								<a href="<%=basePath%>ScenicServlet/selectDetails?id=1" class="ddone">成都</a><a href="">乐山</a><a href="">德阳</a>
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
					<a href="html/luxury.html" class="na">预订行程<span></span></a>
					<div class="menu">
						<div class="process1">
							<div class="prop">预订行程</div>
							<ul class="process">
								<li><a href="html/luxury.html"><p>赞品旅程</p></a></li>
								<li><a href=""><p>自由行</p></a></li>
								<li><a href=""><p>轻奢小团</p></a></li>
								<li><a href="html/luxury.html"><p>大航海时代</p></a></li>
								<li><a href=""><p>限时特惠</p></a></li>
								<li><a href=""><p>精选酒店</p></a></li>
								<li><a href=""><p>精品短假</p></a></li>
								<li><a href="html/private.html"><p>私人定制</p></a></li>
							</ul>
						</div>
						<div class="process2">
							<a href=""><img src="images/320x420.jpg" alt=""></a>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="na">折扣</a>
				</li>
				<li>
					<a href="html/private.html" class="na">私人定制</a>
				</li>
				<li>
					<a href="#" class="na">活动</a>
				</li>
			</ul>
			<c:if test="${not empty sessionScope.user && user.rule == 2}">
			<div class="nav_user">
				<p><a href="">用户:${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>html/user.jsp">用户信息</a></li>
						<li><a href="<%=basePath%>html/user.jsp">编辑个人信息</a></li>
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
			<c:if test="${not empty sessionScope.user && user.rule == 1}">
			<div class="nav_user">
				<p><a href="">管理员:${user.userphone}<span></span></a></p>
				<div class="user">
					<ul class="">
						<li><a href="<%=basePath%>Admin/index.jsp">景点管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">用户管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">订单管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">留言管理</a></li>
						<li><a href="<%=basePath%>Admin/index.jsp">退出</a></li>
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
					<p><a href="html/login.jsp">登录</a></p>
					<p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
					<p><a href="html/regist.jsp">注册</a></p>
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
								<a href="html/hainan.html" class="ddone">三亚</a><a href="<%=basePath%>ScenicServlet/selectDetails?id=1">成都</a><a href="">湛江</a><a href="">肇庆</a>
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
								<a href="<%=basePath%>ScenicServlet/selectDetails?id=1" class="ddone">成都</a><a href="">乐山</a><a href="">德阳</a>
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
					<a href="html/luxury.html" class="na">预订行程<span></span></a>
					<div class="menu">
						<div class="process1">
							<div class="prop">预订行程</div>
							<ul class="process">
								<li><a href="html/luxury.html"><p>赞品旅程</p></a></li>
								<li><a href=""><p>自由行</p></a></li>
								<li><a href=""><p>轻奢小团</p></a></li>
								<li><a href="html/luxury.html"><p>大航海时代</p></a></li>
								<li><a href=""><p>限时特惠</p></a></li>
								<li><a href=""><p>精选酒店</p></a></li>
								<li><a href=""><p>精品短假</p></a></li>
								<li><a href="html/private.html"><p>私人定制</p></a></li>
							</ul>
						</div>
						<div class="process2">
							<a href=""><img src="images/320x420.jpg" alt=""></a>
						</div>
					</div>
				</li>
				<li>
					<a href="#" class="na">折扣</a>
				</li>
				<li>
					<a href="html/private.html" class="na">私人定制</a>
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
				<p><a href="html/login.jsp">登录</a></p>
				<p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
				<p><a href="html/regist.jsp">注册</a></p>
				</div>
			</c:if>
		</div>
	</nav>
	<section>
		<div class="sec">
			<div class="FP_h2 margin-bottom-30px">
				<h2>品介特选 Featured Products</h2>
			</div>
			<ul class="FP">
				<li title="【轻奢小团】2019日本九州5天4晚春樱染粉之旅——暖意渐浓，漫樱飞雪（北京出发）">
					<a href="html/hainan.html">
						<div class="sale-tag">
							<div class="line1">仅剩&nbsp;<span>6</span>&nbsp;席</div>
							<div class="line2">4.4 北京出发</div>
						</div>
						<div class="space"><img src="images/key3_3317_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【轻奢小团】2019日本九州5天4晚春樱染粉之旅——暖意渐浓，漫樱飞雪（北京出发）</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-huiyuanzuanshi" title="轻奢小团"></span>
							</div>
							<div class="title1">
								相约赏樱名所，乐享温泉美食，于粉白花树间纵情捕捉春の气息
							</div>
						</div>
					</a>
				</li>
				<li title="【轻奢小团】2019五一不丹7天6晚纯净佛国之旅——奢享精品酒店，探寻幸福之源">
					<a href="html/hainan.html">
						<div class="sale-tag">
							<div class="line1">早鸟特惠 仅剩&nbsp;<span>12</span>&nbsp;席</div>
							<div class="line2">4.28 曼谷出发</div>
						</div>
						<div class="space"><img src="images/key3_3309_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【轻奢小团】2019五一不丹7天6晚纯净佛国之旅——奢享精品酒店，探寻幸福之源</h3>
							<div class="icons">
								<span class="iconfont icon-shijian mg-right-8px" title="限时特惠"></span>
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-huiyuanzuanshi" title="轻奢小团"></span>
							</div>
							<div class="title1">
								深入雷龙之地，亲触绝美自然，身处梁朝伟、刘嘉玲同款古寺，点燃108盏油灯祈福，以独特方式领略不丹的幸福奥义
							</div>
						</div>
					</a>
				</li>
				<li title="金山岭长城悦苑酒店——历史风光中的一抹现代风情">
					<a href="html/hainan.html">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">限时特惠</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_3038_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">金山岭长城悦苑酒店——历史风光中的一抹现代风情</h3>
							<div class="icons">
							</div>
							<div class="title1">
								5晚住宿：2晚松赞拉萨曲吉林卡，1晚林芝希尔顿庄园和2晚鲁朗保利雅图酒店别墅+全程交通用车：专车机场接送服务，考斯特随小团全程跟随+全程用餐：行程中每日三餐，从D1晚餐至D6早餐结束+所有行程中所列的活动和门票+全程赞那度专业陪同
							</div>
						</div>
					</a>
				</li>
				<li class="w660 margin-bottom-0px" title="【轻奢小团】2019暑期北极&amp;冰岛挪威18天16晚北极巡游——登上银海邮轮，聆听极地乐章，邂逅神秘奇景">
					<a href="">
						<div class="sale-tag">
							<div class="line1">仅剩&nbsp;<span>14</span>&nbsp;席</div>
							<div class="line2">7.10 多地出发</div>
						</div>
						<div class="space"><img src="images/key2_3279_bundle.jpg" alt="" width="660px" height="240px"></div>
						<div class="detail">
							<h3 class="title">【轻奢小团】2019暑期北极&amp;冰岛挪威18天16晚北极巡游——登上银海邮轮，聆听极地乐章，邂逅神秘奇景</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-huiyuanzuanshi" title="轻奢小团"></span>
							</div>
							<div class="title1 w660">
								尽享冰岛独特的自然风光，搭乘银海邮轮旗下最顶尖的极地探索邮轮——银云探险号，看世界尽头最奇妙的风景，与北极熊、海狮、海鸟亲密接触，深度体验北极神秘之美。
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="【至臻精选】马尔代夫维拉私人岛6天4晚名门风范之旅">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">独家专享</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_2012_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【至臻精选】马尔代夫维拉私人岛6天4晚名门风范之旅</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-hanglixiang" title="海外自由行"></span>
							</div>
							<div class="title1">
								身处如梦似幻的人间天堂，尽享超越奢华的精品旅程
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</section>
	<main>
		<div class="diff-video">
				<div class="video">
					<video id="media" src="audio/zanadu-brand.mp4" width="1020px"  controls="controls" loop="loop"></video>
				</div>
		</div>
		<div class="different margin-bottom-40px">
			<img src="images/different-zanadu-bg.jpg" alt="">
			<div class="different-video">
				<img src="images/play.png" alt="">
				<p>与众不同的FANGXING放心行</p>
			</div>
			<div class="different-world">
				<img src="images/different-world-map.png" alt="">
                为确保带给您最赞的旅行体验，我们汇聚了全中国最精英的旅行专家团队为您服务。
                每一位旅行顾问都有丰富的全球旅行经验，他们热情洋溢，细致入微，一对一为您提供的咨询，
                致力于为您打造独一无二的旅行体验，符合您的个性、兴趣、品味、预算。且我们从来不在品质上妥协。
     			<div class="different-more">
     				<a href="">了解更多</a>
     			</div>          
			</div>
		</div>
		<c:forEach items="${scenicmap}" var="smap">
		<div class="sec margin-bottom-40px">
			<div class="margin-bottom-30px">
				<h2>${smap.key} Independent Signature Journeys</h2>
			</div>
			<a href="" class="more">
				<span class="iconfont icon-jiahao"></span>
				<div class="underline">更多${smap.key}</div>

			</a>
			<ul class="FP">
			<c:forEach items="${scenicList}" var="scenic" varStatus="status" begin="0" end="5">
			<c:if test="${scenic.getSpotType().getTypeName() == smap.key}">
				<li class="margin-bottom-0px" title="${scenic.title}">
					<a href="<%=basePath%>ScenicServlet/selectDetails?id=${scenic.scenicId}">
						<div class="space"><img src="${scenic.image}" alt=""></div>
						<div class="detail">
							<h3 class="title">${scenic.title}</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								${scenic.details}
								<!-- 深入三大酒庄，乘坐复古三轮车游览芭萝莎；探秘袋鼠岛、菲利普岛，与野生动物零距离接触；直升飞机俯瞰大洋路，收获奇迹美景；塔斯马尼亚延伸游，欣赏城市与自然的融合风光。 -->
							</div>
						</div>
					</a>
				</li>
				</c:if>
			</c:forEach>
				<li title="坦桑尼亚火烈鸟天堂9天7晚野性回归之旅——与粉红精灵共舞">
					<a href="html/hainan.html">
						<div class="space"><img src="images/key3_2962_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">坦桑尼亚火烈鸟天堂9天7晚野性回归之旅——与粉红精灵共舞</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								追寻非洲大陆的美丽精灵，亲临鸟类天堂曼雅拉湖，见证东非大裂谷深处的安静奇观。
							</div>
						</div>
					</a>
				</li>
				<li title="纳米比亚9天7晚光影经典之旅——旷野大漠中感悟生命本源">
					<a href="">
						<div class="space"><img src="images/key3_1697_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">纳米比亚9天7晚光影经典之旅——旷野大漠中感悟生命本源</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								探索八千万年前的火红沙漠，仰望浩瀚纯净的银河星空，观看倒沙入海的世界奇观，感受这个奇妙国度的神秘与狂野！
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="挪威丹麦10天8晚纯净自然之旅——游走最美峡湾，畅享北欧简约风">
					<a href="">	
						<div class="space"><img src="images/key3_2052_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">挪威丹麦10天8晚纯净自然之旅——游走最美峡湾，畅享北欧简约风</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								入住挪威五大家族峡湾酒店，丰富户外活动带您全景欣赏挪威峡湾风光；参观特色博物馆，深入了解城市历史文化。
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="日本九州6天5晚经典魅力之旅——跟随四季流转，品味东瀛之美">
					<a href="">
						<div class="space"><img src="images/key3_2557_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">日本九州6天5晚经典魅力之旅——跟随四季流转，品味东瀛之美</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								从福冈到长崎，春日赏樱，夏日纳凉，秋日猎枫，冬日戏雪，在一时一物间，体会九州独特的四季之美
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="斯里兰卡9天8晚纵情自然之旅——悠享山海假期，玩转激情猎游">
					<a href="">
						<div class="recommend">
							<div>
								<span>100</span>
								%<br>会员推荐
							</div>
						</div>
						<div class="space"><img src="images/key3_2174_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">斯里兰卡9天8晚纵情自然之旅——悠享山海假期，玩转激情猎游</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-fengniao" title="赞品旅程"></span>
							</div>
							<div class="title1">
								亲近自然，品茗观景，畅览这座迷人小岛的独特魅力
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</c:forEach>
		
		<div class="sec margin-bottom-40px">
			<div class="margin-bottom-30px">
				<h2>大航海时代 Luxury Expedition Cruises</h2>
			</div>
			<ul class="FP">
				<li title="【大航海时代】保罗高更号8天7晚大溪地&amp;社会群岛魅力波利尼西亚之旅">
					<a href="">
						<div class="space"><img src="images/key3_3333_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【大航海时代】保罗高更号8天7晚大溪地&amp;社会群岛魅力波利尼西亚之旅</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-youlun" title="邮轮旅行"></span>
							</div>
							<div class="title1">
								跟随奢华邮轮保罗高更号，巡游波利尼西亚，重新发现高更画笔下的美丽岛屿
							</div>
						</div>
					</a>
				</li>
				<li title="【大航海时代】水晶合韵号13天11晚波罗的海传奇之旅">
					<a href="">
						<div class="space"><img src="images/key3_1504_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【大航海时代】水晶合韵号13天11晚波罗的海传奇之旅</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-youlun" title="邮轮旅行"></span>
							</div>
							<div class="title1">
								梦寐以求的顶级海上假期，登上真正六星邮轮，聆听美人鱼的传说
							</div>
						</div>
					</a>
				</li>
				<li title="【大航海时代】银海Muse号阿拉斯加11天9晚梦幻冰川仙境之旅">
					<a href="">
						<div class="space"><img src="images/key3_3331_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【大航海时代】银海Muse号阿拉斯加11天9晚梦幻冰川仙境之旅</h3>
							<div class="icons">
								<span class="iconfont icon-shijian mg-right-8px" title="限时特惠"></span>
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-youlun" title="邮轮旅行"></span>
							</div>
							<div class="title1">
								去阿拉斯加探险吧，遥远又神秘的天域，超越想象的自然美景和新鲜能量。
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="【大航海时代】银云探险号14天12晚穿越北极圈——聆听极地乐章，邂逅神秘奇景">
					<a href="">	
						<div class="space"><img src="images/key3_3308_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【大航海时代】银云探险号14天12晚穿越北极圈——聆听极地乐章，邂逅神秘奇景</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-youlun" title="邮轮旅行"></span>
							</div>
							<div class="title1">
								登上六星奢华探险邮轮，看最奢侈的风景，以最特雅的姿态“约会”憨萌北极熊。
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px w660" title="【大航海时代】银云探险号15天11晚南极半岛巡游——极地华丽冒险，一生只此一次">
					<a href="">
						<div class="space"><img src="images/key2_2454_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【大航海时代】银云探险号15天11晚南极半岛巡游——极地华丽冒险，一生只此一次</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-youlun" title="邮轮旅行"></span>
							</div>
							<div class="title1 w660">
								世界尽头乘风破浪，登上最奢华探险邮轮，看地球上最奢侈的风景，与冰山和企鹅亲密接触
							</div>
						</div>
					</a>
				</li>
				
			</ul>
		</div>
		
		<div class="sec margin-bottom-40px">
			<div class="margin-bottom-30px">
				<h2>精选酒店 Hotel & Resort Collections</h2>
			</div>
			<a href="" class="more">
				<span class="iconfont icon-jiahao"></span>
				<div class="underline">更多酒店</div>
			</a>
			<ul class="FP">
				<li class="l7" title="芽庄安林宁凡湾别墅度假村—酒店套餐">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">酒店套餐</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_2865_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">芽庄安林宁凡湾别墅度假村—酒店套餐</h3>
							<div class="title2 t2 out1">越南,芽庄</div>
						</div>
					</a>
				</li>
				<li class="l8" title="琅勃拉邦贝尔蒙德攀喜风筝山酒店套餐">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">酒店套餐</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_3082_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">琅勃拉邦贝尔蒙德攀喜风筝山酒店套餐</h3>
							<div class="title2 t2 out1">老挝,琅勃拉邦</div>
						</div>
					</a>
				</li>
				<li class="l9" title="暹粒圣塔玛尼吴哥-本斯利典藏馆">
					<a href="">
						<div class="space"><img src="images/key3_3301_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">暹粒圣塔玛尼吴哥-本斯利典藏馆</h3>
							<div class="title2 t2 out1">柬埔寨,暹粒</div>
						</div>
					</a>
				</li>
				<li class="l10 margin-bottom-0px" title="甲米普拉湾丽思卡尔顿隐世精品度假村——酒店套餐">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">酒店套餐</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_3293_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">甲米普拉湾丽思卡尔顿隐世精品度假村——酒店套餐</h3>
							<div class="title2 t2 out out1">泰国,甲米</div>
						</div>
					</a>
				</li>
				<li class="l11 margin-bottom-0px" title="普吉岛安达拉度假村—酒店套餐">
					<a href="">
						<div class="recommend">
							<div>
								<span>100</span>
								%<br>会员推荐
							</div>
						</div>
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">酒店套餐</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_2741_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">普吉岛安达拉度假村—酒店套餐</h3>
							<div class="title2 t2 ">泰国,普吉岛及安达曼海岸</div>
						</div>
					</a>
				</li>
				<li class="l12 margin-bottom-0px" title="普吉岛罗莱夏朵瓦纳卡恩海滩度假村—酒店套餐">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">酒店套餐</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="images/key3_2800_bundle.jpg" alt="" width="320px" height="240px"></div>
						<div class="detail">
							<h3 class="title t">普吉岛罗莱夏朵瓦纳卡恩海滩度假村—酒店套餐</h3>
							<div class="title2 t2 out out1">泰国,普吉岛</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</main>
	<div class="go-top">
		返回顶部
	</div>
	<%@ include file ="html/footer.jsp" %>
	<script src="js/jquery-3.2.1.js"></script>
	<script src="js/index.js"></script>
	<script src="js/foundation-datepicker.js"></script>
	<script src="js/locales/foundation-datepicker.zh-CN.js"></script>		
	<script>
		$('#demo-1').fdatepicker();
		$('#demo-2').fdatepicker({
			format: 'yyyy-mm-dd hh:ii',
			pickTime: true
		});
		$('#demo-3').fdatepicker();

		var nowTemp = new Date();
		var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
		var checkin = $('#dpd1').fdatepicker({
			onRender: function (date) {
				return date.valueOf() < now.valueOf() ? 'disabled' : '';
			}
		}).on('changeDate', function (ev) {
			if (ev.date.valueOf() > checkout.date.valueOf()) {
				var newDate = new Date(ev.date)
				newDate.setDate(newDate.getDate() + 1);
				checkout.update(newDate);
			}
			checkin.hide();
			$('#dpd2')[0].focus();
		}).data('datepicker');
		var checkout = $('#dpd2').fdatepicker({
			onRender: function (date) {
				return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
			}
		}).on('changeDate', function (ev) {
			checkout.hide();
		}).data('datepicker');
		</script>
</body>
</html>