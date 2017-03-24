<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.opendesign.vo.MessageVO.MessageMode"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.utils.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String searchWord = StringUtils.stripToEmpty(request.getParameter("searchWord"));
%>
<style>


.totalsearch {
	height:42px;
}
#searchWord {
	height: 42px;
	width: 100%;
	text-indent: 5px;
}

#searchBtn {
	height: 42px;
}



#custom-search-input {
	margin:0;
	margin-top: 10px;
	padding: 0;
}

#custom-search-input .search-query {
	padding-right: 3px;
	padding-right: 4px \9;
	padding-left: 3px;
	padding-left: 4px \9;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */

	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#custom-search-input button {
	border: 0;
	background: none;
	/** belows styles are working good */
	padding: 2px 5px;
	margin-top: 2px;
	position: relative;
	left: -28px;
	/* IE7-8 doesn't have border-radius, so don't indent the padding */
	margin-bottom: 0;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color:#D9230F;
}

.search-query:focus + button {
	z-index: 3;
}

<!--알람-->
.noti-modal{display:none; top:0; right:0; z-index:10;overflow:scroll; }
.noti-modal .bg{position:fixed; top:0; left:0; z-index:2; width:100%; height:100%; background:none;}
.btn-more2{display:block; width:100%; margin:0 auto; padding:0 24px 0 0; font-size:18px; font-weight:700; color:black; background: none; border: 0px; }
.btn-more2.alarmBtn{padding:10px 0px 10px 0;}
#alert{position:static;}
#alert .noti-inner{position:absolute; z-index:2; width:520px; padding:35px 0 0; box-shadow:0 0 15px #c3c3c3; border:1px solid #ebebeb; background:#fff;}

