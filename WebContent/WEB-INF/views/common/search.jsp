<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String searchWord = request.getParameter("searchWord");
if( searchWord == null || "".equals(searchWord) ) {
	searchWord = "";
}
%>

<!DOCTYPE html>
<head>
<html lang="ko">
<meta charset="utf-8">
<%@include file="/WEB-INF/views/common/head.jsp"%>
<!-- template: 디자인 -->
<!--
<script id="tmpl-0" type="text/x-jsrender">
					<li><a href="/product/productView.do?seq={{:seq}}">
						<img src="{{:thumbUri}}" alt="" width="301" height="234">
						<div class="product-info">
							<p class="product-title">{{:title}}</p>
							<p class="designer">{{:memberName}}</p>
						</div>
						<p class="cate">{{:cateNames}}</p>
						<div class="item-info">
							<span class="like"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
							<span class="hit"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
							<span class="update">{{:displayTime}}</span>
						</div>
					</a></li>
</script>
-->
<script>
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

<!-- new 디자인 template -->
<script id="tmpl-0" type="text/x-jsrender">
	<div id="{{:seq}}" class="des col-xs-6 col-sm-3" data-toggle="modal" data-target="#modal{{:seq}}">
		<div class="thumbnail">
			<a href="javascript:void(0)" class="thumbnail_card">
			<div class="mythum">
				<img src="{{:thumbUri}}"onerror="setDefaultImg(this, 3);"class="thumbnail_card_img" alt=""/>
				</div>
				<div class="caption">
					<p class="text_overflow">{{:title}}</p>
				</div>
				<p class="text-right">{{:memberName}}</p>
				<p>{{:cateNames}}&nbsp;</p>
				<div class="portfolio_icon">
					{{if !curUserLikedYN }}
					<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
					{{else}}
					<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
					{{/if}}
					<span class="mr-5"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
					<span class="update">{{:displayTime}}</span>
				</div>
			</a>
		</div>
	</div>


</script>
<!-- template: 프로젝트 -->

<script id="tmpl-1" type="text/x-jsrender">
	<div id="{{:seq}}" class="des col-xs-6 col-sm-3" data-toggle="modal" data-target="#modal{{:seq}}">
			<a class="aremove" href="/project/openProjectDetail.do?projectSeq={{:seq}}">
			<div class="thumbnail">
        		<img style="width:253px;height:175px"src="{{:fileUrlM}}" onerror="setDefaultImg(this, 5);" alt="" >
					<div class="caption">
    	    			<p class="text_overflow">{{:projectName}}</p>
						<p>{{:ownerName}}님의 프로젝트</p>
					</div>
        		<div>
            		<span>멤버 : {{:projectMemberCntF}}&nbsp</span>
	            	<span>파일 : {{:projectWorkFileCntF}}</span>
				</div>
			</div>
		</a>
	<div>
</script>

<!-- new 프로젝트 template -->




<!-- template: 디자이너 -->
<!--
<script id="tmpl-2" type="text/x-jsrender">
					<li><a href="/designer/portfolio.do?seq={{:seq}}">
						<div class="profile-section">
							<div class="picture">
								<img src="{{:imageUrl}}" alt="{{:uname}}">
							</div>
							<div class="profile">
								<p class="designer">{{:uname}}</p>
								<p class="cate"  >{{:cateNames}}</p>
								<div class="item-info">
									<span class="portfolio"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									<span class="like"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									<span class="hit"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
								</div>
							</div>
						</div>
						<ul class="portfolio-section">
							{{for top3WorkList}}
							<li><img src="{{:thumbUri}}"   alt="포트폴리오"></li>
							{{/for}}
						</ul>
					</a></li>
