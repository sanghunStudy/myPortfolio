
var scrollEvent = false;
var count = 0;

window.onload = function(){
	go();
}

//스크롤 페이지
function go(){

    $("html,body").on("mousewheel",function(c){
    
    c.preventDefault();
    var m = c.originalEvent.wheelDelta;
    var sb = $(".section0").height();

    if(m > 1 && scrollEvent == false && count >= 1){
//        console.log(count+"<<<<<count");
        scrollEvent = true;
        count--;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600,complete: function(){
            scrollEvent = false;}
        })

    }else if(m<1 && scrollEvent == false && count <3){
//        console.log(count+"<<<<<<else if count");
        scrollEvent = true;
        count++;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600, complete: function(){
             scrollEvent = false;}
        })
    }

    if(count == 1){
        $(".section1_item").addClass("animated animatedFadeInUp fadeInUp");
    }else if(count == 2){
        // alert("3번째 영역");
    	$(".section2-wrap").addClass("animated animatedFadeInUp fadeInUp");
    }else if(count == 3){
        // alert("4번째 영역");
        $(".section3_item").addClass("animated animatedFadeInUp fadeInUp");
    }
});

}