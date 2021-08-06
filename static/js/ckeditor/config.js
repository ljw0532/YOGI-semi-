/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.height=300;
	config.width=876;
	config.uiColor='#FF9999';
	config.enterMode=CKEDITOR.ENTER_BR;
	config.extraPlugins = 'youtube';
	
	config.toolbar = [
		{ name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-',] },
		{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
		{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
		{ name: 'links', items: [ 'Link', 'Unlink'] },{ name: 'document', items: [ 'Source', '-', 'Preview' ] },
		'/',
		{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
		{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
		{ name: 'insert', items: [ 'Image', 'Youtube', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar' ] },
		{ name: 'forms', items: [ 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button' ] },
		{ name: 'tools', items: [ 'Maximize'] }
	];


};
