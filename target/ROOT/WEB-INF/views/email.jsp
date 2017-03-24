<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
 <%@include file="/WEB-INF/views/common/head.jsp"%>
 
</head>

<body>

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">프로젝트<br><span>Design Project</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/project/project.do">프로젝트</a></li>
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

                <!--로그인-->
                <ul class="nav navbar-nav navbar-right" style="margin-left: 30px">
                    <li>
                        <a style="padding: 10px">
                            <button  type="button" data-toggle="modal" data-target="#myModal_login" class="btn btn-login" style="padding: 10px;border-radius: 20px"><span class="glyphicon glyphicon-user" style="color:red;border: 1px red solid;border-radius: 15px;padding: 5px"></span> 로그인/회원가입</button>
                        </a>
                        <!-- 로그인 모달 -->
                        <div class="modal-login fade" id="myModal_login" role="dialog">
                            <div class="modal-dialog-login">
                                <!-- Modal content-->
                                <div class="modal-content-login">
                                    <div class="modal-body" style="padding: 30px">
                                        <form>
                                            <h3>로그인</h3>

                                            <div class="form-group">
                                                <input type="email" class="form-control" id="email" placeholder="이메일">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="pwd" placeholder="비밀번호">
                                            </div>
                                            <button type="submit" class="btn btn-red" style="width: 100%;margin-top: 10px">로그인</button>
                                            <button type="button" class="btn btn-facebook" style="margin-top: 3px;width: 100%">페이스북으로 로그인</button>
                                            <button type="button" data-toggle="modal" data-dismiss="" data-target="#myModal_regi" class="btn btn-red" style="margin-top:15px;width: 100%;">회원가입</button>
                                            <button type="button" data-toggle="modal" data-dismiss="" data-target="#myModal_found" class="btn btn-red" style="margin-top:3px;width: 100%;">비밀번호찾기</button>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--회원가입 모달1-->
                        <div class="modal-login fade" id="myModal_regi" role="dialog">
                            <div class="modal-dialog-login">
                                <!-- Modal content-->
                                <div class="modal-content-login">
                                    <div class="modal-body" style="padding: 30px">
                                        <form>
                                            <h3>회원가입</h3>
                                            <div class="form-group">
                                                <input type="email" class="form-control" id="email" placeholder="이메일">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="pwd" placeholder="비밀번호">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="re_pwd" placeholder="비밀번호 확인">
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox">이용약관과 개인정보수집 <br>및 이용에 동의합니다</label>
                                            </div>
                                            <button type="button" data-toggle="modal" data-dismiss="" data-target="#myModal_regi2" class="btn btn-red" style="margin-top:15px;width: 100%;">회원가입</button>

                                        </form>

                                    </div>
                                </div>

                            </div>

                        </div>
                        <!--비번찾기 모달-->
                        <div class="modal-login fade" id="myModal_found" role="dialog">
                            <div class="modal-dialog-login">

                                <!-- Modal content-->
                                <div class="modal-content-login">
                                    <div class="modal-body" style="padding: 30px">
                                        <h3>비밀번호 찾기</h3>
                                        <form>
                                            <div class="form-group">
                                                <input type="email" class="form-control" id="email" placeholder="이메일">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="code" placeholder="보안코드">
                                            </div>
                                            <button type="submit"class="btn btn-red" style="margin-top:3px;width: 100%;">비밀번호찾기</button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </li>
                </ul>

                <!--회원가입 모달2-->
                <div class="modal-login fade" id="myModal_regi2" role="dialog">
                    <div class="modal-dialog-regi">
                        <!-- Modal content-->
                        <div class="modal-content-login">
                            <div class="modal-body" style="padding: 30px">
                                <form>
                                    <h3>회원가입</h3>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input id="Upload photo" name="Upload photo" class="" type="file">
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="nick" placeholder="닉네임 또는 회사명 최대 20자">
                                            </div>
                                            <div class="form-group">
                                                <textarea  placeholder="자기소개 또는 회사소개 최대 1000자" class="form-control" rows="5" id="comment"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <p align="left">나의 카테고리</p>
                                    <div class="row">
                                            <div class="form-group col-sm-4">
                                                <select class="form-control" id="sel1">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                </select>
                                            </div>
                                        <div class="form-group col-sm-4">
                                                <select class="form-control" id="sel2">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                </select>
                                            </div>
                                        <div class="form-group col-sm-4">
                                                <select class="form-control" id="sel3">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                </select>
                                            </div>
                                    </div>
                                    <p align="left">나의 거주지역</p>
                                    <div class="form-group">
                                        <select class="form-control" id="sel1">
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                        </select>
                                    </div>

                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="">디자이너
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" value="">제작자
                                    </label>




                                    <button type="submit" data-toggle="modal" data-dismiss="" data-target="#myModal_regi2" class="btn btn-red" style="margin-top:15px;width: 100%;">회원가입</button>

                                </form>

                            </div>
                        </div>

                    </div>

                </div>

                <!--로그인 했을 시-->
                <!--로그아웃-->
                <ul class="nav navbar-nav navbar-right" style="margin-left: 30px">
                    <li>
                        <a style="padding: 10px">
                            <button  type="button" class="btn btn-login" style="padding: 10px;border-radius: 20px"><img src="http://cfile212.uf.daum.net/image/1557B20A49550EF90F6921" class="img-circle" style="width: 30px;border: 1px red solid"> 로그아웃</button>
                        </a>
                    </li>
                </ul>
                <!--마이페이지&알람&채팅-->
                <ul class="nav navbar-nav navbar-right">
                    <li style="margin-right: 10px;width: 100px">
                        <a style="padding: 10px 0px 10px 0px;width: 100px">
                            <button  type="button" class="btn btn-login" style="padding: 10px;border-radius: 20px"><span class="glyphicon glyphicon-user" style="color:red;border: 1px red solid;border-radius: 15px;padding: 5px"></span>마에페이지</button>
                        </a>
                    </li>
                    <li style="width: 10px;margin-right: 40px">
                        <a style="padding: 10px 0px 10px 0px">
                            <button  type="button" class="btn btn-login" style="padding: 10px;border-radius: 20px"><span class="glyphicon glyphicon-bell" style="color:red;border-radius: 15px;padding: 5px"></span></button>
                        </a>
                    </li>
                    <li style="width: 10px">
                        <a style="padding: 10px 0px 10px 0px">
                            <button  type="button" class="btn btn-login" style="padding: 10px;border-radius: 20px"><span class="glyphicon glyphicon-comment" style="color:red;border-radius: 15px;padding: 5px"></span></button>
                        </a>
                    </li>
                </ul>
                <!--서치창-->
                <ul class="nav navbar-nav">
                    <li>
                        <a style="width: 250px">
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
    <div class="container maintitle" >
        <span style="color:red;background-color:white;font-weight: 600;font-size: 25px;padding: 3px 6px 3px 6px">D</span>
        <span class="maintitle2">이 달의 디자이너 프로젝트</span>
        <span class="maintitle3">Best Desiner Project</span>
    </div>

    <div class="row" style="margin-top: 50px">
        <div class="col-xs-12 col-sm-4">
            <div class="thumbnail">
                <a target="_blank">
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" style="width:100%">
                        </div>
                        <div class="caption col-sm-6">
                            <p style="display:inline"><span style="color: red">Designer</span> 홍길동</p>
                            <button class="btn btn-danger" style="border-radius: 15px;font-size: 5px;float: right">팔로우</button>
                            <p style="font-size:5px;margin-top: 30px">그래픽 디자인, 웹디자인</p>
                            <p style="font-size:5px">그래픽 디자인, 웹디자인</p>
                            <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="col-sm-12" style="margin-top: 10px">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <div class="thumbnail">
                <a target="_blank">
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" style="width:100%">
                        </div>
                        <div class="caption col-sm-6">
                             <p style="display:inline"><span style="color: red">Designer</span> 홍길동</p>
                             <button class="btn btn-danger" style="border-radius: 15px;font-size: 5px;float: right">팔로우</button>
                             <p style="font-size:5px;margin-top: 30px">그래픽 디자인, 웹디자인</p>
                             <p style="font-size:5px">그래픽 디자인, 웹디자인</p>
                            <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="col-sm-12" style="margin-top: 10px">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <div class="thumbnail">
                <a target="_blank">
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" style="width:100%">
                        </div>
                        <div class="caption col-sm-6">
                            <p style="display:inline"><span style="color: red">Designer</span> 홍길동</p>
                            <button class="btn btn-danger" style="border-radius: 15px;font-size: 5px;float: right">팔로우</button>
                            <p style="font-size:5px;margin-top: 30px">그래픽 디자인, 웹디자인</p>
                            <p style="font-size:5px">그래픽 디자인, 웹디자인</p>
                            <div style="letter-spacing: 10px;color: red;margin-top: 20px" align="center">
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
                            </div>
                        </div>
                        <div class="col-sm-12" style="margin-top: 10px">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                            <img src="https://mir-s3-cdn-cf.behance.net/projects/202/faa65347058385.587492de7cc9a.jpg" alt="Lights" width="24%">
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div id="sec4"class="container" style="margin-top: 50px">
    <div id="sec3"class="container maintitle" >
        <span style="color:red;background-color:white;font-weight: 600;font-size: 25px;padding: 3px 6px 3px 6px">D</span>
        <span class="maintitle2">추천 디자인</span>
        <span class="maintitle3">Design recommendation</span>
    </div>

    <div class="row" style="margin-top: 50px">
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



