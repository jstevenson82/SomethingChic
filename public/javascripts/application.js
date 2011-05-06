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