#alert .latest{float:right; margin:0 28px 10px 0; font-size:14px; color:#113b88;}
.alert-list{clear:both; max-height:500px; overflow-y:auto; overflow-x:hidden; padding:0px;}
.alert-list li{margin:-1px 0 0; color:#1e1e1e; transition:all .1s;}
.alert-list li > div{overflow:hidden; margin:0 33px; padding:16px 0 19px; border-top:1px solid red;}
.alert-list .pic{float:left; margin:0 18px 0 0;}
.alert-list .txt{padding:22px 0 5px; font-size:18px;}
.alert-list .txt.reply{padding-top:5px;}
.alert-list .txt.reply p{margin:8px 0 0; font-size:14px;}
.alert-list .date{float:right; font-size:12px;}
.alert-list li:hover{color:#fff; background:#a4a4a4;}
.align {float:left}
.active{border:0px}


.msg-list{width: 400px;margin-bottom: 5px;

}


.msg-list li {
border-bottom: 1px solid red;
	width: 324px;

	margin: -1px 0 0;
	color: #1e1e1e;
	transition: all .1s;
}
.msg-list dl {
	float: left;
	width: 225px;
}
.msg-list li.msg dt {
	color: darkred;
}
.msg-list dt {
	margin: 2px 0 6px;
	font-size: 18px;
}
.msg-list dd {
	font-size: 14px;
	line-height: 1.3;
	word-wrap: break-word;
}
.ellip1 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}


.msg-list .date {

	top: 22px;
	right: 0;
	font-size: 12px;
}
</style>










<!--/////////////////// 수정 부분 김형준  ////////////////////////-->
<!-- 로그인 부분 -->
<%	if(CmnUtil.isUserLogin(request)) {
if(CmnUtil.getTodayLogin()){
}else{
CmnUtil.setTodayLogin(true);
//int point = CmnUtil.getPoint();
//point += 1000;
//out.println("<script>alert('오늘의 첫 로그인!! 1000포인트가 추가되어 " + point + "가 되었습니다.');</script>");
}
}
%>
<!--///////////////////__수정 부분 김형준  ////////////////////////-->



<!-- 로그인 부분 -->
<!-- //로그인 했을때만 보임 -->
<ul class="nav navbar-nav navbar-right">
	<li style="width: 100px">
		<%	if(CmnUtil.isUserLogin(request)) {	%>
		<a href="/logout.do" style="padding:10px;" style="display: inline-block">
			<button style="margin-top: 29px" type="button" class="btn btn-red" >로그아웃</button>
		</a>
	</li>
	<!-- 로그인 했을때만 보임 -->
</ul>
<ul class="nav navbar-nav navbar-right">
	<li style="width: 40px">
		<a style="display: inline-block;margin-top: 29px" href="/user/myPage.do" class="btn-mypage btn"><span class="glyphicon glyphicon-user" style="color:red;border-radius:15px;padding:5px"></span></a>
		<!-- 메세지가 있을 시 클래스 active 추가-->
	</li>
	<!-- 로그인 했을때만 보임 -->
</ul>
<ul class="nav navbar-nav navbar-right">
	<li style="width: 40px">
		<!-- 메세지가 있을 시 클래스 active 추가-->
		<a style="display: inline-block;margin-top: 29px" href="javascript:void(0);" onclick="showMsgDiv();" class="btn-modal btn"><span class="glyphicon glyphicon-comment" style="color:red;padding: 5px"></span></a> <span id="latestMsgNumber" class="number"></span>
		<!-- 알림이 있을 시 클래스 active 추가-->
	</li>
	<!-- 로그인 했을때만 보임 -->
</ul>
<ul class="nav navbar-nav navbar-right">
	<li style="width: 40px">
		<!-- 메세지가 있을 시 클래스 active 추가-->
		<!-- 알림이 있을 시 클래스 active 추가-->
		<a style="display: inline-block;margin-top: 29px" href="javascript:void(0);" onclick="showAlarmDiv();" class="btn-modal btn"><span class="glyphicon glyphicon-bell" style="color:red;padding: 5px"></span></a><span id="latestAlarmNumber" class="number"></span>
	</li>
	<!-- 로그인 했을때만 보임 -->
</ul>

<ul class="nav navbar-nav">
	<li>
		<% 	} else { %>
		<a href="javascript:modalShow('#login-modal');" class="btn-modal" style="padding:10px">
			<button style="margin-top: 29px" type="button" data-toggle="modal" data-target="#myModal_login" class="btn btn-red">로그인/회원가입</button>
		</a>
		<% 	} %>
	</li>
	<!-- 로그인 했을때만 보임 -->
</ul>


<!----------- 통합검색 ---------------------------------------------------------->
<ul class="nav navbar-nav navbar-right mt-3">
	<li style="width: 250px;">
		<a >
			<div id="custom-search-input">
				<div class="input-group col-md-12">
					<form name="inteSearchForm" id="inteSearchForm" action="/search/search.do">
						<div class="input-group col-md-12">
							<input  type="text" name="searchWord" id="searchWord" title="검색어 입력" onkeyup="inteSearch(true);" value="<%=searchWord%>" class="search-query" placeholder="Search" />
							<span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit"  onclick="return false;">
										<span onclick="inteSearch();" id="searchBtn" style="margin-top: 9px" class="glyphicon glyphicon-search"></span>
									</button>
                                </span>
						</div>
					</form>
				</div>
			</div>
		</a>
	</li>
</ul>
<!-----------// 통합검색 ---------------------------------------------------------->

<script id="tmpl-msgRoomListTemplete" type="text/x-jsrender" >


					<li onclick="msgRoomClick(this);" data-new="{{:isNew}}" data-seq="{{:roomUserSeq}}" class="msg">

						<div class="" style="">
<div>
							<img  class="align"style="width:68px;height:68px;" src="{{:roomUserImageUrl}}" alt="{{:roomUserName}}"></div>

							<dl>
								<dt>{{:roomUserName}}</dt>
								<dd class="ellip1">{{:contents}}</dd>
							</dl>
							<span class="date">{{:displayTime}}</span>
						</div>


					</li>



</script>
<script id="tmpl-msgContentListTemplete" type="text/x-jsrender">
						<!-- class: msg / me -->
						{{if  loginUserRecieveUser }}
						<li class="msg">
						{{else}}
						<li class="me">
						{{/if}}
							<div>
								<div class="pic"><img class="align" style="width:68px;height:68px;" src="{{:sendImageUrl}}" alt="{{:sendName}}"></div>
								<dl>
									{{if  loginUserRecieveUser }}
									<dt>{{:sendName}}</dt>
									{{else}}
									<dt>나</dt>
									{{/if}}
									<dd>{{:contents}}</dd>
								</dl>
								<span class="date">{{:displayTime}}</span>
							</div>
						</li>
</script>

<form name="msgContentForm">
	<input type="hidden" name="schSelectedUserSeq" /> 
</form>

<script>
/**
 * 최신 메시지 신호 받았을때
 */
$(function(){
	onNotifyMsgChanged(); 
});

/**
 * 최신 메시지 신호 받았을때
 */
function onNotifyMsgChanged() {
	console.log('>>> onNotifyMsgChanged');
	// === 1. messageDiv refresh
	refreshMsgDiv();
	
	// === 2. message room list refresh
	refreshMsgRoomList();
	
	// === 3. message content list refresh
	refreshMsgContentList();
}

function refreshMsgDiv() {
	console.log('>>> refreshMsgDiv');
	$.ajax({
        url: '/common/selectLatestMessageCount.ajax',
        type: 'post',
        data: { },
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
			if(_data) { 
				var cnt = _data.result;
				if(!cnt) {
					cnt = 0; 
				}
				if(cnt > 0) {
					$('#msgDiv').addClass('active');
					$('#latestMsgNumber').text(cnt);
					$('#latestMsgNumber2').text( '최근 받은 메시지 ({0})'.replace('{0}',cnt) );
				} else {
					$('#msgDiv').removeClass('active');
					$('#latestMsgNumber').text('');
					$('#latestMsgNumber2').text( '최근 받은 메시지 ({0})'.replace('{0}',cnt) );
				}
			}
		}
    });
}

