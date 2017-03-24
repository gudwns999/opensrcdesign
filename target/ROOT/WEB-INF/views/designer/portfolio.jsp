<%-- 화면ID : OD04-01-02 --%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@page import="com.opendesign.vo.DesignerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String schMemberDiv = (String)request.getAttribute("schMemberDiv");  //회원구분
	DesignerVO item = (DesignerVO)request.getAttribute("desingerVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
</head>
<style>

	.space{
		position:absolute;
		left:20%;
		right:20%;
		bottom:10%;
		text-align:center;
	}
	.space > span{

		margin-right:20px;
		margin-left:20px;
		font-size:20px;
		color:red;
	}


	.g-size{font-size:20px;}

</style>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="headerCategoryYN" value="N" />
</jsp:include>
<!-- //header -->

<div class="container" style="background-color:white;margin-top: 70px">
	<!-- content -->
	<div class="row" style="border-bottom:1px red solid; border-left:1px red solid; border-right: 1px red solid">
			<div class="row mt-3"style="margin:0px;">

				<div class="col-sm-3" style="padding:20px 20px 20px 30px">

						<img src="<%=item.getImageUrl()%>" onerror="setDefaultImg(this, 1);" style="width:200px;
    height: 200px;">
				</div>
				<div class="col-sm-3" style="padding:20px 0px 20px 30px">
					<%
					String portfolioName = "포트폴리오";
					if(MemberDiv.PRODUCER.equals(schMemberDiv)) {
					portfolioName = "공방";
					}
					%>
					<p style="font-size:18px;font-weight: bold;"><%=item.getUname()%>님의 <%=portfolioName%> <button type="button" onclick="goShowMsgView('<%=item.getSeq()%>');"><img src="/resources/image/sub/btn_msgGray.png" alt="메시지 보내기"></button></p>
					<p><%=item.getCateNames()%></p>


				</div>

				<div class="col-sm-6" style="padding:20px 20px 20px 30px; border-left:1px red solid; height:245px;" align="center">
					<p class="txt"><%=item.getComments()%></p>
					<div class="space g-size" align="bottom">
					<span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span><%=item.getWorkCntF()%>
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span><%=item.getViewCntF()%>
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span><%=item.getLikeCntF()%>
					<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span><%=item.getCmmtCntF()%>
					</div>
					</div>

			</div>

				<!-- template -->
				<!--
				<li><a href="product_view.html">
					<img src="/resources/image/main/pic_sample1.jpg" alt="">
					<div class="product-info">
						<p class="product-title">별빛이 흐르는</p>
						<p class="designer">김민희</p>
					</div>
					<p class="cate">의상디자인, 패션, 3d</p>
					<div class="item-info">
						<span><img src="/resources/image/common/ico_like.png" alt="좋아요"> 380</span>
						<span><img src="/resources/image/common/ico_hit.png" alt="열람"> 181</span>
						<span class="update">30분 전</span>
					</div>
				</a></li>
				-->

			</div>
		</div>

	<!-- //content -->
<div id="sec4" class="container" style="margin-top:50px">
	<div class="row" style="margin-top:50px">
		<div id="listViewId" class="list-type1">
		</div>
	</div>
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
<!-- //footer -->
<!-- modal -->
<%@include file="/WEB-INF/views/common/modal.jsp"%>
<!-- //modal -->
<script id="tmpl-listTemplete" type="text/x-jsrender">
			<div class="des col-xs-6 col-sm-3">
				<div class="thumbnail">
					<a href="javascript:goProductView('{{:seq}}');"  class="thumbnail_card" style="color:#337ab7">
					<div class="mythum">
						<img class="thumbnail_card_img" src="{{:thumbUriM}}" onerror="setDefaultImg(this, 2);" alt=""/>
					</div>
						<div class="caption">
									<p class="text_overflow"style="color:black">{{:title}}</p>
						</div>
						<p class="text-right">{{:memberName}}</p>
						<p>{{:cateNames}} &nbsp;</p>
						<div class="portfolio_icon">
							{{if !curUserLikedYN }}
							<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
							{{else}}
							<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
							{{/if}}
							<span><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
							<span class="update">{{:displayTime}}</span>
						</div>
					</a>
				</div>
			</div>
</script>

<script>
/**
 * 디자인 상세
 */
function goProductView(seq) {
	<%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
    $.get("/designer/productView.do?seq="+seq, function(html){
        $(".modal-content-design").html(html);
        $('#modal').modal('show');
    });
	<% } else if(MemberDiv.PRODUCER.equals(schMemberDiv))  { %>
    $.get("/producer/productView.do?seq="+seq, function(html){
        $(".modal-content-design").html(html);
        $('#modal').modal('show');
    });	<% } else if(MemberDiv.PRODUCT.equals(schMemberDiv))  { %>
    $.get("/product/productView.do?seq="+seq, function(html){
        $(".modal-content-design").html(html);
        $('#modal').modal('show');
    });	<% } %>
}

</script>
<script>

//뷰 컨트롤러 생성
var listView = null;
//seq
var seq = '<%=item.getSeq()%>';

/**
 * 초기화
 */
$(function(){

	//뷰 컨트롤러 생성
	listView = new ListView({
		htmlElement : $('#listViewId')
	});

	// load
	loadPage();

});


/**
 * 페이지 load
 */
var flag_loadPage = false; //flag
function loadPage() {

	if(flag_loadPage) {
		return;
	}
	flag_loadPage = true;

	// 데이터 조회 및 load
	$.ajax({
        url: '/designer/selectDesignWorkList.ajax',
        type: 'get',
        data: { 'seq' : seq },
		complete : function(_data){
			flag_loadPage = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
	    	var workList = _data.workList;
	    	// load
	    	loadPageWithData(workList);
		}
    });
}

/**
 *  loadPageWithData
 */
function loadPageWithData(itemList) {
	listView.clear();
	if(!itemList || itemList.length == 0) {
		console.log('>>> loadPageWithData no data.');
		return;
	}
	//
	listView.addAll({
		keyName: 'seq'
		,data: itemList
		,htmlTemplate: $('#tmpl-listTemplete').html()
	});
}


</script>
</body>
</html>