</script>
-->
<!-- new 디자이너 template -->
<script id="tmpl-2" type="text/x-jsrender">
				<div id="designer" class="col-xs-12 col-sm-4">
					<div class="thumbnail">
						<a href="/designer/portfolio.do?seq={{:seq}}">
							<div class="row">
								<div class="col-sm-6">
								<div class="mythum">
									<img src="{{:imageUrl}}" class="user_img"  onerror="setDefaultImg(this, 1);" alt="{{:uname}}">
									</div>
								</div>
							<div class="caption col-sm-6">
								<p class="thumb_designer">
									{{:uname}}
								</p>
								<p class="cate_name">{{:cateNames}}</p>
								<div class="portfolio_icon">
									<span class="mr-5"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									{{if !curUserLikedYN }}
									<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									{{else}}
									<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
									{{/if}}
									<span class=""><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
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

<!-- template: 제작자 -->
<!--
<script id="tmpl-3" type="text/x-jsrender">
					<li><a href="/producer/portfolio.do?seq={{:seq}}">
						<div class="profile-section">
							<div class="picture">
								<img src="{{:imageUrl}}" alt="{{:uname}}">
							</div>
							<div class="profile">
								<p class="designer">{{:uname}}</p>
								<p class="cate"  >{{:cateNames}}</p>
								<div class="item-info">
									<span class="portfolio"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCnt}}</span>
									<span class="like"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCnt}}</span>
									<span class="hit"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCnt}}</span>
								</div>
							</div>
						</div>
						<ul class="portfolio-section">
							{{for top3WorkList}}
							<li><img src="{{:thumbUri}}"   alt="포트폴리오"></li>
							{{/for}}
						</ul>
					</a></li>
</script>
-->
<!-- new 제작자 template -->
<script id="tmpl-3" type="text/x-jsrender">
				<div id="designer" class="col-xs-12 col-sm-4">
					<div class="thumbnail">
						<a href="/producer/portfolio.do?seq={{:seq}}">
							<div class="row">
								<div class="col-sm-6">
									<img src="{{:imageUrl}}" class="user_img"  onerror="setDefaultImg(this, 1);" alt="{{:uname}}">
								</div>
							<div class="caption col-sm-6">
								<p class="thumb_designer">
									{{:uname}}
								</p>
								<p class="cate_name">{{:cateNames}}</p>
								<div class="portfolio_icon">
									<span class="mr-5"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									{{if !curUserLikedYN }}
									<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									{{else}}
									<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
									{{/if}}
									<span class=""><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
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

