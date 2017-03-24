<%-- 화면ID : OD04-01-01 --%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@page import="com.opendesign.utils.CmnConst.SchOrderType"%>
<%@page import="com.opendesign.utils.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String schMemberDiv = (String)request.getAttribute("schMemberDiv");  //회원구분
String memberDivString = "";
if(MemberDiv.DESIGNER.equals(schMemberDiv)) {
memberDivString = "디자이너";
} else {
memberDivString = "제작자";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="/WEB-INF/views/common/head.jsp"%>
	<style>
		.category{
			background-color:rgb(234,234,234) !important;
			font-size:18px;
			font-weight: 100;
			text-align:center;
		}
		.bootstrap-select>.dropdown-toggle {
			width:auto;
			padding-right: 25px;
			z-index: 1;
		}
	</style>
	<script>
		$(document).ready(function(){
            $('#allCnt').html($('#tmpl-custom-btn').html());

		    var getValue = $(location).attr('search');
			getValue = getValue.substring(9,12);
            var getState = $(location).attr('pathname');
            getState = getState.substring(1,4);
            if(getState == "des") {
                $('#nowCate').html('디자이너');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=001">패션</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=002">제품</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=003">커뮤니케이션</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=004">공예</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=005">공간</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=006">엔터테인먼트</a></li>');
                $('#nowCate5').append(	'<li><a href="/designer/designer.do?schCate=008">새분야</a></li>');

                if(getValue=="001"){
                    $('#nowCate2').html("패션");
                    $('#nowCate4').append('<li><a href="/designer/designer.do?schCate=001002">스마트패션</a></li>');
                    $('#nowCate4').append('<li><a href="/designer/designer.do?schCate=001003">의상</a></li>');
                    $('#nowCate4').append('<li><a href="/designer/designer.do?schCate=001006">액세서리</a></li>');
                    $('#nowCate4').append('<li><a href="/designer/designer.do?schCate=001005">패션모듈</a></li>');
                }else if(getValue=="002"){
                    $('#nowCate2').html("제품");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=002003'>스마트카</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=002004'>로봇</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=002002'>기계/기기/기구</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=002001'>센서모듈</a></li>");

                }else if(getValue=="003"){
                    $('#nowCate2').html("커뮤니케이션");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=003001'>UI/UX</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=003004'>광고</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=003003'>웹</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=003002'>영상</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=003007'>타이포그래피</a></li>");
                }else if(getValue=="004"){
                    $('#nowCate2').html("공예");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=004001'>금속 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=004002'>도자 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=004003'>목공예</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=004004'>수공예</a></li>");
                }else if(getValue=="005"){
                    $('#nowCate2').html("공간");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=005003'>스마트시티</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=005001'>건축</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=005002'>인테리어</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=005004'>환경</a></li>");
                }else if(getValue=="006"){
                    $('#nowCate2').html("엔터테인먼트");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=006003'>스마트미디어</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=006004'>게임</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=006005'>디지털컨텐츠</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=006006'>서비스</a></li>");
                }else if(getValue=="007"){
                    $('#nowCate2').html("자연");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=007001'>동물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=007002'>식물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=007003'>지구의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=007004'>우주의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/designer/designer.do?schCate=007005'>디자인의 역사</a></li>");
                }else if(getValue=="008"){
                    $('#nowCate2').html("새분야");
                }
            }else if(getState =="pro"){
                $('#nowCate').html('제작자');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=001">의상</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=002">공업</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=003">시각</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=004">공예</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=005">공간</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=006">정보</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=007">자연</a></li>');
                $('#nowCate5').append(	'<li><a href="/producer/producer.do?schCate=008">새분야</a></li>');

                if(getValue=="001"){
                    $('#nowCate2').html("의상");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001001'>전통의상</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001002'>남성복</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001003'>여성복</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001004'>아동복</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001005'>패션잡화</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001006'>액세서리</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=001007'>한복</a></li>");
                }else if(getValue=="002"){
                    $('#nowCate2').html("공업");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=002001'>기계</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=002002'>기기/기구</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=002003'>자동차/운송</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=002004'>로봇</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=002005'>식품</a></li>");
                }else if(getValue=="003"){
                    $('#nowCate2').html("시각");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003001'>그래픽</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003002'>영상</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003003'>동영상</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003004'>광고</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003005'>포장</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003006'>캐릭터</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=003007'>서체</a></li>");
                }else if(getValue=="004"){
                    $('#nowCate2').html("공예");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=004001'>금속 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=004002'>도자 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=004003'>목공예</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=004004'>수공예</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=004005'>유리 공예</a></li>");
                }else if(getValue=="005"){
                    $('#nowCate2').html("공간");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=005001'>건축</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=005002'>인테리어</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=005003'>무대</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=005004'>도시/환경</a></li>");
                }else if(getValue=="006"){
                    $('#nowCate2').html("정보");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006001'>경험/인터렉션</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006002'>인터페이스</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006003'>웹</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006004'>게임</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006005'>소리/음악</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=006006'>음식/요리법</a></li>");
                }else if(getValue=="007"){
                    $('#nowCate2').html("자연");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=007001'>동물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=007002'>식물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=007003'>지구의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=007004'>우주의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/producer/producer.do?schCate=007005'>디자인의 역사</a></li>");
                }else if(getValue=="008"){
                    $('#nowCate2').html("새분야");
                }
            }
		});
	</script>
</head>



<body>
<!--navbar + megamenu-->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!------------------- 김형준 넘어가기  ---------------------------------->

<!--------------------- 넘어가기  ---------------------------------->

<!--designer-->
<div class="container" style="margin-top: 90px">
	<div id="allCnt" style="display: inline;float: right;padding-right:8px"></div>

	<!-- custom-btn 처리 -->
    <script id="tmpl-custom-btn" type="text/x-jsrender">
        <span style="float:right;">
						<%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
						<a href="/designer/openDesignRequestBoard.do?schMemberDiv=<%=schMemberDiv%>" class="btn btn-red">디자인 의뢰</a>
						<%	} else { %>
						<a href="/producer/openDesignRequestBoard.do?schMemberDiv=<%=schMemberDiv%>" class="btn btn-red">제작 의뢰</a>
						<%	} 	%>
								<button type="button" class="btn btn-red" role="button" data-toggle="modal" data-target="#designer-help">도움말</button>

        </span>


	</script>
	<div class="modal fade" tabindex='-1' id="designer-help" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<h3 align="center">쉬운 디자인</h3>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 col-xs-12" >
							<h4>1. 디자인의뢰</h4>
							<p>디자이너 페이지에서 디자인 의로 버튼을 클릭합니다.</p>
							<img class="img-responsive"src="/resources/image/buyimage/designer1.png">

							<p class="mt-5">디자인 의뢰 게시판 페이지에서 글 등록 버튼을 클릭합니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/designer2.png">

							<p class="mt-5">디자인 의뢰 양식에 맞추어 자신이 원하는 디자인을 공개적으로 의뢰합니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/designer3	.png">




						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<span class="sorting"style="font-size: 17px;float: right;margin:1px 10px 0px 0px">
            <a href="javascript:void(0);" onclick="goPageOrdered(this);" data-order="<%=SchOrderType.LATEST%>" class="btn btn-default btn-red" style="margin-left:40px">최신순</a>
            <a href="javascript:void(0);" onclick="goPageOrdered(this);" data-order="<%=SchOrderType.HOTTEST%>" class="btn btn-default">인기순</a>
	</span>

    <!-- content -->
    <div class="row">

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
				<ul class="dropdown-menu" id="nowCate5">
				</ul>
			</span>
		<span class="dropdown">
				<span class="category dropdown-toggle hideCate" type="button" data-toggle="dropdown" id="nowCate3"> 전체</span>
				<ul class="dropdown-menu" id="nowCate4">
				</ul>
			</span>

        <div class="row mt-3">
            <div id="designView"></div>
        </div>
    </div>
    <!-- //content -->

