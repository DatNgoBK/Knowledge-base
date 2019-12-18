<?xml version='1.0' encoding='UTF-8' ?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:p="http://primefaces.org/ui">
<head>
<title>Student Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/style.css" />"></link>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
  	

  </style>
</head>
<body class=" yui3-skin-sam controls-visible signed-out public-page site">
	
		
	
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
			<div class="col-md-8 col-md-offset-2">
				<img src="<c:url value="/resources/images/banner.png"/>" class="img-fluid" alt="Responsive image">
		</div>
	</div>
	</div>
	
		<div class="col-md-10 col-md-offset-1">
		<div id="page_name">
			<h3>Danh sách các khóa hoc</h3>
		</div>
			<div id="pngTable">
				<table cellspacing="0" cellpadding="0"
					class="table table-striped table-hover table-bordered"
					style="width: 99%" id="tblUser">
					<tr class="info">
						<th width="50px" height="20px"></th>
						<th width="15px" height="20px">#</th>
						<c:if test = "${sessionScope.id == 1}">
							<th width="15px" height="10px"></th>
						</c:if>
						<th width="50px" height="20px">Mã học phần</th>
						<th width="50px" height="20px">Tên</th>
						<th width="50px" height="20px">Keyword</th>
						<th width="50px" height="20px">Số tín chỉ</th>
						<th width="50px" height="20px">Học phần học trước</th>
						<th width="50px" height="20px">Nhóm</th>
						<th width="50px" height="20px">Kỳ học</th>
					</tr>
					<c:forEach var="course" items="${courses}" varStatus="i">
						<tr class="user-row" id="${course.number}">
							<td><input type="checkbox" class="checkbox-keyword"/ value="${keyword}"></td>
							<td>${i.index + 1}</td>
							<c:if test = "${sessionScope.id == 1}">
								<td><p class="edit-course edit-row" id="${course.number}">Sửa</p></td>
							</c:if>
							<td>${course.number}</td>
							<td>${course.name}</td>
							<td>${course.keywords}</td>
							<td>${course.credit}</td>
							<td>${course.preRequest}</td>
							<td>${course.group}</td>
							<td>${course.semester}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
	<div class="btn-scroll-top" title="Di chuyển lên đầu trang" style="" id="go-top-page"> <span class="glyphicon glyphicon-arrow-up"></span></div>
		
	</main>
	
	<footer id="footer" role="conteninfo">
		
	</footer>
	</div>
	
	 
  <!-- Modal -->
  <div class="modal fade" id="modal-course" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Cập nhật khóa học</h4>
        </div>
        <div class="modal-body">
         		<form class="form-horizontal" action="update-course.htm">
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="number">Mã học phần</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="number" readonly="readonly" name="number">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="name">Tên học phần:</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="name" readonly="readonly">
				    </div>
				  </div>
				    <div class="form-group">
				    <label class="control-label col-sm-2" for="credit">Số tín chỉ:</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="credit" readonly="readonly">
				    </div>
				  </div>
				    <div class="form-group">
					    <label class="control-label col-sm-2" for="prerequest">Học phần học trước:</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="prerequest" readonly="readonly">
					    </div>
				  </div>
				    <div class="form-group">
				    <label class="control-label col-sm-2" for="group">Nhóm:</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="group" readonly="readonly">
				    </div>
				  </div>
				    <div class="form-group">
				    <label class="control-label col-sm-2" for="semester">Kỳ học:</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="semester" readonly="readonly">
				    </div>
				  </div>
				    <div class="form-group">
				    <label class="control-label col-sm-2" for="keywords">Keywords:</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="keywords" name="keywords">
				    </div>
				   
				  </div>
				  
				  <div class="form-group"> 
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default">Cập nhật</button>
				    </div>
				  </div>
				</form>
         		
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

	<%@include file="_footer.jsp" %>
	
	<script>
	//Trả về chuỗi các keyword được tích.
	function getCheckboxKeyword() {
		var str = '';
		$('input:checkbox.checkbox-keyword').each(function () {
			str += (this.checked ? $(this).val() + ',' : "") ;
		});/* 
		if (str == initName)
			name += '"';
		else
			name = name.slice(0, -1) +'"'; */
		return str;
	}
	
	$(document).ready(function() {

		$('#delete-keywords').click(function() {
			$(location).attr('href', 'delete-keywords.htm?keywords=' + getCheckboxKeyword());
		});
		
		$('.edit-course').click(function() {
			var numberCourse = $(this).attr('id');
			
			 $.ajax({
	    			type: "GET",
	    			encoding:"UTF-8",
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "json",
	    			url: "single-course.htm?number=" + numberCourse,
	    			success: function (course) {
	    				$("#number").val(course.number);
	    				$("#name").val(course.name);
	    				$("#credit").val(course.credit);
	    				$("#preRequests").val(course.preRequest);
	    				$("#group").val(course.group);
	    				$("#semester").val(course.semester);
	    				$("#keywords").val(course.keywords);
	    				
	    			},
	    			failure: function (response) {
	    				alert(response.responseText);
	    			},
	    			error: function (response) {
	    				alert(response.responseText);
	    			}
	    		});
			 $("#modal-course").modal();
		});
		
		$('#go-top-page').click(function() {
		    $('html, body').animate({scrollTop:0}, 'slow');
		/* $(window).scrollTop(0); */
	});
	});
	
	</script>
</body>
</html>

