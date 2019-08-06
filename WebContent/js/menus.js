$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>120){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})
$(window).scroll(function() {
    var n=$(window).scrollTop()
    if(n<700){
    	$('.go-top').hide()
    	}
    	else if(n>700&&n<1400){
				$('.go-top').slideDown(200)
			}
			else if(n>1400){
				$('.go-top').hide()
			}     
})
$('.go-top,.bottom-go-top').click(function(){
	$('html,body').animate({'scrollTop':'0px'})
})
$('.FP li').hover(function(){
    $(this).children().children().children('.title1').toggle()
})