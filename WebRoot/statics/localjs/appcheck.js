$("#back").on("click",function(){
	window.location.href = "list";
});
$("#no").on("click",function(){
	$("#form").attr("action","check?isTrue=no");
	$("#form").submit();
});