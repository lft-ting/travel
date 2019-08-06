<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>行程 - FANGXING放心行</title>
		<link rel="shortcut icon" href="<%=basePath%>images/lvxing.png">
        <link rel="stylesheet" href="../css/cssreset.css">
		<link rel="stylesheet" href="../css/details.css">
		<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
		<link rel="stylesheet" href="<%=basePath%>css/iconfont.css">
		<script src="<%=basePath%>js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function msg(){
		$.ajax({
			url:"../MessageServlet/selectMessage",
			type:"GET",
			success:function(e){
				
			}
		});
	}
</script>		

    </head>
    
    <body onload="msg()">
<%-- <%
     Object ordermsg = session.getAttribute("errorMsg");
     if(ordermsg!=null && !"".equals(ordermsg)){
 
 %>
      <script type="text/javascript">
          alert("<%=ordermsg%>");
      </script>
<%} %> --%>

</script>
    <%@ include file="header.jsp" %>
    <div class="nav-title">
        <div class="container clearfix">
            <div class="title">
                <h2>${scenicsSpot.title}</h2>
                <small>住宿一晚+双人早餐+欢迎饮品+下午茶+露天影院+高铁站接送+每日酒店活动服务</small>
            </div>
            <div class="book">
                
                <p><strong>￥<span>${scenicsSpot.price}</span></strong> /双人1晚套餐</p>
                <button id="putin" name="putin">现在预订</button>
            </div>
        </div>
    </div>
    	<div class="newbook">
    		<div class="user-book">
    			<form action="<%=basePath%>OrderSerclet/insertOrder" class="book-form" method="post">
    				<ul>
    					<li>
    						<label for="username">姓名</label>
    						<input type="text" name="username" id="username">
    					</li>
    					<li>
    						<label for="tellphone">电话</label>
    						<input type="text" name="tellphone" id="tellphone">
    					</li>
    					<li>
    						<label for="num">数量</label>
    						<input type="text" name="num" id="num">
    					</li>
    					<li>
    						<label for="godate">出发日期</label>
    						<input type="text" name="godate" id="godate">
    					</li>
    					<li>
    						<label for="note">特需要求</label>

    						<textarea name="note" style="resize:none"></textarea> 
    					</li>
    				</ul>
    				<button type="submit">提 交</button>
					<button>取 消</button>    				
    			</form>
    		</div>
    	</div>
    <section>
    	<div class="container clearfix">
    		<div class="con_left">
    			<div class="bigimg">
    				<ul>
		    			<li><img src="../images/detail01.jpg" alt=""></li>
		    			<li><img src="../images/detail02.jpg" alt=""></li>
		    			<li><img src="../images/detail03.jpg" alt=""></li>
		    			<li><img src="../images/detail04.jpg" alt=""></li>
		    			<li><img src="../images/detail05.jpg" alt=""></li>
                        <li><img src="../images/detail06.jpg" alt=""></li>
                        <li><img src="../images/detail01.jpg" alt=""></li>
		    		</ul>
    			</div>
    			<p></p>
    			<div class="smallimg ">
    				<span id="left"></span>
		    		<span id="right"></span>
		            <ul>
		    			<li class="current"><img src="../images/smalldetail01.jpg" alt=""></li>
		    			<li><img src="../images/smalldetail02.jpg" alt=""></li>
		    			<li><img src="../images/smalldetail03.jpg" alt=""></li>
		    			<li><img src="../images/smalldetail04.jpg" alt=""></li>
		    			<li><img src="../images/smalldetail05.jpg" alt=""></li>
                        <li><img src="../images/smalldetail06.jpg" alt=""></li>
		    		</ul>
    			</div>
    		</div>
            <div class="con_right">
                <h2>套餐特色</h2>
                <ul>
                    <li>住宿一晚</li>
                    <li>双人早餐</li>
                    <li>欢迎饮品</li>
                    <li>下午茶</li>
                    <li>露天影院</li>
                    <li>高铁站接送</li>
                    <li>每日酒店活动服务</li>
                </ul>
            </div>
    	</div>
    </section>
    <main>
        <div class="container clearfix">
            <div class="f_left">
                <div class="top"><p>行程安排</p></div>
                <div class="content">
                    <div>
                        <p>${scenicsSpot.getSchedule().getSchedule()}</p>
                        <p>千里走单骑·乐山，一座温暖的院子，就这样在乌尤寺柔软的凝视下，山林繁华掩映、百年树龄的老木环绕间，诉说着中式之韵，艺术之美，和无边的乐活心境。</p>
                        <p><strong>费用包含</strong></p>
                        <p>交      通： 含税费团队/散客机票往返（团队机票将统一出票，散客机票因实时计价预定后即刻出票）；当地旅游巴士<br>住      宿： 行程所列酒店。<br>用      餐： 行程中团队标准用餐，早晚酒店套餐不用不退（中式餐或自助餐或特色餐，自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退）。<br>门      票： 行程中所含的景点首道大门票，具体请参考行程描述。<br>导      服： 当地中文导游，正规持证导游，导游全程陪同，自由活动期间除外。<br>导  服  费： 导服费30元/人。<br>儿童价标准： 年龄2~12周岁（不含），不占床,不含门票，早餐，只含往返大交通，导游，当地车位，半正餐，其他费用自理。<br></p>
                        <p><strong>费用不包含</strong></p>
                        <p>小  交  通： 景区内用车（具体请参考行程描述）<br>门      票： 行程中注明需要另行支付的自费景点（具体请参考行程描述）。<br>补      充： 因交通延阻、罢工、天气、飞机机器故障、航班取消或更改时间等不可抗力原因所引致的额外费用。；酒店内洗衣、理发、电话、传真、收费电视、饮品、烟酒等个人消费。；当地参加的自费以及以上"费用包含"中不包含的其它项目。<br>旅游意外险： 旅游人身意外保险<br></p>
                        <p><strong>位置及交通</strong></p>
                        <p>千里走单骑·乐山的具体位置，是在乐山市市中区乌尤坝2号36幢。从乐山火车站而来，驾车行驶14.1公里，大约需要28分钟，便可到达；从乐山北站而来，驾车行驶36.1公里，大约需要58分钟，便可到达。</p>
                        <p></p>
                    </div>
                    <div class="tips">
                        <h2>预约提示</h2>
                        <ol>
                            <li>预约入住日期，须提前至少3天</li>
                            <li>预约时请告知此次预订为“赞那度轻奢行”预订</li>
                            <li>入住有效期： 2019.01.14            至 2019.09.29</li>
                            <li>此套餐是以房券的形式购买（有效期内有效），具体预约入住情况需视酒店房态而定，请尽早预约。</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="f_right r_hotel">
                <p class="hoteltitle">酒店信息</p>
                <div class="hotels">
                    <p>酒店名称：<span>${scenicsSpot.getHotel().getName()}</span></p>
                    <p>房间类型：<span>${scenicsSpot.getHotel().getRoomType()}</span></p>
                    <p>咨询电话：<span>${scenicsSpot.getHotel().getAddress()}</span></p>
                    <p>酒店地址：<span>${scenicsSpot.getHotel().getTelephone()}</span></p>
                </div>
            </div>
        </div>
    </main>
    <form action="<%=basePath%>MessageServlet/insertMessage" method="post">
    <div class="container">
        <div class="message">
            <textarea name="context" id="putmsg" cols="30" rows="10"></textarea>
            <button type="submit">发表评论</button>
            <c:forEach items="${messageList}" var="message">
            <div class="msg">
                <div class="usermsg f_left">
                    <span><img src="${user.imagePath}" alt=""></span>
                    <p>${user.username}</p>
                </div>
                <div class="f_right mainmsg">
                    <p>${message.context}有才华和经验丰富的专家花艺团队每周举办几个互动的花卉工作坊，适合初学者和更有经验的人-从觅食展示、餐桌设置、植物、手工绑花束、花瓶安排、花圈制作、婚礼花等等。天气允许的情况下，参观有机花园，切割，收集灵感和鲜花，带回创意工作室。</p>
                    <p class="time"><span>时间:${message.createTime}</span></p>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
	</form>
    <script src="../js/jquery-3.2.1.js"></script>
    <script src="../js/details.js"></script>

    </body>
</html>