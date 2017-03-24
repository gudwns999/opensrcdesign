<%-- 화면ID : OD04-03-02 --%>
<%-- 화면ID : OD04-03-03 --%>
<%@page import="com.opendesign.utils.CmnConst.CateExclude"%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.utils.CmnConst.RstConst"%>
<%@page import="com.opendesign.vo.CategoryVO"%>
<%@page import="com.opendesign.vo.RequestBoardVO"%>
<%@page import="com.opendesign.vo.RequestBoardFileVO"%>
<%@page import="com.opendesign.utils.CmnConst.PageMode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
	String pageMode = (String)request.getAttribute("pageMode"); //추가/변경 구분
	RequestBoardVO resultVO  = (RequestBoardVO)request.getAttribute(RstConst.P_NAME);
	String schMemberDiv = (String)request.getAttribute("schMemberDiv");  //회원구분
	String memberDivString = "";
	if(MemberDiv.DESIGNER.equals(schMemberDiv)) {
		memberDivString = "디자이너";
	} else {
		memberDivString = "제작자";
	}
	String boardType = schMemberDiv; //게시판구분 
	
	// 
	String lblTitle = "새 글 쓰기";
	String lblSubmit = "새 글 등록";
	String seq = "";
	String title = "";
	String contents = "";
	List<CategoryVO> cateList = null;
	List<RequestBoardFileVO> fileList = null;
	String selCateCode = ""; // 선택된 카테고리
	if(PageMode.UPDATE.equals(pageMode)) {
		lblTitle = "글 수정";
		lblSubmit = "글 수정";
		//
		seq = resultVO.getSeq();
		title = resultVO.getTitle();
		contents = resultVO.getContents(); 
		cateList = resultVO.getCateList(); 
		fileList = resultVO.getFileList();
		selCateCode = resultVO.getSelCateCode();
	} 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>



<script>
/**
 * 등록
 */
