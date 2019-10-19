/**
 * @Name   : index.js
 * @Description : 스크롤페이지
 * @Modification Information
 * @
 * @ 수정일        수정자    수정내용
 * @ ----------    ------    ---------------------------
 * @ 2019.10.18    배상훈    최초 생성
 *
 * @author 배상훈
 * @since 2019.10.18
 * @version 1.0
 * @see
 *
 */

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
        scrollEvent = true;
        count--;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600,complete: function(){
            scrollEvent = false;}
        })

    }else if(m<1 && scrollEvent == false && count <3){
        scrollEvent = true;
        count++;
        $("html,body").stop().animate({scrollTop:sb*count},
            {duration:600, complete: function(){
             scrollEvent = false;}
        })
    }

});

}