/**
 * 메시지 room
 */
function refreshMsgRoomList() {
	
	var myForm = $('form[name="msgSearchForm"]');
	
	console.log('>>> refreshMsgRoomList');
	console.log(myForm.serialize());
	
	if(!$('#message').is(':visible')) {
		console.log('message div is hidden.');
		return;
	}
	
	$.ajax({
        url: '/common/selectLatestMessageRoomList.ajax',
        type: 'post',
        data: myForm.serialize(),
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
			if(_data) {
				var list = _data.result;
				$('#msgRoomList').empty();
				if(!list) {
					console.log('>>> refreshMsgRoomList no data.');
					return;
				}
				//
				var htmlJ = $($.templates('#tmpl-msgRoomListTemplete').render(list));
				$('#msgRoomList').append(htmlJ);
				
				// 선택된 사용자:  
			}
		}
    });
}

/**
 * 메시지 content
 */
function refreshMsgContentList() {
	var myForm = $('form[name="msgContentForm"]');
	
	console.log('>>> refreshMsgContentList');
	console.log(myForm.serialize());
	
	if(!$('#message').is(':visible')) {
		console.log('message div is hidden.');
		return;
	}
	
	$.ajax({
        url: '/common/selectLatestMessageContentList.ajax', 
        type: 'post',
        data: myForm.serialize(),
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
			// 상태 읽음으로 될수 있음으로 개수 refresh한다.
			refreshMsgDiv();
			
			if(_data) {
				var list = _data.result;
				$('#msgContentList').empty();
				if(!list) {
					console.log('>>> refreshMsgContentList no data.');
					return;
				}
				//
				var htmlJ = $($.templates('#tmpl-msgContentListTemplete').render(list));
				$('#msgContentList').append(htmlJ);
				
				// scroll to bottom of div:
				$('#msgContentList').scrollTop($('#msgContentList').prop("scrollHeight"));
				
			}
		}
    });
}


/**
 * 메시지창 보여주기 : 검색모드
 */
function showMsgDiv() {
	console.log('>>> showMsgDiv');
	var searchForm = $('form[name="msgSearchForm"]');
	searchForm.find('[name="schMode"]').val('<%=MessageMode.SEARCH%>');
	searchForm.find('[name="schWord"]').val('');
	searchForm.find('[name="schNewUserSeq"]').val('');
	//
	var contentForm = $('form[name="msgContentForm"]');
	contentForm.find('[name="schSelectedUserSeq"]').val(''); 
	
	modalShow('#message');

	onNotifyMsgChanged();
}

/**
 * 메시지창 보여주기 : 새 사용자 모드
 */
function showMsgDivNewUser(newUserSeq) {
	console.log('>>> showMsgDivNewUser: newUserSeq=' + newUserSeq);
	var searchForm = $('form[name="msgSearchForm"]');
	searchForm.find('[name="schMode"]').val('<%=MessageMode.NEW%>');
	searchForm.find('[name="schWord"]').val('');
	searchForm.find('[name="schNewUserSeq"]').val(newUserSeq); //새 사용자 
	//
	var contentForm = $('form[name="msgContentForm"]');
	contentForm.find('[name="schSelectedUserSeq"]').val('');


	modalShow('#message');
   

	onNotifyMsgChanged();
}

/**
 * 메시지 보내기: 새 사용자 모드
 */
