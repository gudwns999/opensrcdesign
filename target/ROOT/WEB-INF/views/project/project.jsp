<%-- 화면ID : OD03-01-01 --%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.opendesign.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.ProjectGroupVO"%>
<%@page import="com.opendesign.utils.CmnConst"%>
<%@page import="com.opendesign.utils.StringUtil"%><%

	/* 로그인 여부 */
	boolean isLogin = CmnUtil.isUserLogin(request);

	/* 로그인 유저 그룹 */
	List<ProjectGroupVO> myPGroupList = (List<ProjectGroupVO>)request.getAttribute("myPGroupList");
	List<ProjectVO> myProjectList = (List<ProjectVO>)request.getAttribute("myProjectList");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
	<script>
        $(document).ready(function(){


            var getValue = $(location).attr('search');
            //최신순 인기순 눌렀을때 2depth 안나오게 하기 위한 편법.
            if(getValue==""){
                getValue="F";
            }else {
                getValue = getValue.substring(9, 12);
                //정규식으로 숫자만 왔을때를 노림.
                regNumber = /^[0-9]*$/;
            }
            if(!regNumber.test(getValue)){
            }else{
                if(getValue=="001"){
                    $('#nowCate2').html("패션");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=001002'>스마트패션</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=001003'>의상</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=001006'>액세서리</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=001005'>패션모듈</a></li>");
                }else if(getValue=="002"){
                    $('#nowCate2').html("제품");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=002003'>스마트카</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=002004'>로봇</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=002002'>기계/기기/기구</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=002001'>센서모듈</a></li>");

                }else if(getValue=="003"){
                    $('#nowCate2').html("커뮤니케이션");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=003001'>UI/UX</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=003004'>광고</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=003003'>웹</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=003002'>영상</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=003007'>타이포그래피</a></li>");
                }else if(getValue=="004"){
                    $('#nowCate2').html("공예");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=004001'>금속 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=004002'>도자 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=004003'>목공예</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=004004'>수공예</a></li>");
                }else if(getValue=="005"){
                    $('#nowCate2').html("공간");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=005003'>스마트시티</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=005001'>건축</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=005002'>인테리어</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=005004'>환경</a></li>");
                }else if(getValue=="006"){
                    $('#nowCate2').html("정보");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=006003'>스마트미디어</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=006004'>게임</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=006005'>디지털컨텐츠</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=006006'>서비스</a></li>");
                }else if(getValue=="007"){
                    $('#nowCate2').html("자연");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=007001'>동물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=007002'>식물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=007003'>지구의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=007004'>우주의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/project/project.do?schCate=007005'>디자인의 역사</a></li>");
                }else if(getValue=="008"){
                    $('#nowCate2').html("새분야");
                }
            }





            });
	</script>
</head>
<body>
<!--text overflow는 긴 글을 ...으로 처리-->
<style>


	.tab-indentation{
		padding-left:60px;
	}
	.tab-indentation2{
		padding-left:51px;
	}
	.thumbnail > img {
		width: 263px;
		height: 175px;
	}
	.tab-con > div{display:none;}
	.tab-con > div.active{display:block;}
	.project-con{width:1316px; margin:0 auto; padding:10px 0 0;}

	.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
		width:auto;
	}

</style>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- //header -->


<div id="sec4"class="container" style="margin-top: 90px" >
    <div class="row" >
<!-- custom-btn 처리 -->
<script id="tmpl-custom-btn" type="text/x-jsrender">
	<a href="javascript:goPage('/project/projectRegi.do', true);" class="btn-product">
	<button  type="button" class="btn btn-red">프로젝트 생성</button></a>
	<button type="button" class="btn btn-red" role="button" data-toggle="modal" data-target="#project-help">도움말</button>
