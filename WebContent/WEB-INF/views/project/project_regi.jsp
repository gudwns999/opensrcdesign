<%-- 화면ID : OD03-01-02 --%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.vo.CategoryVO"%><%
	List<CategoryVO> cateList = (List<CategoryVO>)request.getAttribute("cateList");
	UserVO user = CmnUtil.getLoginUser(request);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
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
	.cate-list li{float:left; min-width:60px; height:25px; margin:0 10px 0 0; padding:0 0 0 6px; font-size:14px; color:#a4a4a4; border-radius:5px; line-height:25px; background:none;}
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
				<span class="maintitle2">프로젝트 생성</span>
			</div>
			<form name="projectForm" id="projectForm" enctype="multipart/form-data" onsubmit="return false;" >
			<table class="tbl-regi">
				<colgroup>
					<col style="width:220px">
					<col style="">
					<col style="width:220px">
					<col style="">
				</colgroup>
				<tr>
					<th scope="row" class="km-required">프로젝트명</th>
					<td colspan="3"><input type="text" name="projectName" class="no-border" maxlength="50" placeholder="최대 50자 이내 입력"></td>
				</tr>
				<tr>
					<th scope="row" class="km-required">공개 여부</th>
					<td colspan="3">
						<div class="checkbox">
							<input type="checkbox" name="publicYn" value="Y" id="open">
							<label for="open">공개</label>
						</div>
						<div class="checkbox">
							<input type="checkbox" name="publicYn" value="N" id="close">
							<label for="close">비공개</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="km-required">카테고리</th>
					<td colspan="3" id="cateWrapProjRegi">
						<div class="select-area custom-select" id="firstCateDiv">
							<input type="text">
							<select id="cateDepth1" name="cateDepth1">
								<option value="">전체</option>
							<%-- <%for(CategoryVO aCate  : cateList){%>
								<option value="<%=aCate.getCategoryCode() %>"><%=aCate.getCategoryName() %></option>
							<%} %> --%>
							</select>
						</div>
						<div class="select-area custom-select">
							<input type="text">
							<select id="cateDepth2" name="cateDepth2">
								<option value="">전체</option>
							</select>
						</div>
						<div class="select-area custom-select">
							<input type="text">
							<select id="cateDepth3" name="cateDepth3">
								<option value="">전체</option>
							</select>
						</div>
						<button id="btn_add_cate" type="button" class="btn-add"><img src="../resources/image/common/btn_addBig.png" alt="더하기"></button>
						<ul id="ul_cate_list" class="cate-list">
						<%--
							<li>의상 <button type="button">x</button></li>
						--%>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row" class="km-required">썸네일 등록</th>
					<td colspan="3">
						<div class="file-url">
							<input type="text" readonly placeholder="jpg,png만 등록 가능합니다.">
							<!-- button type="btn-del">x</button-->
						</div>
						<div class="file">
							<input type="file" name="fileUrlFile" accept="image/x-png, image/jpeg, image/jpg" />
							<button type="button">검색</button>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">멤버 추가</th>
					<td colspan="3">
						<div class="member-add">
							<input type="text" id="findName" name="schWord" placeholder="이름 또는 이메일 주소를 입력 후 Enter를 눌러주세요" class="no-border">
							<!-- button type="button">검색</button -->
						</div>
						<ul id="ul_member_list" class="cate-list">
						<%--
							<li>의상 <button type="button">x</button></li>
							<li>의상 <button type="button">x</button></li>
							<li>의상 <button type="button">x</button></li>
							<li>의상 <button type="button">x</button></li>
							<li>의상 <button type="button">x</button></li>
						--%>
							
							<li><%=user.getUname() %><input type="hidden" name="emails" value="<%=user.getEmail() %>" /></li>
						</ul>
					</td>
				</tr>
			</table>
			</form>
			<button id="btn_register" type="button" class="btn-complete btn btn-red"style="background-color: red">등록</button>
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
	$(function() {
		new CategoryView({
			htmlContainer: $('#cateWrapProjRegi')
			,hiddenFieldName: 'categoryCodes'
			,excludeData: { }
		}).render();
	});
</script>
<!-- ################ ]]카테고리 ################### -->

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
				, fileUrlFile : { required: true, validateFileExtension:true }
				, publicYn : { validateChecked: true, validateCheckedOne: true  }
            },
            //rules에서 정의된 조건으로 validation에 실패했을 때 화면에 표시할 메시지를 지정한다.
            messages: {
            	projectName : { required: "프로젝트명을 입력해 주세요." }
            	, cateDepth1 : { required: "카테고리를 설정해주세요." }
            	, fileUrlFile : { required: "썸네일을 입력해 주세요.", validateFileExtension: "썸네일은 jpg, png 파일만 등록이 가능합니다." }
				, publicYn : { validateChecked: "공개여부를 선택해 주세요.", validateCheckedOne: "공개여부는 하나만 선택이 가능합니다."}
            },
            invalidHandler: function(form, validator) {
                var errors = validator.numberOfInvalids();
                if (errors) {
                    alert(validator.errorList[0].message);
                    validator.errorList[0].element.focus();
                }          
           	},
          	//validator는 기본적으로 validation 실패 시 실패한 노드 우측에 실패 메시지를 표시하게 되어있다. 
          	//작동을 원하지 않으면 내용이 없는 errorPlacement를 선언한다.
          	//이 샘플에서는 alert를 사용하고 있으므로 빈 메서드를 선언하였다.
            errorPlacement: function(error, element) {
                // do nothing               	
            },
            ignore: [],
            focusInvalid:false,
            onfocusout: false,	// onblur 시 해당항목을 validation 할 것인지 여부 (default: true)
            onkeyup: false,
            onclick: false,
            debug:false, 			//true일 경우 validation 후 submit을 수행하지 않음. (default: false)
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
	        	var aCateli = $('<li>' + ui.item.label2 + ' <button type="button">x</button><input type="hidden" name="emails" value="' + ui.item.value + '" /></li>');
				aCateli.find('button').on('click', function(e){
					$(this).parent().remove();
				});
	        	
	        	$('#ul_member_list').append(aCateli);	        	
	        	return false;
	        }
	    });
		
		$('input[name="publicYn"]').on('click', function(e){
			var val = $(this).val();
			$('input[name="publicYn"][value!="' + val + '"]').prop('checked', false);
			
		});
		
		$('#btn_register').on('click', function(e){
			e.preventDefault();
			registerProject();			
		});
	});
	
	
	function registerProject(){
		
		var form = $('#projectForm');
		if( ! form.valid() ){
			return;
		}

		form.ajaxSubmit({
			url : "/project/registerProject.ajax",
			type : "post",
			dataType : 'json',
			error : function(_data) {
				console.log(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
			},
			success : function(_data) {
				if(_data.result == '1') {
					window.location.href = '/project/project.do';
		    	} else if(_data.result == '100') { //이메일 중복
		    		if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
		    			modalShow('#login-modal');
		    		}
		    	} else {
		    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		    	}
			}
		});
		
	}
</script>
</body>
</html>