<style>
	/* search */
	.search-content{padding:30px 0; border-bottom:1px solid #bcbcbc}
	.search-content .title{float:none; font-size:15px; color:#414141;}
	.result-wrap{clear:both; padding:18px 0 0; border-top:1px solid red;}
	.result-wrap h3{padding:0 0 18px; font-size:15px; color:#414141;}
	.result-wrap .none{padding:0 0 160px; font-size:15px; font-weight:700; color:#414141;}

	.padding_zero{padding:0px;}
</style>

</head>
<body style="background-color: rgb(234,234,234)">
<div class="wrap">
	<!-- header -->
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!-- //header -->

	<!-- content -->
	<div class="search-content">
		<div class="container">
			<h2 class="title">'<%=searchWord %>' 검색결과 &gt; 전체 <span id="all_count">0</span></h2>

			<div class="result-wrap">
				<h3>디자인 검색 결과 <span id="all_count_0">(0)</span></h3>
				<ul class="row padding_zero" id="ul_list_0">
				</ul>
				<button onclick="loadSearchResult(0);" type="button" class="btn-more2" >결과 더 보기</button></br>

			</div>
			<div class="result-wrap">
				<h3>프로젝트 검색 결과 <span id="all_count_1">(0)</span></h3>
				<ul class="row padding_zero" id="ul_list_1" class="project-list">
				</ul>
				<button onclick="loadSearchResult(1);" type="button" class="btn-more2" >결과 더 보기</button></br>
			</div>
			<div class="result-wrap">
				<h3>디자이너 검색 결과 <span id="all_count_2">(0)</span></h3>
				<ul class="row padding_zero" id="ul_list_2">
				</ul>
				<button onclick="loadSearchResult(2);" type="button" class="btn-more2" >결과 더 보기</button></br>
			</div>
			<div class="result-wrap">
				<h3>제작자 검색 결과 <span id="all_count_3">(0)</span></h3>
				<ul class="row padding_zero" id="ul_list_3">
				</ul>
				<button onclick="loadSearchResult(3);" type="button" class="btn-more2" >결과 더 보기</button>
			</div>
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

<script>

	/* 각 메뉴별 템플릿 */
	var listViews = [];

	/* 각 메뉴별 요청 uri */
	var actionUris = ['productList.ajax', 'projectList.ajax', 'designerList.ajax', 'producerList.ajax'];

	/* 각 메뉴별 현재 인덱스 */
	var indices = [0, 0, 0, 0];

	$(function(){
		/*
		* 리스뷰 뷰 초기화
		*/
		for( var i =0; i < actionUris.length; i++) {
			listViews[i] = new ListView({
					id : 'ul_template_' + i,
					htmlElement : $('#ul_list_' + i),
					htmlElementNoData: $("<p class='none'>'<%=searchWord%>'에 대한 검색 결과가 없습니다.</p>")
			});
		}

		loadSearchResult(0); //디자인 검색
		loadSearchResult(1); //디자인 프로젝트 검색
		loadSearchResult(2); //디자이너 검색
		loadSearchResult(3); //제작자 검색

	});


	/**
	* 각 파트별 검색 'targetIndex' = index of actionUris[]
	*/
	function loadSearchResult(targetIndex) {

		var action = actionUris[targetIndex];
		var pageIndex = indices[targetIndex] + 1;

		$.ajax({
	        url: '/search/' + action,
	        type: 'post',
	        data: {searchWord:"<%=searchWord%>", pageIndex:pageIndex},
	        complete : function(_data){},
	        error : function(_data) {
				alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        },
	        success : function(_data){

	        	var listData = _data.list;
	        	var allCount = _data.all_count;
	        	var tamplateView = $('#tmpl-' + targetIndex).html();
	        	<%--
	        	if( listData.length > 0 ) {
	        		listViews[targetIndex].addAll({keyName:'seq', data:listData, htmlTemplate:tamplateView });
	        		indices[targetIndex] = pageIndex;
	        	} else {
	        		if( listViews[targetIndex].items.length == 0 ) {
		        		$('.result-wrap').eq(targetIndex).find('ul').remove();
		        		$('.result-wrap').eq(targetIndex).append("<p class='none'>'<%=searchWord%>'에 대한 검색 결과가 없습니다.</p>");
	        		}
	        	}
	        	--%>
	        	// 결과가 없습니다를 wd-components.js에서 공통처리
	        	listViews[targetIndex].addAll({keyName:'seq', data:listData, htmlTemplate:tamplateView });
        		indices[targetIndex] = pageIndex;

	        	if( listViews[targetIndex].items.length == allCount ) {
	        		$('.result-wrap').eq(targetIndex).find('button').remove();
	        	}

	        	updateTotalCount(targetIndex, allCount);

	        }
	    });
	}

	/**
	* 검색 결과 개수 텍스트 갱신
	*/
	function updateTotalCount(targetIndex, count) {

		$('#all_count_' + targetIndex).text( '(' + formatNumberCommaSeparate(count) + ')' );

		var totalCount = 0;
		for( var i =0; i < actionUris.length; i++) {
			var eachCount = replaceAll( $('#all_count_' + i).text(), "(", "" );
			eachCount = replaceAll( eachCount, ")", "" );
			eachCount = replaceAll( eachCount, ",", "" );

			totalCount += parseInt(eachCount);
		}

		$('#all_count').text( formatNumberCommaSeparate(totalCount) );
	}

</script>


</body>
</html>