<%-- 화면ID : OD04-02-03 --%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@page import="com.opendesign.vo.DesignWorkFileVO"%>
<%@page import="com.opendesign.vo.DesignPreviewImageVO"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.DesignerVO"%>
<%@page import="com.opendesign.vo.DesignWorkVO"%>
<%@page import="com.opendesign.utils.CmnConst.RstConst"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String schMemberDiv = (String)request.getAttribute("schMemberDiv");  //회원구분
	//디자인
	DesignWorkVO itemVO = (DesignWorkVO)request.getAttribute(RstConst.P_NAME);
	//디자이너 
	DesignerVO designerVO = (DesignerVO)request.getAttribute("designerVO");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<!-- ***** 포인트 현황 초기화 ***********-->
<script id="tmpl-pointTemplete" type="text/x-jsrender">
					<div id="pointInfo" class="my-condition">
						<h3>{{:userName}}님 포인트 현황</h3>
						<p>사용 가능 {{:availDisplayPoint}}pt</p>
						<div>
							<input type="text" value="<%=itemVO.getDisplayPoint()%>pt" class="price" readonly>
							<button  type="button">포인트 사용</button>
							<input type="text" value="구매 후 잔여 포인트 {{:leftOverDisplayPoint}}pt" class="no-border" readonly>
						</div>
					</div>
</script>
<script>
$(function(){
	selectPointInfo();
});
/**
 * 포인트 현화 조회
 */
function selectPointInfo(){
		$.ajax({
	        url: '/designer/selectPointInfo.ajax',
	        type: 'post',
	        data: { seq : '<%=itemVO.getSeq()%>' },
	        error : function(_data) {
	        	console.log(_data);
				alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        },
	        success : function(_data){
	        	console.log(_data);
	        	var htmlJ = $($.templates('#tmpl-pointTemplete').render(_data));
	        	$('#pointInfo').replaceWith(htmlJ);
	        	refreshBuyProductEvents(_data.canBuy);
	        }
	    });
}
</script>
<!-- ***** ]]포인트 현황 초기화 ***********-->
<script>
/**
 * 포트폴리오  view
 */
function goPortfolioView(seq) {
	<%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
	window.location.href = '/designer/portfolio.do?seq=' + seq;
	<% } else if(MemberDiv.PRODUCER.equals(schMemberDiv))  { %>
	window.location.href = '/producer/portfolio.do?seq=' + seq;
	<% } else if(MemberDiv.PRODUCT.equals(schMemberDiv))  { %>
	window.location.href = '/product/portfolio.do?seq=' + seq;
	<% } %>
}

/**
 * 디자인 디자인상세
 */
function goProductView(seq) {
	<%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
	window.location.href='/designer/productView.do?seq=' + seq;
	<% } else if(MemberDiv.PRODUCER.equals(schMemberDiv))  { %>
	window.location.href='/producer/productView.do?seq=' + seq;
	<% } else if(MemberDiv.PRODUCT.equals(schMemberDiv))  { %>
	window.location.href='/product/productView.do?seq=' + seq;
	<% } %>
}

/**
 * init event
 */
function refreshBuyProductEvents(canBuy) {
	if(canBuy) {
		$('#btnBuyProduct').prop('disabled', false);
		$('#btnBuyProduct').click(function(){
			buyProduct();
		}); 
	} else {
		$('#btnBuyProduct').off();
		$('#btnBuyProduct').prop('disabled', true);
	}
}

/**
 * 배송정보
 */
function calcDedeliveryInfo() {
	var result = '';
	var myForm = $('form[name="deliveryForm"]'); 
	var data = myForm.serializeObject();
	
	if(data.toName != '') {
		result = $.templates('받는 사람: {{:toName}} | 전화 번호: {{:toPhone}} | 주소: {{:toAddress1}} {{:toAddress2}}').render(data);
		$('form[name="buyForm"]').find('[name="deliveryInfo"]').val(result);
	} 
	console.log('>>> calcDedeliveryInfo');
	console.log(result);
	return true;
}


/**
 * 포인트 사용(결제)
 */
var flag_buyProduct = false; //flag
function buyProduct(){
	checkedLogin(function(){
		console.log('>>> buyProduct');
		
		//배송정보
		if(!calcDedeliveryInfo()) {
			return;
		}
		
		var myForm = $('form[name="buyForm"]');
		if(flag_buyProduct) {
			return;
		}
		flag_buyProduct = true;
		
		$.ajax({
	        url: '/designer/buyProduct.ajax',
	        type: 'post',
	        data: myForm.serialize(),
	        complete : function(_data){
	        	flag_buyProduct = false;
			},
	        error : function(_data) {
	        	console.log(_data);
				alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        },
	        success : function(_data){
	        	if( _data.result == '1' ) {
	        		// 성공후 disable
	        		$('#btnBuyProduct').off();
	        		$('#btnBuyProduct').prop('disabled', true);
	        		alert('디자인 구매 성공하셨습니다.');
	        		goProductView('<%=itemVO.getSeq()%>');
	        	} else if( _data.result == '600' ) {
	        		alert("이미 구매하셨습니다..");
	        	} else if( _data.result == '300' ) {
	        		alert("포인트가 부족합니다.");
	        	} else {
	        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        	}
	        }
	    });
	}); //end of checkedLogin
}