</script>
		<div class="modal fade" tabindex='-1' id="project-help" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<h3 align="center">함께하는 디자인</h3>
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3 col-xs-12" >
								<h4>1. 프로젝트</h4>
								<p>상단 메뉴에서 프로젝트 버튼을 눌러 프로젝트 페이지로 넘어갑니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/pro1.png">
								<p>프로젝트 생선 버튼을 클릭하여 새로운 프로젝트를 생성합니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/proprocess1.png">
								<p>프로젝트 생성 페이지에서 양식에 맞추어 프로젝트 생성을 진행 합니다.</p>
								<p>멤버를 검색해 프로젝트 멤버로 초대 할수도 있습니다.</p>
								<p>프로젝트 서비스를 통해 여러사람이 함께모여 디자인 프로젝트를 진행 할 수 있습니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/proprocess2.png">

								<p>프로젝트는 주제추가, 주제에 맞는 작품 추가를 통해 프로젝트를 진행해 나갑니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/pro4.png">
								<p>또한 주제추가를 프로젝트 성격에 맞추어 주차별, 기능별, 프로젝트에 참여한 사람의 이름명으로 하여 자유롭게 프로젝트를 진행할 수 있습니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/pro5.png">
								<img class="img-responsive"src="/resources/image/buyimage/pro6.png">
								<img class="img-responsive"src="/resources/image/buyimage/pro7.png">
								<h4 class="mt-5">2. 그룹</h4>
								<p>프로젝트 그룹 기능을 이용하여 학교나 기업체 같은 조직에서 프로젝트 팀들을 편리하게 관리할 수 있습니다.</p>
								<img class="img-responsive mt-5"src="/resources/image/buyimage/grpro1.png">
								<img class="img-responsive"src="/resources/image/buyimage/grpro2.png">
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<script>
		$(function(){
			$('.btn-area').append($('#tmpl-custom-btn').html());
		});
