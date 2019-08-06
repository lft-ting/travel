<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=basePath%>js/jquery-3.2.1.js"></script>
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
			    <!-- 查询条件 -->
    	<form action="<%=basePath%>OrderSerclet/selectOrderBy" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		      	<td width="30%" align="center" class="text_cray1"></td>
		        <td width="10%" align="center" class="text_cray1">查询方式</td>
		        <td width="15%" align="left" class="text_blod"><label>
		          <select class="text_cray" id="orderBy" name="orderBy" style="width:120px">
		            <option value="">--请选择--</option>
		            <option value="scenicid">景点</option>
	                <option value="ordertime">下单时间</option>
		          </select>
		        </label></td>
		        <td width="10%" align="center" valign="middle" class="text_craybold">
		        <label>
		          <input name="Submit" type="submit" class="butcx" value="查询" style="width:80px">
		        </label>
		        </td>
		        <td width="30%" align="center" class="text_cray1"></td>
		      </tr>
		      <tr>
		        <td>&nbsp;</td>
		        <td height="20" colspan="11" align="center">&nbsp;</td>
		      </tr>
		    </table>
		</form>
		<!-- 表格显示数据 -->
		<form action="<%=basePath%>OrderSerclet/deleteOrder" method="post">
	        <table width="100%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
	          <tr align="center">
	            <td width="5%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
	            <td width="14%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">标题</td>
	            <td width="12%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">游客姓名</td>
	            <td width="14%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">电话号码</td>
	            <td width="14%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">出发日期</td>
	            <td width="7%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">数量</td>
	            <td width="8%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">总价</td>
	            <td width="14%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">备注</td>
	            <td width="12%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">下单时间</td>
	          </tr>
	          
	          <tr align="center">
	            <td height="15" colspan="9" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"></td>
	          </tr><!-- 奇数行与偶数行背景颜色：#FFFFFF #F5F5F5 -->
	          <c:forEach items="${suborderByList}" var="order" varStatus="status">
	          <tr align="center">
	          	<td class="text_cray1">
	          		<input type="checkbox" name="orderIds" value="${order.id}"><!-- ${user.id} -->
	          	</td>
	          	<td class="text_cray1">${order.getOrderDetail().getScenic().getTitle()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getName()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getPhone()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getGoDate()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getNum()}</td>
	          	<td class="text_cray1">${order.getOrderDetail().getTotal()}</td>
	          	<td class="text_cray1">${order.note}</td>
	          	<td class="text_cray1">${order.createTime}</td>
	          </tr>
	          </c:forEach>	          
	        </table>
	      	<br>
	      	<!-- 操作按钮（删除） -->
	        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
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
        </form>
        <br>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" style="width:60%">
            <td width="335" align="center"  class="text_cray">&nbsp; 总行数：${pu.rowCount } | 总页数 ： ${pu.pageCount } | 当前页码：${pu.pageNum }</td>
            <td width="284" align="center"  class="text_cray">
            	>> 
            	
            	<c:forEach begin="1" end="${pu.pageCount}" var="pageNumber">
            		<a href="<%=basePath%>ScenicServlet/selectAllScenic?pageNumber=${pageNumber}">${pageNumber}</a>
            	</c:forEach>
            	
            	&lt;&lt; 
            </td>
            <td width="154" align="right"  class="text_cray1" style="width:20%">
            <label class="text_cray"> 每页显示
                <select name="select2">
                    <option>10</option>
                    <option>20</option>
                    <option>30</option>
                  </select>
                        条信息</label>
            </td>
          </tr>
        </table>
        <br>
</body>
</html>