<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>赞品旅程-FANGXING放心行</title>
		<link rel="shortcut icon" href="../images/lvxing.png">
		<link rel="stylesheet" href="<%=basePath%>css/cssreset.css">
		<link rel="stylesheet" href="<%=basePath%>css/menus.css">
		<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
		<link rel="stylesheet" href="<%=basePath%>css/iconfont1.css">
    </head>
    <body>
    <%@ include file="header.jsp" %>
	<section>
			<img src="<%=basePath%>images/photo_zanpin_03.jpg" alt="" width="100%">
	</section>
	<div class="clear"></div>
	<div class="lft-nav">
		<div class="contain clearfix">
			<div class="l_choose">
			<label for="">类型</label>
			<select name="spottype" id="spottype" style="height:40px" onchange="window.location.href='<%=basePath%>ScenicServlet/selectScenicByLabel?spottype='+spottype.value">
				<option value="0">景点类型</option>
				<option value="赞品旅程">赞品旅程</option>
                <option value="自由行">自由行</option>
                <option value="轻奢小团">轻奢小团</option>
                <option value="精品短假">精品短假</option>
                <option value="限时特惠">限时特惠</option>
                <option value="精选酒店">精选酒店</option>
			</select>
			</div>
			<div class="r_choose">
			<label for="">兴趣</label>
			<select name="labelname" id="labelname" style="height:40px" onchange="window.location.href='<%=basePath%>ScenicServlet/selectScenicByLabel?labelname='+labelname.value">
				<option value="0">兴趣标签</option>
				<option value="青山绿水">青山绿水</option>
                <option value="魅力城市">魅力城市</option>
                <option value="海滩假期">海滩假期</option>
                <option value="探访古镇">探访古镇</option>
                <option value="至臻精选">至臻精选</option>
                <option value="椰岛风情">椰岛风情</option>
                <option value="宜家欢乐">宜家欢乐</option>
                <option value="浪漫假期">浪漫假期</option>
			</select>
			</div>
		</div>
	</div>
	<main>
	
		<div class="sec margin-bottom-40px">
			<%-- <div class="margin-bottom-30px">
				<h2>${map.key}</h2>
			</div>
			<a href="" class="more">
				<span class="iconfont icon-jiahao"></span>
				<div class="underline">更多旅程</div>

			</a> --%>
			<ul class="FP">
			
			<c:forEach items="${ScenicByLabel}" var="scenic">
			
				<li title="${scenic.title}">
					<a href='<%=basePath%>ScenicServlet/selectDetails?id=${scenic.scenicId}'>
						<div class="recommend">
							<div>
								<span>100</span>
								%<br>会员推荐
							</div>
						</div>
						<div class="space"><img src="${scenic.image}" alt=""></div>
						<div class="detail">
							<h3 class="title">${scenic.title}</h3>
							<div class="price">
							<div class="price_right">
								<strong>￥${scenic.price}</strong>
								<small>/人起</small>
							</div>							
							</div>
							<div class="title1">
								${scenic.details}
							</div>
						</div>
					</a>
				</li>
			
			</c:forEach>
			
			</ul>
		</div>
		<div class="sec margin-bottom-40px">
			<div class="margin-bottom-30px">
				<h2>海外自由行 Oversea Getaways</h2>
			</div>
			<a href="" class="more">
				<span class="iconfont icon-jiahao"></span>
				<div class="underline">更多海外自由行</div>

			</a>
			<ul class="FP">
				<li title="【椰岛风情】苏梅岛四季度假村5天4晚桃源幽享之旅">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">限时特惠</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_2468_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【椰岛风情】苏梅岛四季度假村5天4晚桃源幽享之旅</h3>
							<div class="icons">
								<span class="iconfont icon-shijian mg-right-8px" title="限时特惠"></span>
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-hanglixiang" title="海外自由行"></span>
							</div>
							<div class="title1">
								柔软的白沙、湛蓝的海水、摇曳的椰林......这里是隐秘的伊甸，世外的桃源。
							</div>
						</div>
					</a>
				</li>
				<li title="【宜家欢乐】日本北海道星野Tomamu度假村4天3晚冰雪奇缘之旅">
					<a href="">
						<div class="space"><img src="../images/key3_3180_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【宜家欢乐】日本北海道星野Tomamu度假村4天3晚冰雪奇缘之旅</h3>
							<div class="icons">
								<span class="iconfont icon-feiji1" title="含机票"></span>
								<span class="iconfont icon-hanglixiang" title="海外自由行"></span>
							</div>
							<div class="title1">
								顶级粉雪、雪上娱乐、北海道美食、露天温泉，这里的一切都让人流连忘返！
							</div>
						</div>
					</a>
				</li>
				<li title="【浪漫假期】澳大利亚汉密尔顿岛4晚发现大堡礁之旅">
					<a href="">
						<div class="recommend">
							<div>
								<span>100</span>
								%<br>会员推荐
							</div>
						</div>
						<div class="space"><img src="../images/key3_1289_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title">【浪漫假期】澳大利亚汉密尔顿岛4晚发现大堡礁之旅</h3>
							<div class="icons">
								<span class="iconfont icon-hanglixiang" title="海外自由行"></span>
							</div>
							<div class="title1">
								蓝色天水间充满浪漫与活力的度假胜地
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</main>
	<div class="go-top">
		返回顶部
	</div>
	<%@ include file="footer2.jsp" %>
	<script src="../js/jquery-3.2.1.js"></script>
	<script src="../js/menus.js"></script>	
    </body>
</html>