function goShowMsgView(seq) {
	checkedLogin(function(){
		// scroll to top
	//	$('body').scrollTop(0);
		showMsgDivNewUser(seq);
	}); //end of checkedLogin
}

/**
 * 메시지 검색버튼:
 */
function msgSearchBtnClick() {
	console.log('>>> msgSearchBtnClick:');
	var searchForm = $('form[name="msgSearchForm"]');
	searchForm.find('[name="schMode"]').val('<%=MessageMode.SEARCH%>');
	//searchForm.find('[name="schWord"]').val('');
	searchForm.find('[name="schNewUserSeq"]').val(''); //새 사용자 
	//
	var contentForm = $('form[name="msgContentForm"]');
	contentForm.find('[name="schSelectedUserSeq"]').val(''); 
	 
	onNotifyMsgChanged();
}

/**
 * 메시지 room click
 */
function msgRoomClick(thisObj) {
	console.log('>>> msgRoomClick');
	var roomUserSeq = $(thisObj).data('seq'); 
	var myForm = $('form[name="msgContentForm"]');
	myForm.find('[name="schSelectedUserSeq"]').val(roomUserSeq);
	
	onNotifyMsgChanged();
}

/**
 * 메시지 발송
 */
var flag_msgAddFormInsertMsg = false; //flag
function msgAddFormInsertMsg() {
	console.log('>>> msgAddFormInsertMsg');
	
	var myForm = $('form[name="msgAddForm"]');
	var contents = myForm.find('[name="contents"]');
	if(contents.val().trim() == '') {
		alert('메시지 입력하세요.');
		contents.focus();
		return;
	}
	var contentForm = $('form[name="msgContentForm"]');
	var schSelectedUserSeq = contentForm.find('[name="schSelectedUserSeq"]');
	if(schSelectedUserSeq.val() == '') {
		alert('메시지 발송대상을 선택해주세요.');
		return;
	}
	myForm.find('[name="recieveSeq"]').val(schSelectedUserSeq.val()); //받는 사람
	
	
	if(flag_msgAddFormInsertMsg) {
		return;
	}
	flag_msgAddFormInsertMsg = true;
	
	// 
	$.ajax({
        url: '/common/sendUserMessage.ajax',
        type: 'post',
        data: myForm.serialize(), 
		complete : function(_data){
			flag_msgAddFormInsertMsg = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
			if(_data.result == '1') {
				// do nothing
				contents.val(''); 
			} else {
				alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			}
		}
    });
}

</script>
<!-- **************************  ]]메시지  ************************* -->
		
<!-- **************************  알림  ************************* -->
		<div class="modal noti-modal" id="alert" style="display:none;background-color: #0f0f0f;">
			<div class="bg"></div>
			<div class="noti-inner">
				<p class="latest"></p>
				<ul id="alarmListView" class="alert-list">
					<%-- template
					<li>
						<div>
							<div class="pic">
								<img src="/resources/image/common/pic_profile.jpg" alt="송준기">
							</div>
							<div class="txt">송중기님이 나의 작품 “Dancing with 3D”을 13,880 포인트로
								구매하였습니다.</div>
							<span class="date">오후 11:34분</span>
						</div>
					</li>
					--%>
				</ul>
				<button onclick="alarmLoadMore();" data-name="alarmLoadMore" type="button" class="btn-more2 alarmBtn" >결과 더 보기</button>
			</div>
		</div>
		
<script id="tmpl-alarmListTemplete" type="text/x-jsrender">
					<li>
						<div>
							<div class="pic">
								<img style="width:68px;height:68px;"  src="{{:actorUrl}}" alt="{{:actorName}}">
							</div>
							<div class="txt">{{:wholeContents}}</div>
							<span class="date">{{:displayTime}}</span>
						</div>
					</li>
</script>
<form id="alarmListParamForm" name="alarmListParamForm" method="GET" action="" >
	<input type="hidden" name="schPage" value="1" /> 	<!-- 페이지번호 --> 
	<input type="hidden" name="schLimitCount" value="5" /> <!-- 한 page 개수 -->
</form>
<script>
/**
 * 초기화시 알림개수 조회
 */
$(function(){
	onNotifyAlarmChanged();
});

/**
 * 최신 알림개수 조회하기
 */
function onNotifyAlarmChanged() {
	console.log('>>> onNotifyAlarmChanged');
	// 
	$.ajax({
        url: '/common/selectLatestAlarmCount.ajax',
        type: 'get',
        data: { },
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log('>>> selectLatestAlarmCount');
			console.log(_data);
			if(_data && _data.result > 0) {
				var cnt = _data.result;
				$('#alarmDiv').addClass('active');
				$('#latestAlarmNumber').text(cnt);
			} else {
				$('#alarmDiv').removeClass('active');
				$('#latestAlarmNumber').text('');
			}
		}
    });
}

