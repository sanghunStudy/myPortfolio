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
		    ajaxData.append('files[' + i + ']', files[i]);
		    console.log(files[i]);
		}
//		ajaxData.append("file",files);
		console.log(ajaxData);
		$.ajax({ 
			type: "POST", 
//			enctype: 'multipart/form-data',
			url: '/kopo/portFolio/upload', 
			data: ajaxData, 
			processData: false, 
			contentType: false, 
			success: function (result) {
				
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