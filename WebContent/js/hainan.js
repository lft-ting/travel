/*
* @Author: admin
* @Date:   2019-02-17 11:33:32
* @Last Modified by:   hp
* @Last Modified time: 2019-03-02 09:08:46
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
var n=0
$('ol li').click(function(){
	var num=$(this).index()
	n=num
	if(num>0){
		$('#left').css('display','block')
		$('#right').css('display','block')
	}
	if(num>1){
		$('#right').css('display','none')
	}
	if(num<1){
		$('#right').css('display','block')
		$('#left').css('display','none')
	}
	$('ol li').removeAttr('class')
	$('ol li').eq(num).attr('class','current')
	$('.FP').css('left','${-1020*num}px')
	console.log(num)
})
$('#left').click(function(){
	n--
	if(n>0){
		$('#left').css('display','block')
		$('#right').css('display','block')
		
	}
	else if(n<1){
		$('#left').css('display','none')
		$('#right').css('display','block')
	}
		$('ol li').removeAttr('class')
		$('ol li').eq(n).attr('class','current')
		$('.FP').css('left','${-1020*n}px')
		console.log(n)

})
$('#right').click(function(){
	n++
	if(n>0){
		$('#left').css('display','block')
		$('#right').css('display','block')
	}
	if(n>1){
		$('#right').css('display','none')
	}
	else if(n<1){
		$('#right').css('display','block')
	}
	$('ol li').removeAttr('class')
	$('ol li').eq(n).attr('class','current')
	/*$('.FP').css('left',(-1020*n)+'px')*/
	$('.FP').css('left','${-1020*n}px')
	console.log(n)
})

