$(function() {
	// -- append by class just for lower strings count --
	$('.dtpicker2').appendDtpicker({
		"futureOnly" : false,
		"autodateOnStart" : false,
		"locale" : "ko"
	});

	$('#startdt').change(function() {
		var de = new Date($('#startdt').handleDtpicker('getDate')); // constructor need to avoid linking object
		de.setDate(de.getDate());
		$('#enddt').handleDtpicker('setMinDate', de); //set min end date is 7 day later then start date
	});
	$('#enddt').change(function() {
		var ds = new Date($('#enddt').handleDtpicker('getDate'));
		ds.setDate(ds.getDate());
		$('#startdt').handleDtpicker('setMaxDate', ds); //set max end date is 7 day earlier then end date
	});
	$('#startdt2').change(function() {
		var de = new Date($('#startdt2').handleDtpicker('getDate'));
		de.setDate(de.getDate());
		$('#enddt2').handleDtpicker('setMinDate', de);
	});
	$('#enddt2').change(function() {
		var ds = new Date($('#enddt2').handleDtpicker('getDate'));
		ds.setDate(ds.getDate());
		$('#startdt2').handleDtpicker('setMaxDate', ds);
	});
});

function valueCheck() {
	var f = document.omf_form;
	var content = CKEDITOR.instances.o_content;

	if (!f.o_subject.value) {
		alertify.error('모임명이 입력되지 않았습니다.');
		f.o_subject.focus();
		return false;
	}
	if (!f.o_msdate.value) {
		alertify.error('모임일시가 지정되지 않았습니다.');
		f.o_msdate.focus();
		return false;
	} else if (!f.o_medate.value) {
		alertify.error('모임일시가 지정되지 않았습니다.');
		f.o_medate.focus();
		return false;
	}
	if (!f.o_rsdate.value) {
		alertify.error('접수기간이 지정되지 않았습니다.');
		f.o_rsdate.focus();
		return false;
	} else if (!f.o_redate.value) {
		alertify.error('접수기간이 지정되지 않았습니다.');
		f.o_redate.focus();
		return false;
	}
	if (!f.o_addr.value) {
		alertify.error('상세주소가 입력되지 않았습니다.');
		f.o_addr.focus();
		return false;
	}
	if (!f.o_title.value) {
		alertify.error('간략소개가 입력되지 않았습니다.');
		f.o_title.focus();
		return false;
	}
	if (!f.o_total_pnum.value) {
		alertify.error('인원이 입력되지 않았습니다.');
		f.o_total_pnum.focus();
		return false;
	} else if (f.o_total_pnum.value < 2) {
		alertify.error('최소인원은 2명입니다.');
		f.o_total_pnum.focus();
		f.o_total_pnum.value = 2;
		return false;
	}
	if (!f.o_payment.value) {
		alertify.error('비용이 입력되지 않았습니다.');
		f.o_payment.focus();
		return false;
	} else if (f.o_payment.value < 0) {
		alertify.error('음수는 입력할수 없습니다.');
		f.o_payment.focus();
		f.o_payment.value = 0;
		return false;
	}
	if (!f.upload.value) {
		alertify.error('대표 이미지가 선택되지 않았습니다.');
		f.upload.focus();
		return false;
	}
	if (!content.getData()) {
		alertify.error("내용이 입력되지 않았습니다.");
		content.focus();
		return false;
	}
	
	f.submit();
}