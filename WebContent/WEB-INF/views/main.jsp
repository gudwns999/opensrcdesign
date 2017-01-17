<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
    <script>
        jQuery(document).on('click', '.mega-dropdown', function(e) {
            e.stopPropagation()
        })

        jQuery(document).on('click', '.mega-dropdown2', function(e) {
            e.stopPropagation()
        })

        jQuery(document).on('click', '.mega-dropdown3', function(e) {
            e.stopPropagation()
        })

        jQuery(document).on('click', '.mega-dropdown4', function(e) {
            e.stopPropagation()
        })
    </script>
	<style>
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
			margin:0 0 57px; 
			padding:34px 0 0;
		}
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
		
	</style>
	<base target="_self">
</head>
<body style="background-color: rgb(234,234,234)">
<!--navbar + megamenu-->
<div id="sec1" class="container-fluid" style="border-bottom: 1px red solid;background-color: white">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="./resources/image/logo.jpg" width="100px">
            </div>
            <div class="collapse navbar-collapse js-navbar-collapse" align="center">
                <!--design-->
                <ul class="nav navbar-nav">
                    <li class="dropdown mega-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">디자인<br><span>Design</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/product/product.do">디자인</a></li>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                <h4><small>Summer dress floral prints</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                <h4><small>Gold sandals with shiny touch</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                <h4><small>Denin jacket stamped</small></h4>
                                            </div>
                                            <!-- End Item -->
                                        </div>
                                        <!-- End Carousel Inner -->
                                    </div>
                                    <!-- /.carousel -->
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/product/product.do?schCate=001">의상</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=001001">전통의상</a></li>
                                            <li><a href="/product/product.do?schCate=001001001">한복</a></li>
                                            <li><a href="/product/product.do?schCate=001001002">중국 의상</a></li>
                                            <li><a href="/product/product.do?schCate=001001003">일본 의상</a></li>
                                            <li><a href="/product/product.do?schCate=001001004">동양 의상</a></li>
                                            <li><a href="/product/product.do?schCate=001001005">서양 의상</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=001002">남성복</a></li>
                                            <li><a href="/product/product.do?schCate=001003">여성복</a></li>
                                            <li><a href="/product/product.do?schCate=001004">아동복</a></li>
                                            <li><a href="/product/product.do?schCate=001005">패션잡화</a></li>
                                            <li><a href="/product/product.do?schCate=001005005">신발</a></li>
                                            <li><a href="/product/product.do?schCate=001006">액세서리</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/product/product.do?schCate=002">산업</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=002001">기계</a></li>
                                            <li><a href="/product/product.do?schCate=002002">기기/기구</a></li>
                                            <li><a href="/product/product.do?schCate=002002001">컴퓨터</a></li>
                                            <li><a href="/product/product.do?schCate=002002002">가전</a></li>
                                            <li><a href="/product/product.do?schCate=002005">식품</a></li>

                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=002003">자동차/운송</a></li>
                                            <li><a href="/product/product.do?schCate=002004">로봇</a></li>
                                            <li><a href="/product/product.do?schCate=002003">가구</a></li>
                                            <li><a href="/product/product.do?schCate=002002004">완구</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/product/product.do?schCate=003">시각</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=003001">그래픽</a></li>
                                            <li><a href="/product/product.do?schCate=003002">영상</a></li>
                                            <li><a href="/product/product.do?schCate=003004">광고</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=003005">포장</a></li>
                                            <li><a href="/product/product.do?schCate=003006">캐릭터</a></li>
                                            <li><a href="/product/product.do?schCate=003007">서체</a></li>

                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a herf="/product/product.do?schCate=004">공예</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=004001">금속공예</a></li>
                                            <li><a href="/product/product.do?schCate=004002">도자공예</a></li>
                                            <li><a href="/product/product.do?schCate=004003">목공예</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=004004">수공예</a></li>
                                            <li><a href="/product/product.do?schCate=004005">유리공예</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/product/product.do?schCate=005"></a>공간</li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=005001">건축</a></li>
                                            <li><a href="/product/product.do?schCate=005002">인테리어</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=005003">무대</a></li>
                                            <li><a href="/product/product.do?schCate=005004">도시/환경</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/product/product.do?schCate=006">정보</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=006001">UX</a></li>
                                            <li><a href="/product/product.do?schCate=006003">웹</a></li>
                                            <li><a href="/product/product.do?schCate=006004">게임</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=006002">UI</a></li>
                                            <li><a href="/product/product.do?schCate=006005">소리/음악</a></li>
                                            <li><a href="/product/product.do?schCate=006006">음식/요리법</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="r/product/product.do?schCate=007">자연</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=007001">동물 디자인</a></li>
                                            <li><a href="/product/product.do?schCate=007002">식물 디자인</a></li>
                                            <li><a href="/product/product.do?schCate=007003">지구 디자인</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/product/product.do?schCate=007004">우주 디자인</a></li>
                                            <li><a href="/product/product.do?schCate=007005">디자인 역사</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">새분야</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!--design project-->
                <ul class="nav navbar-nav">
                    <li class="dropdown mega-dropdown2">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">디자인 프로젝트<br><span>Design Project</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/project/project.do">디자인 프로젝트</a></li>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                <h4><small>Summer dress floral prints</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                <h4><small>Gold sandals with shiny touch</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                <h4><small>Denin jacket stamped</small></h4>
                                            </div>
                                            <!-- End Item -->
                                        </div>
                                        <!-- End Carousel Inner -->
                                    </div>
                                    <!-- /.carousel -->
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/project/project.do?schCate=001">의상</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=001001">전통의상</a></li>
                                            <li><a href="/project/project.do?schCate=001001001">한복</a></li>
                                            <li><a href="/project/project.do?schCate=001001002">중국 의상</a></li>
                                            <li><a href="/project/project.do?schCate=001001003">일본 의상</a></li>
                                            <li><a href="/project/project.do?schCate=001001004">동양 의상</a></li>
                                            <li><a href="/project/project.do?schCate=001001005">서양 의상</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=001002">남성복</a></li>
                                            <li><a href="/project/project.do?schCate=001003">여성복</a></li>
                                            <li><a href="/project/project.do?schCate=001004">아동복</a></li>
                                            <li><a href="/project/project.do?schCate=001005">패션잡화</a></li>
                                            <li><a href="/project/project.do?schCate=001005005">신발</a></li>
                                            <li><a href="/project/project.do?schCate=001006">액세서리</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/project/project.do?schCate=002">산업</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=002001">기계</a></li>
                                            <li><a href="/project/project.do?schCate=002002">기기/기구</a></li>
                                            <li><a href="/project/project.do?schCate=002002001">컴퓨터</a></li>
                                            <li><a href="/project/project.do?schCate=002002002">가전</a></li>
                                            <li><a href="/project/project.do?schCate=002005">식품</a></li>

                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=002003">자동차/운송</a></li>
                                            <li><a href="/project/project.do?schCate=002004">로봇</a></li>
                                            <li><a href="/project/project.do?schCate=002003">가구</a></li>
                                            <li><a href="/project/project.do?schCate=002002004">완구</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/project/project.do?schCate=003">시각</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=003001">그래픽</a></li>
                                            <li><a href="/project/project.do?schCate=003002">영상</a></li>
                                            <li><a href="/project/project.do?schCate=003004">광고</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=003005">포장</a></li>
                                            <li><a href="/project/project.do?schCate=003006">캐릭터</a></li>
                                            <li><a href="/project/project.do?schCate=003007">서체</a></li>

                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a herf="/project/project.do?schCate=004">공예</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=004001">금속공예</a></li>
                                            <li><a href="/project/project.do?schCate=004002">도자공예</a></li>
                                            <li><a href="/project/project.do?schCate=004003">목공예</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=004004">수공예</a></li>
                                            <li><a href="/project/project.do?schCate=004005">유리공예</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/project/project.do?schCate=005"></a>공간</li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=005001">건축</a></li>
                                            <li><a href="/project/project.do?schCate=005002">인테리어</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=005003">무대</a></li>
                                            <li><a href="/project/project.do?schCate=005004">도시/환경</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/project/project.do?schCate=006">정보</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=006001">UX</a></li>
                                            <li><a href="/project/project.do?schCate=006003">웹</a></li>
                                            <li><a href="/project/project.do?schCate=006004">게임</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=006002">UI</a></li>
                                            <li><a href="/project/project.do?schCate=006005">소리/음악</a></li>
                                            <li><a href="/project/project.do?schCate=006006">음식/요리법</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="r/project/project.do?schCate=007">자연</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=007001">동물 디자인</a></li>
                                            <li><a href="/project/project.do?schCate=007002">식물 디자인</a></li>
                                            <li><a href="/project/project.do?schCate=007003">지구 디자인</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/project/project.do?schCate=007004">우주 디자인</a></li>
                                            <li><a href="/project/project.do?schCate=007005">디자인 역사</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">새분야</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!--designer-->
                <ul class="nav navbar-nav">
                    <li class="dropdown mega-dropdown3">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">디자이너<br><span>Designer</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/designer/designer.do">디자이너</a></li>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                <h4><small>Summer dress floral prints</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                <h4><small>Gold sandals with shiny touch</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                <h4><small>Denin jacket stamped</small></h4>
                                            </div>
                                            <!-- End Item -->
                                        </div>
                                        <!-- End Carousel Inner -->
                                    </div>
                                    <!-- /.carousel -->
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/designer/designer.do?schCate=001">의상</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=001001">전통의상</a></li>
                                            <li><a href="/designer/designer.do?schCate=001001001">한복</a></li>
                                            <li><a href="/designer/designer.do?schCate=001001002">중국 의상</a></li>
                                            <li><a href="/designer/designer.do?schCate=001001003">일본 의상</a></li>
                                            <li><a href="/designer/designer.do?schCate=001001004">동양 의상</a></li>
                                            <li><a href="/designer/designer.do?schCate=001001005">서양 의상</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=001002">남성복</a></li>
                                            <li><a href="/designer/designer.do?schCate=001003">여성복</a></li>
                                            <li><a href="/designer/designer.do?schCate=001004">아동복</a></li>
                                            <li><a href="/designer/designer.do?schCate=001005">패션잡화</a></li>
                                            <li><a href="/designer/designer.do?schCate=001005005">신발</a></li>
                                            <li><a href="/designer/designer.do?schCate=001006">액세서리</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/designer/designer.do?schCate=002">산업</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=002001">기계</a></li>
                                            <li><a href="/designer/designer.do?schCate=002002">기기/기구</a></li>
                                            <li><a href="/designer/designer.do?schCate=002002001">컴퓨터</a></li>
                                            <li><a href="/designer/designer.do?schCate=002002002">가전</a></li>
                                            <li><a href="/designer/designer.do?schCate=002005">식품</a></li>

                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=002003">자동차/운송</a></li>
                                            <li><a href="/designer/designer.do?schCate=002004">로봇</a></li>
                                            <li><a href="/designer/designer.do?schCate=002003">가구</a></li>
                                            <li><a href="/designer/designer.do?schCate=002002004">완구</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/designer/designer.do?schCate=003">시각</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=003001">그래픽</a></li>
                                            <li><a href="/designer/designer.do?schCate=003002">영상</a></li>
                                            <li><a href="/designer/designer.do?schCate=003004">광고</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=003005">포장</a></li>
                                            <li><a href="/designer/designer.do?schCate=003006">캐릭터</a></li>
                                            <li><a href="/designer/designer.do?schCate=003007">서체</a></li>

                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a herf="/designer/designer.do?schCate=004">공예</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=004001">금속공예</a></li>
                                            <li><a href="/designer/designer.do?schCate=004002">도자공예</a></li>
                                            <li><a href="/designer/designer.do?schCate=004003">목공예</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=004004">수공예</a></li>
                                            <li><a href="/designer/designer.do?schCate=004005">유리공예</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/designer/designer.do?schCate=005"></a>공간</li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=005001">건축</a></li>
                                            <li><a href="/designer/designer.do?schCate=005002">인테리어</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=005003">무대</a></li>
                                            <li><a href="/designer/designer.do?schCate=005004">도시/환경</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/designer/designer.do?schCate=006">정보</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=006001">UX</a></li>
                                            <li><a href="/designer/designer.do?schCate=006003">웹</a></li>
                                            <li><a href="/designer/designer.do?schCate=006004">게임</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/designer/designer.do?schCate=006002">UI</a></li>
                                            <li><a href="/designer/designer.do?schCate=006005">소리/음악</a></li>
                                            <li><a href="/designer/designer.do?schCate=006006">음식/요리법</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">새분야</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!--producer-->
                <ul class="nav navbar-nav">
                    <li class="dropdown mega-dropdown4">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">프로듀서<br><span>Producer</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/producer/producer.do">프로듀서</a></li>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                <h4><small>Summer dress floral prints</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                <h4><small>Gold sandals with shiny touch</small></h4>
                                            </div>
                                            <!-- End Item -->
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                <h4><small>Denin jacket stamped</small></h4>
                                            </div>
                                            <!-- End Item -->
                                        </div>
                                        <!-- End Carousel Inner -->
                                    </div>
                                    <!-- /.carousel -->
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/producer/producer.do?schCate=001">의상</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=001001">전통의상</a></li>
                                            <li><a href="/producer/producer.do?schCate=001001001">한복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001001002">중국 의상</a></li>
                                            <li><a href="/producer/producer.do?schCate=001001003">일본 의상</a></li>
                                            <li><a href="/producer/producer.do?schCate=001001004">동양 의상</a></li>
                                            <li><a href="/producer/producer.do?schCate=001001005">서양 의상</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=001002">남성복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001003">여성복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001004">아동복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001005">패션잡화</a></li>
                                            <li><a href="/producer/producer.do?schCate=001005005">신발</a></li>
                                            <li><a href="/producer/producer.do?schCate=001006">액세서리</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/producer/producer.do?schCate=002">산업</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=002001">기계</a></li>
                                            <li><a href="/producer/producer.do?schCate=002002">기기/기구</a></li>
                                            <li><a href="/producer/producer.do?schCate=002002001">컴퓨터</a></li>
                                            <li><a href="/producer/producer.do?schCate=002002002">가전</a></li>
                                            <li><a href="/producer/producer.do?schCate=002005">식품</a></li>

                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=002003">자동차/운송</a></li>
                                            <li><a href="/producer/producer.do?schCate=002004">로봇</a></li>
                                            <li><a href="/producer/producer.do?schCate=002003">가구</a></li>
                                            <li><a href="/producer/producer.do?schCate=002002004">완구</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/producer/producer.do?schCate=003">시각</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=003001">그래픽</a></li>
                                            <li><a href="/producer/producer.do?schCate=003002">영상</a></li>
                                            <li><a href="/producer/producer.do?schCate=003004">광고</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=003005">포장</a></li>
                                            <li><a href="/producer/producer.do?schCate=003006">캐릭터</a></li>
                                            <li><a href="/producer/producer.do?schCate=003007">서체</a></li>

                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a herf="/producer/producer.do?schCate=004">공예</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=004001">금속공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004002">도자공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004003">목공예</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=004004">수공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004005">유리공예</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header"><a href="/producer/producer.do?schCate=005"></a>공간</li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=005001">건축</a></li>
                                            <li><a href="/producer/producer.do?schCate=005002">인테리어</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=005003">무대</a></li>
                                            <li><a href="/producer/producer.do?schCate=005004">도시/환경</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-3">
                                <ul>
                                    <li class="dropdown-header"><a href="/producer/producer.do?schCate=006">정보</a></li>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=006001">UX</a></li>
                                            <li><a href="/producer/producer.do?schCate=006003">웹</a></li>
                                            <li><a href="/producer/producer.do?schCate=006004">게임</a></li>
                                        </div>
                                        <div class="col-sm-6">
                                            <li><a href="/producer/producer.do?schCate=006002">UI</a></li>
                                            <li><a href="/producer/producer.do?schCate=006005">소리/음악</a></li>
                                            <li><a href="/producer/producer.do?schCate=006006">음식/요리법</a></li>
                                        </div>
                                    </div>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">새분야</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="width: 200px">
                            <div id="custom-search-input">
                                <div class="input-group col-md-12">
                                    <input type="text" class="  search-query form-control" placeholder="Search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /.nav-collapse -->
        </nav>
    </div>
