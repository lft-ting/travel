/*
* @Author: hp
* @Date:   2019-02-23 09:49:34
* @Last Modified by:   hp
* @Last Modified time: 2019-02-23 11:20:25
*/

$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>120){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})
$('.bottom-go-top').click(function(){
	$('html,body').animate({'scrollTop':'0px'})
})
$('.nav_left>li').hover(function(){
    $(this).children('.menu').toggle()
})