<%-- 화면ID : OD03-01-03 --%>
<%@page import="com.opendesign.utils.CmnConst.ProjectProgressStatus"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.UserVO"%>
<%@page import="com.opendesign.utils.CmnConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.vo.CategoryVO"%>
<%@page import="com.opendesign.vo.ProjectVO"%><%
	List<ProjectVO> projectList = (List<ProjectVO>)request.getAttribute("projectList");
	List<CategoryVO> cateList = (List<CategoryVO>)request.getAttribute("cateList");
	UserVO user = CmnUtil.getLoginUser(request);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
	<link rel="stylesheet" type="text/css" href="/resources/js/lib/jquery-ui.min.css" />
	<script src="/resources/js/lib/jquery-ui.min.js" ></script>

	<style>
		.lock{width:100%; overflow:hidden;}
		.inner{position:relative; width:1286px; margin:0 auto;}
		.inner:after{clear:both; display:block; content:'';}

		/* 필수항목 */
		.km-required{color:red !important; }
		.none{width:100%; text-align:center; font-size:15px; font-weight:700; color:#414141;}
		.hide{display:none;}

		/* product regi */
		.regi-content{padding:70px 0 74px;}
		.regi-content h2{float:none; margin:0 0 80px; font-size:46px;}
		.regi-content .cate{color:#696969;}
		.tbl-regi th{padding:35px 0 0 30px; font-size:26px; font-weight:normal; text-align:left; vertical-align:top;}
		tr.no-padding th,
		tr.no-padding td { padding:10px 0 !important; }
		.tbl-regi .no-border{width:100%; height:42px; box-sizing:border-box; padding:0 0 0 5px; font-size:20px; border:0; border-bottom:1px solid #9e9e9e; background:none;}
		.tbl-regi .checkbox input[type="checkbox"]{position:absolute; top:0; left:0; opacity:0;}
		.tbl-regi .checkbox input[type="checkbox"]+label{float:left; height:28px; padding:5px 0 0 38px; font-size:22px; background:url(/resources/image/common/bg_checkboxBig.png) no-repeat 0 0;}
		.tbl-regi .checkbox input[type="checkbox"]:checked+label{background-position:0 bottom;}
		.tbl-regi .btn-guide:hover+.modal-guide{display:block;}
		.tbl-regi td{padding:30px 0;}
		.tbl-regi th .btn-guide img{margin:-5px 0 0;}
		.tbl-regi th span{display:block; font-size:14px;}

		.tbl-regi .my-select{float:none; margin:0;}
		.tbl-regi .my-select input[type="text"]{width:100%;}
		.custom-select{position:relative; float:left; margin:0 4px 0 0;}
		.custom-select select{position:absolute; top:0; left:0; width:100%; height:35px; font-size:14px; opacity:0;}
		.custom-select input[type="text"]{width:120px; height:35px; padding:0 30px 0 12px; color:#a4a4a4; background:#fff url(/resources/image/common/bg_selectSmall.gif) no-repeat right 0;}
		.custom-select input[type="text"].readonly{width:120px; height:35px; padding:0 30px 0 12px; color:#d9d9d9; background:#fff url(/resources/image/common/bg_selectSmall.gif) no-repeat right 0;}

		.file-url{position:relative; float:left; width:307px; height:48px; margin:0 18px 16px 0; background:#fff;}
		.file-url input[type="text"]{width:100%; height:48px; box-sizing:border-box; padding:0 45px 0 10px; border:0;}
		.file-url button{position:absolute; top:0; right:0; width:40px; height:48px; font-size:22px; color:#b1b1b1;}

		.file{position:relative; float:left; width:80px; height:27px; overflow:hidden; margin:10px 0 0;}
		.file input[type="file"]{position:absolute; top:0; left:0; width:80px; height:27px; opacity:0;}
		.file button{width:80px; height:27px; box-sizing:border-box; padding:0 0 0 22px; font-size:15px; color:#fff; border-radius:7px; background:#b5b5b5 url(/resources/image/sub/blt_search.png) no-repeat 14px 5px;}
		.file-list{clear:both; width:385px; height:110px; overflow:auto; padding:0 0 0 20px; font-size:18px; color:#b1b1b1; line-height:1.6; background:#fff;}
		.file-list > div{padding:3px 0;}
		.file-list button{margin:0 0 0 5px; font-size:20px; color:#b1b1b1;}
		.regi-content .btn-complete{float:right; width:200px; height:64px; font-size:24px; color:#fff; text-align:center; line-height:64px; border-radius:7px; background:#b5b5b5;}

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
				<span class="mainAlpha">P</span>
				<span class="maintitle2">프로젝트 관리</span>
			</div>
			<form name="projectForm" id="projectForm" enctype="multipart/form-data" onsubmit="return false;" >
				<input type="hidden" name="seq" id="projectSeq" />
			<table class="tbl-regi">
				<colgroup>
					<col style="width:220px">
					<col style="">
					<col style="width:220px">
					<col style="">
				</colgroup>
				<tr>
					<th scope="row"></th>
					<td colspan="3">
						<div id="div_select_project" class="my-select custom-select">
							<input id="txt_select_project" type="text"  >
							<select id="select_project" name="select_project">
								<option value="">내가 생성한 프로젝트</option>
							<%if( projectList != null ){ %>
							<%	for( ProjectVO aProject : projectList){ %>
								<option value="<%=aProject.getSeq() %>"><%=aProject.getProjectName() %></option>
							<%
								}
							}
							%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="km-required">프로젝트명</th>
					<td colspan="3"><input type="text" name="projectName" class="no-border " maxlength="50" placeholder="최대 50자 이내 입력"></td>
				</tr>
				<tr>
					<th scope="row" class="km-required">공개 여부</th>
					<td colspan="3">
						<div class="checkbox ">
							<input type="checkbox" name="publicYn" value="Y" id="open">
							<label for="open">공개</label>
						</div>
						<div class="checkbox ">
							<input type="checkbox" name="publicYn" value="N" id="close">
							<label for="close">비공개</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="km-required">카테고리</th>
					<td colspan="3" id="cateWrapProjMana">
						<div class="select-area custom-select" id="firstCateDiv">
							<input type="text">
							<select id="cateDepth1" name="cateDepth1">
								<option value="">전체</option>
							<%-- <%for(CategoryVO aCate  : cateList){%>
								<option value="<%=aCate.getCategoryCode() %>"><%=aCate.getCategoryName() %></option>
							<%} %> --%>
							</select>
						</div>
						<div class="select-area custom-select ">
							<input type="text">
							<select name="cateDepth2">
								<option value="">전체</option>
							</select>
						</div>
						<div class="select-area custom-select ">
							<input type="text">
							<select  name="cateDepth3">
								<option value="">전체</option>
							</select>
						</div>
						<button type="button" class="btn-add "><img src="../resources/image/common/btn_addBig.png" alt="더하기"></button>
						<ul id="ul_cate_list" class="cate-list">
						<%--
							<li>의상 <button type="button">x</button></li>
						--%>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">썸네일 등록</th>
					<td colspan="3">
						<div class="file-url ">
							<input type="text" id="fileName" readonly name="fileName" placeholder="jpg,png만 등록 가능합니다.">
							<!-- button type="btn-del">x</button-->
						</div>
						<div class="file ">
							<input type="file" name="fileUrlFile">
							<button type="button">검색</button>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">멤버 추가</th>
					<td colspan="3">
						<div class="member-add ">
							<input type="text" id="findName" name="schWord" placeholder="이름 검색" class="no-border">
							<!-- button type="button">검색</button -->
						</div>
						<ul id="ul_member_list" class="cate-list">
						<%--
							<li>의상 <button type="button">x</button></li>
						--%>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row">그룹 추가</th>
					<td colspan="3">
						<div class="member-add ">
							<input type="text" id="findGroup" name="schWord" placeholder="그룹 검색" class="no-border">
							<!-- button type="button">검색</button -->
						</div>
						<ul id="ul_group_list" class="cate-list">
						<%--
							<li>의상 <button type="button">x</button></li>
						--%>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row" class="km-required">완료 여부</th>
					<td id="td_status" colspan="3">
						<div class="checkbox ">
							<input type="checkbox" name="progressStatus" value="<%=CmnConst.ProjectProgressStatus.PROGRESS %>" id="progress">
							<label for="progress">진행</label>
						</div>
						<div class="checkbox ">
							<input type="checkbox" name="progressStatus" value="<%=CmnConst.ProjectProgressStatus.COMPLETE %>" id="complete">
							<label for="complete">완료</label>
						</div>
					</td>
				</tr>
			</table>
			<button id="btn_save" type="button" class="btn-complete ">수정완료</button>
			<button id="btn_delete" type="button" class="btn-complete " style="margin:0 5px 0 5px;">삭제</button>
			</form>
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

<!-- ################ 카테고리 ################### -->
<script >
	var categoryProjMg = null;
	function refreshCategoryProjMg(selCateCode) {
		if(categoryProjMg == null) {
			categoryProjMg = new CategoryView({
				htmlContainer: $('#cateWrapProjMana')
				,hiddenFieldName: 'categoryCodes'
				,excludeData: { }
				,selCateCode: selCateCode
			}).render();
		} else {
			categoryProjMg.setSelectedCateCode(selCateCode);
		}
	}

	$(function(){
		refreshCategoryProjMg('');
	});
</script>
<!-- ################ ]]카테고리 ################### -->

<script>
	/**
	 * readonly:
	 */
	function readonlyAll(flag) {
		//$('form[name="projectForm"]').find('input,textarea,select,button').not('#select_project').not('#txt_select_project').add('#btn_save').add('#btn_delete').add('div.checkbox').readonly(flag);
		var myForm = $('form[name="projectForm"]');
		myForm.find('input,textarea,select,button,div.checkbox').not('#div_select_project input,select').readonly(flag);
	}
	/**
	 * readonly: 완료된 프로젝트
	 */
	function readonlyCompleteProject() {
		var myForm = $('form[name="projectForm"]');
		myForm.find('input,textarea,select,button,div.checkbox').not('#div_select_project input,select')
			.not('#td_status input,#td_status div.checkbox').not('#btn_save')
			.readonly(true);
	}
</script>


<!-- ################ ]]그룹 ################### -->
<script>
/** 그룹 추가 */
$(function(){
	$("#findGroup").autocomplete({
		source : function( request, response ) {
			searchProjectGroup(request, response);
	    },
	    focus: function( event, ui ) {
			$("#findGroup").val( ui.item.label2 );
			return false;
		},
	    //조회를 위한 최소글자수
	    minLength: 2,
	    select: function( event, ui ) {
	    	insertProjectGroupRequest(event, ui);
	    }
	});
});

/** 그룹 검색 */
function searchProjectGroup(request, response) {
	var schProjectSeq = $('#projectSeq').val();
	if(schProjectSeq == '') {
		retun;
	}
	$.ajax({
    	type: 'post',
        url: "/project/selectProjectGroupListByName.ajax",
        dataType: "json",
        data: { schGroupName : request.term, schProjectSeq : schProjectSeq },
        success: function(data) {
        	console.log('>>> findGroup search result:');
        	console.log(data);
        	var result = data.result;

            response(
                $.map(result, function(item) {
                    return {
                        label:  item.displayGroupName,
                        label2: item.projectGroupName,
                        value: item.projectGroupSeq + '|' + item.projectSeq
                    }
                })
            );
        }
   });
}

/** 그룹 신청*/
function insertProjectGroupRequest(event, ui) {
	// 그룹 추가
	var itemValArr = ui.item.value.split('|');
	if(itemValArr.length < 2) {
		return;
	}
	var projectGroupSeq = itemValArr[0];
	var projectSeq = itemValArr[1];
	$.ajax({
    	type: 'post',
        url: "/project/insertProjectGroupRequest.ajax",
        dataType: "json",
        data: { projectGroupSeq : projectGroupSeq, projectSeq : projectSeq },
        error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
        success: function(data) {
        	console.log('>>> findGroup select:');
        	console.log(data);
        	var result = data.result;
        	if(result == ErrCode.V_SUCESS) {
        		var groupVO = data.groupVO;
        		// ui add
	        	$("#findGroup").val( '' );
	        	$('#ul_group_list').append(generatedLiForGroup(groupVO));
	        	return false;
        	} else if(result == ErrCode.V_NEED_LOGIN) {
        		alert("로그인이 필요합니다.");
        	} else if(result == ErrCode.V_GROUP_CONTAIN) {
        		alert("이미 그룹에 있습니다.");
        	} else if(result == ErrCode.V_GROUP_REQUESTED) {
        		alert("이미 신청하셨습니다.");
        	} else {
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        	$("#findGroup").val( '' );
        }
   });
}

/** 그룹 template */
function generatedLiForGroup(groupData) {
	// 그룹 ui
	var groupUi = $($.templates('<li>{{:groupLabel}}  <input type="hidden" name="uiGroup" value="{{:groupValue}}" /> <button type="button">x</button></li>').render(groupData));

	// 그룹 btn event
	groupUi.find('button').on('click', function(e){
		var thisObj = $(this);
		//그룹 취소
		var groupValue = thisObj.prev('input').val();
		var itemValArr = groupValue.split('|');
		if(itemValArr.length < 2) {
			return;
		}
		var projectGroupSeq = itemValArr[0];
		var projectSeq = itemValArr[1];

		$.ajax({
	    	type: 'post',
	        url: "/project/updateProjectGroupRequestCancel.ajax",
	        dataType: "json",
	        data: { projectGroupSeq : projectGroupSeq, projectSeq : projectSeq  },
	        error : function(_data) {
				console.log(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			},
	        success: function(data) {
	        	console.log('>>> findGroup updateProjectGroupRequestCancel:');
	        	console.log(data);
	        	var result = data.result;
	        	if(result == ErrCode.V_SUCESS ) {
	        		thisObj.parent().remove();
	        	} else {
	        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        	}
	        }
	   });
	});
	//
	return groupUi;
}

/** 그룹 신청 현황 조회*/
function initProjectGroupRequestList() {
	$('#ul_group_list').empty();
	var schProjectSeq = $('#projectSeq').val();
	if(schProjectSeq == '') {
		return;
	}

	$.ajax({
    	type: 'post',
        url: "/project/selectProjectGroupRequestInfo.ajax",
        dataType: "json",
        data: { schProjectSeq : schProjectSeq },
        error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
        success: function(data) {
        	console.log('>>> findGroup initProjectGroupRequestList:');
        	console.log(data);
        	var resultList = data.result;
        	if(resultList ) {
        		// ui add
	        	$('#ul_group_list').append(generatedLiForGroup(resultList));
        	}
        }
   });
}
</script>
<!-- ################ ]]그룹 ################### -->

<script type="text/javascript">
	$(function(){
		$.validator.addMethod("validateChecked", function(value, element) {
			var obj = $('input[name="' + element.name + '"]:checked');
			return obj && obj.length > 0;
		}, "선택해 주세요.");

		$.validator.addMethod("validateCheckedOne", function(value, element) {
			var obj = $('input[name="' + element.name + '"]:checked');
			return obj && obj.length == 1;
		}, "하나만  선택해 주세요.");

		$.validator.addMethod("validateFileExtension", function(value, element) {
			return acceptFileSuffix(value, "jpeg, png, jpg");
		}, "썸네일은 jpg, png 파일만 등록이 가능합니다.");

		$('#projectForm').validate( {
			//각 항목 별로 validation rule을 지정한다.
            rules:{
            	projectName : { required: true }
				, cateDepth1 : { required: true }
				, publicYn : { validateChecked: true, validateCheckedOne: true  }
				//, fileUrlFile : { required: true, validateFileExtension:true }
				, progressStatus : { validateChecked: true, validateCheckedOne: true  }
            },
            //rules에서 정의된 조건으로 validation에 실패했을 때 화면에 표시할 메시지를 지정한다.
            messages: {
            	projectName : { required: "프로젝트명을 입력해 주세요." }
            	, cateDepth1 : { required: "카테고리를 설정해주세요." }
            	//, fileUrlFile : { required: "썸네일을 입력해 주세요.", validateFileExtension: "썸네일은 jpg, png 파일만 등록이 가능합니다." }
				, publicYn : { validateChecked: "공개여부를 선택해 주세요.", validateCheckedOne: "공개여부는 하나만 선택이 가능합니다."}
				, progressStatus : { validateChecked: "완료여부를 선택해 주세요.", validateCheckedOne: "완료여부는 하나만 선택이 가능합니다."}
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
        } );



		/* 자동 완성 */
		$("#findName").autocomplete({
			source : function( request, response ) {
				$.ajax({
                	type: 'post',
                    url: "/project/findMember.ajax",
                    dataType: "json",
                    data: { schWord : request.term },
                    success: function(data) {
                    	var result = data.result;

                        response(
                            $.map(result, function(item) {
                                return {
                                    label: item.uname + '(' + item.email + ')',
                                    label2: item.uname,
                                    value: item.email
                                }
                            })
                        );
                    }
               });
            },
            focus: function( event, ui ) {
				$("#findName").val( ui.item.label2 );
				return false;
			},
	        //조회를 위한 최소글자수
	        minLength: 2,
	        select: function( event, ui ) {
	        	$("#findName").val( '' );
	        	$('#ul_member_list').append(generatedLi('emails', ui.item.label2, ui.item.value));
	        	return false;
	        }
	    });


		$('input[name="publicYn"]').on('click', function(e){
			var val = $(this).val();
			$('input[name="publicYn"][value!="' + val + '"]').prop('checked', false);

		});

		$('input[name="progressStatus"]').on('click', function(e){
			var val = $(this).val();
			$('input[name="progressStatus"][value!="' + val + '"]').prop('checked', false);

		});

		$('#btn_save').on('click', function(e){
			e.preventDefault();
			saveProject();
		});

		$('#btn_delete').click(function(e){
			e.preventDefault();
			deleteProject();
		});

		// readonly: default
		readonlyAll(true);
		var cateDepth1 = $('#cateWrapProjMana').find('[name="cateDepth1"]');
		$('#select_project').on('change', function(e){
			var val = $(this).val();
			$('#projectSeq').val(val);

			var form = $('#projectForm');
			form.find('input[name="projectName"]').val('');
			cateDepth1.find('option:eq(0)').prop('selected', true);
			cateDepth1.prev('input:text').val('전체');
			cateDepth1.trigger('change');

			$('#open').prop('checked', false);
			$('#close').prop('checked', false);
			$('#progress').prop('checked', false);
			$('#complete').prop('checked', false);

			$('#fileName').val('');

			$('#ul_cate_list').empty();
			$('#ul_member_list').empty();

			// default readonly true
			readonlyAll(true);

			if( val ){
				loadProject(val);
			}

			// readonly
			//if(val) {
			//	readonlyAll(false);
			//} else {
			//	readonlyAll(true);
			//}

		});
	});

	function generatedLi(inputName, label, val){
		var userName = "<%=user.getUname()%>";

		var aCateli = $('<li>' + label + ' <input type="hidden" name="' + inputName + '" value="' + val + '" /> <button type="button">x</button></li>');
		/* 현재 로그인 된 사용자 라면 x 버튼 비활성 */
		if( userName == label ) {
			aCateli = $('<li>' + label + ' <input type="hidden" name="' + inputName + '" value="' + val + '" />');
		}

		//맴버 취소
		aCateli.find('button').on('click', function(e){
			$(this).parent().remove();
		});

		return aCateli;
	}


	function saveProject(){

		var form = $('#projectForm');
		if( ! form.valid() ){
			return;
		}

		form.ajaxSubmit({
			url : "/project/updateProject.ajax",
			type : "post",
			dataType : 'json',
			error : function(_data) {
				console.log(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			},
			success : function(_data) {
				if(_data.result == '1') {
					window.location.href = '/project/projectManage.do';
		    	} else if(_data.result == '100') {
		    		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
		    			modalShow('#login-modal');
		    		}
		    	} else {
		    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		    	}
			}
		});
	}

	/**
	 * 프로젝트 삭제:
	 */
	function deleteProject(){
		 checkedLogin(function(){
			if(confirm('정말 삭제하시겠습니까?')) {
				var form = $('#projectForm');
				if($('#projectSeq').val() == '') {
					alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
					return;
				}

				form.ajaxSubmit({
					url : "/project/deleteProject.ajax",
					type : "post",
					dataType : 'json',
					error : function(_data) {
						console.log(_data);
				    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
					},
					success : function(_data) {
						if(_data.result == '1') {
							window.location.href = '/project/projectManage.do';
				    	} else {
				    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
				    	}
					}
				});
			}
		 }); //end of checkedLogin
	}

	function loadProject(projectSeq){
		//return;
		$.ajax({
			url : "/project/projectDetail.ajax",
	        type: "GET",
	        cache: false,
			data : {seq : projectSeq},
			success : function(_data){
				if( '100' == _data.result ){
					if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
		    			modalShow('#login-modal');
		    		}
					return;
				}else if( '404' == _data.result ){
					alert('프로젝트를 찾을 수 없습니다. 다른 프로젝트를 선택해 주세요.');
					return;
				}

				var aProject = _data.project;

				var form = $('#projectForm');
				form.find('input[name="seq"]').val(aProject.seq);
				form.find('input[name="projectName"]').val(aProject.projectName);

				if( !isEmpty(aProject.fileName) ) {
					form.find('input[name="fileName"]').val(aProject.fileName);
				}

				var publicYn = aProject.publicYn;
				form.find('input[name="publicYn"][value="' + publicYn + '"]').prop('checked', true);

				var cateList = _data.cate_list;
				if( cateList ){
					var cateArray = new Array();
					for( var i = 0; i < cateList.length; i++ ){
						var aCate = cateList[i];
						cateArray.push(generatedLi('categoryCodes', aCate.categoryName, aCate.categoryCode));

					}
					$('#ul_cate_list').append(cateArray);

				}

				var memberList = _data.member_list;
				if( memberList ){
					var memberArray = new Array();
					for( var i = 0; i < memberList.length; i++ ){
						var aMember = memberList[i];
						memberArray.push(generatedLi('emails', aMember.uname, aMember.email));

					}
					$('#ul_member_list').append(memberArray);

				}

				//그룹 초기화
				initProjectGroupRequestList();

				var progressStatus = aProject.progressStatus;
				form.find('input[name="progressStatus"][value="' + progressStatus + '"]').prop('checked', true);

				//카테고리 초기화
				refreshCategoryProjMg(aProject.selCateCode);


				// ==== readonly 처리 ============
				readonlyAll(false);
				// readonly category
				var cateDepth2 = $('#cateWrapProjMana').find('[name="cateDepth2"]');
				var cateDepth3 = $('#cateWrapProjMana').find('[name="cateDepth3"]');
				common.cateReadonly(cateDepth2, true);
				common.cateReadonly(cateDepth3, true);

				// 완료된 프로젝트 수정 못함:(상태 수정 빼고)
				handleProjectCompleteStatus(progressStatus);

				// ==== ]]readonly 처리 ============
			},
			error : function(req){
				console.log("fail to loadProject processing!");
			}
		});
	}

	/**
	 * 완료된 프로젝트 수정 못함:(상태와 수정버튼 빼고 다 수정못함)
	 */
	function handleProjectCompleteStatus(progressStatus) {
		if(isEmpty(progressStatus) || progressStatus == '<%=ProjectProgressStatus.PROGRESS%>' ) {
			console.log('>>> handleProjectCompleteStatus : progressStatus=' + progressStatus);
			return;
		}

		readonlyCompleteProject();
	}

</script>
</body>
</html>