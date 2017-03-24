<%-- 화면ID : OD01-01-02 --%>
<%-- 화면ID : OD01-01-03 --%>
<%-- 화면ID : OD03-02-06 --%>
<%@page import="com.opendesign.utils.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ********************* loading ********************* -->
<style type="text/css" >

	.msg-search input[type="text"]{

	float: left;
	width: 303px;
	height: 42px;
	box-sizing: border-box;
	padding: 0 0 0 20px;
	font-weight: 700;
	color: #a4a4a4;
	border: 1px solid #a4a4a4;
	}
	.talking-list{float:left;
	overflow:scroll;
	height:300px;}
	.msg-list dl {
		float: left;
		width: 225px;
	}
	.msg-list{
		float:left;
	margin-left:-40px;}

	.msg-list li{
		list-style:none;
		width: 320px;
		margin: 3px 0 0;
		height:99px;
		margin-top:3px;
		color: #1e1e1e;
		transition: all .1s;
	}
	.noti-inner{
		position: absolute;
		top: 70px;
		right: 70px;
		z-index: 3;

		min-height: 350px;
		box-shadow: 0 0 15px #c3c3c3;
		border: 1px solid #ebebeb;
		background: #fff;


	}

	.msg-edit{

		clear: both;
		padding: 15px 0 0 10px;
	}
	.msg-edit button{
        float:right;
		display: block;
		width: auto;
		
		color: #fff;
		background: red;}

	.msg-edit textarea{
		width: 324px;
		height: 170px;
		box-sizing: border-box;
		padding: 10px 6px;
		font-size: 14px;
		border: 1px solid darkred;}

	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    z-index:999999999;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.2); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	    
	}
    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        z-index:999999999;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }

	.modal-dialog-msg{
		padding:20px;
height:auto;

		margin:auto;
	}
	.msg-wrap{

		border: 1px solid lightgrey;
margin-left:5px;
		overflow-y:scroll;
		height:300px;
	}



</style>
<div class="wrap-loading hide">
    <div><img src="/resources/image/loading/km_loader.gif" /></div>
</div> 
<!-- ********************* ]]loading ********************* -->

<script>
$(function(){
	$('body').on('click', '.modal .bg, .btn-close', function(){ //$('.modal .bg, .btn-close').click(function(){
	modalHide();
	});
});
/*
$(function(){
    $('body').on('click', '.modal .bg, .btn-close', function(){ //$('.modal .bg, .btn-close').click(function(){
        modalHide();
    });
});*/
//ESC눌렀을 시 모달창 꺼짐.
 $(document).keyup(function(e){
	if(e.keyCode==27){
		modalHide();


       $("#modal").modal('hide').data('bs.modal',null);


	}
}); 

/**
 * modal 보여줌
 */
 
function modalShow(modalIdSel, opts) {
	$('body').removeClass('lock');
	$('.modal').fadeOut();

	var modalObj = $(modalIdSel); 
	modalObj.fadeIn();
	
	/* 이벤트 처리 */
	if( '#login-modal' == modalIdSel ){
		var onSuccessLogin = null;
		if( opts && opts.onSuccessLogin ){
			onSuccessLogin = opts.onSuccessLogin;
		}
		
		var btnLogin = $('#btn_modal_login');
		btnLogin.off(); //unbind previous event
		btnLogin.on('click', function(e){
		
			loginFormSubmit( onSuccessLogin );
			
		});
		
		var btnFBLogin = $('#btn_modal_FB_login');
		btnFBLogin.off(); //unbind previous event
		btnFBLogin.on('click', function(e){
			
			facebooklogin( onSuccessLogin );
			
		});
		
	}else if( '#project-search' == modalIdSel ){
		modalObj.find('.search-list ul').empty();
		
		var schProjectName = modalObj.find('input[name="schProjectName"]');
		schProjectName.on('keyup', function(e){
			var charCode = (window.event) ?  event.keyCode : e.which;
			if(13 == charCode) {
				searchGroupProject(opts);							
			}
		});
		schProjectName.val('');
		
		var btnComplete = modalObj.find('.btn-complete');
		btnComplete.off();
		btnComplete.on('click', function(e){
			e.preventDefault();
			
			addGroupProject(opts);
			
		});
	}
}
/**
 * modal 숨김
 */