</div>
<!--carousel-->
<div id="sec2" class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">
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
            <div class="overlay"></div>

            <div class="slide-1"></div>
            <div class="hero">
                <hgroup>
                    <h1>We are creative</h1>
                    <h3>Get start your next awesome project</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">See all features</button>
            </div>
        </div>
        <div class="item slides">
            <div class="overlay"></div>

            <div class="slide-2"></div>
            <div class="hero">
                <hgroup>
                    <h1>We are smart</h1>
                    <h3>Get start your next awesome project</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">See all features</button>
            </div>
        </div>
        <div class="item slides">
            <div class="overlay"></div>

            <div class="slide-3"></div>
            <div class="hero">
                <hgroup>
                    <h1>We are amazing</h1>
                    <h3>Get start your next awesome project</h3>
                </hgroup>
                <button class="btn btn-hero btn-lg" role="button">See all features</button>
            </div>
        </div>
    </div>
</div>


<div id="sec3"class="container" style="margin-top: 50px">
    <button class="btn btn-danger">추천 디자이너/제작</button>
    <div class="best row" style="margin-top: 50px">
    	<div class="best-inner">
   			<div class="swiper-wrapper" id="designView">
   			</div>
   			<div class="slide-btn hide">
   				<button type="button" class="btn-prevSlide purchase-prev"><img src="../resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
   				<button type="button" class="btn-nextSlide purchase-next"><img src="../resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
   			</div>
	    </div>
    </div>
