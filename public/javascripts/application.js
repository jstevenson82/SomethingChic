$(document).ready(function(){
  $("#post-comments").click(function(){
    $("#add-comments").toggle();
  });
});

function limitChars(textid, limit, infodiv)
{
	var text = $('#'+textid).val(); 
	var textlength = text.length;

	if(textlength > limit){
		$('#' + infodiv).html('You cannot write more then '+limit+' characters!');
		$('#'+textid).val(text.substr(0,limit));
		return false;
	}else{
		$('#' + infodiv).html('You have '+ (limit - textlength) +' characters left.');
		return true;

	}
}

$(function(){
	$('#comment_comment').keyup(function(){
		limitChars('comment_comment', 450, 'charlimitinfo');
	})
});

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