/**
 * 알림창 보여주기 
 */
function showAlarmDiv() {
	//active 지우고 number 지운다
	$('#alarmDiv').removeClass('active');
	$('#latestAlarmNumber').text(''); 
	// update 및 조회
	updateAndSearchAlarm();
	modalShow('#alert');
}

/**
 * 알림 update 및 조회
 */
var flag_updateAndSearchAlarm = false; //flag
function updateAndSearchAlarm() {
	
	if(flag_updateAndSearchAlarm) {
		return;
	}
	flag_updateAndSearchAlarm = true;
	
	// 
	$.ajax({
        url: '/common/updateLatestAlarmRead.ajax',
        type: 'post',
        data: {  },
		complete : function(_data){
			flag_updateAndSearchAlarm = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
			console.log('>>> loadPage');
			loadAlarmPage();
		}
    });
}

</script>
<script>
//뷰 컨트롤러 생성	
var alarmListView = null;

/**
 * 초기화
 */
$(function(){
	
	// init param
	var myForm = $('form[name="alarmListParamForm"]');
	myForm.find('[name="schPage"]').val('1');
	
	//뷰 컨트롤러 생성	
	alarmListView = new ListView({
		htmlElement : $('#alarmListView')
	});
	
	// clear
	alarmListView.clear();
});


/**
 * 페이지 load
 */
var flag_loadAlarmPage = false; //flag
function loadAlarmPage() {
	
	if(flag_loadAlarmPage) {
		return;
	}
	flag_loadAlarmPage = true;
	
	var myForm = $('form[name="alarmListParamForm"]');
	// 데이터 조회 및 load
	$.ajax({
        url: '/common/selectLatestAlarmList.ajax',
        type: 'get',
        data: myForm.serialize(),
		complete : function(_data){
			flag_loadAlarmPage = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
	    	// load
	    	loadAlarmPageWithData(_data);
		}
    });
}

/**
 *  loadAlarmPageWithData
 */
function loadAlarmPageWithData(_data) {
	//alarmListView.clear();
	//if(!itemList || itemList.length == 0) {
	//	console.log('>>> loadPageWithData no data.');
	//	return;
	//}
	
	// allCount
	var allCount = _data.all_count;
	console.log('>>> allCount=' + allCount);
	// pageNo
	var myForm = $('form[name="alarmListParamForm"]');
	var pageNo = myForm.find('[name="schPage"]').val();
	
	//
	var listData = _data.list;
	var listCount = listData.length;
	var existList = listCount > 0; 
	alarmListView.putData('existList', existList);
	// loadMore button
	if((! existList) || ((alarmListView.items.length + listCount)  >= allCount) ) {
		$('#alert').find('[data-name="alarmLoadMore"]').hide(); 
	} else {
		$('#alert').find('[data-name="alarmLoadMore"]').show();
	}
	if( ! existList ){	
		console.log('>>> loadPageWithData no data.');
		return;
	}
	
	// 
	alarmListView.addAll({
		keyName: 'seq'
		,data: listData
		,htmlTemplate: $('#tmpl-alarmListTemplete').html()
	});
	
	//
	
}

/**
 * 더보기: 알림
 */
function alarmLoadMore() {
	// pageNo + 1
	var myForm = $('form[name="alarmListParamForm"]');
	var pageNo = myForm.find('[name="schPage"]').val();
	if(pageNo == '') {
		pageNo = '1';
	}
	
	var nextPage = parseInt(pageNo, 10);
	nextPage++;
	myForm.find('[name="schPage"]').val(nextPage);
	
	// load 
	loadAlarmPage();
}

/*
 * 통합검색 
 */
function inteSearch(isKeyDown) {
	
	if( isKeyDown ) {
		if( event.keyCode == 13 ) {
			submitInteSearchForm();	
		}
	} else {
		submitInteSearchForm();
	}
	
}

function submitInteSearchForm() {
	if( !isEmpty($('#searchWord').val()) ) {
		 $('#inteSearchForm').submit(); 
	} else {
		alert("검색어를 입력해 주세요.");
		$('#searchWord').focus();
	}
}

</script>		
		
<!-- **************************  ]]알림  ************************* -->	