</script>
			<!-- 로그인후 보여줌 -->

		<style>

			.category{
				background-color:rgb(234,234,234) !important;
				font-size:18px;
				font-weight: 100;
				text-align:center;
				width: 10px;
			}


		</style>
		<!------------------- 김형준 넘어가기  ---------------------------------->
		<span class="dropdown">
				<span class="category dropdown-toggle" type="button" data-toggle="dropdown" id="nowCate"></span>
				<ul class="dropdown-menu">
					<li><a href="/product/product.do">디자인</a></li>
					<li><a href="/project/project.do">프로젝트</a></li>
					<li><a href="/designer/designer.do">디자이너</a></li>
				</ul>
			</span>
		<span class="dropdown">
				<span class="category dropdown-toggle" type="button" data-toggle="dropdown" id="nowCate2"> 전체</span>
				<ul class="dropdown-menu">
					<li><a href="/project/project.do?schCate=001">패션</a></li>
					<li><a href="/project/project.do?schCate=002">제품</a></li>
					<li><a href="/project/project.do?schCate=003">커뮤니케이션</a></li>
					<li><a href="/project/project.do?schCate=004">공예</a></li>
					<li><a href="/project/project.do?schCate=005">공간</a></li>
					<li><a href="/project/project.do?schCate=006">엔터테인먼트</a></li>
					<li><a href="/project/project.do?schCate=008">새분야</a></li>
				</ul>
			</span>
		<span class="dropdown">
				<span class="category dropdown-toggle hideCate" type="button" data-toggle="dropdown" id="nowCate3"> 전체</span>
				<ul class="dropdown-menu" id="nowCate4">
				</ul>
			</span>

		<style>
			.category{
				background-color:rgb(234,234,234) !important;
				font-size:18px;
				font-weight: 100;
				text-align:center;
			}
		</style>		
		<!------------------- __넘어가기  ---------------------------------->
		<div class="btn-area" style="float: right">
			<% if(isLogin) { %>
			<div id="sch_my_group" style="display: inline-block">
				<select class="selectpicker"  data-style="category" style="display: inline;">
					<option>내그룹(<%=myPGroupList.size()%>)</option>
					<%if( isLogin && myPGroupList.size() > 0 ){ %>
					<%
					for(ProjectGroupVO aPGroup : myPGroupList){
					%>
					<option value="<%=aPGroup.getSeq()%>"><%=aPGroup.getGroupName()%></option>
					<%
					}
					%>
					<%} %>
				</select>
			</div>
			<%} %>
			<div class="sorting" style="font-size:16px;float:right;margin-right:25px">
				<a class="btn btn-default" href="javascript:sortProduct();">최신순</a>
				<a class="btn btn-default" href="javascript:sortProduct('LIKE');">인기순</a>
				<a class="btn btn-default" href="javascript:sortProduct('MEMBER');">멤버순</a>				
			</div>
			<a href="javascript:goPage('/project/projectGroup.do', true);">
				<button  type="button"class="btn btn-red">그룹 생성 및 관리</button>
			</a>

			<%
			if( isLogin && myProjectList.size() > 0 ) {
			%>

			<a href="javascript:goPage('/project/projectManage.do', true);"><button  type="button" class="btn btn-red">프로젝트 관리</button></a>
			<%
			}
			%>
		</div>
		<!--tab-wrap은 지우면 안된다. -->
		<div class="tab-wrap mt-5">
			<ul class="tab tab-indentation">
				<li class="ing active" style="list-style-type: none;display: inline-block">
					<a href="#ing-project">
					<button  type="button" class="btn">
						진행중인 프로젝트</button>
					</a>
				</li>
				<!-- <li class="complete"><a href="#complete-project"><span></span>완료된 프로젝트</a></li> -->
				<li class="complete" style="list-style-type: none;display: inline-block"><a href="#group-tab">
					<button  type="button" class="btn ">
					프로젝트 그룹</button></a></li>
			</ul>
		</div>

		<div class="tab-con project-con">
			<div id="ing-project" class="active">
				<ul id="ing-project-list" class="project-list"></ul>
			</div>
			<!-- <div id="complete-project">
				<ul id="complete-project-list" class="project-list"></ul>
			</div> -->
			<div id="group-tab">		
				<table class="table table-striped">
					<thead>
					<tr id="mytable">
					</tr>
					</thead>
					<tbody id="groupListView" class="project-list">

					</tbody>
				</table>
			</div>
		</div>
		<!-- //content -->

    </div>
</div>


<!-- footer -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
<!-- //footer -->
<!-- modal -->
<%@include file="/WEB-INF/views/common/modal.jsp"%>
<!-- //modal -->


<%
	//카테고리
	String schCate = request.getParameter("schCate");
	//진행중인 프로젝트 페이지 인덱스
	String schPPage = request.getParameter("schPPage");
	//완료된 프로젝트 페이지 인덱스
	String schCPage = request.getParameter("schCPage");
	//내 그룹
	String schMyGroup = request.getParameter("schMyGroup");
	//소트
	String schSort = request.getParameter("schSort");
%>

<form id="listParamForm" name="listParamForm" method="GET" action="" >
	<input type="hidden" name="schCate" value="<%=StringUtil.nullToBlank(schCate) %>" />
	<input type="hidden" name="schPPage" value="" />
	<input type="hidden" name="schCPage" value="" />
	<input type="hidden" name="schMyGroup" value="<%=StringUtil.nullToBlank(schMyGroup) %>" />
	<input type="hidden" name="schProgressStatus" value="" />
	<input type="hidden" name="projectSeq" value="" />
	<!-- sorting 관련 추가. -->
	<input type="hidden" name="schSort" value="<%=schSort %>" />	
	<input type="hidden" name="schLimitCount" value="16" />
</form>

