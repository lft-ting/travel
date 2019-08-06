<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>海南旅游度假 - 海南住宿酒店预订 - ZANADU赞那度</title>
<link rel="shortcut icon" href="../images/lvxing.png">
<link rel="stylesheet" href="../css/hainan.css">
<link rel="stylesheet" href="../css/iconfont.css">
<link rel="stylesheet" href="../css/iconfont1.css">
<link rel="stylesheet" href="../css/iconfont2.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://api.map.baidu.com/api?v=2.0&ak=A1LU7iHS0avqQwPLAxbhKn0UYSQCuRVH"></script>
<script src="../js/jquery.baiduMap.min.js"></script>

</head>
<script type="text/javascript">
    function location(){
		window.location.href='html/city.jsp?provinceid = ${provinceid}';
	}

</script>
<body>
	<%@ include file="header.jsp" %>
	<section class="relative h573">
		<div class="bg-img"></div>
		<div class="box">
			<div class="CNA-hainan">中国</div>
			<div id="container3"class="container fl"></div>
		</div>
	</section>
	<section class="padding-t-b-60px bg-img1">
		<div class="margin-bottom-40px">
			<div class="hainan-d">
				<h2 class="margin-bottom-10px">目的地 Destinations</h2>
				<c:forEach items="${cityList}" var="city">
					<div class="hai-d hai-h">
						<a href="" title="${city.cityName}" onclick="location()">
							<img src="" alt="" height="177px">
							<div class="detail1">
								<div class="title9 t">${city.cityName}</div>
								<div class="title2 t2"></div>
							</div>
						</a>
					</div>
				</c:forEach>
				<div class="clear"></div>
			</div>
		</div>
	</section>
	<section class="padding-t-b-60px">
		<div class="hainan-d  hai-h">
			<h2 class="margin-bottom-10px">精选酒店 · 海南Hotels in HaiNan</h2>
			<div class="margin-bottom-40px">
				<div class="hotel-l">
					<a href="" title="2019元旦跨年：迎接风调雨顺新一年~">
						<img src="../images/key2_3313_bundle.jpg" alt="" width="660px" height="240px">
						<div class="detail1">
							<div class="title9 t">2019元旦跨年：迎接风调雨顺新一年~</div>
							<div class="title2 t2">中国</div>
						</div>
					</a>
				</div>
				<div class="hotel-r">
					<a href="">
						<div class="relative">
							<img src="../images/join-zanadu-2.png" alt="" height="325px">
							<div class="bottom-shade"></div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<section class="relative padding-t-b-60px">
			<div id="left"></div>
			<div id="right"></div>
		<div class="relative sec margin-bottom-40px hidden">
			
			<div class="margin-bottom-30px ">
				<h2>国内短假 </h2>
			</div>
			<ul class="FP">
				<li title="杭州所见西溪度假酒店——开启悠然的避世时光">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">独家专享</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_2614_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">杭州所见西溪度假酒店——开启悠然的避世时光</h3>
							<div class="title1"></div>
						</div>
					</a>
				</li>
				<li title="北京颐和安缦——体验皇室庭院般华贵气息">
					<a href="">
						<div class="space"><img src="../images/key3_3081_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">北京颐和安缦——体验皇室庭院般华贵气息</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
				<li title="阿丽拉乌镇开业特惠——极简江南，惊艳乌镇">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">独家专享</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_3236_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">阿丽拉乌镇开业特惠——极简江南，惊艳乌镇</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="长白山柏悦酒店——雪季又一波重磅来袭">
					<a href="">
						<div class="winter">
							冬季促销
						</div>
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">限时特惠</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_1417_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">长白山柏悦酒店——雪季又一波重磅来袭</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="阿丽拉阳朔糖舍特惠套餐——从老糖厂变身顶级设计酒店">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">冬季促销</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_2563_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">阿丽拉阳朔糖舍特惠套餐——从老糖厂变身顶级设计酒店</h3>
							<div class="icons">
							</div>
							<div class="title1">
						</div>
					</a>
				</li>
				<li class="margin-bottom-0px" title="成都博舍糅合传统和现代设计之美——精品定制，奢华优选">
					<a href="">
						<div class="space"><img src="../images/key3_1885_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">成都博舍糅合传统和现代设计之美——精品定制，奢华优选</h3>
							<div class="icons">
							</div>
							<div class="title1">
						</div>
					</a>
				</li>
				<li title="杭州所见西溪度假酒店——开启悠然的避世时光">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">独家专享</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_2614_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">杭州所见西溪度假酒店——开启悠然的避世时光</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
				<li title="北京颐和安缦——体验皇室庭院般华贵气息">
					<a href="">
						<div class="space"><img src="../images/key3_3081_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">北京颐和安缦——体验皇室庭院般华贵气息</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
				<li title="阿丽拉乌镇开业特惠——极简江南，惊艳乌镇">
					<a href="">
						<div class="sale-tag">
							<div class="line1 only-mg-top-10">独家专享</div>
							<div class="line2"></div>
						</div>
						<div class="space"><img src="../images/key3_3236_bundle.jpg" alt=""></div>
						<div class="detail">
							<h3 class="title5">阿丽拉乌镇开业特惠——极简江南，惊艳乌镇</h3>
							<div class="icons">
							</div>
							<div class="title1">
							</div>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<ol>
			<li class="current"></li>
			<li></li>
			<li></li>
		</ol>
	</section>




	

<div class="go-top">
		返回顶部
	</div>
	<%@ include file="footer2.jsp" %>
	<div class="consult"><span><img src="../images/consult.png" alt="" width="37x"></span><p>在线咨询</p></div>

<script src="../js/hainan.js"></script>
<script type="text/javascript">
var points = [{
				id: 1,
				lng: 109.501,
				lat: 18.246,
			}, {
				id: 2,
				lng: 109.721,
				lat: 18.346,
			}, {
				id: 3,
				lng: 109.83844,
				lat: 18.387522,

			}, {
				id: 4,
				lng: 109.75586,
				lat: 18.377207,

			}];



var map = new BaiduMap( {
	id:"container3",
	level:11,
	//  选填--地图级别--(默认15)
	zoom:true,
	// 选填--是否启用鼠标滚轮缩放功能--(默认false)
	type:[],
	// 选填--显示地图类型--(默认不显示)
	width:320,
	// 选填--信息窗口width--(默认自动调整)
	height:70,
	// 选填--信息窗口height--(默认自动调整)
	titleClass:"title",
	contentClass:"content",
	showPanorama:false,
	// 是否显示全景控件(默认false)
	showMarkPanorama:false,
	// 是否显示标注点全景图(默认false)
	showLabel:false,
	// 是否显示文本标注(默认false)
	mapStyle:"normal",// 默认normal,可选dark,light
	icon: {
		// 选填--自定义icon图标
		url: "../images/zuobiao.png", width:34, height:60
	}

	,
	centerPoint: {
		// 中心点经纬度
		lng: 109.753835, lat:18.29441,
	}

	,
	index:3,
	// 开启对应的信息窗口，默认-1不开启
	animate:true,
	// 是否开启坠落动画，默认false
	points:points,
	// 标注点--id(唯一标识)
	callback:function(id) {
		$(".list").find("li").eq(id - 1).addClass("active").siblings().removeClass("active")
	}

}

);
var data = map.getPosition();
var $li = $(".list").find("li");

$li.each(function(i) {
	$(this).data("id", i + 1)
}

).on("click", function() {
	map.openInfoWindow($(this).data("id"));
	$(this).addClass("active").siblings().removeClass("active")
}

).eq(data.id - 1).addClass("active");
</script>
</body>
</html>
