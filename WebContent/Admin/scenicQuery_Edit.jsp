<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lft.entity.ScenicSpot" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=basePath%>ScenicServlet/updateScenic" method="post">
  <table width="100%" border="0" cellspacing="0">
    <tr>
      <td height="30"></td>
    </tr>
  </table>
  <c:forEach items="${ScenicInfo}" var="scenicInfo">
<table width="835" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="20" colspan="2" ></td>
  </tr>
  <tr>
    <td width="64" height="30"  ></td>
    <td width="771" height="30" valign="top"  class="text_blod_title">编辑景点信息</td>
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
            <td colspan="3" align="left"><input type="text" name="title" id="textfield2" value="${scenicInfo.title}"/></td>
          </tr>
          <tr>
          <td width="20" align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">图片：</td>
            <td colspan="3" align="left"><input name="imagePath" disabled="true" type="text" class="text_cray" id="textfield2" /></td>
          </tr>
          <tr>
          <td width="20" align="center" class="text_red"></td>
            <td width="100" height="40" align="left" class="text_cray1">详情：</td>
            <td colspan="3" align="left"><input name="details" type="text" class="text_cray" id="textfield2" value="${scenicInfo.details}" /></td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">价格：</td>
            <td colspan="3" align="left"><input name="price" type="text" class="text_cray" id="textfield2" value="${scenicInfo.price}" /></td>
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
              <select class="text_cray" name="typeId" id="typeId" disabled="true">
                <option value="1" ${scenicInfo.typeId==1?"selected":""}>赞品旅程</option>
                <option value="2" ${scenicInfo.typeId==2?"selected":""}>自由行</option>
                <option value="3" ${scenicInfo.typeId==3?"selected":""}>轻奢小团</option>
                <option value="4" ${scenicInfo.typeId==4?"selected":""}>精品短假</option>
                <option value="5" ${scenicInfo.typeId==5?"selected":""}>限时特惠</option>
                <option value="6" ${scenicInfo.typeId==6?"selected":""}>精选酒店</option>
            </select>
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">景点标签：</td>
            <td width="150" align="left" class="text_cray1">
              <select class="text_cray" name="labelId" id="labelId" disabled="true">
                <option value="1" ${scenicInfo.labelId==1?"selected":""}>青山绿水</option>
                <option value="2" ${scenicInfo.labelId==2?"selected":""}>魅力城市</option>
                <option value="3" ${scenicInfo.labelId==3?"selected":""}>海滩假期</option>
                <option value="4" ${scenicInfo.labelId==4?"selected":""}>探访古镇</option>
                <option value="5" ${scenicInfo.labelId==5?"selected":""}>至臻精选</option>
                <option value="6" ${scenicInfo.labelId==6?"selected":""}>椰岛风情</option>
                <option value="7" ${scenicInfo.labelId==7?"selected":""}>宜家欢乐</option>
                <option value="8" ${scenicInfo.labelId==8?"selected":""}>浪漫假期</option>
            </select>
            </td>
          </tr>
          <tr>
            <td align="center" class="text_red">*</td>
            <td width="100" height="40" align="left" class="text_cray1">省 份：</td>
            <td align="left" class="text_cray">
            <select name="province" class="text_cray" id="province" disabled="true">
                <option value="省份" selected="selected">省份</option>
            </select> 
            </td>
            <td width="48" align="left" class="text_cray">城市：</td>
            <td width="343" align="left" class="text_cray">
            <select name="city" class="text_cray" id="city" disabled="true">
                <option value="城市" selected="selected">市县</option>
            </select>
            </td>
          </tr>
        </table>
</table></c:forEach><br>
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
<script type="text/JavaScript" src="../js/common.js"></script>
</body>
</html>