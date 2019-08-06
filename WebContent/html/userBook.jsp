<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script>
	function selectAllNullorReserve(obj,type){
	   if(obj!=null&&obj!=""){
	    if(document.getElementsByName(obj)!=undefined&&document.getElementsByName(obj).length>0){	//getElementsByName函数的作用按名字查找对象，返回一个数组。
	     var orderIds = document.getElementsByName(obj);
	     if(type=="全选"){
	      for(var i=0;i<orderIds.length;i++){
	       if(orderIds[i].checked == false){
	    	   orderIds[i].checked = true;
	       }
	      }
	     }else if(type=="全不选"){
	      for(var i=0;i<orderIds.length;i++){
	       if(orderIds[i].checked == true){
	    	   orderIds[i].checked = false;
	       }
	      }
	     }else if(type=="反选"){
	      for(var i=0;i<orderIds.length;i++){
	       if(orderIds[i].checked == true){
	    	   orderIds[i].checked = false;
	       }else{
	    	   orderIds[i].checked = true;
	       }
	      }
	     }
	    }
	   }  
	}
	</script>
</head>
<body>
<form action="<%=basePath%>OrderSerclet/deleteOrder" method="post">
			<div class="news">
			
			<c:forEach items="${orderList}" var="order">
			<%-- <form action="<%=basePath%>OrderSerclet/deleteOrder" method="post" style="border: 1px;"> --%>
			<div style="border: 1px solid #cecece;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
	          	<td width="45%" height="25">订单编号：${order.orderId}</td>
	          	<td width="25%" height="25"></td>
	          	<td width="30%" height="25">下单时间：${order.createTime}</td>
	          </tr>
			</table>
			<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#dadada" bgcolor="#FFFFFF">
	          <tr align="center">
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">编号</td>
	            <td width="60%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1" colspan="2">景点</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">价格</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
	          </tr>	                    
	          <tr align="center">
	          	<td class="text_cray1">
	          		<input type="checkbox" name="orderIds" value="${order.id}"><!-- ${user.id} -->
	          	</td>
	          	<td class="text_cray1">${order.id}</td>
	          	<td class="text_cray1"><img alt="" src="${order.getOrderDetail().getScenic().getImage()}" width="150px"></td>
	          	<td class="text_cray1">${order.getOrderDetail().getScenic().getTitle()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getScenic().getPrice()}</td>
	          	<td class="text_cray1">
	          		<a href="<%=basePath%>ScenicServlet/selectScenicInfo" class="text_red">详情</a>
	          	</td>
	          </tr>
	          </table>
	          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	          	<td class="text_cray1" width="60%"></td>
	          	<td class="text_cray1" width="15%">共${order.getOrderDetail().getNum()}件商品</td>
	          	<td class="text_cray1" width="15%">合计：￥${order.getOrderDetail().getTotal()}</td>
	          	<td class="text_cray1" width="10%"></td>
	          </tr>
	          </table>
	          <table width="100%">
	          <tr>
	          	<td class="text_cray1" width="90%"></td>
	          	<td class="text_cray1">
	          		<input type="submit" name="delete" value="删除订单" style="width:80px">
	          	</td>
	          </tr>          
	          </table>
			</div>
			</c:forEach>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	          <tr width="100%" height="25"></tr>
	          <tr align="center">
	            <td width="15%" align="left" class="text_cray1"><a href="#">
	              <label valign="middle">
	              <input type="checkbox" name="checkbox2" value="11"  onclick="selectAllNullorReserve('orderIds','反选')" ><span class="text_blue">全选</span>
	              </label>
	            </a></td>
	            <td width="40%" align="right"  class="text_cray1"><a href="#">
	              <!-- <input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
	            </a></td>
	            <td width="30%" align="right"  class="text_cray1"><a href="#">
	              <font color="red" size="-1">${deleteResultMsg}</font>
	              <input name="Submit22" type="submit" class="butsc" value="删除" style="width:80px">
	            </a></td>
	          </tr>
	        </table>
	        
			</div>
</form>
</body>
</html>