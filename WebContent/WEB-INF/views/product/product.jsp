<%@page import="com.opendesign.vo.MainItemVO.MainItemType"%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.opendesign.utils.StringUtil"%>
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
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=001002'>스마트패션</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=001003'>의상</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=001006'>액세서리</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=001005'>패션모듈</a></li>");
				}else if(getValue=="002"){
                    $('#nowCate2').html("제품");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=002003'>스마트카</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=002004'>로봇</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=002002'>기계/기기/기구</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=002001'>센서모듈</a></li>");

                }else if(getValue=="003"){
                    $('#nowCate2').html("커뮤니케이션");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=003001'>UI/UX</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=003004'>광고</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=003003'>웹</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=003002'>영상</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=003007'>타이포그래피</a></li>");
				}else if(getValue=="004"){
                    $('#nowCate2').html("공예");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=004001'>금속 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=004002'>도자 공예</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=004003'>목공예</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=004004'>수공예</a></li>");
				}else if(getValue=="005"){
                    $('#nowCate2').html("공간");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=005003'>스마트시티</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=005001'>건축</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=005002'>인테리어</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=005004'>환경</a></li>");
				}else if(getValue=="006"){
                    $('#nowCate2').html("정보");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=006003'>스마트미디어</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=006004'>게임</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=006005'>디지털컨텐츠</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=006006'>서비스</a></li>");
				}else if(getValue=="007"){
                    $('#nowCate2').html("자연");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=007001'>동물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=007002'>식물의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=007003'>지구의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=007004'>우주의 디자인</a></li>");
                    $('#nowCate4').append("<li><a href='/product/product.do?schCate=007005'>디자인의 역사</a></li>");
				}else if(getValue=="008"){
                    $('#nowCate2').html("새분야");
				}
			}
        });
	</script>
</head>
<body>
	<!--navbar + megamenu-->
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- //header -->

	<div id="sec4"class="container" style="margin-top: 90px">
		<div class="designregi" style="display: inline;float: right;padding-right:8px"></div>
		<div class="row">
			<!--<h2 id="product_all_cnt"  class="title"style="padding-left:50px;margin-top:60px;"></h2>-->
			<!------------------- 김형준 넘어가기  ---------------------------------->
            <style>
				.active{
					color:blue;
				}

                .category{
                    background-color:rgb(234,234,234) !important;
                    font-size:20px;
                    font-weight: 100;
                    text-align:center;
					width:auto;
                }

				.bootstrap-select>.dropdown-toggle {

					padding-right: 25px;
					z-index: 1;
				}


				.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
					width:auto;
				}
            </style>
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
					<li><a href="/product/product.do?schCate=001">패션</a></li>
					<li><a href="/product/product.do?schCate=002">제품</a></li>
					<li><a href="/product/product.do?schCate=003">커뮤니케이션</a></li>
					<li><a href="/product/product.do?schCate=004">공예</a></li>
					<li><a href="/product/product.do?schCate=005">공간</a></li>
					<li><a href="/product/product.do?schCate=006">엔터테인먼트</a></li>
					<li><a href="/product/product.do?schCate=008">새분야</a></li>
				</ul>
			</span>
			<span class="dropdown">
				<span class="category dropdown-toggle hideCate" type="button" data-toggle="dropdown" id="nowCate3"> 전체</span>
				<ul class="dropdown-menu" id="nowCate4">
				</ul>
			</span>
			<!--------------------- 넘어가기  ---------------------------------->

				<div class="sorting" style="font-size:16px;float:right;margin-right:25px">
					<a class="btn btn-default" href="javascript:sortProduct();">최신순</a>
					<a class="btn btn-default" href="javascript:sortProduct('LIKE');">인기순</a>
				</div>


			<br><br><br>

				<!-- content -->
				<div style="margin-top: -30px" id="ing-product-list"></div>
				<!-- //content -->
		</div>
	</div>

<!-- custom-btn 처리 -->
<script id="tmpl-custom-btn" type="text/x-jsrender">
		<a href="javascript:goPage('/product/productRegi.do', true);" class="btn btn-red">디자인 등록</a>
		<button type="button" class="btn btn-red" role="button" data-toggle="modal" data-target="#product-help">도움말</button>