</div>

<!--footer-->
<!-- footer -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
<!-- //footer -->
</body>
</html>


<!-- modal -->
<%@include file="/WEB-INF/views/common/modal.jsp"%>
<!-- //modal -->

<%
	//카테고리
	String schCate = request.getParameter("schCate");
	//페이지 인덱스
	String schPage = request.getParameter("schPage");
%>
<form id="listParamForm" name="listParamForm" method="GET" action="" >
	<input type="hidden" name="schCate" value="<%=StringUtil.nullToBlank(schCate) %>" /> <!-- 카테고리 -->
	<input type="hidden" name="schPage" value="" /> 	<!-- 페이지번호 -->
	<input type="hidden" name="schOrderType" value="<%=SchOrderType.LATEST%>" /> <!-- 최신순 -->
	<input type="hidden" name="schMemberDiv" value="<%=schMemberDiv%>" /> <!-- 회원구분 -->
	<input type="hidden" name="schLimitCount" value="16" />
</form>
<script>
	/**
	 * 정열된 page load
	 */
	function goPageOrdered(thisObj) {
		//ui
		$(thisObj).parent().find('a').removeClass('btn-red');
		$(thisObj).addClass('btn-red');
		//
		var orderType = $(thisObj).data('order');
		var myForm = $('#listParamForm');
		myForm.find('[name="schPage"]').val('1');
		myForm.find('[name="schOrderType"]').val(orderType);
		//
		designView.clear();
		loadPage(designView);
	}
</script>

<script id="tmpl-listTemplete" type="text/x-jsrender">
<div class="col-xs-12 col-sm-4">
    <div class="thumbnail"  >
        <a href="javascript:goPortfolioView('{{:seq}}');">
            <div class="row">
                <div class="col-sm-6">
                <div class="mythum" style="height:158px">
                    <img src="{{:imageUrl}}"  class="user_img" onerror="setDefaultImg(this, 1);" alt="{{:uname}}">
                    </div>
                </div>
                <div class="caption col-sm-6">
                    <p class="thumb_designer"><span></span>{{:uname}}</p>
                    <p class="cate_name">{{:cateNames}}</p>
								<div class="portfolio_icon">
									<span class="mr-5"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									{{if !curUserLikedYN }}
									<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									{{else}}
									<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
									{{/if}}
									<span class="mr-4"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
								</div>
                </div>
								<div class="col-sm-12 portfolio_img">
									{{for top4WorkList}}
									<img src="{{:thumbUriM}}" onerror="setDefaultImg(this, 4);" alt="포트폴리오">
									{{/for}}
								</div>
            </div>
        </a>
    </div>
