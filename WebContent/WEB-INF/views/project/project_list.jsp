<%-- 화면ID : OD03-02-01 --%>
<%@page import="com.opendesign.utils.CmnConst"%>
<%@page import="com.opendesign.vo.UserVO"%>
<%@page import="com.opendesign.utils.StringUtil"%>
<%@page import="com.opendesign.vo.ProjectVO"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String projectSeq = (String)request.getAttribute("projectSeq"); //프로젝트seq
	ProjectVO projectVO = (ProjectVO)request.getAttribute("projectVO"); //프로젝트 정보
	UserVO user = CmnUtil.getLoginUser(request);
	Boolean liked = (Boolean)request.getAttribute("liked");

	// 완료된 프로젝트 flag:
	Boolean isProjNotComplete = !CmnConst.ProjectProgressStatus.COMPLETE.equals(projectVO.getProgressStatus());
	System.out.println(">>> isProjNotComplete=" + isProjNotComplete);

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
<!-- 이름 검색 -->
<link rel="stylesheet" type="text/css" href="/resources/js/lib/jquery-ui.min.css" />
<script src="/resources/js/lib/jquery-ui.min.js" ></script>
<!-- //이름 검색 -->
<style type="text/css">
	@charset "utf-8";
	.lock{width:100%; overflow:hidden;}
	.inner{position:relative; width:1286px; margin:0 auto;}
	.inner:after{clear:both; display:block; content:'';}

	/* 필수항목 */
	.km-required{color:red !important; }
	.none{width:100%; text-align:center; font-size:15px; font-weight:700; color:#414141;}
	.hide{display:none;}

	/* slide button의 파란 선택효과 지움 */
	button:focus { outline: 0 !important }

	/** 한 줄 단위로 글자 자르기 */
	.ellip1 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	/** 댓글 등록 */
	.btn-cmmt-wrapper{clear:both;height:40px;}
	.btn-cmmt{float:right; width:75px; height:28px; font-size:15px; color:#fff; border-radius:5px; background:#113b88;}
	.btn-cmmt-del{background: url('/resources/image/common/x-mark-icon-ie.png') gray; width:20px; height:20px; float:right; cursor:pointer; margin-left:5px; }

	/** 이미지 아닌 파일 형식 */
	.display-file { margin:auto;border-top: 1px solid #CACACA; padding-top:10px;padding-bottom:10px;width:100%;}
	.display-file img {width:20px;height:22px;margin:auto;}


	/* modal */

	.cate-wrap{clear:both; padding:15px 0 0;}
	.cate-wrap p{margin:0 0 5px; font-size:14px; color:#414141;}
	.custom-select{position:relative; float:left; margin:0 4px 0 0;}
	.custom-select select{position:absolute; top:0; left:0; width:100%; height:35px; font-size:14px; opacity:0;}
	.custom-select input[type="text"]{width:120px; height:35px; padding:0 30px 0 12px; color:#a4a4a4; background:#fff url(../image/common/bg_selectSmall.gif) no-repeat right 0;}
	.custom-select input[type="text"].readonly{width:120px; height:35px; padding:0 30px 0 12px; color:#d9d9d9; background:#fff url(../image/common/bg_selectSmall.gif) no-repeat right 0;}
	.btn-add{float:left; margin:6px 0 0 3px;}
	.cate-list{clear:both; overflow:hidden; padding:10px 0;}
	.cate-list li{float:left; min-width:60px; height:25px; margin:0 10px 0 0; padding:0 0 0 6px; font-size:14px; color:#a4a4a4; border-radius:5px; line-height:25px; background:#e8e8e8;}
	.cate-list button{float:right; height:25px; margin:0 8px 0 0; font-size:11px; color:#414141;}
	.check-wrap{margin:10px 0 15px; text-align:center;}
	.custom-check{position:relative; display:inline-block; margin:0 40px;}
	.custom-check input[type="checkbox"]{position:absolute; top:0; left:0; opacity:0;}
	.custom-check input[type="checkbox"]+label{display:inline-block; height:17px; padding:0 0 0 24px; background:url(../image/common/bg_checkbox.png) no-repeat 0 0;}
	.custom-check input[type="checkbox"]:checked+label{color:#113b88; background-position:0 bottom;}

	#message{position:static;}
	#message .noti-inner{position:absolute; top:70px; right:-70px; z-index:3; width:715px; min-height:250px; box-shadow:0 0 15px #c3c3c3; border:1px solid #ebebeb; background:#fff;}
	#message .noti-inner:before{position:absolute; top:-27px; right:356px; content:''; width:46px; height:27px; background:url(../image/common/arrow_alert.png) no-repeat;}
	#message .latest{float:right; margin:34px 26px 0 0; font-size:14px; color:#113b88;}
	.msg-search{float:left; width:347px; overflow:hidden; padding:10px;}
	.msg-search input[type="text"]{float:left; width:303px; height:42px; box-sizing:border-box; padding:0 0 0 20px; font-weight:700; color:#a4a4a4; border:1px solid #a4a4a4;}
	.msg-search button{float:left;}
	.no-msg{clear:both; margin:0 26px 0 10px; padding:25px 0; color:#a4a4a4; text-align:center; border-top:1px solid #929292;}
	.msg-list{float:left;}
	.msg-list li{width:357px; margin:-1px 0 0; color:#1e1e1e; transition:all .1s;}
	.msg-list li > div{position:relative; overflow:hidden; margin:0 10px 0 33px; padding:16px 0; border-top:1px solid #979797;}
	.msg-list .pic{float:left; margin:0 18px 0 0;}
	.msg-list dl{float:left; width:225px;}
	.msg-list dt{margin:2px 0 6px; font-size:18px;}
	.msg-list dd{font-size:14px; line-height:1.3;word-wrap:break-word; }
	.msg-list .date{position:absolute; top:22px; right:0; font-size:12px;}
	.msg-list li:hover{color:#fff; background:#a4a4a4;}
	.msg-list li.me .pic{float:right; margin:0 0 0 18px;}
	.msg-list li.me dt{text-align:right;}
	.msg-list li.me .date{left:3px;}
	.msg-list li.msg dt{color:#113b88;}
	.msg-list li.msg:hover dt{color:#fff;}
	.talking-list{float:right;}
	.msg-list.culunm li > div{margin:0 33px 0 10px;}
	.msg-edit{clear:both; padding:15px 0 0 10px;}
	.msg-edit textarea{width:324px; height:130px; box-sizing:border-box; padding:10px 6px; font-size:14px; border:1px solid #919191;}
	.msg-edit button{display:block; width:324px; height:30px; color:#fff; background:#a4a4a4;}

	#alert{position:static;}
	#alert .noti-inner{position:absolute; top:70px; right:-70px; z-index:2; width:715px; padding:35px 0 0; box-shadow:0 0 15px #c3c3c3; border:1px solid #ebebeb; background:#fff;}
	#alert .noti-inner:before{position:absolute; top:-27px; right:300px; content:''; width:46px; height:27px; background:url(../image/common/arrow_alert.png) no-repeat;}
	#alert .latest{float:right; margin:0 28px 10px 0; font-size:14px; color:#113b88;}
	.alert-list{clear:both; max-height:500px; overflow-y:auto; overflow-x:hidden;}
	.alert-list li{margin:-1px 0 0; color:#1e1e1e; transition:all .1s;}
	.alert-list li > div{overflow:hidden; margin:0 33px; padding:16px 0 19px; border-top:1px solid #979797;}
	.alert-list .pic{float:left; margin:0 18px 0 0;}
	.alert-list .txt{padding:22px 0 5px; font-size:18px;}
	.alert-list .txt.reply{padding-top:5px;}
	.alert-list .txt.reply p{margin:8px 0 0; font-size:14px;}
	.alert-list .date{float:right; font-size:12px;}
	.alert-list li:hover{color:#fff; background:#a4a4a4;}

	/* main content */
	/*.main-content{padding:74px 0 50px; border-bottom:1px solid #f2f2f2; background:#f6f6f6;}*/
	.main-content{padding:0 0 50px; border-bottom:1px solid #bcbcbc; background:#f9f9f9;}
	.visual{position:relative; height:369px;}
	.visual > div{position:absolute; top:0; left:50%; width:100%; margin:0 0 0 -50%; text-align:center;}

	.main-content .best{position:relative; overflow:hidden; margin:0 0 57px; padding:34px 0 0;}
	.main-content .best h2{margin:0 0 22px; padding:0 0 0 40px; font-size:20px; font-weight:700; color:#3b3b3b; background:url(../image/main/blt_best.png) no-repeat 1px 0;}
	.main-content .best .best-inner {width:1320px;}
	.main-content .best .list-type2.list1{margin:0 0 0 -19px; }
	.main-content .best .list-type2 .list-type2{margin:0; }
	.main-content .best .list-type2 .list-type2 > li{margin:0 0 16px 19px;}
	/*.best .list-type2 > li{box-sizing:border-box;} */
	.best button{position:absolute; top:50%; z-index:2; margin:0;}
	.best .btn-prevSlide{left:0;}
	.best .btn-nextSlide{right:0;}
	.main-content .recommend{overflow:hidden;}
	.main-content .recommend h2{margin:0 0 22px; padding:0 0 0 40px; font-size:20px; font-weight:700; color:#3b3b3b; background:url(../image/main/blt_recommend.png) no-repeat 1px 0;}

	.project-content{padding:28px 0 50px; border-bottom:1px solid #bcbcbc;}
	.detail-content{padding:30px 0 47px; border-bottom:1px solid #bcbcbc;}
	.content{padding:28px 0 50px; border-bottom:1px solid #bcbcbc; background:#f6f6f6;}
	.my-sub-content{padding:68px 0 50px;}
	.title{float:left; margin:0 0 27px; font-size:15px; color:#414141;}

	.sorting{float:right; margin:0 0 27px; background:url(../image/common/blt_bar.gif) no-repeat center center;}
	.sorting a{position:relative; margin:0 0 0 16px; font-size:15px; font-weight:700; color:#a4a4a4;}
	.sorting a.first{margin:0 16px 0 0;}
	.sorting a.active{color:#113b88;}

	.list-type1{clear:both; margin:0 0 0 -34px;}
	.list-type1 li{position:relative; float:left; width:228px; height:288px; overflow:hidden; box-shadow:0 1px 3px #e1e1e1; margin:0 0 24px 34px; font-size:14px; border:1px solid #ddd; border-radius:6px; background:#fff;}
	.list-type1 a > img{width:228px; height:169px;}
	.list-type1 li:hover{box-shadow:inset 0 0 150px #d1d1d1;}  /* mouse over 효과가 이상 */
	.list-type1 .product-info{padding:8px 12px; border-bottom:1px solid #d8d8d8;}
	.list-type1 .product-title{width:100%; overflow:hidden; margin:0 0 8px; font-size:16px; font-weight:700; color:#0046c3; text-overflow:ellipsis; white-space:nowrap;}
	.list-type1 .designer{font-size:12px; font-weight:700; color:#0046c3;}
	.list-type1 .cate{padding:6px 12px; font-size:12px; color:#6a6a6a; border-bottom:1px solid #d5d5d5;}
	.list-type1 .item-info{padding:10px 12px; font-size:12px; color:#6a6a6a; background:#f7f7f7;}
	.list-type1 span{margin:0 24px 0 0;}
	.list-type1 span img{margin:-2px 0 0 0;}
	.list-type1 .like img{width:13px;}
	.list-type1 .hit img{width:18px;}
	.list-type1 .member img{width:19px;}
	.list-type1 .update{float:right; margin:0; color:#a4a4a4;}
	.list-type1 .label{position:absolute; top:0; left:0;}

	.list-type2{clear:both; margin:0 0 0 -19px;}
	.list-type2 > li{position:relative; float:left; width:305px; height:213px; overflow:hidden; box-shadow:0 1px 3px #e1e1e1; margin:0 0 16px 19px; border:1px solid #d8d8d8; border-radius:6px; background:#fff;}
	.list-type2 > li a{display:block; width:282px; height:213px; padding:0 12px; color:#a4a4a4; transition:box-shadow .1s;}
	.list-type2 > li a:hover{box-shadow:inset 0 0 150px #d1d1d1;}
	.list-type2 .designer{overflow:hidden; margin:5px 0 8px; font-size:16px; font-weight:700; color:#0046c3; text-overflow:ellipsis; white-space:nowrap;}
	.list-type2 .cate{margin:0 0 8px; font-size:12px; color:#6a6a6a;}
	.list-type2 span{margin:0 24px 0 0; font-size:12px; color:#6a6a6a;}
	.list-type2 span img{margin:-3px 0 0 0;}
	.list-type2 .portfolio img{width:11px;}
	.list-type2 .like img{width:10px;}
	.list-type2 .hit{margin:0;}
	.list-type2 .hit img{width:14px;}
	.profile-section{overflow:hidden; padding:17px 0; border-bottom:1px solid #a4a4a4;}
	.profile-section .picture{float:left; margin:0 20px 0 0;}
	.profile-section .picture img{width:89px; height:80px;}
	.profile-section .profile{float:left; width:170px;}
	.portfolio-section{clear:both; overflow:hidden; padding:15px 0;}
	.portfolio-section li{float:left; margin:0 7px 0 0;}
	.portfolio-section li:last-child{margin:0;}
	.portfolio-section li img{width:89px; height:66px;}

	.project-select{position:relative; float:left; width:170px; height:32px; margin:-8px 0 0 14px;}
	.project-select select{position:absolute; top:0; left:0; width:100%; height:32px; opacity:0;}
	.project-select input[type="text"]{width:100%; height:32px; box-sizing:border-box; padding:0 40px 0 10px; color:#848484; border:1px solid #848484; border-radius:7px; background:#fff url(../image/common/bg_select.png) no-repeat right 0;}
	.btn-area{float:right;}
	.btn-area a{float:left; width:122px; height:30px; box-sizing:border-box; margin:0 0 0 9px; font-size:15px; font-weight:bold; color:#113b88; text-align:center; line-height:30px; border:1px solid #113b88; border-radius:7px;}
	.tab-wrap{border-bottom:1px solid #dbdada;}
	.tab{clear:both; width:1286px; overflow:hidden; margin:0 auto -1px;}
	.tab li{float:left; border:1px solid transparent; border-bottom:1px solid #dbdada; background:#f6f6f6;}
	.tab li a{display:block; width:170px; height:42px; box-sizing:border-box; color:#414141; line-height:42px; text-align:center;}
	.tab span{display:inline-block; margin:0 6px 0 0; vertical-align:middle; background:url(../image/main/bg_tab.png) no-repeat 0 0;}
	.tab .ing span{width:16px; height:16px; background-position:0 0;}
	.tab .complete span{width:24px; height:20px; background:url(../image/sub/blt_group.png) no-repeat;}
	.tab .active{border-color:#dbdada; border-bottom-color:transparent; background:#fff;}
	.tab .active a{color:#113b88;}
	.tab .ing.active span{background-position:0 bottom;}
	.tab .complete.active span{background-position:right bottom;}
	.tab-con > div{display:none;}
	.tab-con > div.active{display:block;}
	.project-con{width:1286px; margin:0 auto; padding:38px 0 0;}
	.project-list{overflow:hidden; margin:0 0 0 -21px;}
	/*.project-list li{float:left; width:298px; overflow:hidden; margin:0 0 24px 28px; border:1px solid #d8d8d8; box-shadow:0 1px 3px #e1e1e1; border-radius:6px;}*/
	.project-list li{float:left; width:238px; overflow:hidden; margin:0 0 24px 21px; border:1px solid #d8d8d8; box-shadow:0 1px 3px #e1e1e1; border-radius:6px;}
	.project-list li:hover{box-shadow:inset 0 0 80px #d1d1d1;}  /* mouse over 효과가 이상 */
	.project-list dl{padding:15px; text-align:center;}
	.project-list dt{width:100%; overflow:hidden; margin:0 0 6px; font-size:34px; color:#414141; text-overflow:ellipsis; white-space:nowrap;}
	.project-list dd{width:100%; overflow:hidden; font-size:17px; color:#727272; text-overflow:ellipsis; white-space:nowrap;}
	.project-list .img-area{padding:0 15px 15px;}
	.project-list .img-area img{width:208px; height:85px;}
	.project-list .project-info{border-bottom:1px solid #d8d8d8;}
	.project-info div{float:left; width:50%; box-sizing:border-box; padding:15px; color:#a4a4a4; text-align:center; border-right:1px solid #d8d8d8;}
	.project-info i{display:block; font-size:28px; font-style:normal;}
	.project-info span{display:inline-block; height:17px; box-sizing:border-box; padding:1px 0 0; font-size:12px; line-height:17px;}
	/*.project-info > div:first-child{width:50%;}*/
	.project-info > div:last-child{border-right:0;}
	.project-info .member span{padding-left:22px; background:url(../image/main/blt_member.png) no-repeat 0 0;}
	.project-info .project span{padding-left:22px; background:url(../image/sub/blt_project.png) no-repeat 0 0;}
	.project-info .bbs span{padding-left:25px; background:url(../image/main/blt_bbs.png) no-repeat 0 0;}
	.project-info .file-num{border:0;}
	.project-info .file-num span{padding-left:25px; background:url(../image/main/blt_file.png) no-repeat 0 0;}

	/* mypage */
	.mypage-wrap{padding:26px 0 0;}
	.sub-title h2{float:left; font-size:46px; font-weight:400; color:#414141;}
	.sub-title h2 img{width:75px; margin:0 15px 0 0;}
	.sub-title .btn-modi{float:left; width:83px; height:27px; margin:20px 0 0 10px; font-size:14px; text-align:center; color:#fff; line-height:27px; border-radius:5px; background:#a4a4a4;}
	.sub-title .btn-regi{float:right; width:123px; height:42px; margin:12px 20px 0 0; padding:0 0 0 24px; font-size:15px; text-align:center; color:#fff; line-height:42px; border-radius:7px; background:#a4a4a4 url(../image/mypage/blt_regi.png) no-repeat 34px 11px;}
	.regi-guide{position:absolute; top:6px; right:205px; width:280px; height:95px; padding:15px 0 0; text-align:center; border:1px solid #a4a4a4; border-radius:5px; background:#113b88;}
	.regi-guide:after{position:absolute; top:50%; right:-33px; width:33px; height:36px; margin:-18px 0 0; content:''; background:url(../image/mypage/blt_arrowRegi.png) no-repeat;}
	.regi-guide p{padding:45px 0 0; font-size:16px; font-weight:700; color:#fff; background:url(../image/mypage/bg_regi.png) no-repeat center top;}
	.mypage-wrap .hello{clear:both; padding:20px 0 30px; color:#737373; line-height:1.5;}
	.my-info{overflow:hidden; margin:0 0 40px; border:1px solid #a4a4a4; background:#f6f6f6;}
	.my-info .info-list{float:left; width:50%; height:300px; padding:30px 0 20px 120px; box-sizing:border-box; border-right:1px solid #a4a4a4;}
	.my-info .info-list li{padding:13px 0; font-size:20px; color:#9e9e9e;}
	.my-info .info-list .sbj{display:inline-block; width:250px; color:#414141;}
	.my-info .project{float:left; overflow-y:auto; max-height:300px; width:50%; padding:45px 26px 0 32px; box-sizing:border-box; text-align:center;}
	.my-info .project h3{margin:0 0 15px; font-size:34px; color:#113b88;}
	.my-info .project li{margin:0 0 10px;}
	.my-info .project li:last-child{margin:0;}
	.my-info .project a{display:block; height:46px; padding:0 0 0 48px; font-size:20px; text-align:left; color:#fff; line-height:46px; border-radius:12px;  background:#a4a4a4 url(../image/mypage/blt_project.png) no-repeat 97% center;}
	.my-project{position:relative; min-height:50px; overflow:hidden; padding:0 6px 0 0;}
	.my-project .swiper-slide{overflow:visible;}
	.my-group{position:relative; min-height:50px; overflow:hidden; padding:0 6px 0 0;}
	.my-group .swiper-slide{overflow:visible;}
	.product-list{position:relative; overflow:hidden; margin:0 0 40px; border:1px solid #a4a4a4; background:#f6f6f6;}
	.product-list h3{float:left; width:250px; height:390px; box-sizing:border-box; padding:25px 0 0; font-size:20px; font-weight:400; text-align:center; color:#fff; line-height:390px;}
	.product-list .slide{position:relative; float:left; width:958px; overflow:hidden; margin:38px 38px 0;}
	.product-list .slide-btn{position:absolute; top:50%; right:0; width:1034px;}
	.product-list button{position:absolute; top:50%; z-index:2; margin:-39px 0 0;}
	.product-list .btn-prevSlide{left:11px;}
	.product-list .btn-nextSlide{right:11px;}
	.product-list .list-type1{margin:0 -34px 0 0;}
	.product-list .list-type1 li{width:230px; height:288px; overflow:hidden; margin:0 0 24px; box-sizing:border-box;}
	.portfolio h3{background:#a4a4a4 url(../image/mypage/bg_portfolio.png) no-repeat center 170px;}
	.favorite h3{background:#a4a4a4 url(../image/mypage/bg_favorite.png) no-repeat center 170px;}
	.purchase h3{width:213px; height:54px; padding:0 0 0 40px; font-size:20px; font-weight:400; color:#fff; text-align:center; line-height:54px; background:#b1b1b1 url(../image/mypage/bg_purchase.png) no-repeat 45px center;}
	.purchase-list{position:relative; overflow:hidden; margin:0 0 40px; padding:44px 14px 40px 14px; border:1px solid #b1b1b1; background:#f6f6f6;}
	.purchase-list .slide-btn button{position:absolute; top:50%; z-index:2; margin:-39px 0 0;}
	.purchase-list .purchase-prev{left:0;}
	.purchase-list .purchase-next{right:0;}
	.list-type3{overflow:hidden;}
	.list-type3 > li{width:296px; background:#fff;}
	.list-type3 > li a{display:block; padding:20px 14px 0; border:1px solid #b1b1b1;}
	.list-type3 > li a  > img{width:268px; height:208px;}
	.purchase-info{padding:15px 12px 0; font-size:17px; font-weight:700; color:#666;}
	.purchase-info li{margin:0 0 10px; color:#a4a4a4;}
	.purchase-info .sbj{display:inline-block; width:140px; color:#414141;}
	.purchase-info button{margin:0 0 0 9px;}
	.paging{padding:11px 0 25px; text-align:center;}
	.paging a{display:inline-block; width:22px; height:22px; margin:0 2px; font-size:15px; color:#414141; text-align:center; line-height:22px;}
	.paging a.active{display:inline-block; width:22px; height:22px; margin:0 2px; font-size:15px; color:red; text-align:center; line-height:22px;}
	.my-point{border:1px solid #113b88;}
	.point-inner{padding:20px 40px 0; background:#f6f6f6;}
	.my-point h3{padding:15px 40px; font-size:28px; color:#fff; background:#113b88;}
	.my-point strong{font-size:26px; color:#113b88;}
	.my-point h4{margin:35px 0 20px; font-size:22px; color:#414141;}
	.my-point dt{float:left; width:167px; height:105px; line-height:105px; font-size:18px; color:#fff; text-align:center; background:#a4a4a4;}
	.my-point dd{float:left; padding:8px 0 0 14px;}
	.my-point .btn-sorting{float:left; overflow:hidden; margin:0 0 10px; border:1px solid #a4a4a4;}
	.my-point .btn-sorting button{float:left; width:74px; height:40px; font-size:18px; font-weight:bold; color:#a4a4a4; border-right:1px solid #a4a4a4; background:#fff;}
	.my-point .btn-sorting button.active{color:#fff; background:#113b88;}
	.my-point .btn-sorting .last{border:0;}
	.period{clear:both; overflow:hidden; margin:0 0 33px;}
	.period input[type="text"]{float:left; width:156px; height:40px; box-sizing:border-box; margin:0 7px 0 0; border:1px solid #a4a4a4; background:#fff;}
	.period button{float:left; width:38px; height:40px; border:1px solid #a4a4a4; background:#fff;}
	.period span{float:left; margin:10px 20px 0;}
	.period .btn-check{width:96px; margin:0 0 0 14px; font-size:18px; color:#fff; border:0; background:#a4a4a4;}
	.tbl-point{margin:0 0 23px; color:#414141; border-top:1px solid #9a9a9a;}
	.tbl-point th{padding:16px 0; font-size:18px; border-bottom:1px solid #aeaeae; border-right:1px solid #aeaeae; background:#fff;}
	.tbl-point td{padding:16px 0; font-size:14px; text-align:center; border-bottom:1px solid #aeaeae; border-right:1px solid #aeaeae; background:#fff;}
	.tbl-point .last{border-right:0;}

	/* product regi */
	.regi-content{padding:70px 0 74px;}
	.regi-content h2{float:none; margin:0 0 80px; font-size:46px;}
	.regi-content .cate{color:#696969;}
	.tbl-regi th{padding:35px 0 0 30px; font-size:26px; font-weight:normal; text-align:left; vertical-align:top;}
	tr.no-padding th,
	tr.no-padding td { padding:10px 0 !important; }
	.tbl-regi th span{display:block; font-size:14px;}
	.tbl-regi th .btn-guide img{margin:-5px 0 0;}
	.tbl-regi td{padding:30px 0;}
	.tbl-regi .no-border{width:100%; height:42px; box-sizing:border-box; padding:0 0 0 5px; font-size:20px; border:0; border-bottom:1px solid #9e9e9e; background:none;}
	.tbl-regi .custom-select{margin:0 24px 10px 0; font-size:22px; color:#b5b5b5;}
	.tbl-regi .custom-select input[type="text"]{width:305px; height:46px; box-sizing:border-box; padding:0 45px 0 24px; border:1px solid #b1b1b1; background:#fff url(../image/common/bg_selectBig.gif) no-repeat right center;}
	.tbl-regi .custom-select select{height:46px; font-size:20px;}
	.tbl-regi .cate-list li{min-width:77px; height:37px; padding:0 0 0 10px; font-size:20px; line-height:37px;}
	.tbl-regi .cate-list button{margin-top:5px; font-size:24px;}
	.tbl-regi .checkbox{position:relative; float:left; margin:0 70px 0 0;}
	.tbl-regi textarea{width:100%; height:150px; box-sizing:border-box; padding:16px 20px; border:0; background:#fff;}
	.licenses-check .sbj{float:left; width:165px; margin:5px 0 0; font-size:22px;}
	.licenses-check li{overflow:hidden; margin:0 0 15px;}
	.tbl-regi .checkbox input[type="checkbox"]{position:absolute; top:0; left:0; opacity:0;}
	.tbl-regi .checkbox input[type="checkbox"]+label{float:left; height:28px; padding:5px 0 0 38px; font-size:22px; background:url(../image/common/bg_checkboxBig.png) no-repeat 0 0;}
	.tbl-regi .checkbox input[type="checkbox"]:checked+label{background-position:0 bottom;}
	.tbl-regi .btn-guide:hover+.modal-guide{display:block;}
	.modal-guide{position:relative; float:right; display:none;}
	.tbl-guide{position:absolute; top:-221px; left:-50px; z-index:10; width:665px; background:#b5b5b5;}
	.tbl-guide:after{position:absolute; top:230px; left:-15px; width:0; height:0; content:''; border:5px solid transparent; border-right:10px solid #b5b5b5;}
	.tbl-guide th{padding:15px 0; font-size:18px; font-weight:700; text-align:center; color:#414141; border-bottom:1px solid #414141;}
	.tbl-guide th+th,
	.tbl-guide td+td{border-left:1px solid #414141;}
	.tbl-guide td+td{padding:10px;}
	.tbl-guide tr+tr td{border-top:1px solid #414141;}
	.tbl-guide td{padding:15px 0; font-size:14px; color:#fff;}
	.tbl-guide td.img{text-align:center;}
	.tbl-guide dl{padding:0 0 0 10px;}
	.tbl-guide dt{margin:0 0 5px; font-size:16px; font-weight:700; color:#414141;}
	.tbl-guide dd{font-size:13px;}
	.txt-guide{position:absolute; top:-36px; left:-5px; z-index:10; width:265px; padding:20px 25px; font-size:18px; color:#414141; background:#b5b5b5;}
	.txt-guide:after{position:absolute; top:45px; left:-15px; width:0; height:0; content:''; border:5px solid transparent; border-right:10px solid #b5b5b5;}
	.member-add{position:relative; margin:0 0 10px; padding:0 40px 0 0;}
	.member-add button{position:absolute; top:7px; right:40px; width:80px; height:27px; box-sizing:border-box; padding:0 0 0 22px; font-size:15px; color:#fff; border-radius:7px; background:#b5b5b5 url(../image/sub/blt_search.png) no-repeat 14px 5px;}
	.tbl-regi .my-select{float:none; margin:0;}
	.tbl-regi .my-select input[type="text"]{width:100%;}
	.file-url{position:relative; float:left; width:307px; height:48px; margin:0 18px 16px 0; background:#fff;}
	.file-url input[type="text"]{width:100%; height:48px; box-sizing:border-box; padding:0 45px 0 10px; border:0;}
	.file-url button{position:absolute; top:0; right:0; width:40px; height:48px; font-size:22px; color:#b1b1b1;}
	.file{position:relative; float:left; width:80px; height:27px; overflow:hidden; margin:10px 0 0;}
	.file input[type="file"]{position:absolute; top:0; left:0; width:80px; height:27px; opacity:0;}
	.file button{width:80px; height:27px; box-sizing:border-box; padding:0 0 0 22px; font-size:15px; color:#fff; border-radius:7px; background:#b5b5b5 url(../image/sub/blt_search.png) no-repeat 14px 5px;}
	.file-list{clear:both; width:385px; height:110px; overflow:auto; padding:0 0 0 20px; font-size:18px; color:#b1b1b1; line-height:1.6; background:#fff;}
	.file-list > div{padding:3px 0;}
	.file-list button{margin:0 0 0 5px; font-size:20px; color:#b1b1b1;}
	.regi-content .btn-complete{float:right; width:200px; height:64px; font-size:24px; color:#fff; text-align:center; line-height:64px; border-radius:7px; background:#b5b5b5;}

	/* project list */
	.list-content{padding:23px 0 67px; border-bottom:1px solid #f2f2f2;}
	.list-content .title{margin-bottom:30px; font-size:26px; color:#113b88;}
	.topic-container{clear:both; position:relative;}
	.topic-container button{position:absolute; top:50%; z-index:2; margin:-39px 0 0;}
	.topic-container .btn-topicPrev{left:-40px;}
	.topic-container .btn-topicNext{right:-40px;}
	.swiper-button-disabled{display:none;}
	.topic-slide.swiper-container-horizontal .topic{margin:0;}
	.topic-slide{clear:both; overflow:hidden; margin:0 0 0 -7px;}
	.topic.swiper-slide{float:left; width:208px; margin:0 0 0 7px;}
	.topic .btn-set{float:right; margin:0 0 4px;}
	.topic .btn-set a{display:inline-block; height:20px; padding:0 8px; font-size:12px; font-weight:bold; color:#fff; line-height:20px; border-radius:3px; background:#a4a4a4;}
	.topic h4{clear:both; padding:6px 0; color:black; background:#d2d2d2; border-bottom:2px solid red;}
	.topic h4 span{margin:0 0px 0 0; padding:0 8px 0 20px; border-right:0px solid #6c6c6c;}
	.topic ul{padding:20px 8px 20px; background:#f1f1f1;}
	.topic li{overflow:hidden; margin:0 0 9px; font-size:12px; border-radius:5px; background:#fff;}
	.topic .pic img{width:192px;}
	.topic dl{padding:10px 8px; color:#a4a4a4; border-bottom:1px solid #b6b6b6;}
	.topic dt{margin:0 0 10px; font-size:14px; font-weight:bold;}
	.topic .item-info{overflow:hidden; padding:6px 10px; color:#a4a4a4;}
	.topic .name{float:left;}
	.topic .item-info div{float:right; font-size:11px;}
	.topic .item-info div span{margin:0 0 0 15px;}
	.topic .item-info span:last-child img{margin:-2px 0 0;}

	#project-detail .modal-inner{top:10%; width:956px; margin:0 0 50px -478px; padding:20px 45px; color:#686868; background:#fff;}
	#project-detail h1{padding:0 0 5px; font-size:30px; font-weight:700; color:#113b88;}
	#project-detail h1 span{font-size:12px; font-weight:bold; color:#686868;}
	#project-detail .designer{margin:0 0 5px; font-size:18px; font-weight:bold;}
	#project-detail .custom-select{width:150px;}
	#project-detail select{position:absolute; top:0; left:0; width:100%; height:32px; opacity:0;}
	#project-detail input[type="text"]{width:100%; height:32px; box-sizing:border-box; padding:0 40px 0 10px; color:#848484; border:1px solid #848484; border-radius:7px; background:#fff url(../image/common/bg_select.png) no-repeat right 0;}
	#project-detail .version{overflow:hidden; margin:0 0 10px; font-size:14px;}
	#project-detail .version strong{float:left; margin:8px 15px 0 0;}
	#project-detail .opinion{float:left; margin: 0 0 15px; font-size:12px;}
	#project-detail .btn-set{float:right;}
	#project-detail .btn-set a{margin:0 0 0 12px; padding:0 8px 0 18px; font-size:14px; color:#767676;}
	#project-detail .btn-modi{background:url(../image/sub/blt_modi.png) no-repeat 0 0;}
	#project-detail .btn-del{background:url(../image/sub/blt_trash.png) no-repeat 0 0;}
	#project-detail .img{margin:0 0 6px; border-bottom:1px solid #787878;}
	#project-detail .img img{max-width:100%;}
	#project-detail .img > div{padding:12px;}
	#project-detail .img button{margin:0 45px 0 0; font-size:14px; color:#414141;}
	#project-detail .img .btn-like{padding:0 0 0 25px; background:url(../image/sub/blt_heartGray.png) no-repeat 0 0;}
	#project-detail .img .btn-like.active{padding:0 0 0 25px; background:url(../image/sub/blt_heartGray_active.png) no-repeat 0 0;}
	#project-detail .img .btn-share{padding:0 0 0 30px; background:url(../image/sub/blt_share.png) no-repeat 0 0;}
	#project-detail .img .btn-down{padding:0 0 0 30px; background:url(../image/sub/blt_down.png) no-repeat 0 0;}
	#project-detail textarea{width:100%; height:80px; margin:0 0 6px; box-sizing:border-box; padding:12px; font-size:12px; border:1px solid #787878;}
	#project-detail .reply-list{padding:20px 0 0;}
	#project-detail .reply-list li{overflow:hidden; padding:0 15px 10px; font-size:18px; color:#767676;}
	#project-detail .reply-list .name{float:left; width:65px; font-weight:700; color:#113b88;}
	#project-detail .reply-list .date{float:right; width:120px; font-size:13px; text-align:right;}
	#project-detail .reply-list p{float:left; width:650px;}

	#project-edit .modal-inner{top:10%; width:956px; margin:0 0 50px -478px; padding:45px; color:#686868; background:#f6f6f6;}
	#project-edit input[type="text"]{padding:0 15px; font-size:16px;}
	#project-edit .file-url{margin:0 10px 6px 0;}
	#project-edit .img img{max-width:100%;}
	#project-edit textarea{width:100%; height:80px; margin:0 0 6px; box-sizing:border-box; padding:12px; font-size:12px; border:0; background:#fff;}
	#project-edit .btn-regi{width:110px;}
	.person{width:100%; height:48px; margin:12px 0 9px; line-height:48px; background:#fff;}
	.person span{padding:0 0 0 20px; font-size:20px; color:#686868;}
	.person input[type="text"]{width:100px;}
	.person button{width:105px; height:27px; box-sizing:border-box; font-size:15px; color:#fff; text-align:center; line-height:27px; border-radius:7px; background:#b5b5b5;}

	#upload-modal .modal-inner{width:410px; height:460px; margin:-245px 0 0 -250px; padding:30px 45px 0; background:#f6f6f6;}
	#upload-modal h1{padding:0; font-weight:700;}
	#upload-modal .person{background:none;}
	#upload-modal .person span{padding:0 10px 0 0; color:#113b88;}
	#upload-modal .file-url{margin-bottom:10px;}
	#upload-modal input[type="text"]{margin:0 0 10px; padding:0 0 0 15px; font-size:18px;}
	#upload-modal textarea{width:100%; height:170px; margin:0 0 6px; box-sizing:border-box; padding:12px; font-size:18px; border:0; background:#fff;}
	#upload-modal .btn-regi{width:110px;}

	.group-list{min-height:210px; padding:12px 30px 0 50px; border-bottom:1px solid #dcdcdc; background:#fff;}
	.group-list > div{margin:0 0 15px; font-size:22px; color:#b5b5b5;}
	.group-list button{float:right; width:66px; height:28px; font-size:15px; color:#fff; border-radius:5px; background:#b5b5b5;}
	.add-area{overflow:hidden; padding:12px 30px; background:#fff;}
	.add-area input[type="text"]{width:870px; height:46px; padding:0 20px; border:1px solid #b1b1b1;}
	.add-area button{float:right; width:66px; height:28px; margin:8px 0 0; font-size:15px; color:#fff; border-radius:5px; background:#b5b5b5;}
	.btn-projectAdd{display:block; width:175px; height:28px; margin:10px auto; padding:0 0 0 25px; font-size:15px; color:#fff; text-align:center; line-height:28px; border-radius:5px; background:#b5b5b5 url(../image/sub/blt_search.png) no-repeat 25px 5px;}

	#project-search .modal-inner{width:425px; height:500px; box-sizing:border-box; margin:-250px 0 0 -212px; padding:25px 20px; background:#f4f4f4;}
	#project-search h1{margin:0 0 15px; padding:0; font-weight:700;}
	#project-search input[type="text"]{padding:0 55px 0 15px;}
	#project-search .search{position:relative; margin:0 0 20px;}
	#project-search .search button{position:absolute; top:0; right:0; width:50px; height:48px;}
	#project-search .search-list{height:280px; overflow:auto; margin:0 0 24px; background:#fff;}
	#project-search .search-list a{display:block; padding:15px 12px; font-size:14px; color:#414141;}
	#project-search .search-list .active a{background:#dbdbdb;}
	#project-search .btn-complete{display:block; width:35px; margin:0 auto; padding:0 12px 0 0; font-size:18px; font-weight:700; color:#414141; background:url(../image/common/blt_arrow.png) no-repeat right 4px;}

	#new-topic .modal-inner{width:430px; height:180px; box-sizing:border-box; margin:-90px 0 0 -215px; padding:25px 15px; background:#f4f4f4;}
	#new-topic h1{margin:0 0 30px; padding:0; font-weight:700;}
	#new-topic input[type="text"]{width:300px; margin:0 20px 0 5px; padding:0 0 0 15px; font-size:18px;}
	#new-topic .btn-add{float:none; width:65px; height:28px; font-size:15px; line-height:28px; color:#fff; border-radius:5px; background:#b5b5b5;}

	#modify-topic .modal-inner{width:430px; height:180px; box-sizing:border-box; margin:-90px 0 0 -215px; padding:25px 15px; background:#f4f4f4;}
	#modify-topic h1{margin:0 0 30px; padding:0; font-weight:700;}
	#modify-topic input[type="text"]{width:300px; margin:0 20px 0 5px; padding:0 0 0 15px; font-size:18px;}
	#modify-topic .btn-add{float:none; width:65px; height:28px; font-size:15px; line-height:28px; color:#fff; border-radius:5px; background:#b5b5b5;}

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
	.product-wrap{margin:0 0 28px; border-bottom:2px solid #113b88;}
	.product-wrap .img-area{float:left; width:854px;}
	.product-wrap .img-area img{width:854px; height:510px;}
	.product-wrap .img-area .cate{float:left; margin:0 0 20px; color:#696969;}
	.product-wrap .img-area .btn-set{float:right;}
	.product-wrap .img-area .btn-set a{display:inline-block; margin:0 0 0 25px; color:#767676;}
	.product-wrap .img-area .btn-edit{padding:0 0 0 25px; background:url(../image/sub/blt_edit.png) no-repeat 0 0;}
	.product-wrap .img-area .btn-del{padding:0 0 0 20px; background:url(../image/sub/blt_del.png) no-repeat 0 0;}
	.info-section{float:right; width:377px; padding:38px 0 0;}
	.info-section dl{padding:21px 0 19px 12px; border-bottom:1px solid #a4a4a4;}
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
	.product-wrap .designer-area{width:100%; padding:0 0 15px; border-bottom:1px solid #a4a4a4;}
	.product-wrap .info{clear:both;}
	.designer-area a{float:left; margin:12px 5px 0 0; font-size:22px; color:#414141;}
	.designer-area .profile-pic{float:left; width:48px; height:48px; overflow:hidden; margin:0 10px 0 0;}
	.designer-area .profile-pic img{width:100%;}
	.producer-info .share{float:right; margin:3px 0 0;}
	.img-detail{padding:54px 0 0; text-align:center; border-top:1px solid #b1b1b1;}
	.img-detail img{width:1084px; margin:0 0 55px;}
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
	.btn-more{display:block; width:115px; margin:0 auto; padding:0 24px 0 0; font-size:18px; font-weight:700; color:#113b88; background:url(../image/sub/bg_arrowDown.png) no-repeat right 0;}
	.btn-more2{display:block; width:100%; margin:0 auto; padding:0 24px 0 0; font-size:18px; font-weight:700; color:#113b88; background:url(../image/sub/bg_arrowDown.png) no-repeat 54% ;}
	.btn-more2.alarmBtn{padding:10px 70px 10px 0;}

	.purchase-wrap .img-area{float:left; width:854px; margin:0 0 27px;}
	.purchase-wrap .img-area .cate{margin:0 0 20px;}
	.purchase-wrap .img-area img{width:854px; height:510px;}
	.purchase-wrap .info-section{padding-top:130px;}
	.purchase-wrap .designer-area{width:100%; padding:0 0 15px; border-bottom:1px solid #a4a4a4;}
	.purchase-wrap .info{clear:both;}
	.purchase-wrap .licenses dt{background:url(../image/sub/blt_licensesGray.png) no-repeat 0 0;}
	.purchase-wrap .date dt{background:url(../image/sub/blt_dateGray.png) no-repeat 0 1px;}
	.purchase-wrap .like dt{background:url(../image/sub/blt_heartGray2.png) no-repeat 0 1px;}
	.purchase-wrap .point dt{background:url(../image/sub/blt_pointGray.png) no-repeat 0 0;}
	.point-purchase{clear:both; padding:45px 0 0;  border-top:1px solid #b1b1b1;}
	.my-condition{overflow:hidden; margin:0 0 70px; padding:25px 45px; background:#f6f6f6;}
	.my-condition h3{font-size:38px; font-weight:400; color:#414141;}
	.my-condition p{margin:25px 0; font-size:30px; color:#696969;}
	.my-condition .price{float:left; width:337px; height:80px; box-sizing:border-box; margin:0 20px 0 0; font-size:30px; color:#113b88; text-align:center; border:1px solid #113b88;}
	.my-condition button{float:left; width:315px; height:80px; box-sizing:border-box; margin:0 30px 0 0; padding:0 0 0 45px; font-size:32px; color:#fff; border:1px solid #d4d4d4; background:#a4a4a4 url(../image/sub/blt_purchaseBig.png) no-repeat 60px 24px;}
	.my-condition .no-border{float:left; width:490px; height:80px; box-sizing:border-box; padding:0 0 0 5px; font-size:32px; color:#a4a4a4; text-align:center; border:0; border-bottom:1px solid #9e9e9e; background:none;}
	.delivery{padding:0 0 0 45px;}
	.delivery h3{margin:0 0 20px; font-size:38px; font-weight:400;}
	.delivery h3 span{font-size:22px;}
	.delivery table{margin:0 45px 0 20px;}
	.delivery th{width:90px; padding:25px 0 0; font-size:20px; font-weight:400; color:#696969; text-align:left; vertical-align:top;}
	.delivery td{padding:10px 0; font-size:26px;}
	.delivery input[type="text"]{width:457px; height:55px; box-sizing:border-box; padding:0 0 0 30px; color:#a4a4a4; border:1px solid #a4a4a4;}
	.delivery input[type="text"].address:last-child{margin:0;}
	.delivery button{float:left; width:180px; height:55px; margin:0 10px 15px 0; color:#fff; background:#a4a4a4;}
	.delivery input[type="text"].zipcode{width:180px; margin:0 0 15px; padding:0; text-align:center;}
	.delivery input[type="text"].address{width:1080px; margin:0 0 15px;}
	.delivery p{margin:0 45px 40px 0; font-size:18px; color:#113b88; text-align:right;}
	.delivery .btn-complete{float:right; width:300px; height:75px; margin:0; font-size:32px; color:#fff; border-radius:3px; background:#b1b1b1;}

	.request-content{border-bottom:1px solid #bcbcbc; background:#f6f6f6;}
	.request-content .title{margin:0; padding:30px 0 35px; font-size:15px; font-weight:700; color:#113b88;}
	.request-content .select-wrap{clear:both; float:left; overflow:hidden; margin:0 0 40px;}
	.request-content .custom-select{float:left; margin:0 16px 0 0; font-size:14px;}
	.request-content .custom-select input[type="text"]{width:204px; height:31px; box-sizing:border-box; border:1px solid #b1b1b1; background:#fff url(../image/common/bg_selectSmall.gif) no-repeat right center;}
	.request-content .custom-select select{height:31px;}
	.request-content .input-search{float:left; overflow:hidden; border-radius:5px; background:#dcdcdc;}
	.request-content .input-search input[type="text"]{float:left; width:230px; height:31px; padding:0 0 0 15px; border:0; background:#dcdcdc;}
	.request-content .input-search button{float:left; width:35px; height:31px;}
	.request-content .btn-write{float:right; width:120px; height:31px; font-size:15px; font-weight:bold; color:#fff; text-align:center; line-height:31px; border-radius:5px; background:#a4a4a4;}
	.request-list{clear:both; border-top:4px solid #a4a4a4; border-bottom:4px solid #a4a4a4;}
	.request-list > li{position:relative; margin:0 0 4px; font-size:22px; color:#414141;}
	.request-list > li:last-child{margin:0 0 2px;}
	.request-list dt{overflow:hidden; min-height:25px; padding:20px 320px 20px 100px; cursor:pointer; background:#fff;}
	.request-list dt .txt{float:left;}
	.request-list dd{display:none; margin:4px 0 0; font-size:18px; background:#fff;}
	.request-list dd .txt{padding:30px 100px;}
	.request-list .reply-area{padding:0 30px 20px;}
	.request-list .reply-area textarea{width:100%; height:56px; box-sizing:border-box; margin:0 0 20px; padding:10px; font-size:16px; border:1px solid #7a7a7a;}
	.request-list .reply-area li{position:relative; padding:0 80px 15px 10px; font-size:16px; color:#767676;}
	.request-list .reply-area .name{display:inline-block; width:65px; font-weight:700; color:#113b88;}
	.request-list .reply-area .date{position:absolute; top:0; right:15px; font-weight:700; color:#767676;}
	.request-list .info{position:absolute; top:20px; right:55px;}
	.request-list .info .replay{margin:0 80px 0 0;}
	.request-list li.active{border:1px solid #153e8a;}
	.request-list li.active dt{color:#113b88;}
	.request-list li.active dd{display:block;}
	.request-list .btn-more{width:90px; background-position:right 1px;}
	.request-list .btn-set{display:inline; margin:0 0 10px;}
	.request-list .btn-set button,
	.request-list .btn-set a{display:inline-block; width:60px; height:30px; box-sizing:border-box; padding:0 0 0 17px; font-size:14px; color:#fff; text-align:center; line-height:30px; border-radius:5px;}
	.request-list .btn-set .btn-modi{background:#113b88 url(../image/sub/blt_modiWhite.png) no-repeat 8px 7px;}
	.request-list .btn-set .btn-del{background:#767676 url(../image/sub/blt_trashWhite.png) no-repeat 9px 7px;}
	.request-content .paging{padding:30px 0;}
	.request-content .paging a{width:auto; height:auto; margin:0 5px; font-size:26px; color:#414141;}
	.request-content .paging a.active{width:auto; height:auto; margin:0 5px; font-size:26px; color:red;}
	.request-content .paging a img{margin:-4px 0 0;}

	.request-content .tbl-wrap{clear:both; margin:0 0 26px; padding:25px 0 15px; border-top:1px solid #a7a7a7; border-bottom:1px solid #a7a7a7;}
	.request-content .tbl-regi td{padding:0 0 20px;}
	.request-content .tbl-regi .btn-add{margin:3px 0 0;}
	.request-content .tbl-regi .input-text{width:100%; height:65px; box-sizing:border-box; padding:0 0 0 15px; font-size:22px; border:1px solid #dedede;}
	.request-content .tbl-regi select{font-size:14px;}
	.request-content .tbl-regi .custom-select input[type="text"]{padding-left:15px;}
	.request-content .tbl-regi textarea{width:100%; height:610px; box-sizing:border-box; padding:10px; font-size:22px; border:1px solid #dedede;}
	.request-content .file-url{width:1108px;}
	.request-content .file-url input[type="text"]{width:100%; height:65px; box-sizing:border-box; padding:0 0 0 15px; font-size:22px; border:1px solid #dedede;}
	.request-content .file-url button{width:60px; height:65px; font-size:32px;}
	.request-content .file{width:160px; height:45px;}
	.request-content .file input[type="file"]{width:160px; height:45px;}
	.request-content .file button{width:160px; height:45px; font-size:20px; border-radius:10px; background:#b1b1b1 url(../image/sub/btn_searchBig.png) no-repeat 15px 10px;}
	.request-content .cate-list{padding:10px 0 0;}
	.request-content .cate-list li{height:32px; font-size:18px; line-height:32px;}
	.request-content .cate-list button{margin-top:2px; font-size:18px;}
	.request-content .btn-complete{float:right; width:160px; height:45px; margin:0 0 24px; font-size:22px; color:#fff; text-align:center; line-height:45px; border-radius:10px; background:#a4a4a4;}

	/* search */
	.search-content{padding:30px 0; border-bottom:1px solid #bcbcbc; background:#f6f6f6;}
	.search-content .title{float:none; font-size:15px; color:#414141;}
	.result-wrap{clear:both; padding:18px 0 0; border-top:1px solid #b9b9b9;}
	.result-wrap h3{padding:0 0 18px; font-size:15px; color:#414141;}
	.result-wrap .none{padding:0 0 160px; font-size:15px; font-weight:700; color:#414141;}

	/* terms */
	#terms .modal-inner{top:0; width:1200px; margin:0 0 0 -600px; background:#fff;}
	.rule-box{padding:0 50px; font-size:16px;}
	.rule-box > div{margin:0 0 80px;}
	.rule-box h1{margin:0 -50px 55px; padding:35px; font-size:58px; font-weight:700; border-bottom:2px solid #3b3b3b;}
	.rule-box h2{margin:0 0 20px; font-size:22px; font-weight:700;}
	.rule-box p{margin:0 0 20px;}
	.rule-box .txt{margin:0 0 40px;}


	/* swiper */
	/*.wrap{overflow-x:hidden;}*/
	.swiper-wrapper{
		position:relative;
		width:100%;
		height:100%;
		z-index:1;
		display:-webkit-box;
		display:-moz-box;
		display:-ms-flexbox;
		display:-webkit-flex;
		display:flex;
		-webkit-transition-property:-webkit-transform;
		-moz-transition-property:-moz-transform;
		-o-transition-property:-o-transform;
		-ms-transition-property:-ms-transform;
		transition-property:transform;
		-webkit-box-sizing:content-box;
		-moz-box-sizing:content-box;
		box-sizing:content-box;
		-webkit-transform:translate3d(0px, 0, 0);
		-moz-transform:translate3d(0px, 0, 0);
		-o-transform:translate(0px, 0px);
		-ms-transform:translate3d(0px, 0, 0);
		transform:translate3d(0px, 0, 0);
	}
	.swiper-container-free-mode > .swiper-wrapper{
		-webkit-transition-timing-function:ease-out;
		-moz-transition-timing-function:ease-out;
		-ms-transition-timing-function:ease-out;
		-o-transition-timing-function:ease-out;
		transition-timing-function:ease-out;
		margin:0 auto;
	}
	.swiper-container-autoheight .swiper-wrapper{
		-webkit-box-align:start;
		-ms-flex-align:start;
		-webkit-align-items:flex-start;
		align-items:flex-start;
		-webkit-transition-property:-webkit-transform, height;
		-moz-transition-property:-moz-transform;
		-o-transition-property:-o-transform;
		-ms-transition-property:-ms-transform;
		transition-property:transform, height;
	}
	.swiper-container-vertical > .swiper-wrapper {
		-webkit-box-orient: vertical;
		-moz-box-orient: vertical;
		-ms-flex-direction: column;
		-webkit-flex-direction: column;
		flex-direction: column;
	}
	.swiper-container-multirow > .swiper-wrapper {
		-webkit-box-lines: multiple;
		-moz-box-lines: multiple;
		-ms-flex-wrap: wrap;
		-webkit-flex-wrap: wrap;
		flex-wrap: wrap;
	}
	.swiper-slide{
		-webkit-flex-shrink:0;
		-ms-flex:0 0 auto;
		flex-shrink:0;
		width:100%;
		height:auto;
		position:relative;
		overflow:hidden;
	}
	/* Scrollbar */
	.swiper-scrollbar {
		border-radius: 10px;
		position: relative;
		-ms-touch-action: none;
		background: rgba(0, 0, 0, 0.1);
	}
	.swiper-container-horizontal > .swiper-scrollbar {
		position: absolute;
		left: 1%;
		bottom: 3px;
		z-index: 50;
		height: 5px;
		width: 98%;
	}
	.swiper-container-vertical > .swiper-scrollbar {
		position: absolute;
		right: 0;
		top: 1%;
		z-index: 50;
		width: 5px;
		height: 98%;
	}
	.swiper-scrollbar-drag {
		height: 100%;
		width: 100%;
		position: relative;
		background: rgba(0, 0, 0, 0.5);
		border-radius: 10px;
		left: 0;
		top: 0;
	}
	.swiper-scrollbar-cursor-drag {
		cursor: move;
	}

#project-detail .modal-inner{top:10%; width:956px; margin:0 0 50px -478px; padding:20px 45px; color:#686868; background:#fff;}
#project-detail h1{padding:0 0 5px; font-size:30px; font-weight:700; color:#113b88;}
#project-detail h1 span{font-size:12px; font-weight:bold; color:#686868;}
#project-detail .designer{margin:0 0 5px; font-size:18px; font-weight:bold;}
#project-detail .custom-select{width:150px;}
#project-detail select{position:absolute; top:0; left:0; width:100%; height:32px; opacity:0;}
#project-detail input[type="text"]{width:100%; height:32px; box-sizing:border-box; padding:0 40px 0 10px; color:#848484; border:1px solid #848484; border-radius:7px; background:#fff url(../image/common/bg_select.png) no-repeat right 0;}
#project-detail .version{overflow:hidden; margin:0 0 10px; font-size:14px;}
#project-detail .version strong{float:left; margin:8px 15px 0 0;}
#project-detail .opinion{float:left; margin: 0 0 15px; font-size:12px;}
#project-detail .btn-set{float:right;}
#project-detail .btn-set a{margin:0 0 0 12px; padding:0 8px 0 18px; font-size:14px; color:#767676;}
#project-detail .btn-modi{background:url(../image/sub/blt_modi.png) no-repeat 0 0;}
#project-detail .btn-del{background:url(../image/sub/blt_trash.png) no-repeat 0 0;}
#project-detail .img{margin:0 0 6px; border-bottom:1px solid #787878;}
#project-detail .img img{max-width:100%;}
#project-detail .img > div{padding:12px;}
#project-detail .img button{margin:0 45px 0 0; font-size:14px; color:#414141;}
#project-detail .img .btn-like{padding:0 0 0 25px; background:url(../image/sub/blt_heartGray.png) no-repeat 0 0;}
#project-detail .img .btn-like.active{padding:0 0 0 25px; background:url(../image/sub/blt_heartGray_active.png) no-repeat 0 0;}
#project-detail .img .btn-share{padding:0 0 0 30px; background:url(../image/sub/blt_share.png) no-repeat 0 0;}
#project-detail .img .btn-down{padding:0 0 0 30px; background:url(../image/sub/blt_down.png) no-repeat 0 0;}
#project-detail textarea{width:100%; height:80px; margin:0 0 6px; box-sizing:border-box; padding:12px; font-size:12px; border:1px solid #787878;}
#project-detail .reply-list{padding:20px 0 0;}
#project-detail .reply-list li{overflow:hidden; padding:0 15px 10px; font-size:18px; color:#767676;}
#project-detail .reply-list .name{float:left; width:65px; font-weight:700; color:#113b88;}
#project-detail .reply-list .date{float:right; width:120px; font-size:13px; text-align:right;}
#project-detail .reply-list p{float:left; width:650px;}

#project-edit .modal-inner{top:10%; width:956px; margin:0 0 50px -478px; padding:45px; color:#686868; background:#f6f6f6;}
#project-edit input[type="text"]{padding:0 15px; font-size:16px;}
#project-edit .file-url{margin:0 10px 6px 0;}
#project-edit .img img{max-width:100%;}
#project-edit textarea{width:100%; height:80px; margin:0 0 6px; box-sizing:border-box; padding:12px; font-size:12px; border:0; background:#fff;}
#project-edit .btn-regi{width:110px;}


#project-search .modal-inner{width:425px; height:500px; box-sizing:border-box; margin:-250px 0 0 -212px; padding:25px 20px; background:#f4f4f4;}
#project-search h1{margin:0 0 15px; padding:0; font-weight:700;}
#project-search input[type="text"]{padding:0 55px 0 15px;}
#project-search .search{position:relative; margin:0 0 20px;}
#project-search .search button{position:absolute; top:0; right:0; width:50px; height:48px;}
#project-search .search-list{height:280px; overflow:auto; margin:0 0 24px; background:#fff;}
#project-search .search-list a{display:block; padding:15px 12px; font-size:14px; color:#414141;}
#project-search .search-list .active a{background:#dbdbdb;}
#project-search .btn-complete{display:block; width:35px; margin:0 auto; padding:0 12px 0 0; font-size:18px; font-weight:700; color:#414141; background:url(../image/common/blt_arrow.png) no-repeat right 4px;}


#project-share .modal-inner{width:430px; height:180px; box-sizing:border-box; margin:-90px 0 0 -215px; padding:25px 15px; background:#f4f4f4;}
#project-share h1{padding:0 0 5px; font-size:30px; font-weight:700; color:#113b88;}
#project-share h1 span{font-size:12px; font-weight:bold; color:#686868;}
#project-share .designer{margin:0 0 5px; font-size:18px; font-weight:bold;}
#project-share .custom-select{width:150px;}
#project-share select{position:absolute; top:0; left:0; width:100%; height:32px; opacity:0;}
#project-share input[type="text"]{width:100%; height:32px; box-sizing:border-box; padding:0 40px 0 10px; color:#848484; border:1px solid #848484; border-radius:7px; background:#fff url(/image/common/bg_select.png) no-repeat right 0;}
#project-share .version{overflow:hidden; margin:0 0 10px; font-size:14px;}
#project-share .version strong{float:left; margin:8px 15px 0 0;}
#project-share .opinion{float:left; margin: 0 0 15px; font-size:12px;}
#project-share .btn-add{float:none; width:65px; height:28px; font-size:15px; line-height:28px; color:#fff; border-radius:5px; background:#b5b5b5;}
</style>
<script id="tmpl-subjectTemplate" type="text/x-jsrender">
								<div class="topic swiper-slide">
									<div class="btn-set">
										{{if <%= isProjNotComplete && projectVO.getIsProjectMember()%>}}
										<a href="javascript:goWorkUploadView('{{:seq}}')" class="btn-modal">업로드</a>
										<a href="javascript:goSubjectModifyView('{{:seq}}');" class="btn-modal">수정</a>
										<a href="javascript:delProjectSubject('{{:seq}}')" >삭제</a>
										{{/if}}
									</div>
									<h4><span><img src="/resources/image/circle.png"></span>{{:subjectName}}</h4>
									<input type="hidden" id="subjectTitle_{{:seq}}" value="{{:subjectName}}" />
									<ul>
									</ul>
								</div>
</script>
<script id="tmpl-workTemplate" type="text/x-jsrender">
										<li><a href="javascript:goWorkDetailView('{{:seq}}')" class="btn-modal">
											<div class="pic">
												<!-- <img src="{{:verFileUriS}}" alt=""> -->
												<img src="{{:thumbUriS}}" onerror="setDefaultImg(this, 5);" alt="">
											</div>
											<dl>
												<dt class="text_overflow">{{:title}}</dt>
												<dd class="text_overflow">{{:contents}}</dd>
											</dl>
											<div class="item-info">
												<span class="name">{{:memberName}}</span>
												<div>
													<span><img src="/resources/image/sub/blt_msg.png" alt="댓글"> {{:commentCntF}}</span>
													{{if !curUserLikedYN }}
													<span class="hit"><img src="/resources/image/sub/blt_likeGray.png" alt="좋아요"> {{:likeCntF}}</span>
													{{else}}
													<span class="hit"><img src="/resources/image/sub/blt_likeGray_active.png" alt="좋아요"> {{:likeCntF}}</span>
													{{/if}}
												</div>
											</div>
										</a></li>
</script>
<script>
	var projectSeq = '<%=projectSeq%>'; //프로젝트seq

	// subject 탬플릿
	var subjectTemplate =  $("#tmpl-subjectTemplate").html();

	// work 탬플릿
	var workTemplate = $("#tmpl-workTemplate").html();

/**
 * 초기화
 */
$(function(){

	//뷰 컨트롤러 생성
	new ProjectView({
		id:"projectView",
		htmlElement : $("#subjectArea")
	});

	// swipe init
	swipeInit();

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
        url: '/project/selectProjectDetail.ajax',
        type: 'get',
        data: { 'projectSeq' : '<%=projectSeq%>' },
		complete : function(_data){
			flag_loadPage = false;
		},
		error : function(_data) {
			console.log(_data);
	    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		},
		success : function(_data){
			console.log(_data);
	    	var subjectDatas = _data.subjectList;
	    	// load
	    	loadPageWithData(subjectDatas);
		}
    });
}

/**
 * 주제,디자인 load
 */
function loadPageWithData(subjectDatas) {
	projectView.clear();
	if(!subjectDatas || subjectDatas.length == 0) {
		console.log('>>> loadPageWithData no data.');
		return;
	}
	// 주제:
	projectView.addSubjects({
		keyName : "seq",
		data : subjectDatas,
		htmlTemplate : subjectTemplate,
	});
	// 디자인:
	for(var i=0; i< subjectDatas.length; i++) {
		var workDatas = subjectDatas[i].projectWorkList;
		if(!workDatas || workDatas.length == 0) {
			continue;
		}
		projectView.addWorks({
			parentKeyName : "projectSubjectSeq",
			keyName : "seq",
			data : workDatas,
			htmlTemplate : workTemplate,
		});
	}

	// swipe init
	swipeInit();

}

/**
 * 주제 삭제
 */
var flag_delProjectSubject = false; //flag
function delProjectSubject(seq) {
	checkedLogin(function(invokeAfterLogin){

		if(flag_delProjectSubject) {
			return;
		}
		flag_delProjectSubject = true;
		//삭제 체크:
		$.ajax({
	        url: '/project/checkDeleteProjectSubject.ajax',
	        type: 'get',
	        data: {"seq":seq},
	        complete : function(_data){
	        	flag_delProjectSubject = false;
			},
	        error : function(_data) {
	        	console.log(_data);
		    	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
	        },
	        success : function(_data){
	        	console.log(_data);
		    	if(_data.result == '1') {
		    		//성공
		    		if(confirm('정말 삭제하시겠습니까?')) {
		    			//실제삭제:
		    			doDelProjectSubject(seq);
		    		}
		    	} else if(_data.result == '0') {
		    		alert('주제 라인에 작픔이 하나 이상 남아 있을 경우 삭제할 수 없습니다.');
		    		if( invokeAfterLogin ) {
		    			window.location.reload();
		    		}
		    	} else {
		    		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
		    	}
	        }
	    });
	}); //end of checkedLogin
}


/**
 * 주제 실제 삭제
 */
var flag_doDelProjectSubject = false; //flag
function doDelProjectSubject(seq) {

	if(flag_doDelProjectSubject) {
		return;
	}
	flag_doDelProjectSubject = true;

    //삭제:
	$.ajax({
        url: '/project/deleteProjectSubject.ajax',
        type: 'post',
        data: {"seq":seq},
        complete : function(_data){
        	flag_doDelProjectSubject = false;
		},
        error : function(_data) {
        	console.log(_data);
        	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '1') {
        		modalHide();
        		loadPage();
        	} else {
        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        }
    });
}


/**
 * 주제 수정
 */
var flag_doModifyProjectSubject = false; //flag
function doModifyProjectSubject(seq) {

	if(flag_doModifyProjectSubject) {
		return;
	}
	flag_doModifyProjectSubject = true;

    //삭제:
	$.ajax({
        url: '/project/modifyProjectSubject.ajax',
        type: 'post',
        data: {"seq":seq},
        complete : function(_data){
        	flag_doModifyProjectSubject = false;
		},
        error : function(_data) {
        	console.log(_data);
        	alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        },
        success : function(_data){
        	console.log(_data);
        	if(_data.result == '1') {
        		modalHide();
        		loadPage();
        	} else {
        		alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
        	}
        }
    });
}

</script>
<script>
/**
* swipe init
*/
var topicSwipe;

function swipeInit() {
	var item = $('.topic-wrap').find('.topic').length;

	if(item > 6){

		if( topicSwipe == null ) {

			$('.topic-container').find('button').show();

			topicSwipe = new Swiper('.topic-slide', {
		        slidesPerView: 6,
		        spaceBetween: 7,
		        nextButton: '.btn-topicNext',
		    	prevButton: '.btn-topicPrev'
		    });

		} else {
			topicSwipe.onResize()
		}

	} else{
		$('.topic-container').find('button').hide();
	}
}


/**
 * 좋아요
 */
var flag_prodViewWorkLike = false; //flag
function prodViewWorkLike(thisObj) {
    checkedLogin(function(invokeAfterLogin){
    	var seq = <%=request.getParameter("projectSeq")%>
        if(flag_prodViewWorkLike) {
            return;
        }
        flag_prodViewWorkLike = true;

        $.ajax({
            url: '/common/likeProject.ajax',
            type: 'post',
            data: {"projectSeq":seq},
            complete : function(_data){
                flag_prodViewWorkLike = false;
            },
            error : function(_data) {
                console.log(_data);
                alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
            },
            success : function(_data){
                console.log(_data);
                window.location.reload();
            }
        });

    }); //end of checkedLogin    
}
</script>
</head>
<body>
<div class="wrap" style="margin-top: 90px">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param name="headerCategoryYN" value="N" />
	</jsp:include>
	<!-- //header -->

	<!-- content -->
	<div class="list-content">
		<div class="inner">
			<h2 class="title mt-5" ><%=projectVO.getProjectName()%></h2>
				<div>
					<% if( !liked ) { %>
					<button style="float: right"type="button" class="btn btn-login btn-xs" onclick="prodViewWorkLike(this);" >좋아요</button>
					<% } else { %>
					<button style="float: right" type="button" class="btn btn-red btn-xs" onclick="prodViewWorkLike(this);" >좋아요</button>
					<% } %>
				</div>
			<div id = "subject-addbtn" style="font-size: 15px; text-align :center; float:right;">
				<%if( isProjNotComplete && projectVO.getIsProjectMember() ) { %>
				<a href="javascript:goSubjectAddView();" class="btn btn-red" >새 주제 추가</a>
				<%} %>
			</div>
			<div class="topic-container">
				<button type="button" class="btn-topicPrev"style="background:none;border:none"><img src="/resources/image/sub/btn_projectPrev.png" alt="이전"></button>
				<div class="topic-slide">
					<div id="subjectArea" class="topic-wrap swiper-wrapper">
						<%--
						<!-- template -->
						<div class="topic swiper-slide">
							<div class="btn-set">
								<a href="#upload-modal" class="btn-modal">업로드</a>
								<a href="#">삭제</a>
							</div>
							<h3><span>주제</span> 포스터 기획</h3>
							<ul>
								<li><a href="#project-detail" class="btn-modal">
									<div class="pic">
										<img src="/resources/image/main/pic_sample1.jpg" alt="">
									</div>
									<dl>
										<dt>디자인 시안1</dt>
										<dd>한번 확인해보세요</dd>
									</dl>
									<div class="item-info">
										<span class="name">김은희</span>
										<div>
											<span><img src="/resources/image/sub/blt_msg.png" alt="메시지"> 181</span>
											<span><img src="/resources/image/sub/blt_likeGray.png" alt="좋아요"> 0</span>
										</div>
									</div>
								</a></li>
							</ul>
						</div>
						<!-- //template -->
						--%>

					</div>
				</div>
				<button type="button" class="btn-topicNext"style="background:none;border:none"><img src="/resources/image/sub/btn_projectNext.png" alt="다음"></button>
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
<jsp:include page="/WEB-INF/views/common/modal_project_list.jsp" flush="false">
	<jsp:param name="isProjectOwner" value="<%=projectVO.getIsProjectOwner()%>" />
	<jsp:param name="isProjectMember" value="<%=projectVO.getIsProjectMember()%>" />
	<jsp:param name="isProjNotComplete" value="<%=isProjNotComplete%>" />
</jsp:include>
<!-- //modal -->

</body>
</html>