<!--footer-->
<section class="footer" style="margin-top: 50px">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="footer_dv">
                    <p>
                            ©2017 Open Design Inc.</p>
                    </div>
            </div>
            <div class="col-sm-2">
                <div class="footer_dv">
                    <a data-toggle="modal" data-target="#modal_introduece">
                        오픈소스디자인 소개</a>
                </div>

            </div>
            <div class="col-sm-2">
                <div class="footer_dv">
                    <a data-toggle="modal" data-target="#modal_use">
                        이용약관</a>
                </div>

            </div>
            <div class="col-sm-2">
                <div class="footer_dv">
                    <a data-toggle="modal" data-target="#modal_personal">
                        개인정보처리방침</a>
                </div>

            </div>
            <div class="col-sm-2">
                <div class="footer_dv">
                    <a data-toggle="modal" data-target="#modal_contact">
                        Contact Us</a>
                </div>

            </div>
        </div>
    </div>
</section>
<!--푸터 모달들-->
<div class="modal fade" id="modal_introduece" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-content-one">
            <div class="modal-header">
                오픈소스디자인 소개
            </div>
            <div class="modal-body">
                준비중 입니다.
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_use" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-content-one">
            <div class="modal-header">
                이용약관
            </div>
            <div class="modal-body">
                <p><b>제1조(목적)</b><br><br> 이 약관은 (주)오픈디자인 회사(전자상거래 사업자)가 운영하는 OpenSrcDesign 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.<br>

                    ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br><br>

                    <b>제2조(정의)</b><br>

                    ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br><br>

                    ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br><br>

                    ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br><br>

                    ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br><br>

                    <b>제3조 (약관 등의 명시와 설명 및 개정)</b><br><br>

                    ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br><br>

                    ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br><br>

                    ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br><br>

                    ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br><br>

                    ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br><br>

                    ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br><br>

                    <b>제4조(서비스의 제공 및 변경)</b><br><br>

                    ① “몰”은 다음과 같은 업무를 수행합니다.<br><br>

                    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
                    2. 구매계약이 체결된 재화 또는 용역의 배송<br>
                    3. 기타 “몰”이 정하는 업무<br><br>

                    ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br><br>

                    ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br><br>

                    ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br><br>

                    <b>제5조(서비스의 중단) </b><br><br>

                    ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br><br>

                    ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br><br>

                    ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br><br>

                    <b>제6조(회원가입) </b><br><br>

                    ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br><br>

                    ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br><br>

                    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
                    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
                    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br><br>

                    ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br><br>

                    ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br><br>

                    <b>제7조(회원 탈퇴 및 자격 상실 등) </b><br><br>

                    ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br><br>

                    ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br><br>

                    1. 가입 신청 시에 허위 내용을 등록한 경우<br>
                    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
                    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>
                    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br><br>

                    ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br><br>

                    ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br><br>

                    <b>제8조(회원에 대한 통지)</b><br><br>

                    ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br><br>

                    ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br><br>

                    <b>제9조(구매신청 및 개인정보 제공 동의 등) </b><br><br>

                    ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. <br>
                    1. 재화 등의 검색 및 선택<br>
                    2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>
                    3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인<br>
                    4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시<br>
                    (예, 마우스 클릭)
                    5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br>
                    6. 결제방법의 선택<br><br>

                    ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)<br><br>


                    ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.<br><br>


                    <b>제10조 (계약의 성립)</b><br><br>

                    ①  “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br><br>

                    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
                    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>
                    3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br><br>

                    ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br><br>

                    ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br><br>

                    <b>제11조(지급방법)</b><br><br>

                    “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.<br><br>

                    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 <br>
                    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>
                    3. 온라인무통장입금<br>
                    4. 전자화폐에 의한 결제<br>
                    5. 수령 시 대금지급<br>
                    6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제<br>
                    7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  <br>
                    8. 기타 전자적 지급 방법에 의한 대금 지급 등<br>

                    <b>제12조(수신확인통지․구매신청 변경 및 취소)</b><br><br>

                    ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br><br>

                    ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.<br><br>

                    <b>제13조(재화 등의 공급)</b><br><br>

                    ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br><br>

                    ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br><br>

                    <b>제14조(환급)</b><br><br>

                    “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br><br>

                    <b>제15조(청약철회 등)</b><br><br>

                    ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. <br><br>

                    ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br><br>

                    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
                    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>
                    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>
                    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br><br>

                    ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br><br>

                    ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br><br>

                    <b>제16조(청약철회 등의 효과)</b><br><br>

                    ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br><br>

                    ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br><br>

                    ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br><br>

                    ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br><br>

                    <b>제17조(개인정보보호)</b><br><br>

                    ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br><br>

                    ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br><br>

                    ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br><br>

                    ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br><br>

                    ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br><br>

                    ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br><br>

                    ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br><br>

                    ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br><br>

                    ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br><br>

                    <b>제18조(“몰“의 의무)</b><br><br>

                    ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.<br><br>

                    ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br><br>

                    ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br><br>

                    ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br><br>

                    <b>제19조(회원의 ID 및 비밀번호에 대한 의무)</b><br><br>

                    ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br><br>

                    ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br><br>

                    ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.<br><br>

                    <b>제20조(이용자의 의무)</b><br><br>

                    이용자는 다음 행위를 하여서는 안 됩니다.<br><br>

                    1. 신청 또는 변경시 허위 내용의 등록<br>
                    2. 타인의 정보 도용<br>
                    3. “몰”에 게시된 정보의 변경<br>
                    4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
                    5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
                    6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
                    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br>

                    <b>제21조(연결“몰”과 피연결“몰” 간의 관계)</b><br><br>

                    ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br><br>

                    ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br><br>

                    <b>제22조(저작권의 귀속 및 이용제한)</b><br><br>

                    ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br><br>

                    ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br><br>

                    ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br><br>

                    <b>제23조(분쟁해결)</b><br><br>

                    ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.<br><br>

                    ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br><br>

                    ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br><br>

                    <b>제24조(재판권 및 준거법)</b><br><br>

                    ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br><br>

                    ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br><br>







                </p>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_personal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-content-one">
            <div class="modal-header">
                개인정보 처리방침
            </div>
            <div class="modal-body">

                <p class="txt">개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>

                <p class="txt"><주식회사 오픈디자인>은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p>

                <p class="txt">- 본 방침은부터 2017년 1월 1일부터 시행됩니다.</p>

                <div>
                    <h2>1. 개인정보의 처리 목적</h2>
                    <p><주식회사 오픈디자인>('http://www.opensrcdesign.kookmin.ac.kr'이하 'OSD')은(는) 개인정보를 다음의 목적을 위해 처리합니다.<br>
                            처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>

                    <h3>가. 홈페이지 회원가입 및 관리</h3>
                    <p>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.</p>

                    <h3>나. 민원사무 처리</h3>
                    <p>민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</p>

                    <h3>다. 재화 또는 서비스 제공</h3>
                    <p>서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.</p>

                    <h3>라. 마케팅 및 광고에의 활용</h3>
                    <p>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.</p>
                </div>

                <div>
                    <h2>2. 개인정보 파일 현황</h2>
                    <p>1. 개인정보 파일명 : osd_privacy</p>
                    <p>- 개인정보 항목 : 비밀번호, 로그인ID, 이름, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그</p>
                    <p>- 수집방법 : 홈페이지</p>
                    <p>- 보유근거 : 개인정보처리방침</p>
                    <p>- 보유기간 : 3년</p>
                    <p>- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월</p>
                </div>

                <div>
                    <h2>3. 개인정보의 처리 및 보유 기간</h2>
                    <p>① <주식회사 오픈디자인>('OSD')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리,보유합니다.</p>
                    <p>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>
                    <p>1.<홈페이지 회원가입 및 관리><br>
                            <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다.<br>
                                -보유근거 : 개인정보처리방침<br>
                                -관련법령 : 1)소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</p>
                    <p>2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년</p>
                    <p>3) 표시/광고에 관한 기록 : 6개월</p>
                </div>

                <div>
                    <h2>4. 개인정보의 제3자 제공에 관한 사항</h2>
                    <p>① <주식회사 오픈디자인>('http://www.opensrcdesign.kookmin.ac.kr'이하 'OSD')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
                    <p>② <주식회사 오픈디자인>('http://www.opensrcdesign.kookmin.ac.kr')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p>
                </div>

                <div>
                    <h2>7. 처리하는 개인정보의 항목 작성</h2>
                    <p>① <주식회사 오픈디자인>('http://www.opensrcdesign.kookmin.ac.kr'이하 'OSD')은(는) 다음의 개인정보 항목을 처리하고 있습니다.
                            1<홈페이지 회원가입 및 관리><br>
                                - 필수항목 : 비밀번호, 로그인ID, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_contact" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content modal-content-one">
            <div class="modal-header">
            </div>
            <div class="modal-body">
            </div>
        </div>
    </div>
</div>



</body>
</html>