</div>
<div id="sec4"class="container" style="margin-top: 50px">
    <button class="btn btn-danger">우수 디자이너 프로젝트</button>
    <div class="row" style="margin-top: 50px">
				<div id="productView">					
				</div>
        <div class="col-xs-6 col-sm-3">
            <div class="thumbnail">
                <a target="_blank">
                    <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" style="width:100%">
                    <div class="caption">
                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                    </div>
                </a>
                <p class="text-right"><span style="color: red">Designer</span> 홍길동</p>
                <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3">
            <div class="thumbnail">
                <a target="_blank">
                    <img src="https://mir-s3-cdn-cf.behance.net/projects/202/65b08546799297.Y3JvcCw3MjQsNTY2LDEzNCwzMw.jpg" alt="Nature" style="width:100%">
                    <div class="caption">
                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                    </div>
                </a>
                <p class="text-right"><span style="color: red">Designer</span> 홍길동</p>
                <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3">
            <div class="thumbnail">
                <a target="_blank">
                    <img src="https://mir-s3-cdn-cf.behance.net/projects/202/2d24bd45367581.Y3JvcCwxMzc2LDEwNzcsNTAsMA.png" alt="Fjords" style="width:100%">
                    <div class="caption">
                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                    </div>
                </a>
                <p class="text-right"><span style="color: red">Designer</span> 홍길동</p>
                <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3">
            <div class="thumbnail">
                <a target="_blank">
                    <img src="https://mir-s3-cdn-cf.behance.net/projects/202/b73e7746845113.Y3JvcCwyMDA0LDE1NjksMCwxOTg.jpg" style="width:100%">
                    <div class="caption">
                        <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
                    </div>
                </a>
                <p class="text-right"><span style="color: red">Designer</span> 홍길동</p>
                <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                    <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="sec5"class="container" style="margin-top: 50px">
