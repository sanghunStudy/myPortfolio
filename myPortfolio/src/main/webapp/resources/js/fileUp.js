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
	var savePoint;
	$("#fileSearch").click(function(){
		   $("#fileInput").trigger("click");
	});
	//저장버튼 클릭시
	$("#submitBtn").click(function(){
		if($("#bTitle").val() == ""){
			alert("제목을 입력해주세요");
			$("#bTitle").val("");
			return false;
		}else if($("#bTitle").val().length >=20){
			alert("제목을 20자 이하로 입력해주세요");
			$("#bTitle").val("");
			return false;
		}else if($("#bSummary").val() == ""){
			alert("프로젝트 개요를 입력해주세요");
			$("#bSummary").val("");
			return false;
		}else if($("#bSummary").val().length >=20){
			alert("프로젝트 개요를 20자 이하로 입력해주세요");
			$("#bSummary").val("");
			return false;
		}else if($("#bUserCnt").val() == ""){
			alert("프로젝트 인원을 입력해주세요");
			$("#bUserCnt").val("");
			return false;
		}else if($("#bPurpose").val().length <= 10){
			alert("프로젝트 목적을 10자 이상 입력해주세요");
			return false;
		}else if($("#bDb").val().length >= 20){
			alert("사용 데이터베이스를 20자 이하로 입력해주세요");
			$("#bDb").val("");
			return false;
		}else if($("#bTool").val().length >= 10){
			alert("사용 툴을 5자 이하로 입력해주세요");
			$("#bTool").val("");
			return false;
		}else if($("#bLanguage").val().length >= 20){
			alert("사용언어를 20자 이하로 입력해주세요");
			$("#bLanguage").val("");
			return false;
		}else if("" != seUser){
			savePoint = 1;
			save(savePoint);	
		}else{
			alert("로그인 후 이용해 주세요");
		}
	});
}());

$("#fileInput").change(function(e){
	savePoint = 0;
	var chkLeng = 0;
	var files = $("#fileInput").prop("files");
	var fLength = $(".fileNameList").length;
		chkLeng = files.length + fLength;

	if(chkLeng <= 0){
		alert("하나 이상의 hwp 파일을 선택 해주세요");
		return false;
	}else if(chkLeng >4){
		alert("첨부파일은 최대 4개까지  등록 가능합니다.");
		return false;
	}else{
		save(savePoint);	
	}
	
});
//저장처리
function save(savePoint){
	var files = $("#fileInput").prop("files");
	var fLength = $(".fileNameList").length;
	var chkLeng = chkLeng = files.length + fLength;
		
	
	if(chkLeng <= 0){
		alert("하나 이상의 hwp 파일을 선택 해주세요");
		return false;
	}else{
		var ajaxData = new FormData();
		var fileName = $("input[type=file]")[0].files[0].name;		
		//파일 길이만큼 반복
		for(var i=0; i < files.length; i++){
			if(chkFileType(files[i].name,files[i].size)){
				//유효성 통과시 파일정보를 form에 담아준다.
				ajaxData.append("files["+i+"]",files[i]);
			}else{
				return false;
			}
		}
		ajaxData.append("savePoint",savePoint);
		ajaxData.append("bNo",$("#bNo").val());
		$("input[name='fileNameInput']").val(fileName);
		if(savePoint == 1){
			var form = $("#addForm");
			$.ajax({
				type:"POST",
				url:path+"/portFolio/add",
				data:form.serialize(),
				success:function(res){
					if(res === "ok"){
						fileUploadAjax(ajaxData);
					}else{
						alert("필수 항목을 모두 입력해주세요");
					}
				}
			});
		}else{
			fileUploadAjax(ajaxData);
		}

	}
}
//파일 업로드
function fileUploadAjax(ajaxData){
	$.ajax({ 
		type: "POST", 
		enctype: 'multipart/form-data',
		url: path+'/portFolio/upload', 
		cache: false,
	    contentType: false,
	    processData: false,
	    data: ajaxData,
	    success: function (result) {
	    	if(result == "ok"){
	    		alert("등록이 완료 되었습니다.");
	    		location.href=path+"/portFolio/list";
	    	}else{
			    	var fileNameList = "";
					$.each(result,function(key,val){
						fileNameList += "<div><p class='fileNameList'>"+val+"</p><a class='fileDel'>삭제</a></div>";
					});
					$("#fileList").html(fileNameList);
	    	}
		}, error: function (e) { 
			console.log(e);
			console.log(e.status);
		} });
}

var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //파일 확장자 정규식 
var maxSize = 5242880; // 5MB
//파일 타입 체크
function chkFileType(fileName,fileSize){
    var fileFormat = fileName.split(".");
    if(fileSize > maxSize){
    	alert("5MB이상의 파일은 업로드가 불가능합니다.");
    	return false;
    }
    if(regex.test(fileName) || fileFormat.indexOf("hwp") != 1){
    	alert("hwp 파일만 업로드가 가능 합니다.");
    	 return false;
    }else if (fileFormat.indexOf("hwp") == 1) {
         return true;
    }
    
}
//파일삭제
$(document).on("click",".fileDel",function(e){
	var fNo =$(this).attr("data-code");
	if(fNo == undefined){
		fNo = 0
	}else{
		fNo = $(this).attr("data-code");
		$(this).parent("div").remove();
	}
	var delData = new FormData();
	var delFileName = $(this).prev().text();
	delData.append("delName",delFileName);
	delData.append("fNo",fNo);
	$.ajax({
		type: "POST", 
		url: path+'/portFolio/fileDel',
		data:delData,
		cache: false,
	    contentType: false,
	    processData: false,
		success:function(res){
			if(res != "updateDel"){
				var fileNameList = "";
				$.each(res,function(key,val){
					fileNameList += "<div><p class='fileNameList'>"+val+"</p><a class='fileDel'>삭제</a></div>";
				});
				$("#fileList").html(fileNameList);

			}else{
				alert("기존첨부 파일이 삭제 되었습니다.");
			}
		}
	});
});
//새로고침 및 화면종료시
$(window).bind("beforeunload", function() { 
	return fileListDel();
});
//뒤로가기시
window.onhashchange = function() {
	fileListDel();
}
//temp 폴더 비우기
function fileListDel(){
	$.ajax({
		type:"GET",
		url:path+"/portFolio/fileListDel",
		success:function(res){
			
		}
	});
}