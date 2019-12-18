<?xml version='1.0' encoding='UTF-8' ?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <h:head>
        <title>BKis</title>
        <meta charset="utf-8" />
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/CSS_admin/style.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script> 
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script> 
    </h:head>
    
<body class=" yui3-skin-sam controls-visible signed-out public-page site">
	
		
	<header id="banner" role="banner">
		<div id="banner-wrapper">
			<div class="border-top"></div>
			<div id="banner-left">
				<img src="<c:url value="/resources/images/logoEn.png"/>" alt="Cổng thông tin HUST"/>
			</div>
		</div>
	</header>
	<div class="container-fluid" id="wrapper">
		<div id="content">
			<div class="row">
				<div class="col-md-10 col-md-offset-1" style="background-color: #fff6f6; height: 450px; box-shadow: 5px 10px #ffe8e8;">
					<section>
			              <span style="color: red; font-weight: bold;
			                    font-size: 15px; position: relative; top: 310px; left: 380px;" id="loginMessage">${message}</span>
			              <form id="login" action="authenticate.htm" method="post">
			                  <h3 style="text-align: center; color: white;">Đăng nhập</h3>
			                  <input type="text" name="txtUser" class="form-control" style="width: 400px" placeholder="Username"/><br />
			                  <input type="password" name="txtPass" class="form-control" placeholder="Password"/><br />
			                  <input type="submit"Login" onclick="return checkLogin();" class="btn btn-warning"/>
			              </form>     
			    	</section>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="_footer.jsp" %>
	
	 

	
</body>
</html>
