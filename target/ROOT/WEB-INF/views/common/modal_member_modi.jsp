<%-- 화면ID : OD01-03-02 --%>
<%@page import="com.opendesign.utils.CmnConst.CateExclude"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	/* 필수항목 */
	.km-required{color:red !important; }
	.none{width:100%; text-align:center; font-size:15px; font-weight:700; color:#414141;}
	.hide{display:none;}

	/* modal */
	.modalMypage{display:none; position:fixed; top:0; left:0; z-index:10; width:100%; height:100%; overflow:auto;}
	.modalMypage .bg{position:fixed; top:0; left:0; width:100%; height:100%; opacity:.4; background:#2c2c2c;}
	.modalMypage-inner{position:absolute; top:50%; left:50%; z-index:2}
	.modalMypage h1{padding:10px 0 15px 5px; font-size:38px; font-weight:normal; color:#414141;}
	.modalMypage input[type="text"],
	.modalMypage input[type="password"]{width:100%; height:48px; box-sizing:border-box; margin:0 0 5px; padding:15px 30px; font-size:14px; border:0; background:#fff;}
	.modalMypage .btn{display:block; width:100%; height:48px; font-size:15px; text-align:center; line-height:48px; color:#fff; background:#a4a4a4;}
	.modalMypage .btn-close{position:absolute; top:0; right:0;}
	.modalMypage .btn-facebook{width:100%; height:48px; font-size:15px; color:#fff; background:#3b5998;}
	.modalMypage .btn-regi{float:right; width:75px; height:28px; font-size:15px; color:#fff; border-radius:5px; background:#113b88;}  #login-modal .modalMypage-inner{width:426px; height:388px; box-sizing:border-box; margin:-194px 0 0 -213px; padding:15px; background:#f4f4f4;}
	.cate-wrap{clear:both; padding:15px 0 0;}
	.cate-wrap p{margin:0 0 5px; font-size:14px; color:#414141;}
	.custom-select{position:relative; float:left; margin:0 4px 0 0;}
	.custom-select select{position:absolute; top:0; left:0; width:100%; height:35px; font-size:14px; opacity:0;}
	.custom-select input[type="text"]{width:120px; height:35px; padding:0 30px 0 12px; color:#a4a4a4; background:#fff url(/resources/image/common/bg_selectSmall.gif) no-repeat right 0;}
	.custom-select input[type="text"].readonly{width:120px; height:35px; padding:0 30px 0 12px; color:#d9d9d9; background:#fff url(/resources/image/common/bg_selectSmall.gif) no-repeat right 0;}
	.btn-add{float:left; margin:6px 0 0 3px;}
	.cate-list{clear:both; overflow:hidden; padding:10px 0;}
	.cate-list li{float:left; min-width:60px; height:25px; margin:0 10px 0 0; padding:0 0 0 6px; font-size:14px; color:#a4a4a4; border-radius:5px; line-height:25px; background:#e8e8e8;}
	.cate-list button{float:right; height:25px; margin:0 8px 0 0; font-size:11px; color:#414141;}
	.check-wrap{margin:10px 0 15px; text-align:center;}
	.custom-check{position:relative; display:inline-block; margin:0 40px;}
	.custom-check input[type="checkbox"]{position:absolute; top:0; left:0; opacity:0;}
	.custom-check input[type="checkbox"]+label{display:inline-block; height:17px; padding:0 0 0 24px; background:url(/resources/image/common/bg_checkbox.png) no-repeat 0 0;}
	.custom-check input[type="checkbox"]:checked+label{color:#113b88; background-position:0 bottom;}


	#modi-modal .modalMypage-inner{top:100px; width:600px; margin:0 0 100px -320px; padding:30px 40px; background:#f6f6f6;}
	#modi-modal h1{margin:0 0 30px; padding:0;}
	#modi-modal .my-pic{width:105px; height:105px; margin:0 12px 0 0;}
	#modi-modal .my-pic span{position:absolute; bottom:0; left:0; width:100%; height:23px; box-sizing:border-box; padding:0 0 0 10px; font-size:10px; color:#fff; line-height:23px; background:rgba(0, 0, 0, .5) url(/resources/image/mypage/bg_camera.png) no-repeat 91% 5px;}
	#modi-modal .base-info{overflow:hidden; margin:0 0 20px;}
	#modi-modal .base-info dd{float:left;}
	#modi-modal dl{margin:0 0 10px;}
	#modi-modal dt{margin:0 0 10px; font-size:18px; color:#414141;}
	#modi-modal dd textarea{width:399px; height:62px; padding:5px 10px; font-size:14px; color:#a4a4a4; line-height:1.5; border:1px solid #113b88;}
	#modi-modal dd input[type="text"],
	#modi-modal dd input[type="password"]{height:40px; padding:0 10px;}
	#modi-modal .custom-select{margin:0 17px 0 0;}
	#modi-modal .custom-select select{height:40px;}
	#modi-modal .custom-select input[type="text"]{width:146px; padding:0 40px 0 10px; background:#fff url(/resources/image/common/bg_selectMiddle.gif) no-repeat right 0}
	#modi-modal .btn-add{margin:8px 0 0; color:#a4a4a4;}
	#modi-modal .txt{font-size:12px; color:#414141; letter-spacing:-1px;}
	#modi-modal .txt span{display:block; margin:2px 0 0; color:#113b88;}
	#modi-modal .btn-complete{display:block; width:100%; height:38px; font-size:18px; color:#fff; text-align:center; line-height:38px; border-radius:7px; background:#a4a4a4;}

</style>
<script>
	function myModalHide() {
		$('body').removeClass('lock');
		$('#modi-modal').fadeOut();
	}
    $(function(){
        $('body').on('click', '.modalMypage .bg, .btn-close', function(){ //$('.modal .bg, .btn-close').click(function(){
		myModalHide();
        });
    });
	//ESC
	$(document).keyup(function(e){
		if(e.keyCode==27){
			myModalHide();
			$("#modi-modal").modal('hide').data('bs.modal',null);
		}
	});
</script>
<script id="tmpl-myInfoTemplate" type="text/x-jsrender">

<div class="bg"></div>


    <form name="regModForm" id="regModForm" method="post" enctype="multipart/form-data" onsubmit="return false;"style="overflow:scroll" >
	<div class="modalMypage-inner" style="background-color:2c2c2c;">
		<h1>회원정보수정</h1>
		  <input type="hidden" name="seq" value="{{:seq}}"/> <!-- 주제seq -->
		  <div class="btn-close">
                <button type="button" class="btn btn-default" >x</button>
              </div>

			<fieldset>

				<legend>가입</legend>
				<div class="base-info">
					<div class="my-pic">
						<img src="{{:imageUrl}}" class="pic-profile">
						<span>프로필 사진 변경</span>
						<input type="file" name="imageUrlFile" accept="image/x-png, image/jpeg"  onchange="imgPreview(event);">
					</div>
					<dl>
						<dt><strong>자기소개</strong></dt>
						<dd><textarea placeholder="자기소개 또는 회사소개 등록(최대 1,000자)" name="comments" maxlength="1000">{{:comments}}</textarea></dd>
					</dl>
				</div>

				<dl>
					<dt class="km-required">이메일</dt>
					<dd>
						<input type="text" name="email" value="{{:email}}" readonly="readonly" class="hide">
						<span>{{:email}}</span>
					</dd>
				</dl>
				<dl>
					<dt class="km-required">닉네임 (회사명)</dt>
					<dd><input type="text" name="uname" value="{{:uname}}" maxlength="20"></dd>
				</dl>
				<dl>
					<dt>현재 비밀번호</dt>
					<dd><input type="password" name="passwdOld" id="passwdOld"></dd>
				</dl>
				<dl>
					<dt>새 비밀번호</dt>
					<dd><input type="password" name="passwd" id="passwdNew"></dd>
				</dl>
				<dl>
					<dt>새 비밀번호 확인</dt>
					<dd><input type="password" name="passwdCheck" id="passwdCheck"></dd>
				</dl>

				<dl>
					<dt class="km-required">나의 카테고리</dt>
					<dd id="cateWrapMemberMod">
						<div class="select-area custom-select">
							<input type="text" value="전체">
							<select name="cateDepth1" >
							<option value="">전체</option>
						    </select>
						</div>
						<div class="select-area custom-select">
							<input type="text" value="전체">
							<select name="cateDepth2" >
							<option value="">전체</option>
						    </select>
						</div>

						<div class="select-area custom-select" style="display:none">
							<input type="text" value="전체">
							<select name="cateDepth3" >
							<option value="">전체</option>
						    </select>
						</div>
						<button type="button" class="btn-add"><img src="/resources/image/common/btn_add.png" alt="더하기"> 추가</button>
						<ul class="cate-list">
                            {{for cateNameList}}
							<li>{{:categoryName}} <input type="hidden" name="memberCateCode" id="memberCateCode" value="{{:categoryCode}}"></li>
                            {{/for}}
						</ul>
					</dd>
				</dl>
				<dl>
					<dt class="km-required" >거주지역</dt>
					<dd >
						<div class="select-area custom-select" style="width: 477px; height: 40px;" id="sidoDiv">
							<input type="text" id="sidoTxt" value="전체" style="width: 477px;">
							<select name="sidoVal" id="sidoVal" onchange="changeSidoInfo(this.value, this.options[this.selectedIndex].text)">
								{{for sidoList}}
								<option value="{{:seq}}">{{:sido}}</option>
								{{/for}}
			    			</select>
						</div>
						<ul class="cate-list">
							{{if sidoSeq > 0}}
							<li style="text-align: center; padding: 0 6px 0 6px;" id="memberSidoLi">{{:sido}}</li>
							<input type="hidden" name="memberSido" id="memberSido" value="{{:sidoSeq}}">
							{{else}}
							<li id="memberSidoLi" style="display: none;">{{:sido}}</li>
							<input type="hidden" name="memberSido" id="memberSido" value="{{:sidoSeq}}">
							{{/if}}
						</ul>
					</dd>
				</dl>
				<dl style="clear: both; padding-top: 10px;">
					<dt>회원 구분</dt>
					<dd>
						<p class="txt">디자이너 또는 제작자가 아니라면 체크하지 않아도 됩니다. (중복 선택 가능)
							<span>* 체크를 하시면 디자이너, 제작자 메뉴에 노출됩니다.</span>
						</p>
						<div class="check-wrap">
							<div class="custom-check">
                               {{if chkDesigner }}
								<input type="checkbox" name="memberTypeCheck" checked value="d" id="gubun-designer">
								<label for="gubun-designer">디자이너</label>
							   {{else}}
                                <input type="checkbox" name="memberTypeCheck" value="d" id="gubun-designer">
								<label for="gubun-designer">디자이너</label>
                               {{/if}}
							</div>
							<div class="custom-check">
                               {{if chkProDucer }}
								<input type="checkbox" name="memberTypeCheck" checked value="p" id="gubun-producer">
								<label for="gubun-producer">제작자</label>
                               {{else}}
								<input type="checkbox" name="memberTypeCheck" value="p" id="gubun-producer">
								<label for="gubun-producer">제작자</label>
							   {{/if}}
							</div>
						<div class="check-wrap">
					</dd>
				</dl>
				<a href="javascript:regModFormSubmit();" class="btn-complete">정보 수정 완료</a>
			</fieldset>
	</div>
    </form>

</script>

<script>

/**
 * 회원정보 로드
 */

//뷰 컨트롤러 생성
var listView = null;

//프로젝트 탬플릿
var myInfoTemplate = $("#tmpl-myInfoTemplate").html();

function goMemModi(memberSeq) {
	formValueClear('#modi-modal');
	//$('#upload-modal').find('[name="memberSeq"]').val(memberSeq);
	loadMyInfo(memberSeq);
}

/**
 * 나의 프로젝트 load
 */
var flag_loadMyInfo = false; //flag
var memseq;
function loadMyInfo(memberSeq) {
	   //뷰 컨트롤러 생성
	   listView = new ListView({
		    htmlElement : $('#modi-modal')
	   });
	   memseq = memberSeq;

		if(flag_loadMyInfo) {
			return;
		}
		flag_loadMyInfo = true;

		$.ajax({
			url: '/selectMyInfoList.ajax',
	        type: 'get',
	        data: { 'memberSeq' : memberSeq },
	        cache: false,
	        global: false,
			complete : function(_data){
				flag_loadMyInfo = false;
			},
			error : function(_data) {
				console.log(_data);
				//alert(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			},
			success : function(_data){
		    	var myInfoDatas = _data.infoList;
		    	// load
		    	//alert(myInfoDatas.length);
		    	loadMyInfoWithData(myInfoDatas);
			}
	    });
}

/**
 * 나의 디자인 load
 */
function loadMyInfoWithData(myInfoDatas) {
	listView.clear();

	if(!myInfoDatas || myInfoDatas.length == 0) {
			console.log('>>> loadProjectWithData no data.');
			return;
	}
	//alert(myInfoDatas.length)
	listView.addAll({
			keyName : "myInfo",
			data : myInfoDatas,
			htmlTemplate : myInfoTemplate,
	});

	//선택된 카테고리:
	var selCateCode = myInfoDatas[0].selCateCode;
	initCategoryMod(selCateCode);

	modalShow("#modi-modal");

	regModFormValidRuleInit();
	setSidoTxt(myInfoDatas[0].sidoSeq);
}

</script>
<!-- ################ 카테고리 ################### -->
<script >
	function initCategoryMod(selCateCode) {
		new CategoryView({
			htmlContainer: $('#cateWrapMemberMod')
			,hiddenFieldName: 'memberCateCode'
			,excludeData: {<%=CateExclude.P_NAME%>: '<%=CateExclude.V_DESI_PROD%>' }
			,selCateCode: selCateCode
		}).render();
	}
</script>
<!-- ################ ]]카테고리 ################### -->

<div class="modalMypage" id="modi-modal">

</div>

<script>
    /** 회원정보 수정 */
var flag_regModFormSubmit = false; //flag
function regModFormSubmit() {
	// 0.validate
	var myModForm = $('form[name="regModForm"]');
	if(!myModForm.valid()) {
		return;
	}
	if(!isEmpty($("#passwdNew").val())) {
		if(isEmpty($("#passwdOld").val())) {
			alert("현재 비밀번호를 입력해주세요.");
			$("#passwdOld").focus();
			return;
		}
	}
	console.log(myModForm.find("input[name='memberCateCode']").val() + "/./////////////////");
	if(myModForm.find("input[name='memberCateCode']").val() == null || myModForm.find("input[name='memberCateCode']").val() == "") {
		alert("카테고리를 설정해주세요.");
		$("#cateWrapMemberMod").attr("tabindex", -1).focus();
		return;
	}

	if($("#memberSido").val() <= 0) {
		alert("거주지역을 선택해주세요.");
		$("#sidoDiv").attr("tabindex", -1).focus();
		return;
	}

	//alert(myModForm.valid());
	if(flag_regModFormSubmit) {
		return;
	}
	flag_regModFormSubmit = true;

	//== 1. submit
	myModForm.ajaxSubmit({
		url : "/memupdate.ajax",
		type : "post",

		complete : function(_data){
			flag_regModFormSubmit = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.1");
		},
		success : function(_data) {
			console.log(_data);
			if(_data.result == '1') {
				modalHide('#complete-modal');
				window.location.href = '/user/myPage.do';
				//var divFind = $('#complete-modal');
				//var sText = divFind.find('p');
				//sText.html('회원정보 수정이 완료되었습니다');
	    		//modalShow('#complete-modal');
	    		//3초후 숨기고 mypage로 이동
	    		//setTimeout(function(){
	    		//		modalHide('#complete-modal');
	    		//		window.location.href = '/user/myPage.do';
	    		//	}, 3000);
	    	} else if(_data.result == ErrCode.V_EMAIL_DUP) { //이메일 중복
	    		alert('이메일 중복입니다.');
	    	} else if(_data.result == '200') {
	    		alert('현재비밀번호가 일치하지않습니다. \n확인 후 다시 입력해주세요.');
	    		$("#passwdOld").val("");
	    		$("#passwdOld").focus();
	    		return;
	    	} else {
	    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.2");
	    	}
		}
	});

}


function regModFormValidRuleInit(){
	//===암호검증 rule
	addRulePasswdValidateMod();

	//==
	//==
	var myModForm = $('form[name="regModForm"]');
	myModForm.validate({
		rules:{
			uname : { required: true },
			//email : { required: true, email: true },
			imageUrlFile: {validateFileExtension: true },
			//passwdOld : { required: true },
			passwd : { required: false, passwdValidateMod: true },
            passwdCheck :  {equalTo:'#passwdNew'}
		},
		messages: {
			uname : { required: "이름을 입력해야 합니다." },
			imageUrlFile : { validateFileExtension: "프로필 사진은 jpg, png 파일만 등록이 가능합니다." },
			//email : { required: "이메일을 입력해야 합니다.", email: "올바른 이메일형식이 아닙니다." },
			//passwdOld : { required : "현재 비밀번호를 입력해주세요."},
			//passwd : { required : "새 비밀번호를 입력해주세요."},
			passwdCheck : { equalTo: "비밀번호 확인을 다시 해 주십시오." }
		},
		showErrors: function(errorMap, errorList) {
	    	if( errorList && errorList.length > 0 ){
	    		for( var i = 0; i < errorList.length; i++ ){
					alert(errorList[i].message);
	               	errorList[i].element.focus();
	               	// 특수처리:
	               	if(errorList[i].element.name == 'passwd') {
	               		myModForm.find('[name="passwd"]').val('');
	               		myModForm.find('[name="passwdCheck"]').val('');
	               	} else if(errorList[i].element.name == 'passwdCheck') {
	               		myModForm.find('[name="passwdCheck"]').val('');
	               	}
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

/*
* 암호검증 rule
*/
function addRulePasswdValidateMod() {

	//===암호규칙 ===
	//암호는 대소문자를 구분합니다
	//6자 이상 15자 이하이어야 합니다.
	//최소 하나의 영문자(a-z; A-Z)를 포함해야 합니다.
	//최소 하나의 숫자(0-9)를 포함해야 합니다.
	//최소 하나의 특수 문자를 포함해야 합니다. 예를 들면 다음과 같습니다. (  _+!@#  )
	//===암호규칙 ===

	var customRule =  function(value, element, params) {
		var passwd = value;

	   if (passwd != ""){
		//==패스월드는 6자 이상 15자 이하의 영문자,숫자,특수문자(_+!@#)로만 구성될수 있습니다.
		var regPw = /^[a-zA-Z0-9_+!@#]{6,15}$/;
		if(!regPw.test(passwd)) {
			return false;
		}

		//==최소 하나의 영문자/숫자/특수문자가 포함되여야 함니다.
		var existAlp = false; //영어
		var existNum = false; //숫자
		var existSpe = false; //특수문자
		for(var i=0; i<passwd.length; i++) {
			var ch = passwd[i];
			if(/[a-zA-Z]/.test(ch)) {
				existAlp = true;
				continue;
			}
			if(/[0-9]/.test(ch)) {
				existNum = true;
				continue;
			}
			if(/[_+!@#]/.test(ch)) {
				existSpe = true;
				continue;
			}
		}
		if(!existAlp) {
			return false;
		}
		if(!existNum) {
			return false;
		}
		if(!existSpe) {
			return false;
		}
	   }
	   return true;
  	};

	// === rule:
	$.validator.addMethod("passwdValidateMod",
			function(value, element, params) {
				return customRule(value, element, params);
		    },
		    "패스워드는 6자 이상 15자 이하의 영문자,숫자,특수문자(_+!@#)로만 구성될수 있습니다."
	);
}

//시/도 변경시 텍스와 value 변경.
function changeSidoInfo(val, txt) {
	$("#memberSidoLi").css("display", "inline");
	$("#memberSidoLi").text(txt);
	$("#memberSido").val(val);
}

	//시/도 텍스트 설정.
    function setSidoTxt(sidoSeq) {
		console.log(sidoSeq + "///////////////////////////");
    	var cateComp = $("#sidoVal").find('option[value="{0}"]'.replace('{0}', sidoSeq));
    	console.log(cateComp);
		cateComp.prop('selected', true);
		var txt = cateComp.text();
		console.log(txt + ".................");
		//cateComp.closest('select').prev('input:text').val(txt);
		$("#sidoTxt").val(txt);
	}
</script>