</script>
	<div class="modal fade" tabindex='-1' id="product-help" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<h3 align="center">쉬운 디자인</h3>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 col-xs-12" >
							<h4>1. 디자인 등록</h4>
							<p>상단 메뉴에서 디자인 페이지로 이동합니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/design-process.png">
							<p>로그인 후 디자인 등록 버튼을 클릭 합니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/design-process2.png">
							<img class="img-responsive mt-5"src="/resources/image/buyimage/design-process4.png">
							<p>디자인 등록창에서 디자인명, 카테고리, 라이센스, 테크, 디자인 파일, 오픈디자인 파일을 등록하여 완료합니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/design-process3.png">


							<h4>2. 새디자인</h4>
							<p class="mt-5">새디자인 기존에 있는 디자인 작품을 통해 새롭게 변형하거나 추가하여 새로운 디자인을 만드는 것을 얘기합니다.</p>
							<p>디자인 상세 페이지에서 기존 디자인 작품을 올린 디자이너의 공유 범위를 CC라이센스를 통해 확인 할 수 있습니다. 이를 통해 공유하거나 재생산 할 수 있는 작품이면 새디자인 버튼을 클릭하여 출처 등이 자동으로 등록되며 기존 디자인 작품의 소스를 다운받아 새롭게 디자인 작품을 등록 할 수 있습니다. </p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/easy.png">
							<h4>3. 원본보기</h4>
							<p>원본보기 버튼을 클릭하면 기존 작품이 어떠한 작품에서 파생되었는지를 확인 할 수 있습니다.</p>
							<p>이를 통해 디자인 공유가 쉬워지고 보호 받을 수 있으며 그안에서 누구나 쉽게 디자인 할 수 있습니다.</p>
							<img class="img-responsive mt-5"src="/resources/image/buyimage/easy4.png">


							<h4>4. 수정&삭제</h4>
							<p>디자인 상세 창에서 썸내일 사진 하단에 수정 버튼을 클릭하여 수정 할 수 있습니다. 삭제버튼 클릭시 삭제 할 수 있습니다.</p>t
							<img class="img-responsive mt-5"src="/resources/image/buyimage/product4.png">
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
		$('.designregi').append($('#tmpl-custom-btn').html());
	});
</script>

<!-- 카드 클릭시 해당 seq 인식 후 get방식으로 넘어감. des라는 임의 클래스 값에 {{:seq}}값을 넣었음. -->






<%
	//카테고리
	String schCate = request.getParameter("schCate");
	//디자인 페이지 인덱스
	String schPage = request.getParameter("schPage");

	String schSort = request.getParameter("schSort");
%>
<form id="listParamForm" name="listParamForm" method="GET" action="" >
	<input type="hidden" name="schCate" value="<%=StringUtil.nullToBlank(schCate) %>" />
	<input type="hidden" name="schPage" value="" />
	<input type="hidden" name="schSort" value="" />
	<input type="hidden" name="seq" value="" />
	<input type="hidden" name="schLimitCount" value="20" />
</form>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script id="tmpl-listTemplete" type="text/x-jsrender">
				<div id="{{:seq}}" class="des col-xs-6 col-sm-3" data-toggle="modal" data-target="#modal{{:seq}}">
						<div class="thumbnail">
						<a href="javascript:void(0);" onclick="goDetailView('{{:itemType}}','{{:seq}}');" class="thumbnail_card" style="color:#337ab7">
<!--						{{if itemType == '<%=MainItemType.PROJECT%>' }}
						<div>
							<img  class="project_label" src="/resources/image/common/label_project.png" alt="PROJECT">
						</div>
						{{/if}}-->
							<div class="mythum">
								<img src="{{:thumbUri}}" onerror="setDefaultImg(this, 3);" alt="이미지"class="thumbnail_card_img">
							</div>
								<div class="caption">

									<p style="color:black" class="text_overflow"><c:out value="{{:title}}" escapeXml="true"/></p>
								</div>
								<p class="text-right">{{:memberName}}</p>
								<p>{{:cateName}} &nbsp;</p>
								<div class="portfolio_icon">
								{{if !curUserLikedYN }}
									<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
								{{else}}
									<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
								{{/if}}
								{{if itemType == '<%=MainItemType.PROJECT%>' }}
									<span class="mr-3"><img src="/resources/image/common/ico_member.png" alt="멤버"> {{:projectMemberCntF}}</span>
								{{else}}
									<span class="mr-3"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
								{{/if}}
									<span class="update">{{:displayTime}}</span>
								</div>
							</a>
					</div>
				</div>



</script>


<script>
/**
 * 상세 페이지
 */
function goDetailView(itemType, seq) {
	console.log('itemType=' + itemType + ', seq=' + seq);
	if(itemType == '<%=MainItemType.PROJECT%>') {
		//프로젝트
		window.location.href='/project/openProjectDetail.do?projectSeq=' + seq;
	} else {
//        window.location.href='/product/productView.do?seq=' + seq;
	}
}
//디자인
$(document).on("click",".des",function(){
    var seq = $(this).attr('id');
    $('.modal-design').attr('id','modal'+seq);
//   $('div.modal').modal({remote : '/product/productView.do?seq='+seq});
    $.get("/product/productView.do?seq="+seq, function(html){
        $(".modal-content-design").html(html);
        $('#modal').modal('show');
    });
});

