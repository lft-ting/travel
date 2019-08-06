/*
* @Author: admin
* @Date:   2019-02-14 11:50:41
* @Last Modified by:   hp
* @Last Modified time: 2019-03-16 15:05:30
*/
$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>560){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})
$(window).scroll(function() {
    var n=$(window).scrollTop()
    if(n<1200){
    	$('.go-top').hide()
    	}
    	else if(n>1200&&n<6158){
				$('.go-top').slideDown(200)
			}
			else if(n>6158){
				$('.go-top').hide()
			}     
})
$('.searchbar input').focus(function(){
	$('.checkin').show().children('input').animate({'width':'140px'},600)
	$('.checkout').show().children('input').animate({'width':'140px'},600)
});
// $('.checkindate').click(function(a){
// 	$('#schedule-box').show()
// 	a.stopPropagation()
// })
// $('.checkoutdate').click(function(a){
// 	var div=$('.checkin #schedule-box').clone(true) 
// 	// clone(true)带有事件的克隆
// 	div.attr('class','sml')
// 	$('.checkout').append(div)
// 	a.stopPropagation()
// })
// $('')
// $('.checkoutdate').click(function(a){
// 	$('#schedule-box').css('left','140px')
// 	$('#schedule-box').show()
// 	a.stopPropagation()
// })	
// $('.schedule-bd li').click(function(){
// 	var m=$('.today').html()
//     $('.checkoutdate').val(m)
//     $('#schedule-box').hide()
// })	
var n=0
function add(){
	$('ol li').removeAttr('class')
	$('ol li').eq(n).attr('class','current')
	$('.header_pic li').eq(n).siblings().hide()
	$('.header_pic li').eq(n).show()
}
function go(){
timer=setInterval(function(){
	n++
	if(n>13){
		n=0
	}
	add()
},5000)
}
go()
$('ol li').click(function(){
	var index=$(this).index()
	n=index
	$('ol li').removeAttr('class')
	$('ol li').eq(index).attr('class','current')
	$('.header_pic li').eq(index).stop().fadeIn(1300).siblings().hide()
})
$('#left').click(function(){
	n--
	if(n<0){
		n=13
	}
	add()
})
$('#right').click(function(){
	n++
	if(n>13){
		n=0
	}
	add()
})

$('header').hover(function(){
    clearInterval(timer)
},function(){
   go()
})
$('.different-video').click(function(){
	var Media = document.getElementById("media");
	$('.diff-video').show()
	Media.play();
	$('body').css('overflow','hidden')
})
$('.diff-video').click(function() {
	var Media = document.getElementById("media");
	$('.diff-video').hide()
	Media.pause();
	$('body').css('overflow','')
})
$('.go-top,.bottom-go-top').click(function(){
	$('html,body').animate({'scrollTop':'0px'})
})