var flag_boardFormSubmit = false; //flag
function boardFormSubmit() {
	checkedLogin(function(){
		// 0.validate
		var myForm = $('form[name="boardForm"]');
		if(!myForm.valid()) {
			return;
		}
		//
		
		if(flag_boardFormSubmit) {
			return;
		}
		flag_boardFormSubmit = true;
		
		//== 1. submit
		myForm.ajaxSubmit({
			url : "/designer/insUpdRequestBoard.ajax",
			type : "post",
			dataType : 'json',
			complete : function(_data){
				flag_boardFormSubmit = false;
			},
			error : function(_data) {
				console.log(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			},
			success : function(_data) {
				console.log(_data);
				if(_data.result == '1') {
		    		//alert('성공했습니다.');
		    		//목록으로 이동
		    		window.location.href = '/designer/openDesignRequestBoard.do?schMemberDiv=<%=schMemberDiv%>';
		    	} else {
		    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		    	}
			}
		}); 
	}); //end of checkedLogin
}
</script>
<script>
//==================== 검증 ====================
$(function(){
	boardFormValidRuleInit(); 
})

function boardFormValidRuleInit(){
	//== 
	//== 
	//== 
	var myForm = $('form[name="boardForm"]');
	
	$.validator.addMethod("validateFileExtension", function(value, element) {
		return acceptFileSuffix(value, "jpeg, png, jpg");
	}, "썸네일은 jpg, png 파일만 등록이 가능합니다."); 
	
	myForm.validate({
		rules:{
			title : { required: true }
			,cateDepth1 : { required: true}
			,contents : { required: true }
			,uiImageUrlFile: {validateFileExtension: true}
		},
		messages: {
			title : { required: "제목을 입력하세요." }
			,cateDepth1 : { required: "카테고리를 설정하세요."}
			,contents : { required: "내용을 입력하세요." }
			,uiImageUrlFile : { validateFileExtension: "참고자료는 jpg, png 파일만 등록이 가능합니다." }
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
	    debug: true,
	    ignore: [],
	    focusInvalid:false,
	    onfocusout: false,
	    onkeyup: false,
	    onclick: false
	});
}
//==================== ]]검증 ====================
</script>

<!-- ################ 카테고리 ################### -->
<script >
	$(function() {
		new CategoryView({
			htmlContainer: $('#cateWrapRequestWrite')
			,hiddenFieldName: 'uiBoardCateCodes'
			,excludeData: { <%=CateExclude.P_NAME%>: '<%=CateExclude.V_DESI_PROD%>' }
			,selCateCode: '<%=selCateCode%>'
		}).render();
	});
</script>
<!-- ################ ]]카테고리 ################### -->

<!-- ###################### file upload ############################## -->
<script id="tmpl-boardFormFile" type="text/x-jsrender">
				<div class="file-wrap" >
					<div class="file-url">
						<input type="text" readonly="readonly" name="ttt" placeholder="참고 자료 (jpg,png만 등록, 최대 10MB)">
						<button onclick="boardFormRemoveFile(this);" class="btn-del">x</button>
					</div>
					<div class="file">
						<input type="file" accept="image/x-png, image/jpeg" name="uiImageUrlFile" style="width: 100px; cursor: pointer;">
						<button type="button" style="width: 100px; cursor: pointer;">검색</button>
					</div>
				</div>
</script>
<script>
////
	/**
	 * file add
	 */
	function boardFormAddFile(thisObj) {
		var myForm = $(thisObj).closest('form');
		var fileCont = myForm.find('.file-container');
		// check 4개 
		if(fileCont.find('.file-wrap').length >= 4) {
			alert('최대 4개까지 등록할수 있습니다.');
			return;
		}
		var htmlJ = $($.templates('#tmpl-boardFormFile').render());
		fileCont.append(htmlJ);
	}
	
 	/**
 	 * file remove
 	 */
 	function boardFormRemoveFile(thisObj) {
 		$(thisObj).closest('.file-wrap').remove();
 	}
 	
 	/**
 	*첫번째 참고자료는 등록된 이미지만 제거.
 	*/
 	function removeDataInFileWrap() {
		$("#ttt").val("");
 	}
</script>
<!-- ###################### ]]file upload ############################## -->


</head>
<style>
	.request-content{border-bottom:1px solid #bcbcbc; background:#f6f6f6;}
	.request-content .title{margin:0; padding:30px 0 35px; font-size:15px; font-weight:700; color:#113b88;}
	.request-content .select-wrap{clear:both; float:left; overflow:hidden; margin:0 0 40px;}
	.request-content .custom-select{float:left; margin:0 16px 0 0; font-size:14px;}
	.request-content .custom-select input[type="text"]{width:204px; height:31px; box-sizing:border-box; border:1px solid #b1b1b1; background:#fff url(../image/common/bg_selectSmall.gif) no-repeat right center;}
	.request-content .custom-select select{height:31px;}
	.request-content .input-search{float:left; overflow:hidden; border-radius:5px; background:#dcdcdc;}
	.request-content .input-search input[type="text"]{float:left; width:158px; height:31px; padding:0 0 0 15px; border:0; background:#dcdcdc;}
	.request-content .input-search button{float:left; width:35px; height:31px;}
	.request-content .tbl-wrap{clear:both; margin:0 0 26px; padding:25px 0 15px; border-top:1px solid #a7a7a7; border-bottom:1px solid #a7a7a7;}
	.request-content .tbl-regi {width:90%;}
	.request-content .tbl-regi td{display:block;padding:0 0 20px;}
	.request-content .tbl-regi .btn-add{margin:3px 0 0; right:-60px;}
	.request-content .tbl-regi .input-text{width:100%; height:65px; box-sizing:border-box; padding:0 0 0 15px; font-size:18px; border:1px solid #dedede;}
	.request-content .tbl-regi select{font-size:14px;}
	.request-content .tbl-regi .custom-select input[type="text"]{padding-left:15px;}
	.request-content .tbl-regi textarea{width:100%; height:610px; box-sizing:border-box; padding:15px; margin-top:15px;font-size:18px; border:1px solid #dedede;}

	.request-content .file-url{width:100%;}
	.request-content .file-url input[type="text"]{width:100%; height:65px; box-sizing:border-box; padding:0 0 0 15px; font-size:18px; border:1px solid #dedede;}
	.request-content .file-url .btn-del{right:0px;background-color:white;width:60px; height:65px; font-size:32px; border:}
	.request-content .file{width:160px; height:45px;}
	.request-content .file input[type="file"]{width:160px; height:45px;}
	.request-content .file button{width:160px; height:45px; font-size:20px; border-radius:10px;}
	.request-content .cate-list{padding:10px 0 0;}
	.request-content .cate-list li{height:32px; font-size:18px; line-height:32px;}
	.request-content .cate-list button{margin-top:2px; font-size:18px;}
	.request-content .btn-complete{float:right; width:160px; height:45px; margin:0 0 24px; font-size:22px; color:#fff; text-align:center; line-height:45px; border-radius:10px; background:red;}
	.request-content{overflow: hidden;}
	.custom-select{display:inline;}

	.file-url{position:relative; float:left; width:307px; height:48px; margin:0 18px 16px 0; background:#fff;}
	.file-url input[type="text"]{width:100%; height:48px; box-sizing:border-box; padding:0 45px 0 10px; border:0;}
	.file-url button{position:absolute; top:0; right:0; width:40px; height:48px; font-size:22px; color:#b1b1b1;}
	.file{position:relative; float:left; width:80px; height:27px; overflow:hidden; margin:10px 0 0;}
	.file input[type="file"]{position:absolute; top:0;left:0; width:80px; height:27px; opacity:0;}
	.file button{width:80px; height:50px; box-sizing:border-box; padding:0 0 0 22px; font-size:15px; color:#fff; border-radius:7px; background:#b5b5b5 url(../resources/image/sub/blt_search.png) no-repeat 14px 10px;}
	.file-list{clear:both; width:385px; height:110px; overflow:auto; padding:0 0 0 20px; font-size:18px; color:#b1b1b1; line-height:1.6; background:#fff;}
	.file-list > div{padding:3px 0;}
	.file-list button{margin:0 0 0 5px; font-size:20px; color:#b1b1b1;}

	.cate-list{clear:both; overflow:hidden; padding:10px 0;}
	.cate-list li{float:left; min-width:60px; height:25px; margin:0 10px 0 0; padding:0 0 0 6px; font-size:14px; color:#a4a4a4; border-radius:5px; line-height:25px; background:#e8e8e8;}
	.cate-list button{float:right; height:25px; margin:0 8px 0 0; font-size:11px; color:#414141;}

	.tbl-regi .cate-list li{min-width:77px; height:37px; padding:0 0 0 10px; font-size:20px; line-height:37px;}
	.tbl-regi .cate-list button{margin-top:5px; font-size:24px;}

	.request-content .cate-list{padding:10px 0 0;}
	.request-content .cate-list li{height:32px; font-size:18px; line-height:32px;}
	.request-content .cate-list button{margin-top:2px; font-size:18px;}

	.maintitle{width:250px; height:42px;}
	.mainAlpha{color:red;background-color:white;font-weight: 600;font-size: 20px;padding: 3px 6px 0px 6px}
</style>

<div class="wrap">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"> 
		<jsp:param name="headerCategoryYN" value="N" />
	</jsp:include>
	<!-- //header -->

	<!-- content -->

		<div class="request-content container">
			<div class="container maintitle mb-5" >
				<span class="mainAlpha">D</span>
				<span class="maintitle2"><%=lblTitle%></span>
			</div>


			<form name="boardForm" method="post" enctype="multipart/form-data" onsubmit="return false;" >
				<input type="hidden" name="pageMode" value="<%=pageMode%>" />
				<input type="hidden" name="seq" value="<%=seq%>" />
				<input type="hidden" name="boardType" value="<%=boardType%>" /> <!-- 게시판구분 -->
				
				<div class="tbl-wrap">
					<table class="tbl-regi">
							<td id="cateWrapRequestWrite">
								<div class="select-area custom-select">
									<select name="cateDepth1" id="cateDepth1">
										<option value=""></option>
									</select>
								</div>
								<div class="select-area custom-select">
									<select name="cateDepth2" >
										<option value="">전체</option>
									</select>
								</div>
								<div class="select-area custom-select">
									<select name="cateDepth3">
										<option value="">전체</option>
									</select>
								</div>
								<button type="button" class="btn-add" ><img src="/resources/image/common/btn_add.png" alt="더하기"></button>
						<ul class="cate-list">
									<!-- <li>의상 <button type="button" onclick="boardFormDelCategory(this);">X</button> <input type="hidden" name="uiBoardCateCodes" value=""></li> -->
									<% if( !CmnUtil.isEmpty(cateList)) { for(CategoryVO item : cateList) { %>
									<li><%=item.getCategoryName()%> <input type="hidden" name="uiBoardCateCodes" value="<%=item.getCategoryCode()%>"></li>
									<% } } %> 
								</ul>
							</td>

						<tr>
							<td>
								<input type="text" name="title" maxlength="40" placeholder="제목 (최대 40자)" class="input-text" value="<%=title%>" />
							</td>
						</tr>
						<!-- <tr>
							<td>
								<div class="btn-add" style="margin-right:10px;" >이미지 추가: </div>
								<button type="button" class="btn-add" onclick="boardFormAddFile(this);"><img src="/resources/image/common/btn_add.png" alt="더하기"></button>
							</td>
						</tr> -->
						<tr>
							<td class="file-container" style="position:relative;">
								<div class="file-wrap" >
									<div class="file-url">
										<input type="text" readonly="readonly" name="ttt" id="ttt" placeholder="참고 자료 (jpg,png만 등록, 최대 10MB)">
										<button type="button" class="btn-del" onclick="removeDataInFileWrap();"  >x</button>
									</div>
									<div class="file">
										<input type="file" accept="image/x-png, image/jpeg" name="uiImageUrlFile" style="width:100px;cursor: pointer;	">
										<button type="button" style="width: 100px; cursor: pointer;">검색</button>
									</div>
								</div>
								<button type="button" class="btn-add" style="position:absolute; top:12px; "onclick="boardFormAddFile(this);"><img src="/resources/image/common/btn_add.png" alt="더하기"></button>
							</td>
						</tr>
						<tr>
							<td><textarea name="contents" maxlength="5000" placeholder="새글쓰기 (최대 5,000자)"><%=contents%></textarea></td>
						</tr>
					</table>
				</div>
				<button type="button" onclick="boardFormSubmit();" class="btn-complete btn btn-red"><%=lblSubmit%></button>
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
</body>
</html>