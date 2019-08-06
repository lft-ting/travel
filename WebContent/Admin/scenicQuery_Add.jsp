<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var xhr = false; 
	
	function getCity()
	{
		
		//1. 创建XMLHttpRequest对象
		//非IE浏览器
		if(window.XMLHttpRequest)
		{
			xhr = new XMLHttpRequest();
		}
		//IE浏览器
		else if(window.ActiveXObject)
		{
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
		//数据存在即可执行，0、null、""、false均不满足条件
		if(xhr)
		{
			//获取选中的省份的value属性值
			var provinceObj = document.getElementById("province");
			//选中的option的下标index
			var index = provinceObj.selectedIndex;
			//根据下标index获取具体的option
			var provinceId = provinceObj.options[index].value;
			
			//2.定url链接
			var action = "../CityServlet";
			
			//3.打开到服务器的连接
			xhr.open("post", action, true);//true 异步   false 同步
			
			//-------POST请求必须写-------------------------------------
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			//4.绑定回调函数（reponse响应回来之后会调用的函数）
			//xhr.onreadystatechange = callback_xml;
			xhr.onreadystatechange = callback_json;
			
			//5.发送请求
			xhr.send("provinceId="+provinceId);
		}
		else
		{
			alert("XMLHttpRequest创建失败");
		}
	}
	//处理响应的城市列表--------响应json格式字符串
	function callback_json()
	{
		if(xhr.readyState == 4)//响应完成
		{
			if(xhr.status == 200)//响应正常，没有404、没有500
			{
				/*
					响应的json格式的城市列表：
					[
						{"id":0,"cityId":"2001","cityName":"长沙市","father":""},
						{"id":0,"cityId":"2002","cityName":"常德市","father":""},
						{"id":0,"cityId":"2003","cityName":"湘潭市","father":""}
					]
				*/
				//所有的city对象
				var cities = eval(xhr.responseText);
				
				var cityObj = document.getElementById("city");
				cityObj.options.length = 1;//清空下拉列表
				for(var i = 0;i<cities.length;i++)
				{
					var city = cities[i];
					
					//城市编号
					var cityId = city.cityId;//<cityId>2001</cityId>
					//城市名称
					var cityName = city.cityName;//<cityName>长沙市</cityName>
					
					//绑定到城市下拉列表
					cityObj.options[cityObj.options.length] = new Option(cityName,cityId);//<option value="2001">长沙市</option>
				} 
			}
		}
	}
</script>
</head>
<body>
<form action="<%=basePath%>ScenicServlet/insertScenic" method="post">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30"></td>
    </tr>
  </table>
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" height="30"  ></td>
    <td width="771" height="30" valign="top"  class="text_blod_title">新增景点信息</td>
  </tr>
  <tr>
    <td height="15" colspan="2" ></td>
    </tr>
  <tr>
    <td colspan="2" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64"></td>
        <td width="771" height="25" align="left" class="text_cray">注：标有<span class="text_red"> *</span> 处，均为必填项</td>
      </tr>
      <tr>
        <td></td>
        <td height="15"></td>
      </tr>
    </table>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">景点信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6"></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">标题：</td>
            <td colspan="3" align="left"><input type="text" name="title" id="textfield2"/></td>
          </tr>
          <tr>
          <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">图片：</td>
            <td colspan="3" align="left"><input name="imagePath" type="text" class="text_cray" id="textfield2" /></td>
          </tr>
          <tr>
          <td width="20" align="center" class="text_red"></td>
            <td width="100" height="40" align="left" class="text_cray1">详情：</td>
            <td colspan="3" align="left"><input name="details" type="text" class="text_cray" id="textfield2" /></td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">价格：</td>
            <td colspan="3" align="left"><input name="price" type="text" class="text_cray" id="textfield2" /></td>
          </tr>
        </table>
      <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="20" colspan="6" ></td>
          </tr>
          <tr>
            <td height="15" colspan="6" align="left" class="text_title">详细信息</td>
          </tr>
          <tr>
            <td height="10" colspan="6" ></td>
          </tr>
          <tr>
            <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">景点类型：</td>
            <td colspan="3" align="left">
              <select class="text_cray" name="typeId" id="typeId">             
                <option value="1">赞品旅程</option>
                <option value="2">自由行</option>
                <option value="3">轻奢小团</option>
                <option value="4">精品短假</option>
                <option value="5">限时特惠</option>
                <option value="6">精选酒店</option>
            </select>
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">景点标签：</td>
            <td width="150" align="left" class="text_cray1">
              <select class="text_cray" name="labelId" id="labelId"">
              	<option value="1">青山绿水</option>
                <option value="2">魅力城市</option>
                <option value="3">海滩假期</option>
                <option value="4">探访古镇</option>
                <option value="5">至臻精选</option>
                <option value="6">椰岛风情</option>
                <option value="7">宜家欢乐</option>
                <option value="8">浪漫假期</option>
            </select>
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省 份：</td>
            <td align="left" class="text_cray">
            <select name="province" class="text_cray" id="province" onchange="getCity()">
                <option value="">省份</option>
                <c:forEach items="${provinceList}" var="province">
                <option value="${province.provinceId}">${province.provinceName}</option>
                </c:forEach>
            </select> 
            </td>
            <td width="48" align="left" class="text_cray">城市：</td>
            <td width="343" align="left" class="text_cray">
            <select name="city" class="text_cray" id="city">
                <option value="">市县</option>
            </select>
            </td>
          </tr>
        </table>
</table><br>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="164"></td>
    <td width="99" height="30" align="center"><input name="button" type="submit" class="buttj" id="button" value="提交"></td>
    <td width="98" ></td>
    <td width="97" align="center"><input name="button2" type="button" class="butcz" id="button2" value="取消" onclick="window.location.href='scenicQuery.jsp'"></td>
    <td width="200" ></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td height="20"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0">
<tr>
    <td height="2" background="../images/bottom_point.gif"></td>
  </tr>
  <tr>
    <td height="25" align="center" class="text_cray">copyright@放心行 旅行社网站</td>
  </tr>
</table>
</form>
<!-- <script type="text/JavaScript" src="../js/common.js"></script> -->
</body>
</html>