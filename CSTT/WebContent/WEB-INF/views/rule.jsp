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
									<a href="/CSTT/home.htm" role="menuitem">
										<span>Gợi ý đăng ký môn học</span>
									</a>
								</li>
							</c:if>
							<li class id="layout_258" role="presentation" >
								<a href="/CSTT/course.htm" role="menuitem">
									<span>Khóa học</span>
								</a>
							</li>
							<c:if test = "${sessionScope.id == 1}">
								<li class id="layout_256" role="presentation">
									<a role="menuitem">
										<span>Chỉnh sửa luât</span>
									</a>
								</li><li class id="layout_256" role="presentation">
									<a  href="/CSTT/statistical.htm" role="menuitem">
										<span>Thống kê</span>
									</a>
								</li>
							</c:if>
							<li class id="layout_256" role="presentation">
								<a href="/CSTT/login.htm" role="menuitem">
									<span>Đăng xuất</span>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
	</div>
	<div class="row">
		<div class="col-md-10 col-md-offset-1" style="background-color: ;">
				<h3>Danh sách các keyword</h3>
				<div id="pngTable">
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
				<button id="add-keyword" class="btn btn-info btn-sm">Thêm keyword</button>
				<button id="delete-keywords" class="btn btn-danger btn-sm">Xóa các keyword đã chọn</button>
				
			
				<h3>Bộ lọc tín chỉ</h3>
				<div class="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblUser">
						<tr class="info">
							<th width="50px" height="20px"></th>
							<th width="15px" height="20px">#</th>
							<th width="15px" height="10px"></th>
							<th width="50px" height="20px">ID</th>
							<th width="50px" height="20px">Name</th>
							<th width="50px" height="20px">mul</th>
						</tr>
						<c:forEach var="creditRule" items="${creditRules}" varStatus="i">
							<tr class="user-row" id="${creditRule.id}">
								<td><input type="checkbox" class="checkbox-creditRule"/ value="${creditRule.id}"></td>
								<td>${i.index + 1}</td>
								<td><p class="edit-creditRule edit-row" id="${creditRule.id}">Sửa</p></td>
								<td>${creditRule.id}</td>
								<td>${creditRule.name}</td>
								<td>${creditRule.mult}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<button id="add-creditRule"  class="btn btn-info btn-sm">Thêm credit rule</button>
				<button id="delete-creditRules" class="btn btn-danger btn-sm">Xóa các credit rule đã chọn</button>
					
				<h3>Danh sách các GradeRule</h3>
				<div >
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblUser">
						<tr class="info">
							<th width="50px" height="20px"></th>
							<th width="15px" height="20px">#</th>
							<th width="15px" height="10px"></th>
							<th width="50px" height="20px">id</th>
							<th width="50px" height="20px">CPA</th>
							<th width="50px" height="20px">Level</th>
							<th width="50px" height="20px">Mult</th>
						</tr>
						<c:forEach var="gradeRule" items="${gradeRules}" varStatus="i">
							<tr class="user-row" id="${creditRule.id}">
								<td><input type="checkbox" class="checkbox-gradeRule"/ value="${gradeRule.id}"></td>
								<td>${i.index + 1}</td>
								<td><p class="edit-gradeRule edit-row" id="${gradeRule.id}">Sửa</p></td>
								<td>${gradeRule.id}</td>
								<td>${gradeRule.cpa}</td>
								<td>${gradeRule.level}</td>
								<td>${gradeRule.mult}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<button id="add-gradeRule"  class="btn btn-info btn-sm">Thêm grade rule</button>
				<button id="delete-gradeRules" class="btn btn-danger btn-sm">Xóa các grade đã chọn</button>
					
				<h3>Danh sách các LevelRule</h3>
				<div id="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblUser">
						<tr class="info">
							<th width="50px" height="20px"></th>
							<th width="15px" height="20px">#</th>
							<th width="15px" height="10px"></th>
							<th width="50px" height="20px">id</th>
							<th width="50px" height="20px">Level</th>
							<th width="50px" height="20px">Test</th>
							<th width="50px" height="20px">Mul</th>
						</tr>
						<c:forEach var="levelRule" items="${levelRules}" varStatus="i">
							<tr class="user-row" id="${creditRule.id}">
								<td><input type="checkbox" class="checkbox-levelRule"/ value="${levelRule.id}"></td>
								<td>${i.index + 1}</td>
								<td><p class="edit-levelRule edit-row" id="${levelRule.id}">Sửa</p></td>
								<td>${levelRule.id}</td>
								<td>${levelRule.level}</td>
								<td>${levelRule.test}</td>
								<td>${levelRule.mult}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<button id="add-levelRule"  class="btn btn-info btn-sm">Thêm level rule</button>
				<button id="delete-levelRules" class="btn btn-danger btn-sm">Xóa các level đã chọn</button>
					
				<h3>Danh sách các PreferenceRule</h3>
				<div id="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblUser">
						<tr class="info">
							<th width="50px" height="20px"></th>
							<th width="15px" height="20px">#</th>
							<th width="15px" height="10px"></th>
							<th width="50px" height="20px">id</th>
							<th width="50px" height="20px">Name</th>
							<th width="50px" height="20px">Mul</th>
						</tr>
						<c:forEach var="preferenceRule" items="${preferenceRules}" varStatus="i">
							<tr class="user-row" id="${preferenceRule.id}">
								<td><input type="checkbox" class="checkbox-preferenceRule"/ value="${preferenceRule.id}"></td>
								<td>${i.index + 1}</td>
								<td><p class="edit-preferenceRule edit-row" id="${preferenceRule.id}">Sửa</p></td>
								<td>${preferenceRule.id}</td>
								<td>${preferenceRule.name}</td>
								<td>${preferenceRule.mult}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<button id="add-preferenceRule" class="btn btn-info btn-sm">Thêm preferenceRule rule</button>
				<button id="delete-preferenceRules" class="btn btn-danger btn-sm">Xóa các preferenceRule đã chọn</button>
		</div>
		<div class="btn-scroll-top" title="Di chuyển lên đầu trang" style="" id="go-top-page"> <span class="glyphicon glyphicon-arrow-up"></span></div>
	</div>
	
	</div>
	
	
	<!-- footer -->
	<!-- <footer id="footer" role="conteninfo" style="background-color: black; height: 200px;">
	</footer> -->
	<!-- /footer -->
			  
	<!-- Modal -->
	  <div class="modal fade" id="modal-edit-creditRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="update-creditRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-creditRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-creditRule" readonly="readonly" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="name-creditRule">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="name-creditRule" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-creditRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-creditRule" name="mult">
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
	  
	  
	  <div class="modal fade" id="modal-add-creditRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="add-creditRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-creditRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-creditRule" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="name-creditRule">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="name-creditRule" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-creditRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-creditRule" name="mult">
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
	  
	    <div class="modal fade" id="modal-edit-gradeRule" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ID</h4>
        </div>
        <div class="modal-body">
         		<form class="form-horizontal" action="update-gradeRule.htm">
         		<div class="form-group">
				    <label class="control-label col-sm-2" for="id-gradeRule">id</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="id-gradeRule" readonly="readonly" name="id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="cpa-creditRule">CPA</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="cpa-gradeRule" name="cpa">
				    </div>
				  </div>
				   <div class="form-group">
				    <label class="control-label col-sm-2" for="level-gradeRule">Level</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="level-gradeRule" name="level">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="mult-gradeRule">Mult</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="mult-gradeRule" name="mult">
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
  
  
  <div class="modal fade" id="modal-add-gradeRule" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">ID</h4>
        </div>
        <div class="modal-body">
         		<form class="form-horizontal" action="add-gradeRule.htm">
         		<div class="form-group">
				    <label class="control-label col-sm-2" for="id-gradeRule">id</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="id-gradeRule" name="id">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="cpa-creditRule">CPA</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="cpa-gradeRule" name="cpa">
				    </div>
				  </div>
				   <div class="form-group">
				    <label class="control-label col-sm-2" for="level-gradeRule">Level</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="level-gradeRule" name="level">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="control-label col-sm-2" for="mult-gradeRule">Mult</label>
				    <div class="col-sm-10"> 
				      <input type="text" class="form-control" id="mult-gradeRule" name="mult">
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
  
  	  <div class="modal fade" id="modal-edit-levelRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="update-levelRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-creditRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-creditRule" readonly="readonly" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="level-levelRule">Level</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="level-levelRule" name="level">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="test-levelRule">Test</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="test-levelRule" name="test">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-levelRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-levelRule" name="mult">
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
	  
	  <div class="modal fade" id="modal-add-levelRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="add-levelRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-creditRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-creditRule" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="level-levelRule">Level</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="level-levelRule" name="level">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="test-levelRule">Test</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="test-levelRule" name="test">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-levelRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-levelRule" name="mult">
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
	  
	  
	  <!-- Modal -->
	  <div class="modal fade" id="modal-edit-preferenceRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="update-preferenceRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-preferenceRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-preferenceRule" readonly="readonly" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="name-preferenceRule">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="name-preferenceRule" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-preferenceRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-preferenceRule" name="mult">
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
	  
	  
	  <div class="modal fade" id="modal-add-preferenceRule" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="add-preferenceRule.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="id-preferenceRule">id</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="id-preferenceRule" name="id">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="name-preferenceRule">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="name-preferenceRule" name="name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="control-label col-sm-2" for="mult-preferenceRule">Mult</label>
					    <div class="col-sm-10"> 
					      <input type="text" class="form-control" id="mult-preferenceRule" name="mult">
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
	 
	  
	 
	  
	  <div class="modal fade" id="modal-add-keyword" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">ID</h4>
	        </div>
	        <div class="modal-body">
	         		<form class="form-horizontal" action="add-keyword.htm">
	         		<div class="form-group">
					    <label class="control-label col-sm-2" for="keyword">keyword</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="keyword" name="keyword">
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
  <!--/Modal -->
  
	</div>
	<%@include file="_footer.jsp" %>
	<script>
	//Trả về chuỗi các keyword được tích.
	function getCheckboxKeyword(name) {
		var str = '';
		$('input:checkbox.checkbox-'+name).each(function () {
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
			$(location).attr('href', 'delete-keywords.htm?keywords=' + getCheckboxKeyword('keyword'));
		});
		$('#delete-creditRules').click(function() {
			$(location).attr('href', 'delete-creditRules.htm?creditRuleIds=' + getCheckboxKeyword('creditRule'));
		});
		
		$('#delete-gradeRules').click(function() {
			$(location).attr('href', 'delete-gradeRules.htm?gradeRuleIds=' + getCheckboxKeyword('gradeRule'));
		});
		
		$('#delete-levelRules').click(function() {
			$(location).attr('href', 'delete-levelRules.htm?levelRuleIds=' + getCheckboxKeyword('levelRule'));
		});
		
		$('#delete-preferenceRules').click(function() {
			$(location).attr('href', 'delete-preferenceRules.htm?preferenceRuleIds=' + getCheckboxKeyword('preferenceRule'));
		});
		

		$('#add-keyword').click(function() {			
			 $("#modal-add-keyword").modal();
		});
		$('#add-creditRule').click(function() {			
			 $("#modal-add-creditRule").modal();
		});
		$('#add-gradeRule').click(function() {			
			 $("#modal-add-gradeRule").modal();
		});
		$('#add-levelRule').click(function() {			
			 $("#modal-add-levelRule").modal();
		});
		$('#add-preferenceRule').click(function() {			
			 $("#modal-add-preferenceRule").modal();
		});
		
		$('.edit-creditRule').click(function() {
			var id = $(this).attr('id');
			
			 $.ajax({
	    			type: "GET",
	    			encoding:"UTF-8",
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "json",
	    			url: "single-creditRule.htm?id=" + id,
	    			success: function (creditRule) {
	    				$("#id-creditRule").val(creditRule.id);
	    				$("#name-creditRule").val(creditRule.name);
	    				$("#mult-creditRule").val(creditRule.mult);
	    			},
	    			failure: function (response) {
	    				alert(response.responseText);
	    			},
	    			error: function (response) {
	    				alert(response.responseText);
	    			}
	    		});
			 $("#modal-edit-creditRule").modal();
		});
		
		$('.edit-gradeRule').click(function() {
			var id = $(this).attr('id');
			
			 $.ajax({
	    			type: "GET",
	    			encoding:"UTF-8",
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "json",
	    			url: "gradeRule.htm?id=" + id,
	    			success: function (gradeRule) {
	    				$("#id-gradeRule").val(gradeRule.id);
	    				$("#cpa-gradeRule").val(gradeRule.cpa);
	    				$("#level-gradeRule").val(gradeRule.level);
	    				$("#mult-gradeRule").val(gradeRule.mult);
	    			},
	    			failure: function (response) {
	    				alert(response.responseText);
	    			},
	    			error: function (response) {
	    				alert(response.responseText);
	    			}
	    		});
			 $("#modal-edit-gradeRule").modal();
		});
		$('.edit-levelRule').click(function() {
			var id = $(this).attr('id');
			
			 $.ajax({
	    			type: "GET",
	    			encoding:"UTF-8",
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "json",
	    			url: "levelRule.htm?id=" + id,
	    			success: function (levelRule) {
	    				$("#id-levelRule").val(levelRule.id);
	    				$("#level-levelRule").val(levelRule.level);
	    				$("#test-levelRule").val(levelRule.test);
	    				$("#mult-levelRule").val(levelRule.mult);
	    			},
	    			failure: function (response) {
	    				alert(response.responseText);
	    			},
	    			error: function (response) {
	    				alert(response.responseText);
	    			}
	    		});
			 $("#modal-edit-levelRule").modal();
		});
		$('.edit-preferenceRule').click(function() {
			var id = $(this).attr('id');
			 $.ajax({
	    			type: "GET",
	    			encoding:"UTF-8",
	    			contentType: "application/json; charset=UTF-8",
	    			dataType: "json",
	    			url: "preferenceRule.htm?id=" + id,
	    			success: function (preferenceRule) {
	    				$("#id-preferenceRule").val(preferenceRule.id);
	    				$("#name-preferenceRule").val(preferenceRule.name);
	    				$("#mult-preferenceRule").val(preferenceRule.mult);
	    			},
	    			failure: function (response) {
	    				alert(response.responseText);
	    			},
	    			error: function (response) {
	    				alert(response.responseText);
	    			}
	    		});
			 $("#modal-edit-preferenceRule").modal();
		});
		
		$('#go-top-page').click(function() {
			    $('html, body').animate({scrollTop:0}, 'slow');
			/* $(window).scrollTop(0); */
		});
	});
	
	
	
	</script>
</body>
</html>

