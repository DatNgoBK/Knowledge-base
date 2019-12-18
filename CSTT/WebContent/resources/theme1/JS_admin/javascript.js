$(document).ready(function() {
	$('#btnComment').click(function(){
		loadPopup();
	});
	
	$('#btnProceed').click(function(){
		var semester = $('#selSemester').val();
		$.ajax({
			type: "POST",
			url: "credit.htm",
			data: semester,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (credit) {
				$('#txtCredits').val(credit);
			},
			failure: function (response) {
				alert(response.responseText);
			},
			error: function (response) {
				alert(response.responseText);
			}
		});
		loadPopup();
	});
	$('#selSemester').change(function(){
		var semester = $('#selSemester').val();
		$.ajax({
			type: "POST",
			url: "credit.htm",
			data: semester,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (credit) {
				$('#txtCredits').val(credit);
			},
			failure: function (response) {
				alert(response.responseText);
			},
			error: function (response) {
				alert(response.responseText);
			}
		});
	});
	$("#btn-close").click(function() {
		disablePopup();
	});
	$(this).keydown(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup(); // function close pop up
		}
	});
	$("#background-popup").click(function() {
		disablePopup(); // function close pop up
//		disableLoginPopup();
	});
	var popupStatus = 0; // set value
	function loadPopup() {
		if (popupStatus == 0) { // if value is 0, show popup
			$("#to-popup").fadeIn(200); // fadein popup div
			$("#background-popup").css("opacity", "0.8"); // css opacity,
															// supports IE7, IE8
			$("#background-popup").fadeIn(200);
			popupStatus = 1; // and set value to 1
		}
	}
	function disablePopup() {
		if (popupStatus == 1) { // if value is 1, close popup
			$("#to-popup").fadeOut(300);
			$("#background-popup").fadeOut(300);
			$('body,html').css("overflow", "auto");// enable scroll bar
			popupStatus = 0; // and set value to 0
		}
	}	
});



