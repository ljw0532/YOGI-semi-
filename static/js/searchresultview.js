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
