<%-- 화면ID : OD03-02-05 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
	<style>
		.lock{width:100%; overflow:hidden;}
		.inner{position:relative; width:1286px; margin:0 auto;}
		.inner:after{clear:both; display:block; content:'';}

		/* product regi */
		.regi-content{padding:70px 0 74px;}
		.regi-content h2{float:none; margin:0 0 80px; font-size:46px;}
		.regi-content .cate{color:#696969;}

		.tbl-regi div{font-size:26px; font-weight:normal; text-align:left; vertical-align:top;}

		.group-list{min-height:210px; padding:12px 30px 0 50px; border-bottom:1px solid #dcdcdc; background:#fff;}
		.group-list > div{margin:0 0 15px; font-size:22px; color:#b5b5b5;}
		.group-list button{float:right; width:66px; height:28px; font-size:15px; color:#fff; border-radius:5px; background:#b5b5b5;}
		.add-area{overflow:hidden; padding:12px 30px; background:#fff;}
		.add-area input[type="text"]{width:870px; height:46px; padding:0 20px; border:1px solid #b1b1b1;}
		.add-area button{float:right; width:66px; height:28px; margin:8px 0 0; font-size:15px; color:#fff; border-radius:5px; background:#b5b5b5;}
		.btn-projectAdd{display:block; width:175px; height:28px; margin:10px auto; padding:0 0 0 25px; font-size:15px; color:#fff; text-align:center; line-height:28px; border-radius:5px; background:#b5b5b5 url(../image/sub/blt_search.png) no-repeat 25px 5px;}


		.maintitle{width:250px; height:42px;}
		.mainAlpha{color:red;background-color:white;font-weight: 600;font-size: 20px;padding: 3px 6px 0px 6px}
	</style>
</head>
<body>
<div class="wrap">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- //header -->

	<!-- content -->
	<div class="content regi-content">
		<div class="inner">
			<div class="container maintitle mb-5" >
				<span class="mainAlpha">G</span>
				<span class="maintitle2">그룹 생성 및 관리</span>
			</div>

			<div class="tbl-regi">
				<colgroup>
					<col style="width:220px">
					<col style="">
				</colgroup>
				<div class="ml-5">
					<div scope="row">그룹 목록</div>
					<div>
						<div class="group-list">
						</div>
						<div class="add-area">
							<input type="text" name="group_name" placeholder="그룹명 입력">
							<button class="btn btn-red" style="background:red" type="button" onclick="insertGroup();" >추가</button>
						</div>
					</div>
				</div>
				<div class="mt-5 ml-5">
					<div scope="row">프로젝트 목록</div>
					<div>
						<div class="group-list"></div>
							<!--<div class="add-area">-->
								<!--<a href="javascript:modalShowProjectSearch();" class="btn-projectAdd btn-modal">추가할 프로젝트 조회</a>-->
							<!--</div>-->
					</div>
				</div>
				<div class="mt-5 ml-5">
					<div scope="row">프로젝트 대기 목록</div>
					<div>
						<div id="groupProjectWaitingList" class="group-list"></div>
					</div>
				</div>
			</div>
			<a href="/project/project.do" class="btn-complete btn btn-red mt-5 mr-5" style="float:right">완료</a>
		</div>
	</div>
	<!-- //content -->

	<!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- //footer -->
</div>


<!-- modal -->
<%@include file="/WEB-INF/views/common/modal.jsp"%>
<!-- //modal -->

<script id="tmpl-groupRow" type="text/x-jsrender">
	<div class="item active" onclick="onClickGroupRow(event);" data-seq="{{:seq}}" >
		{{:groupName}}
		<button type="button" onclick="onClickGroupRow(event);" data-seq="{{:seq}}" >삭제</button>
	</div>
</script>

<script id="tmpl-groupProjectRow" type="text/x-jsrender">
	<div class="item">
		{{:projectName}}
		<button type="button" onclick="deleteGroupProject(event);" data-group_seq="{{:groupSeq}}" data-seq="{{:seq}}" >삭제</button>
	</div>
</script>

<script id="tmpl-groupProjectWaitingTemplate" type="text/x-jsrender">
	<div class="item">
		{{:projectName}}
		<button type="button" onclick="groupProjectWaitingReject(event);" data-group_seq="{{:projectGroupSeq}}" data-project_seq="{{:projectSeq}}" >제외</button>
		<span style="padding:2px;float:right;"></span>
		<button type="button" onclick="groupProjectWaitingApprove(event);" data-group_seq="{{:projectGroupSeq}}" data-project_seq="{{:projectSeq}}" >승인</button>
	</div>
</script>

<script type="text/javascript">
var groupTemplete = null;
var groupProjectTemplete = null;
var groupProjectWaitingTemplate = null; //대기
var divGroupList = null;
var divGroupProjectList = null;
var selectGroupSeq = null;

$(function(){
	groupTemplete = $('#tmpl-groupRow').html();
	groupProjectTemplete = $('#tmpl-groupProjectRow').html();
	groupProjectWaitingTemplate = $('#tmpl-groupProjectWaitingTemplate').html();

	var tblRegi = $('.tbl-regi');
	divGroupList = tblRegi.find('div:eq(0) div.group-list');
	divGroupProjectList = tblRegi.find('tr:eq(1) div.group-list');
	divGroupProjectWaitingList = $('#groupProjectWaitingList');

	loadGroup();
});

var flagRequsest = false;
var defaultAjaxOpt = {
	cache: false,
    error : function(_data) {
    	console.log(_data);
		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	},
	complete: function(_data){
    	flagRequsest = false;
    }
};

function requestAjax(opts){
	$.extend(opts, defaultAjaxOpt);
	$.ajax(opts);
}

function loadGroup(){

	requestAjax({
		url: '/project/groupList.ajax',
        type: 'get',
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');

        		}
        		return;
        	}
        	divGroupList.empty();
        	divGroupProjectList.empty();
        	divGroupProjectWaitingList.empty();

        	var list = _data.list;
        	if( list != null && list.length > 0 ){
        		var eleList = new Array();
				for( var i = 0; i < list.length; i++ ){
					var aData = list[i];

					var formattedHtml = $.templates(groupTemplete).render( aData );
					eleList.push( $( formattedHtml ) );

				}
				divGroupList.append(eleList);

        	}
        }
	});
}

function loadGroupProject(groupSeq){
	requestAjax({
		url: '/project/groupProjectList.ajax',
        type: 'get',
        data: {seq:groupSeq},
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');

        		}
        		return;
        	}
        	divGroupProjectList.empty();

        	selectGroupSeq = groupSeq;

        	var list = _data.list;
        	if( list != null && list.length > 0 ){
        		var eleList = new Array();
				for( var i = 0; i < list.length; i++ ){
					var aData = list[i];
					aData.groupSeq = groupSeq;

					var formattedHtml = $.templates(groupProjectTemplete).render( aData );
					eleList.push( $( formattedHtml ) );

				}
				divGroupProjectList.append(eleList);

        	}
        }
	});
}

// ====================== 프로그램 그룹 대기 ===================================
/** 프로그램 대기 */
function loadGroupProjectWaiting(groupSeq){
	requestAjax({
		url: '/project/selectProjectGroupRequestWaitingList.ajax',
        type: 'get',
        data: {schGroupSeq : groupSeq},
        success : function(_data){
        	var result = _data.result;
        	divGroupProjectWaitingList.empty();
        	if(result) {
        		var groupUis = $($.templates(groupProjectWaitingTemplate).render(result));
        		divGroupProjectWaitingList.append(groupUis);
        	}
        }
	});
}

function groupProjectWaitingApprove(event){
	checkedLogin(function(invokeAfterLogin){

		if( ! confirm('정말 승인하시겠습니까?') ){
			return;
		}

		if( flagRequsest ){
			return;
		}
		flagRequsest = true;

		var thisObj = $(extractEventTarget(event));
		var projectGroupSeq = thisObj.data('group_seq');
		var projectSeq = thisObj.data('project_seq');

		requestAjax({
			url: '/project/updateProjectGroupRequestApprove.ajax',
	        type: 'post',
	        data: {projectGroupSeq: projectGroupSeq, projectSeq: projectSeq},
	        success : function(_data){
	        	var result = _data.result;
	        	if(result == ErrCode.V_SUCESS) {
	        		//
	        		var thisParent = thisObj.parent();
		        	thisParent.remove();
		        	//
		        	loadGroupProject(projectGroupSeq);
	        	} else {
	        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        	}
	        }
		});

	}); //end of checkedLogin
}

function groupProjectWaitingReject(event){
	checkedLogin(function(invokeAfterLogin){

		if( ! confirm('정말 제외하시겠습니까?') ){
			return;
		}

		if( flagRequsest ){
			return;
		}
		flagRequsest = true;

		var thisObj = $(extractEventTarget(event));
		var projectGroupSeq = thisObj.data('group_seq');
		var projectSeq = thisObj.data('project_seq');

		requestAjax({
			url: '/project/updateProjectGroupRequestReject.ajax',
	        type: 'post',
	        data: {projectGroupSeq: projectGroupSeq, projectSeq: projectSeq},
	        success : function(_data){
	        	var result = _data.result;
	        	if(result == ErrCode.V_SUCESS) {
	        		//
	        		var thisParent = thisObj.parent();
		        	thisParent.remove();
	        	} else {
	        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        	}
	        }
		});

	}); //end of checkedLogin
}
//====================== ]]프로그램 그룹 대기 ===================================

function insertGroup(){
	var iGroupName = $('input[name="group_name"]');
	var val = iGroupName.val();
	if( $.trim(val) == '' ){
		alert('그룹명을 입력해 주세요');
		iGroupName.focus();
		return;
	}

	if( flagRequsest ){
		return;
	}
	flagRequsest = true;

	requestAjax({
		url: '/project/insertGroup.ajax',
        type: 'post',
        data: {groupName : val},
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');

        		}
        		return;
        	}

        	var groupData = _data.data;
        	if( groupData ){
        		iGroupName.val('');
        		divGroupProjectList.empty();

        		selectGroupSeq = groupData.seq;

        		var formattedHtml = $.templates(groupTemplete).render( groupData );
        		var addObj = $( formattedHtml );
        		divGroupList.append(addObj);
        		onChangeGroupRow(addObj);

        	}
        }
	});
}