</script>
<script type="text/javascript">

	/* project list 탬플릿 */
	var productLitTemplete = $('#tmpl-listTemplete').html();

	/* list form 객체 */
	var listForm = null;
	var prodcutView = null;

	/* 초기화 */
	$(function(){
		/* 진행중인 디자인 객체 생성 */
		prodcutView = new ListView({
			id : 'productView'
			, htmlElement : $('#ing-product-list')
		});

		/* 디자인목록 조건 form */
		listForm = $('#listParamForm');
		/* 파라미터 초기화 */
		initParam();

		/* 진행중인 디자인 데이터 로드 */
		loadProduct();

		/* 윈도우 스크롤 이벤트 : 디자인 로드 */
		$(window).on('mousewheel', function(e){
			if( e.originalEvent.wheelDelta / 120 > 0 ) {
				// to do nothing...
	        } else {
	        	/* 스크롤이 최하단일 경우 디자인 로드 */
	        	if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
	        		if( ! prodcutView.data('existList') ){
	        			return;
	        		}

	        		loadProduct(true);
	            }
	        }
		});
	});

	/**
	 * 검색 파라미터 초기화
	 */
	function initParam(){
		var from = listForm;

		var sortVal = '<%=StringUtil.nullToBlank(schSort) %>';

		from.find('input[name="seq"]').val('');
		from.find('input[name="schPage"]').val('<%=StringUtil.emptyToString(schPage, "1") %>');
		from.find('input[name="schSort"]').val(sortVal);

		var aSorting = $('.sorting').find('a');
		aSorting.removeClass('btn-red');

		var aIndex = 0;
		if( sortVal == 'LIKE' ){
			aIndex = 1;

		}

		aSorting.eq(aIndex).addClass('btn-red');

	}

	function sortProduct(sortType){
		sortType = sortType || '';

		var from = listForm;
		from.find('input[name="seq"]').val('');
		from.find('input[name="schPage"]').val('<%=StringUtil.emptyToString(schPage, "1") %>');
		from.find('input[name="schSort"]').val(sortType);
		from.submit();
	}

//	<%--
//	/**
//	 * 디자인 상세 화면 이동
//	 */
//	function goProductView(productSeq){
//		listForm.find('input[name="seq"]').val(productSeq);
//		listForm.prop('action', '/product/productView.do');
//		listForm.submit();
//	}
//	--%>

	/* scroll 데이터 로드 여부 */
	var flagScrollLoad = false;
	/**
	 * 디자인 데이터 로드
	 */
	function loadProduct( flagScroll ){
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
			url : "/product/productList.ajax",
	        type: "GET",
	        cache: false,
			data : from.serializeArray(),
			success : function(_data){
				if( flagScroll ) flagScrollLoad = false;

				var allCount = _data.all_count;
				var item = _data.item;

//				if(item.thirdCategoryNm != null && item.thirdCategoryNm != "") {
////					$('#product_all_cnt').html('디자인 > ' + item.firstCategoryNm + ' > ' + item.secondCategoryNm + ' > ' + item.thirdCategoryNm + '(' + formatNumberCommaSeparate(allCount) + '건)');
//				}
				if(item.secondCategoryNm != null && item.secondCategoryNm != "") {
                    $('#nowCate3').removeClass('hideCate');
					$('#nowCate3').html(item.secondCategoryNm + '(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    $('#nowCate').html('디자인 <span class="caret"></span>');
				} else if(item.firstCategoryNm != null && item.firstCategoryNm != "") {
                    $('#nowCate').html('디자인<span class="caret"></span>');
                    $('#nowCate2').html(item.firstCategoryNm + '<span class="caret"></span>');
                    $('#nowCate3').removeClass('hideCate');
                    $('#nowCate3').html('전체(' + formatNumberCommaSeparate(allCount) + '건)<span class="caret"></span>');
                } else {
					$('#nowCate').html('디자인<span class="caret"></span>');
                    $('#nowCate2').html('전체(' + formatNumberCommaSeparate(allCount) + '건) <span class="caret"></span>');
				}

				var listData = _data.list;
				var listCount = listData.length;
				var existList = listCount > 0;
				prodcutView.putData('existList', existList);
				if( ! existList ){
					return;

				}

				//var totalCount = _data.total_count;
				var intPageCount = parseInt(pageTarget.val(), 10);
				intPageCount++;
				pageTarget.val(intPageCount);


				prodcutView.addAll({keyName:'seq', data:listData, htmlTemplate:productLitTemplete });

			},
			error : function(req){
				if( flagScroll ) flagScrollLoad = false;
				console.log("fail to loadProduct processing!");
			}
		});
//        $('#sch_my_group select').on('change', function(){
//            var val = $(this).find('option:selected').val();
//            $(location).attr('href',"/product/product.do?schCate="+val);
//        });
//        $('#sch_my_group2 select').on('change', function(){
//            var val = $(this).find('option:selected').val();
//            $(location).attr('href',"/product/product.do?schCate="+val);
//        });
	}
</script>


</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<%@include file="/WEB-INF/views/common/modal.jsp"%>
</body>
</html>
