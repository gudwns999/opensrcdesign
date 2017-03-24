<%-- 화면ID : OD01-01-04 --%>
<%-- 화면ID : OD01-01-05 --%>
<%@page import="com.opendesign.utils.CmnConst.CateExclude"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회원가입:상세 -->
<style>
	.cateDepth {
		width:150px;
	}
	.fully-height-bar{
		height:100%;display:inline-block;content:' '; vertical-align:middle;
	}
	.my-pic{position:relative; float:left; width:127px; height:163px; overflow:hidden; background:#fff url(../image/common/bg_profile.png) no-repeat center center;}
	.my-pic img{width:100%;height:100%;}
	.my-pic input[type="file"]{position:absolute; top:0; left:0; width:100%; height:163px; opacity:0;}
</style>
<div class="modal modal-login" id="join2-modal">
	<div class="modal-inner modal-dialog-regi" style="height:570px;">
		<div class="modal-content modal-content-one">
			<div class="modal-body" style="padding:30px">
				<form name="regForm2" method="post" enctype="multipart/form-data" onsubmit="return false;" >
					<input type="hidden" name="memberType" value="">
					<input type="hidden" name="categoryList" value="">
					<div align="right">
						<button type="button" class="btn-close close-login" style="margin-top:10px;" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
					</div>
					<fieldset>
						<legend>회원가입</legend>
						<div class="row">
							<div class="col-sm-4" align="center">
								<div class="my-pic form-group">
									<img src="/resources/image/addFile.png" class="pic-profile">
									<input type="file" name="imageUrlFile" accept="image/x-png, image/jpeg" onchange="imgPreview(event);">
								</div>
							</div>
							<div class="col-sm-8">
								<div class="fully-height-bar"></div>
								<div style="vertical-align:middle">
									<h5>프로필 사진 형식</h5>
									<h5> </h5>
									<h5>용량  : ~ 5Mbytes</h5>
									<h5>형식  : .png / .jpeg 파일만 가능 </h5>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8">
								<div class="form-group">
									<input type="text" name="uname" class="form-control" style="border: 2px solid #f5acac;" placeholder="닉네임 또는 회사명 (필수 최대 20자)" maxlength="20">
								</div>
								<div class="form-group">
									<textarea name="comments" class="form-control" placeholder="자기소개 또는 회사소개 등록(최대 1,000자)" maxlength="1000"></textarea>
								</div>
							</div>								
						</div>
						<div class="row">
							<div class="cate-wrap" id="cateWrapMemberReg">
								<p style="padding-left:15px">나의 카테고리(필수)</p>
								<div class="form-group col-sm-4">
									<div class="select-area custom-select">
										<select class="cateDepth" name="cateDepth1" id="cateDepth1" style="border: 2px solid #f5acac;">
										<option value="">전체</option>
										</select>
									</div>
								</div>
								<div class="form-group col-sm-4">
									<div class="select-area custom-select">
										<select class="cateDepth" name="cateDepth2" >
											<option value="">전체</option>
										</select>
									</div>
								</div>
<!--								<div class="form-group col-sm-4">
									<div class="select-area custom-select">
										<select class="cateDepth" name="cateDepth3" >
											<option value="">전체</option>
										</select>
									</div>
								</div>-->
									<button type="button" class="btn-add" ><img src="/resources/image/common/btn_add.png" alt="더하기"></button>
								<!--<ul class="cate-list">
									<li>의상 <button type="button" >X</button> <input type="hidden" name="memberCateCode" value=""></li>
								</ul>-->
							</div>
						</div>
						<div class="form-group">
							<p style="font-size: 14px; margin-bottom: 8px;">거주지역(필수)</p>
							<div class="select-area custom-select" id="sidoMemberReg" style="border: 2px solid #f5acac; height: 35px; width: 367px;">
								<select class="form-control" name="sidoVal" id="sidoVal">
									<option value="" selected="selected">전체</option>
								</select>
							</div>
						</div>
						<p class="txt" style="clear: both; padding-top: 14px;">디자이너 또는 제작자가 아니라면 체크하지 않아도 됩니다. (중복 선택 가능)
							<span>* 체크를 하시면 디자이너, 제작자 메뉴에 노출됩니다.</span>
						</p>	
						<div class="check-wrap">
							<div class="custom-check">
								<input type="checkbox" name="memberTypeCheck" value="d" id="designer">
								<label for="designer">디자이너</label>
							</div>
							<div class="custom-check">
								<input type="checkbox" name="memberTypeCheck" value="p" id="producer">
								<label for="producer">제작자</label>
							</div>
						</div>
						<a href="javascript:regForm2Submit();" class="btn-complete btn-modal btn btn-red" style="margin-top:15px;width:100%">회원가입</a>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 회원가입이 완료 -->
<div class="modal" id="complete-modal">
	<div class="bg"></div>
	<div class="modal-inner">
		<p>회원가입이 완료되었습니다<br>감사합니다</p>
	</div>
</div>

<!-- ################ 카테고리 ################### -->
<script >
	$(function() {
		new CategoryView({
			htmlContainer: $('#cateWrapMemberReg')
			,hiddenFieldName: 'memberCateCode'
			,excludeData: {<%=CateExclude.P_NAME%>: '<%=CateExclude.V_DESI_PROD%>' }
		}).render();
		
		selectSidoList();
	});
</script>
<!-- ################ ]]카테고리 ################### -->

<script>
/** 회원가입2 */
var flag_regForm2Submit = false; //flag
function regForm2Submit() {
	// 0.validate
	var myForm = $('form[name="regForm2"]');
	if(!myForm.valid()) {
		return;
	}
	
	if(flag_regForm2Submit) {
		return;
	}
	
	if($("#cateDepth1").val() == "" || $("#cateDepth1").val() == null) {
		alert("카테고리를 선택해주세요.");
		$("#cateDepth1").focus();
		return;
	}
	
	if($("#sidoVal").val() == "" || $("#sidoVal").val() == null) {
		alert("거주지역을 선택해주세요.");
		$("#sidoVal").focus();
		return;
	}
	
	flag_regForm2Submit = true;
	
	//== 1. submit
	myForm.ajaxSubmit({
		url : "/register2.ajax",
		type : "post",
		dataType : 'json',
		complete : function(_data){
			flag_regForm2Submit = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data) {
			console.log(_data);
			if(_data.result == '1') {
	    		modalShow('#complete-modal');
	    		//3초후 숨기고 mypage로 이동
	    		setTimeout(function(){ 
	    				modalHide('#complete-modal');
	    				window.location.href = '/user/myPage.do';
	    			}, 3000);
	    	} else if(_data.result == ErrCode.V_EMAIL_DUP) { //이메일 중복
	    		alert('이메일 중복입니다.'); 
	    	} else if(_data.result == ErrCode.V_UNAME_DUP) { //닉네임 중복
	    		alert('닉네임 중복입니다.'); 
	    	} else {
	    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	    	}
		}
	});
	
}

//=== 검증 ==========
$(function(){
	regForm2ValidRuleInit();
})

function regForm2ValidRuleInit(){
	$.validator.addMethod("validateFileExtension", function(value, element) {
		return acceptFileSuffix(value, "jpeg, png, jpg");
	}, "썸네일은 jpg, png 파일만 등록이 가능합니다.");
	
	var myForm = $('form[name="regForm2"]');
	myForm.validate({
		rules:{
			uname : { required: true }
			,imageUrlFile: {validateFileExtension: true }
		},
		messages: {
			uname : { required: "닉네임 또는 회사명을 입력해 주세요." }
			,imageUrlFile : { validateFileExtension: "프로필 사진은 jpg, png 파일만 등록이 가능합니다." }
		},
		showErrors: function(errorMap, errorList) {
	    	if( errorList && errorList.length > 0 ){
	    		for( var i = 0; i < errorList.length; i++ ){                			
					alert(errorList[i].message);
	               	errorList[i].element.focus();
	    			break;
	    		}
	    	}
	    },
	    ignore: [],
	    focusInvalid:false,
	    onfocusout: false,
	    onkeyup: false,
	    onclick: false
	});
}

//시/도 리스트 가져오기.
function selectSidoList() {
	$.ajax({
		url : "/selectSidoList.ajax",
		type : "post",
		dataType : 'json',
		complete : function(_data){
			
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data) {
			console.log(_data);
			
			var sidoList = _data.sidoList;
			var sidoOption = "";
			for(var i = 0; i < sidoList.length; i++) {
				var sido = sidoList[i];
				sidoOption += "<option value='"+sido.seq+"'>" + sido.sido + "</option>";
			}
			$("#sidoVal").append(sidoOption);
		}
	});
} 


</script>

