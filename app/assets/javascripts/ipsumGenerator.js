// $(document).ready(function() {
// 	$('quotes').on
// 	console.log($('input#quotes option').val());
// 	$('input#generate').hide();
	
// 	($('#paragraph_tvcharacter_id') && $('#quotes') && $('#paragraphs')).on('change', function () {
// 		var tvCharacter = $('#paragraph_tvcharacter_id').find(':selected').text();
// 		var lines = $('#quotes').val();
// 		var blocks = $('#paragraphs').val();
// 		console.log(tvCharacter + " " + lines + " " + blocks);
// 		if (tvCharacter === "" || lines === 0 || blocks === 0) {
// 			$('input#generate').hide();
// 		} else if (tvCharacter !== "" && lines !== 0 && blocks !== 0) {
// 			$('input#generate').show();
// 		}
// 	});
	// $('#quotes').on('change', function () {
	// 	var lines = $(this).val();
	// 	if (lines === "") {
	// 		$('input#generate').hide();
	// 	} else {
	// 		$('input#generate').show();
	// 	}
	// })


	// if ($('select#paragraph_tvcharacter_id option value').text() === "") {
	// 	$('input#generate').hide();
	// } else {
	// 	$('input#generate').show();
	// }
	
// })


// var app = app || {};

// _.templateSettings = {
// evaluate : /\{\[([\s\S]+?)\]\}/g,     // {[ console.log("Hello"); ]} - runs
// interpolate : /\{\{([\s\S]+?)\}\}/g   // {{ key }} - interpolates
// };

// $(document).ready(function () {
// 	if ($('#main').length === 0) {
//     	return; // Don't start Backbone unless we're on a Backbone compatible page.
//   	}
//   	app.paragraphs = new app.Paragrpahs();




// 	// $('select#paragraph_tvcharacter_id').on('change', function (e) {
// 	// 	e.preventDefault();
// 	// 	$.ajax({
// 	// 			url: "/paragraphs",
// 	//      		type: "GET",
// 	//      		data: {
// 	//      			paragraph: {
// 	//        				tvcharacters: gon.tvcharacters
// 	//      			}
// 	//      		},
// 	//      		success: function () {
// 	//      			console.log(gon.tvcharacters[$('select#paragraph_tvcharacter_id').val() -1].name);
// 	//      		}
// 	//    		});
// 	// });
// 	// $('input#quotes').on('change', function (e) {
// 	// 	gon.quotations =  $(this).val();
// 	// 	console.log(gon.quotations);
// 	// });
// 	// $('input#paragraphs').on('change', function (e) {
// 	// 	gon.paragraphs =  $(this).val();
// 	// 	console.log(gon.paragraphs);
// 	// });
	


// })