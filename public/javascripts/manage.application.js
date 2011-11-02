function notify(flash_message){
	// jQuery: reference div, load in message, and fade in
	var flash_div = $("#flash")
	flash_div.html(flash_message);
	flash_div.fadeIn(400);
	// use Javascript timeout function to delay calling
	// our jQuery fadeOut, and hide
	setTimeout(function(){
	flash_div.fadeOut(1000,
	function(){
		flash_div.html("");
		flash_div.hide()}
		)},
		5400);
}

$(function(){ // &lt;&lt;JQUERY after dom is loaded event
	// hide our container div
	$("#flash").hide();
	// grab flash message from our div
	var flash_message = $("#flash").html().trim();
	// call our flash display function
	if(flash_message != ""){
		notify(flash_message);
	}
});

/*
 * Image preview script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */
 
this.imagePreview = function(){	
	/* CONFIG */
		
		xOffset = 10;
		yOffset = 30;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$("a.preview").hover(function(e){
		this.t = this.title;
		this.title = "";	
		var c = (this.t != "") ? "<br/>" + this.t : "";
		$("body").append("<p id='preview'><img src='"+ this.href +"' alt='Image preview' />"+ c +"</p>");								 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast");						
    },
	function(){
		this.title = this.t;	
		$("#preview").remove();
    });	
	$("a.preview").mousemove(function(e){
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};


// starting the script on page load
$(document).ready(function(){
	imagePreview();
});