function modalHide() {
	$('body').removeClass('lock');
//	$('#modal-view').removeClass('lock');

	$('.modal').fadeOut();
}
/*
function modalHidemsg() {
    $('.modal').removeClass('lock');
//	$('#modal-view').removeClass('lock');

    $('.message').fadeOut();
}*/

/** 로그인 */
var flag_loginFormSubmit = false; //flag
function loginFormSubmit( onSuccessLogin ) {
	//
	var myForm = $('form[name="loginForm"]');
	if(!myForm.valid()) {
		return;
	}
	
	if(flag_loginFormSubmit) {
		return;
	}
	flag_loginFormSubmit = true;
	
	//== 
	$.ajax({
        url: '/login.ajax',
        type: 'post',
        data: myForm.serialize(),
        complete : function(_data){
			flag_loginFormSubmit = false;
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '200') {
        		alert("존재하지 않는 이메일이거나 패스워드가 잘못되었습니다."); 
        		myForm.find('[name="email"]').focus();
        	} else if(_data.result == '1') {
        		//성공
        		if( onSuccessLogin ){
        			/* 
        			* 파라미터가 'true' 일 경우에는 
        			* 로그인 프로세스 진행 후, 콜백이 호출 되었다는 의미
        			* --- 현재는 '프로젝트 상세 댓글 등록' 에서만 사용하고 있음---
        			*/
        			onSuccessLogin(true);
        			return;
        		}
        		
        		window.location.reload();
        	} else {
        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        }
    });
}

var flag_loginFBSubmit = false; //flag
function loginFBSubmit(onSuccessLogin, fbUser) {
	
	if(flag_loginFBSubmit) {
		return;
	}
	flag_loginFBSubmit = true;
	
	$.ajax({
        url: '/loginFB.ajax',
        type: 'post',
        data: {'email':fbUser.email, 'fbAccessToken':fbUser.token},
        complete : function(_data){
        	flag_loginFBSubmit = false;
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '1') {
        		//성공
        		if( onSuccessLogin ){
        			/* 
        			* 파라미터가 'true' 일 경우에는 
        			* 로그인 프로세스 진행 후, 콜백이 호출 되었다는 의미
        			* --- 현재는 '프로젝트 상세 댓글 등록' 에서만 사용하고 있음---
        			*/
        			onSuccessLogin(true);
        			return;
        		}
        		
        		window.location.reload();
        	} else {
        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        }
    });
	
	
}

function goPage(url, isCheckedLogin){
	if( isCheckedLogin ){
		checkedLogin(function(){
			location.href = url;			
		});
		return;
	}
	location.href = url;
}


//페이스북 로그인 
function facebooklogin( onSuccessLogin ) { 
   //  alert("facebook");
	FB.login(function(response) {  
      
    var accessToken = response.authResponse.accessToken; 
    FB.api('/me', { locale: 'en_US', fields: 'name, email' }, function(user) { 
      
     console.log("fb user.id=" + user.id + ", user.email=" + user.email + ", fbname=" + user.name + ", accessToken=" +accessToken );
     user.token = accessToken;
     
     if( !isEmpty(user.email) && !isEmpty(accessToken) ) {
    	 
    	 $.ajax({
    	        url: '/hasEmailDuplication.ajax',
    	        type: 'get',
    	        data: {'email':user.email}, 
    	        complete : function(_data){},
    	        error : function(_data) {
    				alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
    	        },
    	        success : function(_data){
    	        	if( _data.result ) {
    	        		
    	        		/* 중복되는 이메일이 있다면 로그인 처리  */
    	        		loginFBSubmit(onSuccessLogin, user);
    	        		
    	        	} else {
    	        		/*중복되는 이메일이 없다면  신규회원 가입프로세스 처리 */
    	        		regFormSubmit(true, user);
    	        	
    	        	}
    	        }
    	    });
    	 
     } else {
    	 alert("Facebook 정보가 잘못 되었습니다. 다시 로그인해 주세요.")
     }
      
      
    });   
  }, {scope: "user_friends,public_profile,email"});
}


/**
 * 로그인 체크 
 */
var flag_checkedLogin = false; //flag
function checkedLogin( callback ){
	
	if(flag_checkedLogin) {
		return;
	}
	flag_checkedLogin = true;
	
	$.ajax({
        url: '/checkedLogin.ajax',
        type: 'get',
        complete : function(_data){
			flag_checkedLogin = false;
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	if( _data.result ) {
        		callback();
        	} else {
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal', {onSuccessLogin:callback});
        			
        		}
        	}
        }
    });
}

