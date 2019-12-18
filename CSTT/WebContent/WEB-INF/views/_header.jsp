<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid" id="wrapper">
		<header id="banner" role="banner">
			<div id="banner-wrapper">
				<div class="border-top"></div>
				<div id="banner-left">
					<img src="<c:url value="/resources/images/logoEn.png"/>" alt="Cổng thông tin HUST"/>
				</div>
			</div>
		</header>
		
	<div id="content">
		<div class="row" style=" background-color: #5d0201;">
			<div id="menu">
				<div id="home-text">
					<nav class="sort-page modify-pages" id="navigation" role="navigation">
						<ul aria-label="Các trang" role="menubar">
							<c:if test = "${sessionScope.id != 1}">
								<li class id="layout_257" role="presentation">
								<a href="home.htm" role="menuitem">
									<span>Gợi ý đăng ký môn học</span>
								</a>
							</li>
							</c:if>
							<li class id="layout_258" role="presentation" >
								<a href="course.htm" role="menuitem">
									<span>Khóa học</span>
								</a>
							</li>
							<c:if test = "${sessionScope.id == 1}">
								<li class id="layout_256" role="presentation">
									<a href="rule/list.htm" role="menuitem">
										<span>Chỉnh sửa luât</span>
									</a>
								</li>
								<li class id="layout_256" role="presentation">
									<a href="statistical.htm" role="menuitem">
										<span>Thống kê</span>
									</a>
								</li>
							</c:if>
							
							<li class id="layout_256" role="presentation">
								<a href="login.htm" role="menuitem">
									<span>Đăng xuất</span>
								</a>
							</li>
							
						</ul>
					</nav>
				</div>
			</div>
			
	</div>
	</div>
	</div>
</body>
</html>