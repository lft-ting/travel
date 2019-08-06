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
	     var scenicids = document.getElementsByName(obj);
	     if(type=="全选"){
	      for(var i=0;i<scenicids.length;i++){
	       if(scenicids[i].checked == false){
	    	   scenicids[i].checked = true;
	       }
	      }
	     }else if(type=="全不选"){
	      for(var i=0;i<scenicids.length;i++){
	       if(scenicids[i].checked == true){
	    	   scenicids[i].checked = false;
	       }
	      }
	     }else if(type=="反选"){
	      for(var i=0;i<scenicids.length;i++){
	       if(scenicids[i].checked == true){
	    	   scenicids[i].checked = false;
	       }else{
	    	   scenicids[i].checked = true;
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
    	<form action="<%=basePath%>ScenicServlet/selectAllScenic" method="post">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		      <tr>
		        <td width="10%" height="25" align="center" class="text_cray1">城市</td>
		        <td width="15%" align="left" class="text_cray1">
			        <label>
			          <input name="city" type="text" class="text_cray" value="${params.getCity().getCityName()}" style="width:100px">
			        </label>
		        </td>
		        <td width="10%" align="center" class="text_cray1">类型</td>
		        <td width="15%" align="left" class="text_cray1">
		        <label>
		          <select class="text_cray" name="spottype" id="typeid" style="width:120px">
		            <option value=""></option>
		            <c:forEach items="${allscenicList}" var="alltype">
		            <option value="${alltype.getSpotType().getTypeName()}">${alltype.getSpotType().getTypeName()}</option>
					</c:forEach>
		          </select>
		        </label>
		        </td>
		        <td width="10%" align="center" class="text_cray1">标签</td>
		        <td width="15%" align="left" class="text_blod"><label>
		          <select class="text_cray" id="labelid" name="labelname" style="width:120px">
		            <option value=""></option>
		            <%-- <c:forEach items="${allscenicList}" var="alllabel">
		            <option value="${alllabel.getLabel().getLabelName()}">${alllabel.getLabel().getLabelName()}</option>
		            </c:forEach> --%>
		            <option value="青山绿水">青山绿水</option>
	                <option value="魅力城市">魅力城市</option>
	                <option value="海滩假期">海滩假期</option>
	                <option value="探访古镇">探访古镇</option>
		          </select>
		        </label></td>
		        <td width="10%" align="center" valign="middle" class="text_craybold">
		        <label>
		          <input name="Submit" type="submit" class="butcx" value="查询" style="width:80px">
		        </label>
		        </td>
		      </tr>
		      <tr>
		        <td>&nbsp;</td>
		        <td height="20" colspan="11" align="center">&nbsp;</td>
		      </tr>
		    </table>
		</form>
		<!-- 表格显示数据 -->
		<form action="<%=basePath%>ScenicServlet/deleteScenic" method="post">
	        <table width="100%" border="1" align="center" cellpadding="0" cellspacing="1" bordercolor="#dadada" bgcolor="#FFFFFF">
	          <tr align="center">
	            <td width="5%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1">选择</td>
	            <td width="18%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">图片</td>
	            <td width="14%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">标题</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">类型</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">标签</td>
	            <td width="10%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">城市</td>
	            <td width="21%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">详情</td>
	            <td width="6%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">价格</td>
	            <td width="6%" height="25" valign="middle" bordercolor="#FFFFFF" bgcolor="#FFFFFF"  class="text_cray1">操作</td>
	          </tr>
	          
	          <tr align="center">
	            <td height="15" colspan="9" bordercolor="#FFFFFF" bgcolor="#FFFFFF"   class="text_cray1"></td>
	          </tr><!-- 奇数行与偶数行背景颜色：#FFFFFF #F5F5F5 -->
	          <c:forEach items="${subscenicList}" var="scenic" varStatus="status">
	          <tr align="center">
	          	<td class="text_cray1">
	          		<input type="checkbox" name="scenicIds" value="${scenic.scenicId}"><!-- ${user.id} -->
	          	</td>
	          	<td class="text_cray1">${scenic.image}</td>
	          	<td class="text_cray1">${scenic.title}</td>
	          	<td class="text_cray1">${scenic.getSpotType().getTypeName()}</td>
	          	<td class="text_cray1">${scenic.getLabel().getLabelName()}</td>
	          	<td class="text_cray1">${scenic.getCity().getCityName()}</td>
	          	<td class="text_cray1">${scenic.details}</td>
	          	<td class="text_cray1">${scenic.price}</td>
	          	<td class="text_cray1">
	          		<a href="<%=basePath%>ScenicServlet/selectScenicInfo?id=${scenic.scenicId}" class="text_red">编辑</a>
	          	</td>
	          </tr>
	          </c:forEach>	          
	        </table>
	      	<br>
	      	<!-- 操作按钮（删除） -->
	        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	          <tr align="center">
	            <td width="15%" align="left" class="text_cray1"><a href="#">
	              <label valign="middle">
	              <input type="checkbox" name="checkbox2" value="11"  onclick="selectAllNullorReserve('scenicIds','反选')" ><span class="text_blue">全选</span>
	              </label>
	            </a></td>
	            <td width="40%" align="right"  class="text_cray1"><a href="#">
	              <!-- <input type="button" name="Submit23" value="新增" onClick="UserAdd()"> -->
	            </a></td>
	            <td width="30%" align="right"  class="text_cray1"><a href="#">
	              <font color="red" size="-1">${deleteResultMsg}</font>
	              <input name="Submit22" type="submit" class="butsc" value="删除" style="width:80px">
	            </a></td>
	            <td width="15%" align="center"  class="text_cray1"><label>
	              <input name="export" type="button" class="butdc" value="新增" style="width:80px" onclick="window.location.href='<%=basePath%>CityServlet'">
	            </label></td>
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