function deleteGroup(thisObj){
	var groupSeq = thisObj.data('seq');
	requestAjax({
		url: '/project/deleteGroup.ajax',
        type: 'post',
        data: {seq : groupSeq},
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');

        		}
        		return;
        	}

        	var thisParent = thisObj.parent();
        	thisParent.remove();

        	if( selectGroupSeq == groupSeq ){
        		divGroupProjectList.empty();
        		divGroupProjectWaitingList.empty();
        		selectGroupSeq = null;

	       	}
        }
	});
}

function deleteGroupProject(event){
	if( ! confirm('정말 삭제하시겠습니까?') ){
		return;
	}

	if( flagRequsest ){
		return;
	}
	flagRequsest = true;

	var thisObj = $(extractEventTarget(event));
	var groupSeq = thisObj.data('group_seq');
	var projectSeq = thisObj.data('seq');

	requestAjax({
		url: '/project/deleteGroupProject.ajax',
        type: 'post',
        data: {groupSeq: groupSeq, projectSeq: projectSeq},
        success : function(_data){
        	var result = _data.result;
        	if( '100' == result ){
        		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
        			modalShow('#login-modal');

        		}
        		return;
        	}

        	var thisParent = thisObj.parent();
        	thisParent.remove();
        }
	});

}

function onClickGroupRow(event){
	if( flagRequsest ){
		return;
	}
	flagRequsest = true;

	var thisObj = $(extractEventTarget(event));
	if( 'button' == thisObj.prop('type') ){
		if(event.stopPropagation) {
			event.stopPropagation();
	    } else {
	    	event.returnValue = false;
	    }

		if( confirm('정말 삭제하시겠습니까?') ){
			deleteGroup( thisObj );
			return;
		}
		flagRequsest = false;
		return;
	}
	onChangeGroupRow(thisObj);

	var groupSeq = thisObj.data('seq');
	loadGroupProject( groupSeq );
	loadGroupProjectWaiting( groupSeq );
}

function modalShowProjectSearch(){
	if( selectGroupSeq ){
		modalShow('#project-search', {
			groupSeq:selectGroupSeq
			, onComplete: function(groupSeq){
				loadGroupProject(groupSeq);
				loadGroupProjectWaiting(groupSeq);
			}
		});
	}else{
		alert('그룹을 선택해 주세요.');
	}
}

function onChangeGroupRow(thisObj){
	var defaultColor = '#b5b5b5';

	var divList = thisObj.parent();
	var divs = divList.find('div.item');

	divs.each(function(){
		divs.css('color', defaultColor);
	});

	thisObj.css('color', '#113b88');

}
</script>

</body>
</html>