<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/user.css">
<style type="text/css">
body, html {
	min-width: 670px;
}
</style>
</head>
<body>
<form action="../UploadServlet" method="post"  enctype="multipart/form-data" >
			<div class="news">
			
				<div class="news-left">
					<div class="touxiang">
						<img src="${user.imagePath}" alt="">
					</div>
					<input class="save2" type="file" name="touxiang" value="更新头像" style="opacity:0">
					<input class="save" type="" value="更新头像">
				</div>
				<div class="news-right">
					<h3>个人信息</h3>
					<ul>
						<li>
							<label for="">称谓</label>
							<input type="radio" name="sex" value="1" style="width:25px" ${user.sex=="1"?"checked":""}>男
							<input type="radio" name="sex" value="2" style="width:25px" ${user.sex=="2"?"checked":""}>女
						</li>
						<li>
							<label for="username">昵称</label>
							<input type="text" name="username" value="${user.username}" maxlength="64">
						</li>
						<li>
							<label for="realame">姓名</label>
							<input type="text" name="realName" value="${user.realName}" maxlength="64">
						</li>
						<li>
							<label for="realame">生日</label>
							<input type="text" name="birthday" value='<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>' maxlength="64">
						</li>
						<li>
							<label for="realame">自我介绍</label>
							<textarea name="content" id="" cols="60" rows="10">${user.content}</textarea>
						</li>
						<li>
							<input class="save" type="submit" value="保存">
						</li>
					</ul>
				</div>
				
			</div>
</form>	
</body>
</html>