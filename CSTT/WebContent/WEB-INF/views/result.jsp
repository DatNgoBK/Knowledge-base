<?xml version='1.0' encoding='UTF-8' ?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
</head>
<body>
	<%@include file="_header.jsp" %>
	<div class="containerfuid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
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
								<th width="50px" height="20px">Điểm số</th>
								<th width="50px" height="20px">Điểm chữ</th>
							</tr>
							<c:forEach var="grade" items="${grades}" varStatus="i">
								<tr class="user-row ${grade.suggested}">
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
						
						<input type="button" name="btnComment" value="Gửi phản hồi"
							id="btnComment" class="btn btn-info btn-md"/>
					</div>
		</div>

	</form>
	<div id="to-popup">
		<span id="btn-close"></span>
		<div id="popup-content">
			<form action="comment.htm">
				Gợi ý có phù hợp với bạn: <input type="radio" name="radLike" value="1" /> Có
				 <input type="radio" name="radLike" value="0" /> Không <br />
				 Bạn thấy không phù hợp vì <br />
				 <input type="checkbox" name="reason" value="1" /> Quá nhiều môn học <br />
				 <input type="checkbox" name="reason" value="2" /> Quá ít môn học <br />
				 <input type="checkbox" name="reason" value="3" /> Chưa gợi ý đúng các môn yêu thích <br />
				 <input type="checkbox" name="reason" value="4" /> Các môn học quá khó <br />
				 <input type="checkbox" name="reason" value="5" /> Các môn gợi ý không đúng trong chương trình đào tạo <br />
				 <input type="checkbox" name="reason" value="6" /> Chưa đủ các keyword <br />
				 Comment <br />
				 <textarea rows="5" cols="80" name="comment"></textarea>
				 <input type="submit" value="OK" class="btn btn-primary btnSubmit"
					id="btnUserSubmit" /> <input type="button" value="Cancel"
					class="btn btnSubmit" />
			</form>
		</div>
		<!--end #popup-content-->
				<div id="to-popup">
					<span id="btn-close"></span>
					<div id="popup-content">
						<form action="result.htm">
							Gợi ý có phù hợp với bạn: <input type="radio" name="radLike" value="1" /> Có
							 <input type="radio" name="radLike" value="0" /> Không <br />
							 Bạn thấy không phù hợp vì <br />
							 <input type="checkbox" name="reason" value="1" /> Quá nhiều môn học <br />
							 <input type="checkbox" name="reason" value="2" /> Quá ít môn học <br />
							 <input type="checkbox" name="reason" value="3" /> Chưa gợi ý đúng các môn yêu thích <br />
							 <input type="checkbox" name="reason" value="4" /> Các môn học quá khó <br />
							 <input type="checkbox" name="reason" value="5" /> Các môn gợi ý không đúng trong chương trình đào tạo <br />
							 <input type="checkbox" name="reason" value="6" /> Chưa đủ các keyword <br />
							 Comment <br />
							 <textarea rows="5" cols="80"></textarea>
							 <input type="submit" value="OK" class="btn btn-primary btnSubmit"
								id="btnUserSubmit" /> <input type="button" value="Cancel"
								class="btn btnSubmit" />
						</form>
					</div>
					</div>
					<!--end #popup-content-->
				</div>
				<div id="background-popup"></div>
				</div>
			</div>
	</div>
	<%@include file="_footer.jsp" %>
	
</body>
</html>