//=== 검증 ==========
$(function(){
	loginFormValidRuleInit();
	captchaFormValidRuleInit();
});

function loginFormValidRuleInit(){
	
	var myForm = $('form[name="loginForm"]');
	myForm.validate({
		rules:{
			email : { required: true, email: true }
			, passwd : { required: true }
		},
		messages: {
			email : { required: "필수로 입력해야 합니다.", email: "올바른 이메일형식이 아닙니다." } 
			, passwd : { required: "필수로 입력해야 합니다." }
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

function captchaFormValidRuleInit(){
	
	var myForm = $('form[name="captchaForm"]');
	myForm.validate({
		rules:{
			captchaEmail : { required: true, email: true }
			, captchaAnswer : { required: true }
		},
		messages: {
			captchaEmail : { required: "이메일을 입력해 주세요.", email: "올바른 이메일형식이 아닙니다." } 
			, captchaAnswer : { required: "보안코드를 입력해 주세요." }
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

//=== ]]검증 ========== 
</script>

<script>

/** 회원가입 */
var flag_regFormSubmit = false; //flag
function regFormSubmit(isFB, fbUser) {
	//modalShow('#join2-modal'); //test
	//return;
	
	//
	var myForm = $('form[name="regForm"]');
	if( !isFB ) {
		if(!myForm.valid()) {
			return;
		}
	}
	
	if(flag_regFormSubmit) {
		return;
	}
	flag_regFormSubmit = true;
	
	var param = myForm.serialize();
	if( isFB ) {
		param = {'email':fbUser.email, 'fbAccessToken':fbUser.token};
	}
	
	console.log("register user param=" + param);
	
	//== 
	$.ajax({
        url: '/register.ajax',
        type: 'post',
        data: param,
        complete : function(_data){
			flag_regFormSubmit = false;
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '1') {
        		modalShow('#join2-modal');
        	} else if(_data.result == ErrCode.V_EMAIL_DUP) { //이메일 중복
        		alert('이메일 중복입니다.'); 
        	} else {
        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        }
    });
	
}
//=== 검증 ==========
$(function(){
	regFormValidRuleInit();
});

function regFormValidRuleInit(){
	//===암호검증 rule
	addRulePasswdValidate(); 
	//===
	//== 
	var myForm = $('form[name="regForm"]');
	myForm.validate({
		rules:{
			agree : { required: true } 
			, email : { required: true, email: true }
			, passwd : { required: true, passwdValidate: true }
			, passwdCheck : { equalTo: "#passwd" } 
		},
		messages: {
			agree : { required: "이용약관, 개인정보수집 및 이용에 모두 동의해야 합니다." }
			, email : { required: "이메일을 입력해 주세요.", email: "정확한 이메일을 입력하세요." } 
			, passwd : { required: "비밀번호를 입력해 주세요." }
			, passwdCheck : { equalTo: "비밀번호 확인을 다시 해 주십시오." }
		},
		showErrors: function(errorMap, errorList) {
	    	if( errorList && errorList.length > 0 ){
	    		for( var i = 0; i < errorList.length; i++ ){                			
					alert(errorList[i].message);
	               	errorList[i].element.focus();
	               	// 특수처리:
	               	if(errorList[i].element.name == 'passwd') {
	               		myForm.find('[name="passwd"]').val('');
	               		myForm.find('[name="passwdCheck"]').val('');
	               	} else if(errorList[i].element.name == 'passwdCheck') {
	               		myForm.find('[name="passwdCheck"]').val('');
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
function addRulePasswdValidate() {
	
	//===암호규칙 ===
	//암호는 대소문자를 구분합니다
	//6자 이상 15자 이하이어야 합니다.
	//최소 하나의 영문자(a-z; A-Z)를 포함해야 합니다.
	//최소 하나의 숫자(0-9)를 포함해야 합니다.
	//최소 하나의 특수 문자를 포함해야 합니다. 예를 들면 다음과 같습니다. (  _+!@#  ) 
	//===암호규칙 ===
		
	var customRule =  function(value, element, params) {
		var passwd = value;
		
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
		
		return true;
  	};
  
	// === rule: 	
	$.validator.addMethod("passwdValidate", 
			function(value, element, params) {
				return customRule(value, element, params);
		    },
		    "패스월드는 6자 이상 15자 이하의 영문자,숫자,특수문자(_+!@#)로만 구성될수 있습니다."
	);
}
//=== ]]검증 ========== 
</script>

<!-- li class="active"><a href="#">웨어러블 스마트 패션 2조</a></li -->
<script id="tmpl-groupProjectSearchRow" type="text/x-jsrender">
	<li data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
</script>
<!-- 포로젝트 조회 -->
<div class="modal" id="project-search">
	<div class="bg"></div>
	<div class="modal-inner">
		<h1>프로젝트 조회</h1>
		<div class="search">
			<input type="text" name="schProjectName" />
			<button type="button"><img src="/resources/image/sub/blt_searchGray.png" onclick="searchGroupProject();" alt="검색"></button>
		</div>
		<div class="search-list">
			<ul>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
				<li class="active" data-project_seq="{{:seq}}" ><a onclick="toggleParent(this, 'active');" style="cursor: pointer;" >{{:projectName}}</a></li>
			</ul>
		</div>
		<a class="btn-complete" style="cursor: pointer;" >완료</a>
		<button type="button" class="btn-close"><img src="/resources/image/common/btn_close.gif" alt="닫기"></button>
	</div>
</div>
<script type="text/javascript">
/**
 * 프로젝트 조회 초기화
 */
var projectSearchList = null;
var tmplGroupProjectSearchRow = null;
$(function(){
	projectSearchList = $('#project-search').find('.search-list');
	tmplGroupProjectSearchRow = $('#tmpl-groupProjectSearchRow').html();
});
/**
 * 프로젝트 그룹에 프로젝트 추가
 * 프로젝트 조회 완료 버튼 클릭 시 호출 된다.
 * modalShow에서 완료 버튼 이벤트를 바인딩 한다.
 */
function addGroupProject(opts){
	var groupSeq = opts.groupSeq || null;
	if( groupSeq == null ){
		alert('프로젝트 그룹이 선택되지 않았습니다.\n 다시 시도해 주세요.');
		return;
	}
	
	var projectSeqs = new Array(); 
	var activeLis = projectSearchList.find('ul li.active');
	activeLis.each(function(){
		var seq = $(this).data('project_seq');
		projectSeqs.push(seq);
		
	});
	
	if( projectSeqs.length <= 0 ){
		modalHide();
		return;
	}
	
	$.ajax({
        url: '/project/addGroupProject.ajax',
        type: 'post',
        cache: false,
        data: {projectGroupSeq: groupSeq, projectSeq: projectSeqs},
        complete : function(_data){
        	
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');
        			
        		}       		
        		return;
        	}
        	
        	if( '200' == result ){
        		alert('프로젝트 추가가 실패 하였씁니다.\n 다시 시도해 주세요.');       		
        		return;
        	}
        	
        	modalHide();
        	if( opts.onComplete ){
        		opts.onComplete(groupSeq);	
        	}
        }
    });
}
/**
 * 프로젝트 검색
 * modalShow에서 이벤트를 바인딩 한다.
 */
function searchGroupProject(opts){
	
	var schPName = $('#project-search').find('input[name="schProjectName"]');
	var val = schPName.val(); 	
	
	$.ajax({
        url: '/project/searchGroupProject.ajax',
        type: 'post',
        data: { schProjectName: val},
        complete : function(_data){
        	
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');
        			
        		}       		
        		return;
        	}
        	
        	var normalLis = projectSearchList.find('ul li').not('.active');
        	normalLis.remove();
        	
        	var list = _data.list;
        	if( list && list.length > 0 ){
        		var activeLis = projectSearchList.find('ul li.active');
            	activeLis.each(function(){
            		var projectSeq = $(this).data('project_seq');             		
					for( var i = 0; i < list.length; i++ ){
						var aData = list[i];
						if( projectSeq == aData.seq ){
							list.remove(i);
							break;
						}
					}
            	});	
            	
            	if( list.length > 0 ){
            		var rows = new Array(); 
            		for( var i = 0; i < list.length; i++ ){
						var formattedHtml = $.templates(tmplGroupProjectSearchRow).render( list[i] );
						rows.push( $( formattedHtml ) );
					}
            		projectSearchList.find('ul').append(rows);
            	}
        	}
        }
    });
}

function toggleParent(thisObj, className){
	$(thisObj).parent().toggleClass(className);
}

function requestCaptCha() {
	$('#captChaImage').attr('src','/requestCaptCha.do');
}

var flag_findPassword = false;
function findPassword() {
	
	var myForm = $('form[name="captchaForm"]');
	if(!myForm.valid()) {
		return;
	}
	
	if(flag_findPassword) {
		return;
	}
	flag_findPassword = true;
	
	var param = {'mail.target':$("#captchaEmail").val(), 
			captchaAnswer:$("#captchaAnswer").val(), 
			'mail.title':'[OpenDesign 비밀번호 찾기]', 
			'mail.template':'mail_password.vm'
	};
	
	$.ajax({
        url: '/findPassword.ajax',
        type: 'post',
        data: param,
        complete : function(_data){
			flag_findPassword = false;
		},
        error : function(_data) {
        	console.log(_data);
			alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '-1') {
        		alert("보안코드 인증에 실패 하셨습니다. 확인 후 다시 요청해 주세요."); 
        	} else if(_data.result == '1') {
        		alert("입력하신 메일로 비밀번호가 발송 되었습니다. \n확인 후 로그인해 주세요.");
        		$('#captchaAnswer').val('');
        		$('#captchaEmail').val('');
        		
        		$('form[name="loginForm"] input[name="email"]').val('')
        		$('form[name="loginForm"] input[name="passwd"]').val('')
        		
        		modalShow('#login-modal');
        	} else if(_data.result == '-2'){
        		alert("입력하신 이메일에 대한 사용자 정보가 없습니다.\n다시 확인 후 요청해 주세요.");
        	}
        }
    }); 
}




</script>

<!-------------------------------- 회원가입e --------------------------------------------------------->
<div class="modal modal-login" id="join-modal">
	<div class="modal-content-one modal-dialog-login">
		<div class="modal-body" style="padding:30px">
			<form name="regForm" action="" method="post" >
				<div align="right">
				<button type="button" class="btn-close close-login" style="margin-top:10px;" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
				</div>
				<fieldset>
					<legend>회원가입</legend>
					<div class="form-group" >
						<input type="text" class="input-register" name="email" placeholder="이메일">
					</div>
					<div class="form-group">
						<input type="password" class="input-register" name="passwd" id="passwd" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<input type="password" class="input-register" name="passwdCheck" placeholder="비밀번호 확인">
					</div>
					<div class="checkbox">
						<input type="checkbox" name="agree" id="agree" value="" >
						<label for="agree" style="padding-left:0px"><a>이용약관</a>과 <a>개인정보수집 및 이용</a>에 동의합니다</label>
					</div>
					<div style="width:100%" align="center">
						<a href="javascript:regFormSubmit();"  class="btn btn-modal"><button type="button" class="btn btn-red" style="margin-top:15px;width:100%;">회원가입</button></a>
					</div>
					<!-- button type="button" class="btn-facebook"><img src="/resources/image/common/blt_facebook.png"> facebook 으로 가입하기</button-->
				</fieldset>
			</form>
<!-- 			<button type="button" class="btn-close"><img src="/resources/image/common/btn_close.gif" alt="닫기"></button>-->
		</div>
	</div>
</div>
<!--------------------------------// 회원가입 --------------------------------------------------------->

<!-------------------------------------- 비밀번호 찾기 -------------------------------------------->
<div class="modal modal-login" id="pw-modal">
	<div class="modal-dialog-login">
		<div class="modal-content-login modal-content-one">
			<div class="modal-body" style="padding:30px">
				<form name="captchaForm" id="captchaForm">
				<fieldset>
					<legend><h3>비밀번호 찾기</h3></legend>
					<div class="form-group">
						<label for="" class="km-required">이메일</label>
						<input type="text" class="form-control" name="captchaEmail" id="captchaEmail">
					</div>
					<div class="form-group">
						<label for="" class="km-required">보안코드</label>
						<input type="text" class="form-control" name="captchaAnswer" id="captchaAnswer"/>
					</div>
					<div class="code">
						<img style="width:100%;" alt="보안코드 이미지" id="captChaImage" src="" />
					</div>
					<button type="button" onclick="javascript:findPassword();" class="btn btn-red btn-confirm" style="margin-top:3px;width:100%;">비밀번호 찾기</button>
				</fieldset>
				</form>
<!-- 		<button type="button" class="btn-close"><img src="/resources/image/common/btn_close.gif" alt="닫기"></button> -->
			</div>
		</div>
	</div>
</div>
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '<%=PropertyUtil.getProperty("fb.appId")%>',
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

</script>
 <!--------------------------------------// 비밀번호 찾기 -------------------------------------------->
 
<!------------------ 로그인 ---------------------------------EDIT---------------------------------------->
<div class="modal modal-login" id="login-modal" align="center" style="position:absolute; left:40%">
	<div class="modal-dialog-login"></div>
	<div >
	<div class="modal-content-login" style="position:fixed">
		<div class="modal-body" style="padding:30px; ">
			<form name="loginForm">
				<div class="row" align="right">
				    <button data-dismiss="modal" type="button" class="btn-close close-login" style="margin-top:10px;" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
				</div>
				<fieldset>
					<legend>로그인</legend>
					<div class="form-group">
						<input type="text" class="form-control" name="email" placeholder="이메일">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="passwd" placeholder="비밀번호">
					</div>
					<button type="button" id="btn_modal_login" class="btn btn-red" style="width:100%;margin-top:10px">로그인</button> 
					<button type="button" id="btn_modal_FB_login" class="btn btn-facebook" style="width:100%;margin-top:3px"> facebook 으로 로그인하기</button>
					<div class="row pr-4" align="right">
					<div class="btn-set">
						<table style="margin-top:15px;">
							<tr>
								<td><a href="javascript:requestCaptCha();modalShow('#pw-modal');" class="btn-find" style="display:block">비밀번호 찾기</a></td>
								<td> / </td>
								<td style="right:0px;"><a href="javascript:modalShow('#join-modal');" class="btn-modal" style="display:block">회원가입</a></td>
							</tr>
						</table>
					</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	</div>
</div>
<!------------------ //로그인 ------------------------------------------------------------------------->

<!-------------------------------- 회원가입:상세 modal_register2.jsp-------------------------------------------------------->
<jsp:include page="/openRegister2.do" />
<!--------------------------------//회원가입:상세 -------------------------------------------------------->

<!-- --------------------------------------디자인 상세보기 모달--------------------------------------- -->
<style>
	.close-login{
		background:none;
		border:none;
		color:red;
	}
	.input-register{
		background:none;
		border:none;
		border-bottom:1px solid red;
	}
.modal-content-design{
    height: 100%;
    border-radius: 0;
    color:black;
    overflow:auto;
}
</style>
  <div class="modal fade" id="modal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content-design modal-content-one">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="title"></h4>
        </div>
        <div class="modal-body">
          <p id="content"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<!-- --------------------------------------//디자인 상세보기 모달--------------------------------------- -->

<!----------------------------------------------  메시지  ------------------------------------------- -->

		<div class="modal noti-modal" id="message" style="display:none;">
			<div class="noti-inner modal-dialog-msg" style="background-color:white">
				<div class="msg-search">
					<form name="msgSearchForm" onsubmit="msgSearchBtnClick();return false;">
						<input type="hidden" name="schMode" /> 
						<input type="hidden" name="schNewUserSeq" />
                      <!--  <div class="btn-close"  >
                        <button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-default" style="float:right">x</button>
                </div>-->
                        <button data-dismiss="modal" type="button" class="btn-close close-login" style="margin-top:10px;float:right" ><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <fieldset >

							<legend>메시지 검색</legend>
							<div>
								<input type="text" name="schWord" placeholder="검색" />
								<button onclick="return false;" type="submit" class="btn btn-danger"  style="background-color:red;height:42px">
									<span onclick="msgSearchBtnClick();" id="searchBtn" style="margin-top: 0px;padding:5px;" class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</fieldset>
					</form>
				</div>

				<legend class="latest"   wid="latestMsgNumber2" style="margin-top:15px;">최근 받은 메시지 (0) </legend>
				<!-- 메시지가 없는 경우
				<p class="no-msg">편지함에 메시지가 없습니다.</p>
				-->
					<ul id="msgRoomList" class="msg-wrap msg-list" style="">

				</ul>

				<div class="talking-list" style="max-width:357px;">
					<ul id="msgContentList" class="msg-list culunm" style="margin-bottom: 5px; max-height:500px; overflow-y:auto; overflow-x:hidden;">

					</ul>


					<div class="msg-edit">
						<form name="msgAddForm">
							<input type="hidden" name="recieveSeq" value="" />
							<fieldset>
								<legend>메시지 작성</legend>
								<div>
								<textarea name="contents" maxlength="200" placeholder="메시지를 작성해주세요"></textarea>
								<button type="button" onclick="msgAddFormInsertMsg();" type="button" class="btn btn-danger">메시지보내기</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>

<!----------------------------------------------//  메시지  ------------------------------------------- -->