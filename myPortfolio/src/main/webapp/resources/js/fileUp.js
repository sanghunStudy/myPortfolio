/**
 * @Name   : fileUp.js
 * @Description : 파일업로드
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

$(function(){
	$("#fileSearch").click(function(){
		   $("#fileInput").trigger("click");
	});
}());

$("#fileInput").change(function(e){
	save();
});

function save(){
	var fileName = $("input[type=file]")[0].files[0].name;
	
	  
	if(fileName == ""){
		alert("hwp 파일을 선택 해주세요");
	}else if(chkFileType(fileName)){
		alert("hwp 파일만 업로드 가능 합니다.");
	    return false;
	}else{
		$("input[name='fileNameInput']").val(fileName);
        
		var ajaxData = new FormData();
		var files = $("#fileInput").prop("files");
		for(var i=0; i < files.length; i++){
			ajaxData.append("files["+i+"]",files[i]);
		}
		$.ajax({ 
			type: "POST", 
			enctype: 'multipart/form-data',
			url: '/kopo/portFolio/upload', 
			cache: false,
		    contentType: false,
		    processData: false,
		    data: ajaxData,
		    success: function (result) {
		    	var fileNameList = "";
//				console.log(result);
				$.each(result,function(key,val){
					fileNameList += "<p>"+val+"</p><a>삭제</a>";
				});
				$("#fileList").html(fileNameList);
			}, error: function (e) { 
				console.log(e);
				console.log(e.status);
			} });

	}
}

//파일 타입 체크
function chkFileType(fileName){
    var fileFormat = fileName.split(".");
     if (fileFormat.indexOf("hwp") != 1) {
         return true;
     } else {
         return false;
     }
}