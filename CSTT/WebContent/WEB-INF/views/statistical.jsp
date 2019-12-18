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
</head>
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
	    background: rgba( 255, 255, 255, .8 ) 
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
<body>
	
	<%@include file="_header.jsp" %>
		
	<div class="containerfuid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<form id="info">
					<c:forEach items="${statisticals}" var="s">
						${s.status}: ${s.number} <br />
					</c:forEach>
					Lý do không thích: <br /> 
					<c:forEach items="${reasons}" var="r" varStatus="i">
						${i.index+1}.${r.reason}: ${r.number} <br />
					</c:forEach>
					<p:messages id="message"></p:messages>
					<div id="pngTable">
						<table cellspacing="0" cellpadding="0"
							class="table table-striped table-hover table-bordered"
							style="width: 99%" id="tblUser">
							<tr class="info">
								<th width="" height="20px">#</th>
								<th width="" height="20px">Mã sinh viên</th>
								<th width="" height="20px">Lý do</th>
								<th width="" height="20px">Comment</th>
							</tr>
							<c:forEach var="c" items="${comments}" varStatus="i">
								<tr class="user-row">
									<td>${i.index + 1}</td>
									<td>${c.studentId}</td>
									<td>${c.reason}</td>
									<td>${c.comment}</td>
								</tr>
							</c:forEach>
						</table>
						
						<!-- <input type="button" name="btnComment" value="Gửi phản hồi"
							id="btnComment" /> -->
						<!-- <f:ajax listener="${userBean.changeNextPage()}" render="pngTable"/> -->
					</div>
			
				</form>
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
							 <input type="submit" value="OK" class="btn btn-primary btnSubmit"
								id="btnUserSubmit" /> <input type="button" value="Cancel"
								class="btn btnSubmit" />
						</form>
					</div>
					<!--end #popup-content-->
				</div>
			</div>
		</div>
	</div>
	<div id="background-popup"></div>
	<div class="modal"></div>
	<%@include file="_footer.jsp" %>
	
	<script>
	$body = $("body");
	$(document).on({
	    ajaxStart: function() { $body.addClass("loading");    },
	     ajaxStop: function() { $body.removeClass("loading"); }    
	});
	</script>
</body>
</html>

