/*
* @Author: hp
* @Date:   2019-01-25 16:26:08
* @Last Modified by:   hp
* @Last Modified time: 2019-02-27 17:42:03
*/
$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>120){
		$('.navbar').show()
	}else{
		$('.navbar').hide()
	}
})

var reg=/^[0-9]{11,}|[@]{1,}$/
user.onkeyup=function(){
	if(this.value.match(reg)){
		pass.style.display='block'
		forget.style.display='block'
	}else{
		pass.style.display='none'
		forget.style.display='none'
	}
}
