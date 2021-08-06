$(function() {
	// -- append by class just for lower strings count --
	$('.dtpicker_omview').appendDtpicker({
		"futureOnly" : false,
		"autodateOnStart" : false,
		"locale" : "ko",
		"dateFormat": "YY/MM/DD",
		"dateOnly": true	
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
});
