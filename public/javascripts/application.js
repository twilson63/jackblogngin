// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready( function(){

	$('.accordion').accordion({ 
		header: ".ui-accordion-header"
	}).css('margin-top','20px');
	
	$('.post').addClass("ui-widget post-content-widget");
	$('.post > h3').addClass("ui-widget-header  ui-corner-top");
	$('.post > .clearfix').addClass("ui-widget-content ui-corner-bottom post-content-widget-details");

	$('.comments').addClass("ui-widget post-content-widget");
	$('.comments > h3').addClass("ui-widget-header  ui-corner-top");
	$('.comments > .clearfix').addClass("ui-widget-content ui-corner-bottom post-content-widget-details");
	
	$('input:submit').addClass('ui-widget-header ui-corner-all').css('padding', '5px');
	
	var options = {
		beforeSubmit: validate,
		resetForm: true,
		dataType: 'script',
		success: closeDialog
	};
	
	$('#new_comment_form').ajaxForm(options);
		
	$('#comment_dialog').dialog({
		autoOpen: false,
		width: 550,
		buttons: {
			"Ok": function() {
				  $('#new_comment_form').submit();
				
				}, 
			"Cancel": function() {
				//$("form").each(function () { this.reset(); }); 
				$('#errors').empty();
				$(this).dialog("close"); 
				} 
			}
	});

	var wysiwyg1 = false;
	//
	$('#new_comment_link').click(function(){
		$('#comment_dialog').dialog('open');
		if (wysiwyg1 == false) { $('textarea').wysiwyg();wysiwyg1 = true; }
		$('#comment_name').focus();
		// Need to set focus to allergy box
		return false;
	});

	function validate(formData, jqForm, options) {
		var form = jqForm[0]; 
		var valid = true;
		
		$('#errors').empty();
		
		if (!form.comment_name.value) { 
			//alert('Name is Required!'); 
			$('#errors').append('<h3>Name is Required!</h3>')
			valid = false; 
		} 
		if (!form.comment_email.value) { 
			//alert('Email is Required.'); 
			$('#errors').append('<h3>Email is Required!</h3>');
			valid = false; 
		} 
		if (!form.comment_body.value) { 
			//alert('Comment is Required.'); 
			$('#errors').append('<h3>Comment is Required!</h3>');
			valid = false; 
		} 
		
		if (valid) {
			return true;
			
		}
		else {
			return false;
		}
		

	}
	
	function closeDialog(responseText, statusText ) {
		$('#comment_dialog').dialog("close"); 
	}

});