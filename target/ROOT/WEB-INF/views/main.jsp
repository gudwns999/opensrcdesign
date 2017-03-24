<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <%@include file="/WEB-INF/views/common/head.jsp"%>
    <style>
        /*swiper-slide는  메인에 보이는 이달의 디자이너/제작자 컨텐츠가 overflow됐을때 다음 컨텐츠로 넘어가게 함*/
        .swiper-slide{
            -webkit-flex-shrink:0;
            -ms-flex:0 0 auto;
            flex-shrink:0;
            width:100%;
            height:auto;
            position:relative;
            overflow:hidden;
        }
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
        .best{
            position:relative;
            overflow:hidden;
            margin:0 0 50px;
            padding:10px 0 0;
        }
        .best .best-inner {width:1320px;}
        .best button{
            position:absolute;
            top:50%;
            z-index:2;
            margin:0;
        }
        .best .btn-prevSlide{
            left:0;
        }
        .best .btn-nextSlide{
            right:0;
        }
        .hide{display:none;}
        .text_overflow{
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        .maintitle{width:250px; height:42px;}
        .mainAlpha{color:red;background-color:white;font-weight: 600;font-size: 20px;padding: 3px 6px 0px 6px}

    </style>
    <base target="_self">
</head>
<body>
<!--header start-->
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!--header end-->
<!--carousel-->



<div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">
    <!-- Overlay -->
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#bs-carousel" data-slide-to="1"></li>
        <li data-target="#bs-carousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" style="border-bottom: 1px red solid">
        <div class="item slides active">
            <div class="slide-1"></div>
            <div class="hero">
                <button type="button" class="btn btn-hero btn-lg" role="button" data-toggle="modal" data-target="#open-design-modal">오픈디자인
                    <span  style="color: white;font-size: 14px;" class="ml-2 glyphicon glyphicon-search"></span>
                </button>

            </div>
        </div>
        <div class="item slides">
            <div class="slide-2"></div>
            <div class="hero">
                <button type="button" class="btn btn-hero btn-lg" role="button" data-toggle="modal" data-target="#easy-design-modal">쉬운 디자인
                    <span  style="color: white;font-size: 14px;" class="ml-2 glyphicon glyphicon-search"></span>
                </button>
            </div>
        </div>
        <div class="item slides">
            <div class="slide-3"></div>
            <div class="hero">
                <button type="button" class="btn btn-hero btn-lg" role="button" data-toggle="modal" data-target="#together-design-modal">함께하는 디자인
                    <span  style="color: white;font-size: 14px;" class="ml-2 glyphicon glyphicon-search"></span>
                </button>
            </div>
        </div>
    </div>
</div>


<!-- 오픈디자인 설명 모달 -->
<div class="modal fade" tabindex='-1' id="open-design-modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <h3 align="center">오픈 디자인</h3>
                <div class="row">
                    <div style="white-space: pre-line;font-size: 18px " class="col-sm-6 col-sm-offset-3 col-xs-12" >
                        <div align="center" style="line-height: 40px">
                        디자인은 인간의 <span style="color: red">창의성</span>을 담는 그릇입니다.
                        창의력이 핵심 경쟁력이 될 미래는 <span style="color: red">디자인 중심 사회</span>가 될 것입니다.
                        세계 각국은 디자인의 중요성을 깨달아 디자인에 대한 투자를 늘리고 있지만
                        아직 대부분의 사람들에게 디자인은 <span style="color: red">어려운</span> 분야입니다.
                        사람들이 쉽게 디자인을 접하고, 경험하며, 배울 수 있는 디자인 <span style="color: red">인프라 구축</span>이 중요한 시점입니다.
                        오픈 디자인은 <span style="color: red;font-size: 25px">“쉬운 디자인, 함께하는 디자인”</span>을 추구하는 웹 사이트입니다.
                        누구나 쉽고, 재미있게, 시간과 장소에 구애 받지 않고
                        함께 어울리며 디자인할 수 있는 환경을 만들고자 합니다.
                        </div>
                        <span class="btn btn-red mb-3">1. 쉬운 디자인</span>
                        우리 사이트에서는 디자인이 쉬워집니다. 기존의 디자인을 약간 수정하거나 보완하여 새로운 디자인을 만들고, 이를 다시 공유하는 디자인 공유 사이클이 활성화됩니다. 간단한 디자인 모듈들을 조립하여 복잡한 디자인을 만들 수 있는 모듈형 디자인도 가능해집니다.
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/easy.png">

                        <span class="btn btn-red mb-3">2. 함께하는 디자인</span>
                        우리 사이트에서는 디자인이 재미있어집니다. 온라인 협업 디자인 환경을 제공하는 프로젝트 기능을 이용해서 언제, 어디서나, 누구와도 함께 어울리며 즐겁게 디자인을 경험하면서 배울 수 있습니다.
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/pro8.png">
                        <img class="img-responsive"src="/resources/image/buyimage/pro5.png">
                        <img class="img-responsive"src="/resources/image/buyimage/pro6.png">
                        <img class="img-responsive"src="/resources/image/buyimage/pro7.png">
                        디자인 공유 사이클이 활성화 되기 위해서는 디자인 아이디어의 공유 못지않게 디자인 과정에서의 산출물들을 포함하는 디자인 소스 공유가 중요합니다. 우리 사이트는 디자인 프로젝트를 이용하여 디자인 소스를 공유할 수 있도록 지원합니다.

                        디자인 공유를 통해 오픈 소스 소프트웨어가 소프트웨어 분야에 미친 효과를 디자인 분야에도 가져올 수 있도록 노력할 것이며, 구체적으로 다음과 같은 효과를 기대합니다.

                        •	개개인의 작은 디자인 아이디어가 모여 최고의 디자인으로 발전할 수 있습니다. (집단 지성)

                        •	사장될 수도 있는 개인의 디자인 아이디어가 다른 사람들에게 영감을 주어 디자인 생태계의 발전을 가져옵니다. (창의성 고양)

                        •	일반인들의 디자인에 대한 관심을 끌고 안목을 키워줄 수 있습니다.

                        •	디자인의 독창성, 우수성, 개선사항 등에 대한 다양한 분야의 전문가들의 평가와 조언을 즉각적으로 얻을 수 있습니다.

                        •	많은 발명이나 발견이 인류공영에 이바지 하였듯이 훌륭한 디자인이 수많은 사람들에게 혜택을 줄 수 있습니다.

                        디자인에 대한 투자는 기술에 대한 투자보다 30배 이상의 이득이 있다고 합니다. 우리나라 디자인 산업 분야에서의 1% 생산성 증가가 1조원 이상의 가치를 창출합니다. 디자인 중심 사회가 될 미래에 핵심 가치를 창출할 수 있도록 여러분들의 적극적인 참여를 부탁 드립니다.
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
<!-- 쉬운디자인 설명 모달 -->
<div class="modal fade" tabindex='-1' id="easy-design-modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <h3 align="center">쉬운 디자인</h3>
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-xs-12" style="white-space: pre-line;font-size: 18px" >
                        <div align="center" style="line-height: 40px;font-size:18px">
                        우리 사이트에서는 <span style="color:red">디자인이 쉬워집니다."</span>
                        기존의 디자인을 약간 수정하거나 보완하여 <span style="color:red">새로운 디자인</span>을 만들고,
                        이를 다시 공유하는 <span style="color:red;font-size:25px">디자인 공유 사이클</span>이 활성화됩니다.
                        간단한 <span style="color:red">디자인 모듈</span>들을 조립하여 복잡한 디자인을 만들 수 있는 <span style="color:red">모듈형 디자인</span>도 가능해집니다.
                        </div>
                        <h4 class="mt-5 btn btn-red">1. 디자인 공유하기</h4>
                        <p class="mt-5">상단 메뉴에서 디자인 페이지로 이동합니다.</p>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/design-process.png">
                        <p>로그인 후 디자인 등록 버튼을 클릭 합니다.</p>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/design-process2.png">
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/design-process4.png">
                        <p>디자인 등록창에서 디자인명, 카테고리, 라이센스, 테크, 디자인 파일, 오픈디자인 파일을 등록하여 완료합니다.</p>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/design-process3.png">

                        <h4 class="mt-5 btn btn-red">2. 파생디자인 등록하기</h4>
                        <p class="mt-5">새디자인 기존에 있는 디자인 작품을 통해 새롭게 변형하거나 추가하여 새로운 디자인을 만드는 것을 얘기합니다.</p>
                        <p>디자인 상세 페이지에서 기존 디자인 작품을 올린 디자이너의 공유 범위를 CC라이센스를 통해 확인 할 수 있습니다. 이를 통해 공유하거나 재생산 할 수 있는 작품이면 새디자인 버튼을 클릭하여 출처 등이 자동으로 등록되며 기존 디자인 작품의 소스를 다운받아 새롭게 디자인 작품을 등록 할 수 있습니다. </p>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/easy.png">

                        <h4 class="btn btn-red">3. 원본 디자인 보기</h4>
                        <p class="mt-5">원본보기 버튼을 클릭하면 기존 작품이 어떠한 작품에서 파생되었는지를 확인 할 수 있습니다.</p>
                        <p>이를 통해 디자인 공유가 쉬워지고 보호 받을 수 있으며 그안에서 누구나 쉽게 디자인 할 수 있습니다.</p>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/easy4.png">
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 함께하는디자인 설명 모달 -->
<div class="modal fade" tabindex='-1' id="together-design-modal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <h3 align="center">함께하는 디자인</h3>
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-xs-12" style="white-space: pre-line;font-size: 18px" >
                        <div align="center" style="line-height: 40px;font-size: 18px">
                        우리 사이트에서는 디자인이 <span style="color: red;font-size: 25px">재미</span>있어집니다.
                        <span style="color:red">온라인 협업 디자인 환경</span>을 제공하는 프로젝트 기능을 이용해서
                        <span style="color:red;font-size:25px">언제, 어디서나, 누구와</span>도 함께 어울리며 즐겁게 디자인을 경험하면서 배울 수 있습니다.
                        </div>
                        <h4 class="btn btn-red mt-5 mb-5">1. 프로젝트</h4>
                        <span class="mt-5">상단 메뉴에서 프로젝트 버튼을 눌러 프로젝트 페이지로 넘어갑니다.</span>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/pro1.png">
                        <span>프로젝트 생선 버튼을 클릭하여 새로운 프로젝트를 생성합니다.</span>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/proprocess1.png">
                        <span>프로젝트 생성 페이지에서 양식에 맞추어 프로젝트 생성을 진행 합니다.</span>
                        <span>멤버를 검색해 프로젝트 멤버로 초대 할수도 있습니다.</span>
                        <span>프로젝트 서비스를 통해 여러사람이 함께모여 디자인 프로젝트를 진행 할 수 있습니다.</span>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/proprocess2.png">

                        <span>프로젝트는 단계추가, 단계에 맞는 작품 추가를 통해 프로젝트를 진행해 나갑니다.</span>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/pro4.png">

                        <span>또한 단계추가를 프로젝트 성격에 맞추어 주차별, 기능별, 프로젝트에 참여한 사람의 이름명으로 하여 자유롭게 프로젝트를 진행할 수 있습니다.</span>
                        <img class="img-responsive mt-5"src="/resources/image/buyimage/pro5.png">
                        <img class="img-responsive"src="/resources/image/buyimage/pro6.png">
                        <img class="img-responsive"src="/resources/image/buyimage/pro7.png">
                        <h4 class="mt-5 btn btn-red">2. 그룹</h4>
                        <p class="mt-5">프로젝트 그룹 기능을 이용하여 학교나 기업체 같은 조직에서 프로젝트 팀들을 편리하게 관리할 수 있습니다.</p>
                        <span>프로젝트 페이지에서 그룹 생성 및 관리 버튼을 클릭합니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/grpro1.png">
                        <span>그룹명을 입력하고 추가 버튼을 클릭합니다. 완료버튼을 눌러 그룹 생성을 완료합니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/group1.png">
                        <img class="img-responsive"src="/resources/image/buyimage/group2.png">
                        <span>이제 프로젝트를 만든 프로젝트장이 자신의 프로젝트를 원하는 그룹에 가입 신청을 합니다.</span>
                        <span>프로젝트 페이지에서 프로젝트 관리 버튼을 클릭합니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/group3.png">
                        <span>프로젝트장이 자신이 개설한 프로젝트를 검색합니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/group4.png">
                        <span>프로젝트를 가입하게 할 그룹을 검색합니다.</span>
                        <span>수정완료를 누루면 그룹장한테 프로젝트 가입 승인 요청이 갑니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/group5.png">
                        <span>그룹장이 그룹관리및 생성페이지에서 승인을 누루면 프로젝트가 그룹에 가입됩니다.</span>
                        <img class="img-responsive"src="/resources/image/buyimage/group6.png">
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="container maintitle" >
        <span class="mainAlpha">D</span>
        <span class="maintitle2">이 달의 디자이너</span>
    </div>

    <div class="best row">
        <div class="best-inner">
            <div class="swiper-wrapper" id="designView"></div>
            <div class="slide-btn hide">
                <button type="button" class="btn-prevSlide purchase-prev" style="background:none;border:none;margin-top:-40px"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
                <button type="button" class="btn-nextSlide purchase-next"style="background:none;border:none;margin-top:-40px"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>

            </div>
        </div>
    </div>
</div>

<div class="container" style="margin-top: -50px;">
    <div class="container maintitle" >
        <span class="mainAlpha">D</span>
        <span class="maintitle2">추천 디자인</span>
    </div>
    <div class="row" style="margin-top: 10px">
        <div id="productView"></div>
    </div>
</div>

<div class="container">
</div>
<!-- 디자인버튼 눌렀을 시 처리 -->
<script type="text/javascript">
    $(document).on("click",".des",function(){
        var seq = $(this).attr('id');
        $('.modal-design').attr('id','modal'+seq);
//    $('div.modal').modal({remote : '/product/productView.do?seq='+seq});
        $.get("/product/productView.do?seq="+seq, function(html){
            $(".modal-content-design").html(html);
            $('#modal').modal('show');
        });
    });

</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>
<%@include file="/WEB-INF/views/common/modal.jsp"%>

<script type="text/javascript">
    /* designer list 탬플릿 */
    var designerListTemplete = null;
    /* 디자이너 리스트 박스 */
    var designView = null;

    /* 디자인 list 탬플릿 */
    var productListTemplete = null;
    /* 디자인 리스트 박스 */
    var productView = null;

    /* 초기화 */
    $(function(){

        designerListTemplete = $("#tmpl-designerListTemplete").html();

        designView = new ListView({
            htmlElement : $('#designView')
        });


        productListTemplete = $("#tmpl-productListTemplete").html();

        productView = new ListView({
            htmlElement : $('#productView')
        });

        loadPage();

        /* 윈도우 스크롤 이벤트 : 프로젝트 로드 */
        $(window).on('mousewheel', function(e){
            if( e.originalEvent.wheelDelta / 120 > 0 ) {
                // to do nothing...
            } else {
                /* 스크롤이 최하단일 경우 프로젝트 로드 */
                if ( $(window).scrollTop() == $(document).height() - $(window).height()) {
                    //
                    if(!productView.data('existList')) {
                        return;
                    }
                    loadProductData();
                }
            }
        });

    });


    /**
     * 프로젝트 데이터 로드
     */
    function loadPage(){

        $.ajax({
            url : "/selectMainList.ajax",
            type: "GET",
            cache: false,
            data : {},
            success : function(_data){

                // === designer
                loadDesignerData(_data.designerList);

                // === product
                window.gb_productList = _data.productList || [];
                loadProductData();

            },
            error : function(req){
            }

        });
    }

    /**
     * 디자이너 load
     */
    function loadDesignerData(designerList) {
        var hasDesigners = designerList.length > 0;

        designView.putData('existList', hasDesigners);
        designView.addAll({keyName:'seq', data:designerList, htmlTemplate:designerListTemplete });

        //특수처리: 한번에 6개씩 움직이게: loading할때 한번 처리
        while($('#designView > #designer').length != 0) {
            $('#designView > #designer').slice(0,6).wrapAll('<div class="swiper-slide"> </div>');
        }

        //swiper:
        swipeInitDesigner();
    }

    /**
     * 작품 load
     */
    var flag_loadProductData = false;
    function loadProductData() {
        if(flag_loadProductData) {
            return;
        }
        flag_loadProductData = true;

        $('.wrap-loading').show();

        var productList = getProductData();
        var hasProducts = productList.length > 0;

        productView.putData('existList', hasProducts);
        productView.addAll({keyName:'seq', data:productList, htmlTemplate:productListTemplete });

        var loadDelay = 10; //ms
        setTimeout(function(){
            $('.wrap-loading').hide();
            flag_loadProductData = false;
        }, loadDelay);
    }

    var gb_productList = [];
    var gb_product_start = 0;
    var gb_product_limitCnt = 12;
    function getProductData() {
        var start = gb_product_start;
        var end = gb_product_start + gb_product_limitCnt;
        gb_product_start = end;
        var list = gb_productList.slice(start, end);

        console.log('>>> getProductData: start='+start +', end='+end+', list.length=' + list.length);
        return list;
    }



    /*
     *swiper 디자이너/제작자
     */
    var designerSwipe = null;
    function swipeInitDesigner() {
        var swipeContSel = '.best-inner';
        var slideBtn = $(swipeContSel).find('.slide-btn');
        var item = $(swipeContSel).find('.thumbnail').length;
        if(designerSwipe == null) {
            designerSwipe = new Swiper(swipeContSel, {
                //slidesPerView: 4,
                //slidesPerColumn: 2,
                //spaceBetween: 19,
                //slidesPerColumnFill: "row",
                simulateTouch: false,
                nextButton: '.purchase-next',
                prevButton: '.purchase-prev'
            });
        } else {
            designerSwipe.onResize();
        }

        if(item > 3*2){
// 			slideBtn.show();
            $(".slide-btn").removeClass("hide");
        } else{
            slideBtn.hide();
        }
    }

    /**
     * 디자인 상세 화면 이동
     */
    function goProductView(productSeq){
//		window.location.href = "/product/productView.do?seq=" + productSeq;
//        $('div.modal').modal({remote : '/product/productView.do?seq='+productSeq});

    }

    function goPortfolioView(seq, memberType) {

        if( memberType == '01') {
            window.location.href='/producer/portfolio.do?seq=' + seq;
        } else {
            window.location.href='/designer/portfolio.do?seq=' + seq;
        }
    }

</script>
<!-- 디자이너 수정 부분 -->
<script id="tmpl-designerListTemplete" type="text/x-jsrender">
				<div id="designer" class="col-xs-12 col-sm-4">
					<div class="thumbnail">
						<a href="javascript:goPortfolioView('{{:seq}}', '{{:memberType}}');">
							<div class="row">
								<div class="col-sm-6">
								<div class="mythum" style="height:158px">
									<img src="{{:imageUrl}}" class="user_img"  onerror="setDefaultImg(this, 1);" alt="{{:uname}}">
								</div>
								</div>
							<div class="caption col-sm-6">
								<p class="thumb_designer">
									<span ></span>{{:uname}}
								</p>
								<p class="cate_name"> {{:cateNames}}</p>
								<div class="portfolio_icon">
									<span class="mr-5"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									{{if !curUserLikedYN }}
									<span class="mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									{{else}}
									<span class="mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
									{{/if}}
									<span><img src="/resources/image/common/ico_hit.png" alt="<<열></열></열>람"> {{:viewCntF}}</span>
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
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex> slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 4000); // Change image every 2 seconds
    }
</script>
<!-- 디자인 카드 수정. -->
<script id="tmpl-productListTemplete" type="text/x-jsrender">
	<div id="{{:seq}}" class="des col-xs-6 col-sm-3" data-toggle="modal" data-target="#modal{{:seq}}">
		<div class="thumbnail">
			<a href="javascript:goProductView('{{:seq}}');" class="thumbnail_card">
			<div class="mythum">
				<img src="{{:thumbUri}}"onerror="setDefaultImg(this, 3);" class="thumbnail_card_img" alt=""/>
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
					<span><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
					<span class="update">{{:displayTime}}</span>
				</div>
			</a>
		</div>
	</div>
</script>
</body>
</html>
