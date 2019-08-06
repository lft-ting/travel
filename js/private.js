/*
* @Author: admin
* @Date:   2019-02-16 15:03:37
* @Last Modified by:   hp
* @Last Modified time: 2019-02-27 20:11:17
*/
$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>50){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})
var number=/^[0-9]{1,}$/
function numbers(e){
	if(e.value.match(number)==null){
    	e.value=''
    }
}
$("form").submit(function(e){
	var flag=true
	if($('#want_go').val()==''){
		$('#want_go').siblings('.error').show()
		flag=false;
	}
	if($('.start-go').val()==''){
		$('.start-go').siblings('.error').show()
		flag=false;
	}
	if($('.dpd1').val()==''){
		$('.dpd1').siblings('.error').show()
		flag=false;
	}
	if($('#fname').val()==''){
		$('#fname').siblings('.error').show()
		flag=false;
	}
	if($('#name').val()==''){
		$('#name').siblings('.error').show()
		flag=false;
	}
	if($('.phone').val()==''){
		$('.phone').siblings('.error').show()
		flag=false;
	}
	if($('.mail').val()==''){
		$('.mail').siblings('.error').show()
		flag=false;
	}
	if(flag){

	}else{
		e.preventDefault()
	}
})
function hideor(e){
	$(e).siblings('.error').fadeOut(400)
}
$('#budget-ul li').click(function(){
	var n=$(this).children().html()
	console.log($(this).children().html())
	$('.major').html(n)
	$('#budget-ul').hide()
})
$('#call-ul li').click(function(){
	var n=$(this).children().html()
	console.log($(this).children().html())
	$('.call-major').html(n)
	$('#call-ul').hide()
})
$('.hotel-rbox').click(function(){
	$('.hotel-rbox').css('background-position','0px 0px')
	$(this).css('background-position','-30px -15px')	
})
$('.daoyou-rbox').click(function(){
	$('.daoyou-rbox').css('background-position','0px 0px')
	$(this).css('background-position','-30px -15px')	
})
$('.theme-label').click(function(){
	$(this).toggleClass('add')
	var max=$(this).parent().children('.add').length
	if (max>3) {
            $(this).removeClass("add");
        }
})
$('.nav_left>li').hover(function(){
    $(this).children('.menu').toggle()
})
$('.dpd1').click(function(){
	$('#schedule-box').toggle()
})
$('.pbox').click(function(){
	$('#pbox').toggle()
})
$('#budget').click(function(){
	$('#budget-ul').toggle()
})
$('#call').click(function(){
	$('#call-ul').toggle()
})
$('.room .up').click(function(){
	var n=$('.room .dpd2').val()
	n++
	$('.room .dpd2').val(+n)
})
$('.room .down').click(function(){
	var n=$('.room .dpd2').val()
	n--
	if(n<0){
		n=0
	}
	$('.room .dpd2').val(+n)
})
$('.child .up').click(function(){
	var n=$('.child .dpd2').val()
	n++
	$('.child .dpd2').val(+n)
})
$('.child .down').click(function(){
	var n=$('.child .dpd2').val()
	n--
	if(n<0){
		n=0
	}
	$('.child .dpd2').val(+n)
})
$('.humans .up').click(function(){
	var n=$('.humans .dpd').val()
	n++
	$('.humans .dpd').val(+n)
})
$('.humans .down').click(function(){
	var n=$('.humans .dpd').val()
	n--
	if(n<1){
		n=1
	}
	$('.humans .dpd').val(+n)
})
$('.go-right .down').click(function(){
	var n=$('.go-right .dpd2').val()
	n--
	if(n<1){
		n=1
	}
	$('.go-right .dpd2').val(+n)
})
$('.go-right .up').click(function(){
	var n=$('.go-right .dpd2').val()
	n++
	$('.go-right .dpd2').val(+n)
})