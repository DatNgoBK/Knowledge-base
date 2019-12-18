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
	<style>
		/* Start by setting display:none to make this hidden.
	   Then we position it in relation to the viewport window
	   with position:fixed. Width, height, top and left speak
	   for themselves. Background we set to 80% white with
	   our animation centered, and no-repeating */
	.modal {
	    display:    none;
	    position:   fixed;
	    z-index:    1000;
	    top:        0;
	    left:       0;
	    height:     100%;
	    width:      100%;
	    background: rgba( 255, 255, 255, .9 ) 
	                url('http://i.stack.imgur.com/FhHRx.gif') 
	                50% 50% 
	                no-repeat;
	}
	
	/* When the body has the loading class, we turn
	   the scrollbar off with overflow:hidden */
	body.loading .modal {
	    overflow: hidden;   
	}
	
	/* Anytime the body has the loading class, our
	   modal element will be visible */
	body.loading .modal {
	    display: block;
	}
</style>
</head>

<body class=" yui3-skin-sam controls-visible signed-out public-page site">
	<%@include file="_header.jsp" %>
	<div class="container-fluid" id="wrapper">
	<div id="content">
	<div class="row">
		<div class="col-md-10 col-md-offset-1" style="background-color: ;">
			
				<div id="page_name">
					<h3>Thông tin sinh viên</h3>
				</div>
				<form id="info">
					<p:messages id="message"></p:messages>
					<br /> Mã số sinh viên: ${student.id} <br /> Tên: ${student.name} <br />
					Chuyên ngành: ${student.specialization} <br /> CPA: ${student.CPA} <br />
					<div id="pngTable">
						<table cellspacing="0" cellpadding="0"
							class="table table-striped table-hover table-bordered"
							style="width: 99%" id="tblUser">
							<tr class="info">
								<th width="15px" height="20px">#</th>
								<th width="25px" height="20px">Mã học phần</th>
								<th width="80px" height="20px">Tên học phần</th>
								<th width="50px" height="20px">Tín chỉ</th>
								<th width="80px" height="20px">Keyword</th>
								<th width="50px" height="20px">Điểm chữ</th>
								<th width="50px" height="20px">Điểm số</th>
							</tr>
							<c:forEach var="grade" items="${grades}" varStatus="i">
								<tr class="user-row">
									<td>${i.index + 1}</td>
									<td>${grade.courseNumber}</td>
									<td>${grade.courseName}</td>
									<td>${grade.courseCredit}</td>
									<td>${grade.keyWord}</td>
									<td>${grade.grade}</td>
									<td>${grade.gradeNumber}</td>
								</tr>
							</c:forEach>
						</table>
						
						<input type="button" name="btnProceed" value="Gợi ý đăng ký"
							id="btnProceed" class="btn btn-info btn-sm"/>
						<!-- <f:ajax listener="${userBean.changeNextPage()}" render="pngTable"/> -->
					</div>
			
				</form>
				<div id="to-popup">
					<span id="btn-close"></span>
					<div id="popup-content">
						<form action="result.htm">
							<select name="selSemester" id="selSemester">
								<option value="2018 3">2018 3</option>
								<option value="2019 1">2019 1</option>
								<option value="2019 2">2019 2</option>
								<option value="2019 3">2019 3</option>
								<option value="2020 1">2020 1</option>
							</select>
							Số tín chỉ gợi ý cho kỳ học tới: <input type="text" name="txtCredits" value="${credits}" id="txtCredits" /> <br />
							
							<c:forEach items="${keywords}" var="keyword">
								<input type="checkbox" name="keywords" value="${keyword}" /> ${keyword}<br />
							</c:forEach>
							<input type="submit" value="OK" class="btn btn-primary btnSubmit"
								id="btnUserSubmit" /> <input type="button" value="Cancel"
								class="btn btnSubmit" />
						</form>
					</div>
					<!--end #popup-content-->
				</div>
				<div id="background-popup"></div>
		</div>
		
	</div>
	
	</div>
	</div>
	<div class="modal"></div>
	<%@include file="_footer.jsp" %>
	<!-- <script>
	window.addEventListener("load", function() {
		console.log(1);
	});
	
	</script> -->
	<script>
		/* $body = $("body");
		$(document).on({
		    ajaxStart: function() { $body.addClass("loading");    },
		    ajaxStop: function() { $body.removeClass("loading"); }    
		});
		 */
		$(document).ready(function() {
			$('#btnUserSubmit').click(function() {
				console.log(1);
				$('body').addClass("loading");
			});
			
		});
	</script>
</body>
</html>