<!-- 디자인버튼 눌렀을 시 처리 -->
<script type="text/javascript">
  $(document).on("click",".des",function(){
 	 var seq = $(this).attr('id');
 	 if(seq)
	 $('.modal').attr('id','modal'+seq);
//    $('div.modal').modal({remote : '/product/productView.do?seq='+seq});
			$.get("/product/productView.do?seq="+seq, function(html){
                $(".modal-content").html(html);
                $('.modal').modal('show');                
			});
 });
 
</script>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 <div class="modal-dialog">
        <div class="modal-content modal-content-one">
	        <!-- remote ajax call이 되는영역 -->
	    </div>
	  </div>
	</div>
</div>

<section class="footer" style="margin-top: 50px">
    <div class="container">
        <div class="row">
            <div class="col-lg-4  col-md-4 col-sm-4">
                <div class="footer_dv">
                    <h4>Services</h4>
                    <ul>
                        <li class="line_rv"><a href="canon-printer-support.php">Canon Printer Support</a></li>

                        <li><a href="hp-printer-support.php">Hp printer Support</a></li>
                        <li><a href="dell-printer-support.php">Dell Printer Support</a></li>
                        <li><a href="epson-printer-support.php">Epson printer Support</a></li>
                        <li><a href="samsung-printer-support.php">Samsung Printer Support</a></li>
                        <li><a href="lexmark-printer-support.php">Lexmark Printer Support</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4  col-md-4 col-sm-4">
                <div class="footer_dv">
                    <h4>Services</h4>
                    <ul>
                        <li><a href="tosiba-printer-support.php">Toshiba Printer Support</a></li>
                        <li><a href="panasonic-printer-support.php">Panasonic Printer Support</a></li>
                        <li><a href="xerox-printer-support.php">Xerox Printer Support</a></li>
                        <li><a href="brother-printer-support.php">Brother printer support</a></li>
                        <li><a href="zebra-printer-support.php">Zebra printer support</a></li>
                        <li><a href="lenovo-printer-support.php">Lenovo printer Support</a></li>


                    </ul>
                </div>
            </div>
            <div class="col-lg-4  col-md-4 col-sm-4">
                <div class="footer_dv">
                    <h4>Contact us</h4>
                    <p>Printer customer Support</p>
                    <p>USA (TOLL FREE) 9125772929<br>

                    </p></div>
            </div>
        </div>
    </div>