</div>
</script>
<script>
/**
 * 포트폴리오 페이지
 */
function goPortfolioView(seq) {
	<%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
	window.location.href='/designer/portfolio.do?seq=' + seq;
	<% } else { %>
	window.location.href='/producer/portfolio.do?seq=' + seq;
	<% } %>
}
</script>
<script type="text/javascript">

	/* list 탬플릿 */
	var listTemplete = $("#tmpl-listTemplete").html();

	/* list form 객체 */
	var listForm = null;
	/* 디자이너 객체 */
	var designView = null;

	/* 초기화 */
	$(function(){
		/* 진행중인 프로젝트 객체 생성 */
		designView = new ListView({
			htmlElement : $('#designView')
		});

		/* 프로젝트목록 조건 form */
		listForm = $('#listParamForm');
		/* 파라미터 초기화 */
		initParam();

		/* 진행중인 프로젝트 데이터 로드 */
		loadPage(designView);

		/* 윈도우 스크롤 이벤트 : 프로젝트 로드 */
		$(window).on('mousewheel', function(e){
			if( e.originalEvent.wheelDelta / 120 > 0 ) {
				// to do nothing...
	        } else {
	        	/* 스크롤이 최하단일 경우 프로젝트 로드 */
	        	if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
	        		var targetView = designView;
	        		if( ! targetView.data('existList') ){
	        			return;
	        		}

	        		loadPage(targetView, true);
	            }
	        }
		});
	});

	/**
	 * 검색 파라미터 초기화
	 */
	function initParam(){
		var from = listForm;
		from.find('input[name="schPage"]').val('<%=StringUtil.emptyToString(schPage, "1") %>');
	}


	/* scroll 데이터 로드 여부 */
	var flagScrollLoad = false;
	/**
	 * 프로젝트 데이터 로드
	 */
	function loadPage( targetView, flagScroll ){
		/* 스크롤 */
		if( flagScroll ){
			if( flagScrollLoad ){
				return;
			}

			flagScrollLoad = true;
		}

		var from = listForm;
		var pageTarget = from.find('input[name="schPage"]');

		$.ajax({
			url : "/designer/designerList.ajax",
	        type: "GET",
	        cache: false,
			data : from.serializeArray(),
			success : function(_data){
				console.log('>>> _data: ');
				console.log(_data);
				if( flagScroll ) { flagScrollLoad = false; }

				var allCount = _data.all_count;
				var item = _data.item;
				var memberDivString = '<%= memberDivString%>';
                var getState = $(location).attr('pathname');
                getState = getState.substring(1,4);

                if(item.secondCategoryNm != null && item.secondCategoryNm != "") {
                    $('#nowCate3').removeClass('hideCate');
                    $('#nowCate3').html(item.secondCategoryNm + '(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    if(getState == "des") {
                        $('#nowCate').html('디자이너<span class="caret"></span>');
                    }else if(getState == "pro"){
                        $('#nowCate').html('제작자<span class="caret"></span>');
                    }
                } else if(item.firstCategoryNm != null && item.firstCategoryNm != "") {
                    if(getState == "des") {
                        $('#nowCate').html('디자이너<span class="caret"></span>');
                    }else if(getState == "pro"){
                        $('#nowCate').html('제작자<span class="caret"></span>');
                    }
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    $('#nowCate3').removeClass('hideCate');
                    $('#nowCate3').html('전체(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                } else {
                    if(getState == "des") {
                        $('#nowCate').html('디자이너<span class="caret"></span>');
                    }else if(getState == "pro"){
                        $('#nowCate').html('제작자<span class="caret"></span>');
                    }
                    $('#nowCate2').html('전체(' + formatNumberCommaSeparate(allCount) + '건) <span class="caret"></span>');
                }

				var listData = _data.list;
				var listCount = listData.length;
				var existList = listCount > 0;
				targetView.putData('existList', existList);
				if( ! existList ){
					return;
				}


				var intPageCount = parseInt(pageTarget.val(), 10);
				intPageCount++;
				pageTarget.val(intPageCount);

				targetView.addAll({keyName:'seq', data:listData, htmlTemplate:listTemplete });

			},
			error : function(req){
				if( flagScroll ) {flagScrollLoad = false;}
				console.log("fail to loadPage processing!");
			}
		});
		$('#sch_my_group select').on('change', function(){
			var val = $(this).find('option:selected').val();
			var getState = $(location).attr('pathname');
			getState = getState.substring(1,4);
			if(getState == "des") {
				$(location).attr('href', "/designer/designer.do?schCate=" + val);
				$('#nowCate').html("디자이너");
			}else if(getState =="pro"){
				$(location).attr('href', "/producer/producer.do?schCate=" + val);
				$('#nowCate').html("제작자");
			}
		});
	}
</script>