<script id="tmpl-listView" type="text/x-jsrender">
	<div id="{{:seq}}" class="pro col-xs-6 col-sm-3">
		<a class="aremove" href="javascript:goProject({{:seq}});">
			<div class="thumbnail">
        		<img src="{{:fileUrlM}}" onerror="setDefaultImg(this, 5);" />
					<div class="caption">
    	    			<p class="text_overflow">{{:projectName}}</p>
						<p>{{:ownerName}}님의 프로젝트</p>
					</div>
        		<div>
            		<span>멤버 : {{:projectMemberCntF}}&nbsp</span>
	            	<span>파일 : {{:projectWorkFileCntF}}</span>
					<span>좋아요 :{{:likeCnt}} </span>
				</div>
			</div>
		</a>
	<div>
</script>
<script type="text/javascript">


	/* project list 탬플릿 */
	var projectLitTemplete = $('#tmpl-listView').html();

	/* list form 객체 */
	var listForm = null;
	/* 진행중인 프로젝트 객체 */
	var designProjectIngView = null;
	/* 완료된 프로젝트 객체 */
	//var designProjectComView = null;

	/* 초기화 */
	$(function(){


		/* 진행중인 프로젝트 객체 생성 */
		designProjectIngView = new ListView({
			id : 'designProjectIngView'
			, htmlElement : $('#ing-project-list')
			, data : {progressStatus:'<%=CmnConst.ProjectProgressStatus.PROGRESS%>'}
		});

		/* 완료된 프로젝트 객체 생성 */
		<%--
		designProjectComView = new ListView({
			id : 'designProjectComView'
			, htmlElement : $('#complete-project-list')
			, data : {progressStatus:'<%=CmnConst.ProjectProgressStatus.COMPLETE%>'}
		});
		--%>

		/* 프로젝트목록 조건 form */
		listForm = $('#listParamForm');
		/* 파라미터 초기화 */
		initParam();

		/* 이벤트 : 사용자 그룹 변경 */
		$('#sch_my_group select').on('change', function(){
			var val = $(this).find('option:selected').val();
			listForm.find('input[name="schMyGroup"]').val(val);
			listForm.find('input[name="schPPage"]').val('1');
			listForm.find('input[name="schCPage"]').val('1');
			listForm.find('input[name="schProgressStatus"]').val('');
			listForm.prop('action', '/project/project.do');
			listForm.submit();

		});

		/* 진행중인 프로젝트 데이터 로드 */
		//loadProject(designProjectIngView);
		/* 데이터 로드: 탭 click시  */
		//groupLoadPage(groupListView);
		var projectTab = $('.tab-wrap li.ing');
		$(projectTab).click(function(){
			initParam();
			designProjectIngView.clear();
			loadProject(designProjectIngView);
          $('.tab-wrap li.ing').find('button').addClass('btn-red');
          $('.tab-wrap li.complete').find('button').removeClass('btn-red');
		});

		/* 완료된 프로젝트 데이터 로딩 */
		//loadProject(designProjectComView);

		/* 윈도우 스크롤 이벤트 : 프로젝트 로드 */
		$(window).on('mousewheel', function(e){
			if( e.originalEvent.wheelDelta / 120 > 0 ) {
				// to do nothing...
	        } else {
	        	/* 스크롤이 최하단일 경우 프로젝트 로드 */
	        	if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
	        		//var targetView = $('#ing-project').hasClass('active') ?
	        		//				 designProjectIngView : designProjectComView;
	        		var targetView = $('#ing-project').hasClass('active') ? designProjectIngView : null;
	        		if( !targetView || ! targetView.data('existList') ){
	        			return;
	        		}

	        		loadProject(targetView, true);
	            }
	        }
		});




	});

	/**
	 * 검색 파라미터 초기화
	 */
	function initParam(){
		var from = listForm;
		from.find('input[name="projectSeq"]').val('');

		/* 첫번째 option 선택 */
		$('#sch_my_group select > option[value=""]').prop('selected', true);
		/* 파라미터 option 선택 */
		var val = listForm.find('input[name="schMyGroup"]').val();
		$('#sch_my_group select > option[value="' + val + '"]').prop('selected', true);
		var name = $('#sch_my_group select > option:selected').text();
		$('#sch_my_group input:text').val(name);

		from.find('input[name="schPPage"]').val('<%=StringUtil.emptyToString(schPPage, "1") %>');
		from.find('input[name="schCPage"]').val('<%=StringUtil.emptyToString(schCPage, "1") %>');
	}
	
	//sorting
	function sortProduct(sortType){
		sortType = sortType || '';

		var from = listForm;
		from.find('input[name="seq"]').val('');
		from.find('input[name="schPPage"]').val('<%=StringUtil.emptyToString(schPPage, "1") %>');
		from.find('input[name="schSort"]').val(sortType);
		from.submit();
	}	
	
	/**
	 * 프로젝트 상세 화면 이동
	 */
	function goProject(projectSeq){
		listForm.find('input[name="projectSeq"]').val(projectSeq);
		listForm.prop('action', '/project/openProjectDetail.do');
		listForm.submit();

	}

	/* scroll 데이터 로드 여부 */
	var flagScrollLoad = false;
	/**
	 * 프로젝트 데이터 로드
	 */
	function loadProject( targetView, flagScroll ){
		/* 스크롤 */
		if( flagScroll ){
			if( flagScrollLoad ){
				return;
			}

			flagScrollLoad = true;
		}
		var schProgressStatus = targetView.data('progressStatus');

		var from = listForm;
		var pageTarget = targetView.id == 'designProjectIngView'
						 ? from.find('input[name="schPPage"]')
						 : from.find('input[name="schCPage"]');
		from.find('input[name="schProgressStatus"]').val(schProgressStatus);

		$.ajax({
			url : "/project/projectList.ajax",
	        type: "GET",
	        cache: false,
			data : from.serializeArray(),
			success : function(_data){
				if( flagScroll ) flagScrollLoad = false;



				/*
				* css 처리로 변경 하였음 2016.09.29
				*
				for( key in listData ) {
					var project = listData[key];
					project.projectName = addDots(project.projectName, 6);
				}
				*/

				var allCount = _data.all_count;
				var item = _data.item;

                if(item.secondCategoryNm != null && item.secondCategoryNm != "") {
                    $('#nowCate3').removeClass('hideCate');
                    $('#nowCate3').html(item.secondCategoryNm + '(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    $('#nowCate').html('프로젝트<span class="caret"></span>');
                } else if(item.firstCategoryNm != null && item.firstCategoryNm != "") {
                    $('#nowCate').html('프로젝트<span class="caret"></span>');
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    $('#nowCate3').removeClass('hideCate');
                    $('#nowCate3').html('전체(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                } else {
                    $('#nowCate').html('프로젝트<span class="caret"></span>');
                    $('#nowCate2').html('전체(' + formatNumberCommaSeparate(allCount) + '건) <span class="caret"></span>');
                }

				var listData = _data.list;
				var listCount = listData.length;
				var existList = listCount > 0;
				targetView.putData('existList', existList);
				if( ! existList ){
					return;

				}

				//var totalCount = _data.total_count;
				var intPageCount = parseInt(pageTarget.val(), 10);
				intPageCount++;
				pageTarget.val(intPageCount);


				targetView.addAll({keyName:'seq', data:listData, htmlTemplate:projectLitTemplete });

			},
			error : function(req){
				if( flagScroll ) flagScrollLoad = false;
				console.log("fail to loadProject processing!");
			}
		});
	}
</script>

<!-- ################# 그룹 탭  ###################### -->
<%
	//그룹 페이지 인덱스
	String schPage = request.getParameter("schPage");
%>

<form id="groupListForm" name="groupListForm" method="GET" action="" >
	<input type="hidden" name="schPage" value="" /> 	<!-- 페이지번호 -->
	<input type="hidden" name="schLimitCount" value="16" />
</form>
<!--그룹 눌렀을시 그룹 카드 리스트-->
<script id="tmpl-groupListView" type="text/x-jsrender">
      <tr>
        <td><a href="javascript:goGroupDetailView({{:seq}});">{{:groupName}}</a></td>
        <td>{{:registerTime.substring(0,4)}}-{{:registerTime.substring(4,6)}}-{{:registerTime.substring(6,8)}}</td>
        <td>{{:updateTime.substring(0,4)}}-{{:updateTime.substring(4,6)}}-{{:updateTime.substring(6,8)}}</td>
        <td>{{:memberName}}</td>
        <td>{{:projectCntF}}</td>
        <td>{{:memberCntF}}</td>
      </tr>
</script>
<script type="text/javascript">

	/* list 탬플릿 */
	var groupListTemplete = $("#tmpl-groupListView").html();
	/* list form 객체 */
	var groupListForm = null;
	/* view 객체 */
	var groupListView = null;

	/* 초기화 */
	$(function(){
		/* 뷰 객체 생성 */
		groupListView = new ListView({
			htmlElement : $('#groupListView')
		});

		/* 프로젝트목록 조건 form */
		groupListForm = $('#groupListForm');
		/* 파라미터 초기화 */
		groupInitParam();

		/* 데이터 로드: 탭 click시  */
		//groupLoadPage(groupListView);
		$('.tab-wrap li.complete').click(function(){
			groupInitParam();
			groupListView.clear();
			groupLoadPage(groupListView);
            $('#mytable').html('<th id="mygr" class="text_overflow" width="60%">그룹명</th><th>등록된 날짜</th><th>최신 업데이트 날짜</th><th>개설자</th><th>프로젝트 수</th><th>멤버 수</th>');
            $('.tab-wrap li.complete').find('button').addClass('btn-red');
            $('.tab-wrap li.ing').find('button').removeClass('btn-red');
		});

		/* 윈도우 스크롤 이벤트 : 프로젝트 로드 */
		$(window).on('mousewheel', function(e){
			if( e.originalEvent.wheelDelta / 120 > 0 ) {
				// to do nothing...
	        } else {
	        	/* 스크롤이 최하단일 경우 프로젝트 로드 */
	        	if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
	        		var targetView = $('#group-tab').hasClass('active') ? groupListView : null;
	        		if( ! targetView || ! targetView.data('existList') ){
	        			return;
	        		}

	        		groupLoadPage(targetView, true);
	            }
	        }
		});
	});

	/**
	 * 검색 파라미터 초기화
	 */
	function groupInitParam(){
		var from = groupListForm;
		from.find('input[name="schPage"]').val('<%=StringUtil.emptyToString(schPage, "1") %>');
	}


	/* scroll 데이터 로드 여부 */
	var flagScrollLoadGroupDetail = false;
	/**
	 * 프로젝트 데이터 로드
	 */
	function groupLoadPage( targetView, flagScroll ){
		/* 스크롤 */
		if( flagScroll ){
			if( flagScrollLoadGroupDetail ){
				return;
			}

			flagScrollLoadGroupDetail = true;
		}

		var from = groupListForm;
		var pageTarget = from.find('input[name="schPage"]');

		$.ajax({
			url : "/project/selectGroupList.ajax",
	        type: "GET",
	        cache: false,
			data : from.serializeArray(),
			success : function(_data){
				console.log('>>> _data: ');
				console.log(_data);
				if( flagScroll ) { flagScrollLoadGroupDetail = false; }

				var listData = _data.list;
				var listCount = listData.length;
				var existList = listCount > 0;

				var allCount = _data.all_count;
				$('#project_all_cnt').html('그룹 (' + formatNumberCommaSeparate(allCount) + '건)');

				targetView.putData('existList', existList);
				if( ! existList ){
					return;

				}


				var intPageCount = parseInt(pageTarget.val(), 10);
				intPageCount++;
				pageTarget.val(intPageCount);

				//$('#allCnt').html('(' + formatNumberCommaSeparate(allCount) + '건)');

				targetView.addAll({keyName:'seq', data:listData, htmlTemplate: groupListTemplete });

			},
			error : function(req){
				if( flagScroll ) {flagScrollLoadGroup = false;}
				console.log("fail to groupLoadPage processing!");
			}
		});
	}
</script>

<!-- ########## 그룹 상세 ########## -->
<script>
/**
 * group 상세 페이지
 */
function goGroupDetailView(seq) {
	window.location.href='/project/project.do?schMyGroup=' + seq;
}
</script>
<!--그룹 공개일때만 상세조회 가능 -->
<script id="tmpl-groupDetail" type="text/x-jsrender">
	{{if publicYn == 'Y' }}
	<a href="javascript:goProject({{:seq}});" >
	{{else}}
	<li><a href="javascript:void(0);" >
	{{/if}}
		<div id="{{:seq}}" class="pro col-xs-6 col-sm-3" style="padding:0px">
		<a href="javascript:goProject({{:seq}});">
			<div class="thumbnail">
        		<img src="{{:fileUrlM}}" onerror="setDefaultImg(this, 5);" alt="" >
					<div class="caption">
    	    			<p>{{:projectName}}</p>
						<p>{{:ownerName}}님의 프로젝트</p>
					</div>
        		<div>
            		<span>멤버 : {{:projectMemberCntF}}&nbsp</span>
	            	<span>파일 : {{:projectWorkFileCntF}}</span>
				</div>
			</div>
		</a>
	<div>
	</a>
</script>
<script>
	var groupDetailTemplate = $('#tmpl-groupDetail').html();
	/** 그룹 상세 */
	function groupDetailLoadPage(schMyGroup){
		$.ajax({
			url : "/project/selectGroupDetail.ajax",
	        type: "GET",
	        cache: false,
			data : {schMyGroup : schMyGroup},
			success : function(_data){
				console.log('>>> _data: ');
				console.log(_data);

				groupListView.clear();

				var listData = _data.list;
				var listCount = listData.length;
				var allCount = _data.all_count;
				$('#project_all_cnt').html('프로젝트 (' + formatNumberCommaSeparate(allCount) + '건)');
				groupListView.addAll({keyName:'seq', data:listData, htmlTemplate: groupDetailTemplate });

			},
			error : function(req){
				console.log("fail to groupDetailLoadPage processing!");
			}
		});
	}

</script>
<script>
/** 탭 페이지 init */
$(function(){
	var schMyGroup = '<%=StringUtils.stripToEmpty(schMyGroup)%>';
	console.log('>>> schMyGroup=' + schMyGroup);
	if(schMyGroup != '') {
		// tab ui 처리 :
		changeTabActiveUI('.tab-wrap li.complete');
		//
		groupDetailLoadPage(schMyGroup);
	} else {
		changeTabActiveUI('.tab-wrap li.ing');
		$('.tab-wrap li.ing').trigger('click');
	}

	$('#sch_my_group3 select').on('change', function(){
		var val = $(this).find('option:selected').val();
		$(location).attr('href',"/project/project.do?schCate="+val);
	});
	$('#sch_my_group4 select').on('change', function(){
		var val = $(this).find('option:selected').val();
		$(location).attr('href',"/project/project.do?schCate="+val);
	});
});

function changeTabActiveUI(tabLiObjSel) {
	var tabAObj = $(tabLiObjSel).find('a');
	var target = tabAObj.attr('href');
	tabAObj.parent().addClass('active').siblings().removeClass('active');
	$(target).addClass('active').siblings().removeClass('active');

    //ui
    $(tabLiObjSel).parent().find('button').addClass('btn-red');
    //
}

</script>
<!-- ################# ]]그룹 탭  ###################### -->


</body>
</html>