</section>


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
	var gb_product_limitCnt = 10;
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
								<img src="{{:imageUrl}}" onerror="setDefaultImg(this, 1);" alt="{{:uname}}" style="width:100%">
							</div>
							<div class="caption col-sm-6">
								<p style="display:inline"><span style="color:red">Designer</span>{{:uname}}</p>
								<button class="btn btn-danger" style="border-radius:15px;font-size:5px;float:right">팔로우</button>
								<p style="font-size:5px;margin-top:30px">{{:cateNames}}</p>
								<div style="letter-spacing:10px;color:red;margin-top:20px" align="center">
									<span class="portfolio"><img src="/resources/image/common/ico_portfolio.png" alt="포트폴리오"> {{:workCntF}}</span>
									{{if !curUserLikedYN }}
									<span class="like"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
									{{else}}
									<span class="like"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
									{{/if}}
									<span class="hit"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
								</div>
							</div>
								<div class="col-sm-12" style="margin-top:10px">
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
			<a href="javascript:goProductView('{{:seq}}');" style="width:301px;height:271px;" >
				<img src="{{:thumbUri}}" onerror="setDefaultImg(this, 3);" alt="" style="width:100%"/>
				<div class="caption">
					<p >{{:title}}</p>
				</div>
				<p class="text-right"><span style="color:red">Designer</span>{{:memberName}}</p>
				<p class="cate" >{{:cateNames}}&nbsp;</p>
				<div style="letter-spacing: 10px; color:red; margin-top:20px" align="center">
					{{if !curUserLikedYN }}
					<span class="like"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:likeCntF}}</span>
					{{else}}
					<span class="like"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:likeCntF}}</span>
					{{/if}}
					<span class="hit"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:viewCntF}}</span>
					<span class="update">{{:displayTime}}</span>
				</div>
			</a>
		</div>
	</div>
</script>
</body>
</html>
