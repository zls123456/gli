$(document).ready(function() {

$(".menu_list ul li").click(function() {
	
	if($(this).children(".div1").is(":hidden")){
		
		if(!$(this).children(".div1").is(":animated")) {
			$(this).children(".xiala").css({'transform':'rotate(180deg)'}); 
			
			$(this).children(".div1").animate({
					height: 'show'
				}, 1000)
				//siblings
				.end().siblings().find(".div1").hide(1000);
		}
	} else {
	
		if(!$(this).children(".div1").is(":animated")) {
			$(this).children(".xiala").css({'transform':'rotate(360deg)'});  
			$(this).children(".div1").animate({
					height: 'hide'
				}, 1000)
				.end().siblings().find(".div1").hide(1000);
		}
	}
});


$('.div1').click(function(e){
	e.stopPropagation();
});

$(".menu_list ul li .div1 .zcd").click(function() {
	$(this).addClass("removes").siblings().removeClass("removes");
	  $(".div1").each(function(){
	  		if($(this).is(":hidden")){
	  			$(this).children(".zcd").removeClass("removes");
		  		}
		  });
	});
});



