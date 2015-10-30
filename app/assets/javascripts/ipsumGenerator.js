var app = app || {};

_.templateSettings = {
evaluate : /\{\[([\s\S]+?)\]\}/g,     // {[ console.log("Hello"); ]} - runs
interpolate : /\{\{([\s\S]+?)\}\}/g   // {{ key }} - interpolates
};

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