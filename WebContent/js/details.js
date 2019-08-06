$(function(){
        		var num=0;
        		var timee;
                var n=0;
        		function zou(){
        			timee=setInterval(function(){
        			num=num+1;
        			if(num==6){
                        n=0;
                        $('.smallimg li').eq(n).addClass('current').siblings('').removeClass('current');
                    }
        			if(num>6)
        			{
        				num=0; 
                        $('.bigimg>ul').css('left', -660*num+'px'); 
                        num=1;
        			}
                $('.smallimg li').eq(num).addClass('current').siblings('').removeClass('current');
        		$('.bigimg ul').animate({'left':-660*num+'px'})

        		},2000);	
        		}
        		zou();
        		$('.con_left').hover(function() {		
        			clearInterval(timee);
        		}, function() {
        			zou();
        		});
        		/*$('span').hover(function() {
                    console.log($(this).index());
        			$(this).css('background', 'rgba(0, 0, 0, 0.8)');
        		}, function() {
        			$(this).css('background', 'rgba(0, 0, 0, 0.5)');
        		});*/

        		$('#left').click(function(event) {
        			num=num-1;
        			if(num<0)
        			{
        				num=6;
                        $('.bigimg ul').css('left', -660*num+'px'); 
                        num=5;
        			}
        			$('.bigimg ul').animate({'left':-660*num+'px'})
                    $('.smallimg li').eq(num).addClass('current').siblings('').removeClass('current');

        		});
        		$('#right').click(function(event) {
        			num=num+1;
                    if(num==6){
                        n=0;
                        $('.smallimg li').eq(n).addClass('current').siblings('').removeClass('current');
                    }
        			if(num>6)
        			{
                        num=0; 
                        $('.bigimg ul').css('left', -660*num+'px'); 
                        num=1;
        			}
                    $('.smallimg li').eq(num).addClass('current').siblings('').removeClass('current');
        			$('.bigimg ul').animate({'left':-660*num+'px'})
        		});


        		$('.smallimg li').click(function(event) {
                    $(this).addClass('current').siblings('').removeClass('current');
        			num=$(this).index();
                    $('.bigimg ul').animate({'left':-660*num+'px'})
        		});
        		

        	})
 
$('#putin').click(function(event) {
    		/*if($(event.target).is($('#putin'))){
    			$('.book').addClass('is-visible');
    			if($(event.target).is('.book-form')){
    				$('.book-form').addClass('is-selected');
    			}
    		} */ 
    		$('.newbook').addClass('is-visible');  		    		
    	});
    	$('.newbook').click(function(event) {
    		if($(event.target).is('.newbook')){
    			$('.newbook').removeClass('is-visible');
    		}
    		
    	});   
    	
$(window).scroll(function(){
	var n=$(window).scrollTop()
	if(n>120){
	    $('.navbar').show()
	}else{
	    $('.navbar').hide()
	}
})

