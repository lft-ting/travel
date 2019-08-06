/*
* @Author: admin
* @Date:   2019-02-16 10:57:51
* @Last Modified by:   hp
* @Last Modified time: 2019-02-27 17:53:59
*/
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
    if(n<900){
    	$('.go-top').hide()
    	}
    	else if(n>900&&n<3900){
				$('.go-top').slideDown(200)
			}
			else if(n>3900){
				$('.go-top').hide()
			}     
})
$('.go-top,.bottom-go-top').click(function(){
	$('html,body').animate({'scrollTop':'0px'})
})
$('.nav_left>li').hover(function(){
    $(this).children('.menu').toggle()
})

var n=0
function go(){
timer=setInterval(function(){
	n++
	if(n>2){
		n=0
	}
	$('.voyage li').eq(n).show(1000).siblings().hide(800)    
},5000)
}
function add(){
	$('.voyage li').eq(n).show(1000).siblings().hide(800)
}
go()
$('#left').click(function(){
	n--
	if(n<0){
		n=2
	}
	add()
})
$('#right').click(function(){
	n++
	if(n>2){
		n=0
	}
	add()
})
$('section').hover(function(){
    clearInterval(timer)
},function(){
   go()
})