$('.nav_left>li').hover(function(){
    $(this).children('.menu').toggle()
})
$('.FP li').hover(function(){
    $(this).children().children().children('.title1').toggle()
})
$('.l1').hover(function(){
	$('.l1 .t').text('Ani Villas Thailand')
	$('.l1 .t2').text('Phuket Island,Thailand')
	$('.l1 .t3').text('¥ 55,776 /晚起')
},function(){
	$('.l1 .t').text('泰国安颐私人度假别墅')
	$('.l1 .t2').text('泰国,普吉岛及安达曼海岸')
	$('.l1 .t3').text('6-10卧室 / 12-20人')
})
$('.l2').hover(function(){
	$('.l2 .t').text('Kumo Machiya Imperial Palace Minami')
	$('.l2 .t2').text('Kyoto,Japan')
	$('.l2 .t3').text('')
},function(){
	$('.l2 .t').text('云·小舟')
	$('.l2 .t2').text('日本,京都')
	$('.l2 .t3').text('2-5人')
})
$('.l3').hover(function(){
	$('.l3 .t').text('Ani Villas Sri Lanka')
	$('.l3 .t2').text('Dickwella,Sro Lanka')
	$('.l3 .t3').text('¥ 35,301 /晚起')
},function(){
	$('.l3 .t').text('斯里兰卡安颐私人度假别墅')
	$('.l3 .t2').text('斯里兰卡,迪克维勒')
	$('.l3 .t3').text('4-15卧室 / 8-30人')
})
$('.l4').hover(function(){
	$('.l4 .t').text('Samujana Villa 30 (Plus)')
	$('.l4 .t2').text('Choneng Mon,Koh Samui,Thailand')
	$('.l4 .t3').text('¥ 19,769 /晚起')
},function(){
	$('.l4 .t').text('萨姆加纳30号别墅')
	$('.l4 .t2').text('泰国,苏梅岛,春蒙')
	$('.l4 .t3').text('5卧室 / 10人')
})
$('.l5').hover(function(){
	$('.l5 .t').text('The Ungasan Clifftop Resort - Villa Pawan')
	$('.l5 .t2').text('Uluwatu Bail island,Indonesia')
	$('.l5 .t3').text('¥ 17,483 /晚起')
},function(){
	$('.l5 .t').text('乌干沙帕凡舞别墅')
	$('.l5 .t2').text('印度尼西亚,巴厘岛,乌鲁瓦图')
	$('.l5 .t3').text('3-5卧室 / 6-10人')
})
$('.l6').hover(function(){
	$('.l6 .t').text('Saint Lazare')
	$('.l6 .t2').text('Gakerues Lafayette, ile-de-france,France,Europe')
	$('.l6 .t3').text('¥ 5,784 /晚起')
	$('.l6 .t2').css('line-height','1.2em')
},function(){
	$('.l6 .t').text('巴黎八区春天典雅公寓')
	$('.l6 .t2').text('欧洲,法国,大巴黎,老佛爷街区')
	$('.l6 .t3').text('4卧室 / 8人')
})
$('.l7').hover(function(){
	$('.l7 .t').text('L`ALYA NINH VAN BAY - Nha Trang,Vietnam')
	$('.l7 .t2').text('Nha Trang,Vietnam')
	$('.l7 .out1').css('margin-top','20px')
},function(){
	$('.l7 .t').text('芽庄安林宁凡湾别墅度假村—酒店套餐')
	$('.l7 .t2').text('越南,芽庄')
	$('.l7 .out1').css('margin-top','0px')
})
$('.l8').hover(function(){
	$('.l8 .t').text('Belmond La Residence Phou Vao Lauang Prabang')
	$('.l8 .t2').text('LuangPrang,laos')
	$('.l8 .out1').css('margin-top','20px')
},function(){
	$('.l8 .t').text('琅勃拉邦贝尔蒙德攀喜风筝山酒店套餐')
	$('.l8 .t2').text('老挝,琅勃拉邦')
	$('.l8 .out1').css('margin-top','0px')
})
$('.l9').hover(function(){
	$('.l9 .t').text('Bensley Collection – Shinta Mani Angkor 比尔·本斯利位于暹粒文化的最新典范')
	$('.l9 .t2').text('Siem Reap,Cambodia')
	$('.l9 .out1').css('margin-top','20px')
},function(){
	$('.l9 .t').text('暹粒圣塔玛尼吴哥-本斯利典藏馆')
	$('.l9 .t2').text('柬埔寨,暹粒')
	$('.l9 .t2').css('margin-top','0px')
})
$('.l10').hover(function(){
	$('.l10 .t').text('Phulay Bay,a Ritz-Carlton Reserve')
	$('.l10 .t2').text('Krabi,Thailand')
	$('.l10 .t2').css('margin-top','0px')
},function(){
	$('.l10 .t').text('甲米普拉湾丽思卡尔顿隐世精品度假村——酒店套餐')
	$('.l10 .t2').text('泰国,甲米')
	$('.l10 .t2').css('margin-top','20px')
})
$('.l11').hover(function(){
	$('.l11 .t').text('Aandara Resort Phuket')
	$('.l11 .t2').text('Phuket Island,Thailand')
},function(){
	$('.l11 .t').text('普吉岛安达拉度假村—酒店套餐')
	$('.l11 .t2').text('泰国,普吉岛及安达曼海岸')
})
$('.l12').hover(function(){
	$('.l12 .t').text('Relais & Chateaux Wwanakarn Beach Resort & Spa')
	$('.l12 .t2').text('Phuket,Thailand')
},function(){
	$('.l12 .t').text('普吉岛罗莱夏朵瓦纳卡恩海滩度假村—酒店套餐')
	$('.l12 .t2').text('泰国,普吉岛')
})
$('.nav_user').hover(function(){
	$(this).children('.user').toggle()
})


