<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Projection by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css" />" />
		
			<%-- <script type="text/javascript"
			src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
	<link rel="stylesheet" type="text/css"
		href="<c:url value="/resources/theme1/CSS_admin/style.css" />"></link>
	<link rel="stylesheet" type="text/css"
		href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
	 --%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="index.html" class="logo"><strong>Projection</strong> by TEMPLATED</a>
					<nav id="nav">
						<a href="index.html">Home</a>
						<a href="generic.html">Generic</a>
						<a href="elements.html">Elements</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1></h1>
					</header>					
				</div>
			</section>


		<!-- Three -->
			<section id="three" class="wrapper align-center">
				<div class="inner">
						<h4>Alternate</h4><div id="pngTable">
				<table cellspacing="0" cellpadding="0"
					class="table table-striped table-hover table-bordered"
					style="width: 99%" id="tblUser">
					<tr class="info">
						<th width="50px" height="20px"></th>
						<th width="15px" height="20px">#</th>
						<th width="50px" height="20px">Tên</th>
					</tr>
					<c:forEach var="keyword" items="${keywords}" varStatus="i">
						<tr class="user-row">
							<td><input type="checkbox" class="checkbox-keyword"/ value="${keyword}"></td>
							<td>${i.index + 1}</td>
							<td>${keyword}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
					</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">

					<h3>Get in touch</h3>

					<form action="#" method="post">

						<div class="field half first">
							<label for="name">Name</label>
							<input name="name" id="name" type="text" placeholder="Name">
						</div>
						<div class="field half">
							<label for="email">Email</label>
							<input name="email" id="email" type="email" placeholder="Email">
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
						</div>
						<ul class="actions">
							<li><input value="Send Message" class="button alt" type="submit"></li>
						</ul>
					</form>

					<div class="copyright">
						&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
					</div>

				</div>
			</footer>

		<!-- Scripts -->
			<%-- <script src="<c:url value="/resources/assets/js/jquery.min.js"/>"</script>
			<script src="<c:url value="/resources/assets/js/skel.min.js"/>"</script>
			<script src="<c:url value="/resources/assets/js/util.js"/>"</script>
			<script src="<c:url value="/resources/assets/js/main.js"/>"</script>
 --%>
	</body>
</html>