</script>


<style>
	.portfolio-content{padding:40px 55px 28px; border-bottom:1px solid #bcbcbc;}
	.portfolio-content .profile-pic{float:left; width:76px; height:76px; overflow:hidden; margin:0 12px 0 0;}
	.portfolio-content .profile-pic img{width:100%;}
	.portfolio-content h2{margin:0 0 5px; font-size:42px; font-weight:400;}
	.portfolio-content .title-area{overflow:hidden; margin:0 0 30px;}
	.portfolio-content .title-area p{font-size:18px;}
	.portfolio-content .txt{margin:0 0 35px; line-height:1.5; color:#737373;}
	.designer-info{overflow:hidden; margin:0 0 45px; padding:20px 0; border-top:1px solid #a4a4a4; border-bottom:1px solid #a4a4a4;}
	.designer-info li{float:left; width:25%; box-sizing:border-box; text-align:center; color:#a4a4a4; border-right:1px solid #a4a4a4;}
	.designer-info li span{padding:0 25px 0 30px; font-weight:700;}
	.designer-info .item span{background:url(../image/sub/blt_item.png) no-repeat 0 0;}
	.designer-info .like span{background:url(../image/sub/blt_likeGray2.png) no-repeat 0 2px;}
	.designer-info .hit span{padding-left:37px; background:url(../image/sub/blt_hitGray.png) no-repeat 0 3px;}
	.designer-info .reply{border:0;}
	.designer-info .reply span{background:url(../image/sub/blt_reply.png) no-repeat 0 4px;}

	.detail-content h2{float:none; margin:0 0 5px; font-size:46px; font-weight:normal; font-family:Arial; color:#113b88;}
	.info-section{float:right; width:377px; padding:38px 0 0;}
	.info-section dl{padding:21px 0 19px 12px; border-bottom:1px solid red;}
	.info-section dt{float:left; width:130px; padding:0 0 0 35px; font-size:18px; font-weight:700; color:#414141;}
	.info-section dd{color:#a4a4a4; line-height:1.4;}
	.info-section .summary{padding-top:0;}
	.info-section .summary dt{float:none; margin:0 0 16px; background:url(../image/sub/blt_detail.png) no-repeat 0 0;}
	.info-section .point dt{background:url(../image/sub/blt_point.png) no-repeat 0 0;}
	.info-section .date dt{background:url(../image/sub/blt_date.png) no-repeat 0 1px;}
	.info-section .like dt{background:url(../image/sub/blt_like.png) no-repeat 0 1px;}
	.info-section .like_active dt{background:url(../image/sub/blt_like_active.png) no-repeat 0 1px;}
	.info-section .hit dt{background:url(../image/sub/blt_hit.png) no-repeat 0 2px;}
	.info-section .licenses dt{background:url(../image/sub/blt_licenses.png) no-repeat 0 0;}
	.info-section .btn-set{padding:27px 0 0; text-align:center;}
	.info-section .btn-set button,
	.info-section .btn-set a{display:inline-block; width:170px; height:40px; margin:0 4px; font-size:18px; color:#fff; text-align:center; line-height:40px; border-radius:5px; background:#b1b1b1;}
	/* 좋아요css */
	.info-section .btn-set .btn-like{}
	.info-section .btn-set .btn-like.active{background:#d94d4f;}
	/* ]]좋아요css */
	.producer-info{clear:both; width:814px; overflow:hidden; padding:15px 20px;}
	.designer-area{float:left;}
	.product-wrap .designer-area{width:100%; padding:0 0 15px; border-bottom:1px solid red;}
	.product-wrap .info{clear:both;}
	.designer-area a{float:left; margin:12px 5px 0 0; font-size:22px; color:#414141;}
	.designer-area .profile-pic{float:left; width:48px; height:48px; overflow:hidden; margin:0 10px 0 0;}
	.designer-area .profile-pic img{width:100%;}
	.producer-info .share{float:right; margin:3px 0 0;}
	.img-detail{padding:54px 0 0; text-align:center; border-top:1px solid #b1b1b1;}
	.img-detail img{/* width:1084px; */ margin:0 0 55px;}
	.tag-area{overflow:hidden; margin:0 0 34px;}
	.tag-area span{float:left; margin:10px 18px 0 18px;}
	.tag-area li{float:left; min-width:110px; height:42px; margin:0 10px 0 0; padding:0 20px; font-size:18px; color:#fff; text-align:center; line-height:42px; border-radius:5px; background:#bfbfbf;}
	.opensource{clear:both; margin:0 0 29px;}
	.opensource h3{margin:0 0 15px; font-size:26px; color:#113b88;}
	.opensource h3 span{font-size:14px; font-weight:400; color:#a4a4a4;}
	.opensource ul{min-height:120px; padding:12px 0 0 60px; border:1px solid #a4a4a4;}
	.opensource li{margin:0 0 12px; font-size:18px; color:#414141;}
	.product-reply{padding:20px 27px; border:1px solid #a4a4a4;}
	.product-reply .number{float:right; margin:0 0 15px; font-size:18px; font-weight:700; color:#a4a4a4;}
	.product-reply textarea{width:100%; height:95px; box-sizing:border-box; margin:0 0 15px; padding:15px; border:1px solid #a4a4a4;}
	.product-reply .reply-list li{position:relative; height:95px; overflow:hidden; margin:0 0 15px; padding:0 0 0 145px;}
	.product-reply .pic{position:absolute; top:0; left:0; width:95px; height:95px; overflow:hidden; margin:0 50px 0 0;}
	.product-reply .pic img{width:100%}
	.product-reply .reply-list dl{float:left; width:100%; min-height:85px; padding:8px 0 0; border-bottom:1px solid #a4a4a4;}
	.product-reply .reply-list dt{margin:0 0 10px; font-weight:700; color:#666;}
	.product-reply .reply-list a{font-size:20px; color:#b93f0e;}
	.product-reply .reply-list .date{margin:0 0 0 8px; font-size:12px; color:#9b9b9b;}
	.btn-more{display:block; width:115px; margin:0 auto; padding:0 24px 0 0; font-size:18px; font-weight:700; color:#113b88; }
	.btn-more2{display:block; width:100%; margin:0 auto; padding:0 24px 0 0; font-size:18px; font-weight:700; color:#113b88; }
	.btn-more2.alarmBtn{padding:10px 70px 10px 0;}

	.detail-content{padding:30px 0 47px; border-bottom:1px solid #bcbcbc;}

	.purchase-wrap .img-area{float:left; width:854px; margin:0 0 27px;}
	.purchase-wrap .img-area .cate{margin:0 0 20px;}
	.purchase-wrap .img-area img{width:854px; height:510px;}
	.purchase-wrap .info-section{padding-top:130px;}
	.purchase-wrap .designer-area{width:100%; padding:0 0 15px; border-bottom:1px solid red;}
	.purchase-wrap .info{clear:both;}
	.purchase-wrap .licenses dt{background:url(../image/sub/blt_licensesGray.png) no-repeat 0 0;}
	.purchase-wrap .date dt{background:url(../image/sub/blt_dateGray.png) no-repeat 0 1px;}
	.purchase-wrap .like dt{background:url(../image/sub/blt_heartGray2.png) no-repeat 0 1px;}
	.purchase-wrap .point dt{background:url(../image/sub/blt_pointGray.png) no-repeat 0 0;}
	.point-purchase{clear:both; padding:45px 0 0;  border-top:1px solid #b1b1b1;}
	.my-condition{overflow:hidden; margin:0 0 70px; padding:25px 45px; background:#f6f6f6;}
	.my-condition h3{font-size:38px; font-weight:400; color:#414141;}
	.my-condition p{margin:25px 0; font-size:30px; color:#696969;}
	.my-condition .price{float:left; width:337px; height:80px; box-sizing:border-box; margin:0 20px 0 0; font-size:30px; color:black; text-align:center; border:1px solid black;}
	.my-condition button{float:left; width:315px; height:80px; box-sizing:border-box; margin:0 30px 0 0; padding:0 0 0 45px; font-size:32px; color:#fff; border:1px solid #d4d4d4; background:#a4a4a4 url(../image/sub/blt_purchaseBig.png) no-repeat 60px 24px;}
	.my-condition .no-border{float:left; width:490px; height:80px; box-sizing:border-box; padding:0 0 0 5px; font-size:32px; color:#a4a4a4; text-align:center; border:0; border-bottom:1px solid red; background:none;}
	.delivery{padding:0 0 0 45px;}
	.delivery h3{margin:0 0 20px; font-size:38px; font-weight:400;}
	.delivery h3 span{font-size:22px;}
	.delivery table{margin:0 45px 0 20px;}
	.delivery th{width:90px; padding:25px 0 0; font-size:20px; font-weight:400; color:#696969; text-align:left; vertical-align:top;}
	.delivery td{padding:10px 0; font-size:26px;}
	.delivery input[type="text"]{width:457px; height:55px; box-sizing:border-box; padding:0 0 0 30px; color:#a4a4a4; border: none; background: none; border-bottom:1px solid red;}
	.delivery input[type="text"].address:last-child{margin:0;}
	.delivery button{float:left; width:180px; height:55px; margin:0 10px 15px 0; color:#fff; background:#a4a4a4;}
	.delivery input[type="text"].zipcode{width:180px; margin:0 0 15px; padding:0; text-align:center;}
	.delivery input[type="text"].address{width:1080px; margin:0 0 15px;}
	.delivery p{margin:0 45px 40px 0; font-size:18px; color:black; text-align:right;}
	.delivery .btn-complete{float:right; width:300px; height:75px; margin:0; font-size:32px; color:#fff; border-radius:3px; background:#b1b1b1;}

	.red-unline-box{border:none; background: none; border-bottom: 1px solid red;}
</style>


</head>
<body>

<!-- 구매 form -->
<form name="buyForm">
	<input type="hidden" name="designWorkSeq" value="<%=itemVO.getSeq()%>" /> 
	<input type="hidden" name="deliveryInfo" value="" />
</form>

<div class="wrap">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"> 
		<jsp:param name="headerCategoryYN" value="N" />
	</jsp:include>
	<!-- //header -->

	<!-- content -->
	<div class="detail-content">
		<div class="container">
			<div class="purchase-wrap">
				<div class="point-purchase" style="border-top: none;">
					<div id="pointInfo" class="my-condition">
						<h3> 님 포인트 현황</h3>
						<p>사용 가능  pt</p>
						<div>
							<input type="text" value="<%=itemVO.getDisplayPoint()%>pt" class="price" readonly>
							<button  type="button">포인트 사용</button>
							<input type="text" value="구매 후 잔여 포인트 pt" class="no-border" readonly>
						</div>
					</div>

					<div class="delivery">
						<h3>배송지 선택 <span>(배송 받으실 물건이 있으시다면 입력해 주세요)</span></h3>
						<form name="deliveryForm">
							<table>
								<tr>
									<th scope="row">받는 사람</th>
									<td><input type="text" name="toName" placeholder="받는 사람" /></td>
								</tr>
								<tr>
									<th scope="row">전화 번호</th>
									<td><input type="text" name="toPhone" placeholder="전화 번호" /></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>
										<!-- <button type="button">주소찾기</button>
										<input type="text" class="zipcode" name="toZip" /> -->
										<input type="text" class="address" name="toAddress1" placeholder="주소" />
										<input type="text" class="address" name="toAddress2" placeholder="상세주소" />
									</td>
								</tr>
							</table>
							<p>* 구입한 디자인은 마이페이지에서 확인할 수 있습니다.</p>
							<button id="btnBuyProduct" type="button"  class="btn-complete" disabled="disabled">포인트 결제완료</button>
						</form>
					</div>
				</div>
				<h2 class="title" style="margin-top: 200px;"><%=itemVO.getTitle()%></h2>
				<div class="img-area">
					<p class="cate"><%=itemVO.getCateNames()%></p>
					<img src="<%=itemVO.getThumbUri()%>"  alt="대표 이미지">
				</div>
				<div class="info-section">
					<div class="designer-area">
						<div class="profile-pic"><img src="<%=designerVO.getImageUrl()%>" alt=""></div>
						<a href="javascript:goPortfolioView('<%=designerVO.getSeq()%>');" class="name"><%=designerVO.getUname()%></a>
						<a href="javascript:goShowMsgView('<%=designerVO.getSeq()%>');" class="btn-msg"><img src="/resources/image/sub/btn_msg.png" alt="메세지 보내기"></a>
					</div>
					<div class="info">
						<dl class="licenses">
							<dt>라이센스</dt>
							<dd>
								<% if("1".equals(itemVO.getLicenseBY())) { %><span><img src="/resources/image/sub/licenses_by.png" alt="BY"></span><% } %>
								<% if("1".equals(itemVO.getLicenseNC())) { %><span><img src="/resources/image/sub/licenses_nc.png" alt="NC"></span><% } %>
								<% if("1".equals(itemVO.getLicenseND())) { %><span><img src="/resources/image/sub/licenses_nd.png" alt="ND"></span><% } %>
							</dd>
						</dl>
						<dl class="date">
							<dt>게시일</dt>
							<dd><%=itemVO.getDisplayRegTime()%></dd>
						</dl>
						<dl class="like">
							<dt>좋아요</dt>
							<dd><%=itemVO.getLikeCnt()%></dd>
						</dl>
						<dl class="point">
							<dt>포인트</dt>
							<dd><%=itemVO.getDisplayPoint()%>pt</dd>
						</dl>
					</div>
				</div>
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
</body>
</html>