<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	String headerCategoryYN = StringUtils.stripToEmpty(request.getParameter("headerCategoryYN"));
	// default "N"
	if(StringUtils.isEmpty(headerCategoryYN)) {
		headerCategoryYN = "N";
	}
	String uri = request.getRequestURI();
	boolean hideCategories = uri.endsWith("main.jsp") || uri.endsWith("mypage.jsp") || uri.endsWith("search.jsp");
	
%>
 --%>
<script>
    $(document).ready(function () {

        $('.navbar .dropdown').hover(function () {
            $(this).find('.dropdown-menu').first().stop(true, true).slideDown(150);
        }, function () {
            $(this).find('.dropdown-menu').first().stop(true, true).slideUp(105)
        });

        var getState = $(location).attr('pathname');
        getState = getState.substring(1,10);
        if(getState == "designer/") {
            $("#sub-nav1").css('display','inline');
            $("#sec1").css('border-bottom','white');
            $("#menu-designer").css('border-bottom','2px red solid');

            $('.gocate1').click(function () {
                var href = $('.gocate1').attr('href');
                window.location.href = 'designer.do?schCate=001';
            });
            $('.gocate2').click(function () {
                var href = $('.gocate2').attr('href');
                window.location.href = 'designer.do?schCate=002';
            });
            $('.gocate3').click(function () {
                var href = $('.gocate3').attr('href');
                window.location.href = 'designer.do?schCate=003';
            });
            $('.gocate4').click(function () {
                var href = $('.gocate4').attr('href');
                window.location.href = 'designer.do?schCate=004';
            });
            $('.gocate5').click(function () {
                var href = $('.gocate5').attr('href');
                window.location.href = 'designer.do?schCate=005';
            });
            $('.gocate6').click(function () {
                var href = $('.gocate6').attr('href');
                window.location.href = 'designer.do?schCate=006';
            });

            $("#fassion1").html("<a href=\"/designer/designer.do?schCate=001002\">스마트패션</a>");
            $("#fassion2").html("<a href=\"/designer/designer.do?schCate=001003\">의상</a>");
            $("#fassion3").html("<a href=\"/designer/designer.do?schCate=001006\">액세서리</a>");
            $("#fassion4").html("<a href=\"/designer/designer.do?schCate=001005\">패션모듈</a>");

            $("#product1").html("<a href=\"/designer/designer.do?schCate=002003\">스마트카</a>");
            $("#product2").html("<a href=\"/designer/designer.do?schCate=002004\">로봇</a>");
            $("#product3").html("<a href=\"/designer/designer.do?schCate=002002\">기계/기기/기구</a>");
            $("#product4").html("<a href=\"/designer/designer.do?schCate=002001\">센서모듈</a>");

            $("#communication1").html("<a href=\"/designer/designer.do?schCate=003001\">UI/UX</a>");
            $("#communication2").html("<a href=\"/designer/designer.do?schCate=003004\">광고</a>");
            $("#communication3").html("<a href=\"/designer/designer.do?schCate=003003\">웹</a>");
            $("#communication4").html("<a href=\"/designer/designer.do?schCate=003002\">영상</a>");
            $("#communication5").html("<a href=\"/designer/designer.do?schCate=003007\">타이포그래피</a>");

            $("#crafts1").html("<a href=\"/designer/designer.do?schCate=004001\">금속공예</a>");
            $("#crafts2").html("<a href=\"/designer/designer.do?schCate=004002\">도자공예</a>");
            $("#crafts3").html("<a href=\"/designer/designer.do?schCate=004003\">목공예</a>");
            $("#crafts4").html("<a href=\"/designer/designer.do?schCate=004004\">수공예</a>");

            $("#space1").html("<a href=\"/designer/designer.do?schCate=005003\">스마트시티</a>");
            $("#space2").html("<a href=\"/designer/designer.do?schCate=005001\">건축</a>");
            $("#space3").html("<a href=\"/designer/designer.do?schCate=005002\">인테리어</a>");
            $("#space4").html("<a href=\"/designer/designer.do?schCate=005004\">환경</a>");

            $("#entertainment1").html("<a href=\"/designer/designer.do?schCate=006003\">스마트미디어</a>");
            $("#entertainment2").html("<a href=\"/designer/designer.do?schCate=006004\">게임</a>");
            $("#entertainment3").html("<a href=\"/designer/designer.do?schCate=006005\">디지털컨텐츠</a>");
            $("#entertainment4").html("<a href=\"/designer/designer.do?schCate=006006\">서비스</a>");



        }else if(getState=="project/p"){
            $("#sub-nav1").css('display','inline');
            $("#sec1").css('border-bottom','white');
            $("#menu-project").css('border-bottom','2px red solid');
            var getState1 = $(location).attr('href');

            $('.gocate1').click(function () {
                var href = $('.gocate1').attr('href');
                window.location.href = 'project.do?schCate=001';
            });
            $('.gocate2').click(function () {
                var href = $('.gocate2').attr('href');
                window.location.href = 'project.do?schCate=002';
            });
            $('.gocate3').click(function () {
                var href = $('.gocate3').attr('href');
                window.location.href = 'project.do?schCate=003';
            });
            $('.gocate4').click(function () {
                var href = $('.gocate4').attr('href');
                window.location.href = 'project.do?schCate=004';
            });
            $('.gocate5').click(function () {
                var href = $('.gocate5').attr('href');
                window.location.href = 'project.do?schCate=005';
            });
            $('.gocate6').click(function () {
                var href = $('.gocate6').attr('href');
                window.location.href = 'project.do?schCate=006';
            });

            $("#fassion1").html("<a href=\"/project/project.do?schCate=001002\">스마트패션</a>");
            $("#fassion2").html("<a href=\"/project/project.do?schCate=001003\">의상</a>");
            $("#fassion3").html("<a href=\"/project/project.do?schCate=001006\">액세서리</a>");
            $("#fassion4").html("<a href=\"/project/project.do?schCate=001005\">패션모듈</a>");

            $("#product1").html("<a href=\"/project/project.do?schCate=002003\">스마트카</a>");
            $("#product2").html("<a href=\"/project/project.do?schCate=002004\">로봇</a>");
            $("#product3").html("<a href=\"/project/project.do?schCate=002002\">기계/기기/기구</a>");
            $("#product4").html("<a href=\"/project/project.do?schCate=002001\">센서모듈</a>");

            $("#communication1").html("<a href=\"/project/project.do?schCate=003001\">UI/UX</a>");
            $("#communication2").html("<a href=\"/project/project.do?schCate=003004\">광고</a>");
            $("#communication3").html("<a href=\"/project/project.do?schCate=003003\">웹</a>");
            $("#communication4").html("<a href=\"/project/project.do?schCate=003002\">영상</a>");
            $("#communication5").html("<a href=\"/project/project.do?schCate=003007\">타이포그래피</a>");

            $("#crafts1").html("<a href=\"/project/project.do?schCate=004001\">금속공예</a>");
            $("#crafts2").html("<a href=\"/project/project.do?schCate=004002\">도자공예</a>");
            $("#crafts3").html("<a href=\"/project/project.do?schCate=004003\">목공예</a>");
            $("#crafts4").html("<a href=\"/project/project.do?schCate=004004\">수공예</a>");

            $("#space1").html("<a href=\"/project/project.do?schCate=005003\">스마트시티</a>");
            $("#space2").html("<a href=\"/project/project.do?schCate=005001\">건축</a>");
            $("#space3").html("<a href=\"/project/project.do?schCate=005002\">인테리어</a>");
            $("#space4").html("<a href=\"/project/project.do?schCate=005004\">환경</a>");

            $("#entertainment1").html("<a href=\"/project/project.do?schCate=006003\">스마트미디어</a>");
            $("#entertainment2").html("<a href=\"/project/project.do?schCate=006004\">게임</a>");
            $("#entertainment3").html("<a href=\"/project/project.do?schCate=006005\">디지털컨텐츠</a>");
            $("#entertainment4").html("<a href=\"/project/project.do?schCate=006006\">서비스</a>");




        }else if(getState=="product/p"){
        $("#sub-nav1").css('display','inline');
        $("#sec1").css('border-bottom','white');
        $("#menu-design").css('border-bottom','2px red solid');

            $('.gocate1').click(function () {
                var href = $('.gocate1').attr('href');
                window.location.href = 'product.do?schCate=001';
            });
            $('.gocate2').click(function () {
                var href = $('.gocate2').attr('href');
                window.location.href = 'product.do?schCate=002';
            });
            $('.gocate3').click(function () {
                var href = $('.gocate3').attr('href');
                window.location.href = 'product.do?schCate=003';
            });
            $('.gocate4').click(function () {
                var href = $('.gocate4').attr('href');
                window.location.href = 'product.do?schCate=004';
            });
            $('.gocate5').click(function () {
                var href = $('.gocate5').attr('href');
                window.location.href = 'product.do?schCate=005';
            });
            $('.gocate6').click(function () {
                var href = $('.gocate6').attr('href');
                window.location.href = 'product.do?schCate=006';
            });

            $("#fassion1").html("<a href=\"/product/product.do?schCate=001002\">스마트패션</a>");
            $("#fassion2").html("<a href=\"/product/product.do?schCate=001003\">의상</a>");
            $("#fassion3").html("<a href=\"/product/product.do?schCate=001006\">액세서리</a>");
            $("#fassion4").html("<a href=\"/product/product.do?schCate=001005\">패션모듈</a>");

            $("#product1").html("<a href=\"/product/product.do?schCate=002003\">스마트카</a>");
            $("#product2").html("<a href=\"/product/product.do?schCate=002004\">로봇</a>");
            $("#product3").html("<a href=\"/product/product.do?schCate=002002\">기계/기기/기구</a>");
            $("#product4").html("<a href=\"/product/product.do?schCate=002001\">센서모듈</a>");

            $("#communication1").html("<a href=\"/product/product.do?schCate=003001\">UI/UX</a>");
            $("#communication2").html("<a href=\"/product/product.do?schCate=003004\">광고</a>");
            $("#communication3").html("<a href=\"/product/product.do?schCate=003003\">웹</a>");
            $("#communication4").html("<a href=\"/product/product.do?schCate=003002\">영상</a>");
            $("#communication5").html("<a href=\"/product/product.do?schCate=003007\">타이포그래피</a>");

            $("#crafts1").html("<a href=\"/product/product.do?schCate=004001\">금속공예</a>");
            $("#crafts2").html("<a href=\"/product/product.do?schCate=004002\">도자공예</a>");
            $("#crafts3").html("<a href=\"/product/product.do?schCate=004003\">목공예</a>");
            $("#crafts4").html("<a href=\"/product/product.do?schCate=004004\">수공예</a>");

            $("#space1").html("<a href=\"/product/product.do?schCate=005003\">스마트시티</a>");
            $("#space2").html("<a href=\"/product/product.do?schCate=005001\">건축</a>");
            $("#space3").html("<a href=\"/product/product.do?schCate=005002\">인테리어</a>");
            $("#space4").html("<a href=\"/product/product.do?schCate=005004\">환경</a>");

            $("#entertainment1").html("<a href=\"/product/product.do?schCate=006003\">스마트미디어</a>");
            $("#entertainment2").html("<a href=\"/product/product.do?schCate=006004\">게임</a>");
            $("#entertainment3").html("<a href=\"/product/product.do?schCate=006005\">디지털컨텐츠</a>");
            $("#entertainment4").html("<a href=\"/product/product.do?schCate=006006\">서비스</a>");



        }
        else {
        }


    });
</script>
<div id="sec1" class="container-fluid navbar-fixed-top" style="border-bottom: 1px red solid;background-color: white;height: 81px">
    <div class="container" >
        <nav class="navbar navbar-default" style="height: 80px">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/main.do"><img src="/resources/image/logo.jpg" width="80px"></a>
            </div>
            <div class="collapse navbar-collapse js-navbar-collapse" align="center">

                <!--design-->
                <ul class="nav navbar-nav mt-5">
                    <li class="dropdown mega-dropdown">
                        <a href="/product/product.do"><span id="menu-design" class="menuunder" style="padding-bottom: 12px">디자인</span><br></a>
                    </li>
                </ul>
                <!--design project-->
                <ul class="nav navbar-nav mt-5">
                    <li class="dropdown mega-dropdown2">
                        <a href="/project/project.do"><span id="menu-project" style="padding-bottom: 12px" class="menuunder">프로젝트</span></a>
                    </li>
                </ul>
                <!--designer-->
                <ul class="nav navbar-nav mt-5">
                    <li class="dropdown mega-dropdown3">
                        <a href="/designer/designer.do"><span id="menu-designer" style="padding-bottom: 12px" class="menuunder">디자이너</span></a>
                    </li>
                </ul>
                <!--producer-->
<!--
                <ul class="nav navbar-nav mt-5">
                    <li class="dropdown mega-dropdown4">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="menuunder">제작자</span></a>
                        <ul class="dropdown-menu mega-dropdown-menu row" style="width: 90%">
                            <li class="col-sm-3"><ul>
                                    <li class="dropdown-header"><a href="/producer/producer.do">제작자(전체)</a></li>
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                                <h4><small>Summer dress floral prints</small></h4>
                                            </div>
                                            &lt;!&ndash; End Item &ndash;&gt;
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                                <h4><small>Gold sandals with shiny touch</small></h4>
                                            </div>
                                            &lt;!&ndash; End Item &ndash;&gt;
                                            <div class="item">
                                                <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                                <h4><small>Denin jacket stamped</small></h4>
                                            </div>
                                            &lt;!&ndash; End Item &ndash;&gt;
                                        </div>
                                        &lt;!&ndash; End Carousel Inner &ndash;&gt;
                                    </div>
                                    &lt;!&ndash; /.carousel &ndash;&gt;
                                    <li class="divider"></li>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=001">의상</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/producer/producer.do?schCate=001001">전통 의상</a></li>
                                            <li><a href="/producer/producer.do?schCate=001002">남성복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001003">여성복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001004">아동복</a></li>
                                            <li><a href="/producer/producer.do?schCate=001005">패션잡화</a></li>
                                            <li><a href="/producer/producer.do?schCate=001006">액세서리</a></li>
                                            <li><a href="/producer/producer.do?schCate=001007">한복</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=002">공업</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/product/product.do?schCate=002001">기계</a></li>
                                            <li><a href="/product/product.do?schCate=002002">기기/기구</a></li>
                                            <li><a href="/product/product.do?schCate=002003">자동차/운송</a></li>
                                            <li><a href="/product/product.do?schCate=002004">로봇</a></li>
                                            <li><a href="/product/product.do?schCate=002005">식품</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=003">시각</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/producer/producer.do?schCate=003001">그래픽</a></li>
                                            <li><a href="/producer/producer.do?schCate=003002">영상</a></li>
                                            <li><a href="/producer/producer.do?schCate=003003">동영상</a></li>
                                            <li><a href="/producer/producer.do?schCate=003004">광고</a></li>
                                            <li><a href="/producer/producer.do?schCate=003005">포장</a></li>
                                            <li><a href="/producer/producer.do?schCate=003006">캐릭터</a></li>
                                            <li><a href="/producer/producer.do?schCate=003007">서체</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=004">공예</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/producer/producer.do?schCate=004001">금속공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004002">도자공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004003">목공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004004">수공예</a></li>
                                            <li><a href="/producer/producer.do?schCate=004004">유리공예</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=005">공간</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/producer/producer.do?schCate=005001">건축</a></li>
                                            <li><a href="/producer/producer.do?schCate=005002">인테리어</a></li>
                                            <li><a href="/producer/producer.do?schCate=005003">무대</a></li>
                                            <li><a href="/producer/producer.do?schCate=005004">도시/환경</a></li>

                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1 cate_first_depth_size30">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=006">정보</a></li>
                                    <div class="row">
                                        <div>
                                            <li><a href="/producer/producer.do?schCate=006001">UI/UX</a></li>
                                            <li><a href="/producer/producer.do?schCate=006002">인터페이스</a></li>
                                            <li><a href="/producer/producer.do?schCate=006003">웹</a></li>
                                            <li><a href="/producer/producer.do?schCate=006004">게임</a></li>
                                            <li><a href="/producer/producer.do?schCate=006005">소리/음악</a></li>
                                            <li><a href="/producer/producer.do?schCate=006006">음식/요리법</a></li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="col-sm-1">
                                <ul>
                                    <li class="dropdown-header cate_first_depth"><a href="/producer/producer.do?schCate=008">새분야</a></li>
                                    <div class="row">
                                        <div>
                                            &lt;!&ndash;<li><a href="/producer/producer.do?schCate=006001"></a></li>&ndash;&gt;
                                        </div>
                                    </div>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
-->
		<!-- inner 로그인 기능. -->
		<jsp:include page="/openHeaderInner.do" />
		<!-- //inner -->
        <!-- /.nav-collapse -->
            </div>
        </nav>
    </div>
</div>

<div id="sub-nav1"class="container-fluid navbar-fixed-top" style="display:none;border-bottom: 1px red solid;background-color: white;height:51px;top:81px;">
    <div class="container" >
    <nav class="navbar navbar-default" style="margin: 0px">
    <div>
        <ul class="nav navbar-nav">
            <li class="dropdown gocate1">
                <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">패션</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="fassion1"></li>
                    <li id="fassion2"></li>
                    <li id="fassion3"></li>
                    <li id="fassion4"></li>
                </ul>
            </li>
            <li class="dropdown gocate2">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">제품</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="product1"></li>
                    <li id="product2"></li>
                    <li id="product3"></li>
                    <li id="product4"></li>
                </ul>
            </li>
            <li class="dropdown gocate3">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니케이션</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="communication1"></li>
                    <li id="communication2"></li>
                    <li id="communication3"></li>
                    <li id="communication4"></li>
                    <li id="communication5"></li>
                </ul>
            </li>

            <li class="dropdown gocate4">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">공예</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="crafts1"></li>
                    <li id="crafts2"></li>
                    <li id="crafts3"></li>
                    <li id="crafts4"></li>

                </ul>
            </li>

            <li class="dropdown gocate5">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">공간</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="space1"></li>
                    <li id="space2"></li>
                    <li id="space3"></li>
                    <li id="space4"></li>
                </ul>
            </li>
            <li class="dropdown gocate6">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">엔터테인먼트</a>
                <ul class="dropdown-menu" style="margin-top:-5px">
                    <li id="entertainment1"></li>
                    <li id="entertainment2"></li>
                    <li id="entertainment3"></li>
                    <li id="entertainment4"></li>
                    <li id="entertainment5"></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="/designer/designer.do?schCate=008">새분야</a>
            </li>
        </ul>
        </div>
    </nav>
    </div>
</div>
<br><br><br>
<%-- 
<style>

	.nav .active > a{color:#fff; border-radius:2px; background:#bebebe;}
	
	.menuSelected {
		border-radius:2px; 
		background:#bebebe;
	}
	
	.menuSelected a {
		color:#fff;
	}
	
	#menuBox li a {
		padding-left: 10px;
		padding-right: 10px;
	}
	
	/*.mainCategory {
		position: absolute !important;
		padding-left: 78px !important;
		border-bottom: 1px solid #b9b9b9;
		border-top: 1px solid #b9b9b9;
		display: none;
		background-color: #fff;
		width:100% !important;
	}*/
	
	.mainCategory {
		display: none;
	}
	
	/* .mainNavCate {
		border:none;
	} */
	
	.mainNavCate {
		border-top: 1px solid #b9b9b9;
	}
	
	
	
	.header{
		background-color: #fff;
    	width: 100%;
    	position: fixed;
    	z-index:10;
	}
	
	.main-content {
		padding-top: 129px;
	}
	
	.project-content {
		padding-top: 220px;
	}
	
	.list-content {
		padding-top: 220px;
	}
	
	.sub-content {
		padding-top: 150px;
	}
	
	.portfolio-content {
		padding-top: 220px;
	}
	
	.detail-content {
		padding-top: 220px;
	}
	
	.request-content {
		padding-top: 180px;
	}
	
	.search-content {
		padding-top: 180px;
	}
	
	.content {
		padding-top: 220px;
	}
	
</style>
	<!-- header -->
	<div class="header">
		<!-- inner -->
		<jsp:include page="/openHeaderInner.do" />
		<!-- //inner -->
		
		<!-- naver -->
		<div class="nav-section">
			<!-- nav -->
			<script>
				
				//현재 활성화된 메뉴 (1뎁스 카테고리)
				var activeMenu;
				
				//롤오버 메뉴
				var hoverMenu;
				
				//현재 활성화된 카테고리
				var activeCategory;
				
				//자연 카테고리 (필터 대상)
				var natureCategory;
				
				
				var menuList = new Array();
				
				menuList[0] = 	"/product/";
				
				menuList[1] = 	"/project/";
				
				menuList[2] = "/designer/";
								
				menuList[3] = "/producer/";
				
				
				
				$(function(){
					
					natureCategory = $('.nav-cate .depth2').find("#007");
					
					//자연 메뉴 제외한 메뉴들 show
					$('.nav-cate .depth2').children().each(function() {
						
						if( $(this).hasClass('active') ) {
							activeCategory = this;
						}
						
						if( $(this) != natureCategory ) {
							$(this).show();
						}
					})
					
					//메뉴 밖으로 나갔을 경우
					$('#menuArea').mouseleave(function() {
						$('#menuBox li').each(function() {
							$(this).removeClass('menuSelected');
						})
						
						$(activeMenu).addClass("active");
						$(activeCategory).addClass("active");
						
						hoverMenu = activeMenu;
						if( <%=hideCategories%> ) {
							$('.depth2').hide();	
						}
						
						filterMenus(true);
						
					});
					
					//메뉴 롤 오버시
					$('#menuBox li').mouseover(function() {
						
						$(activeMenu).removeClass("active");
						$(activeCategory).removeClass("active");
						
						
						$('#menuBox li').each(function() {
							$(this).removeClass('menuSelected');
						});
						
						$(this).addClass('menuSelected');
						hoverMenu = this;
						$('.depth2').show();
						filterMenus();
					});
					
					
					$('.nav-cate .depth2 > li').mouseover(function() {
						if( activeCategory != this ) {
							$(activeCategory).removeClass("active");
						}
					});
					
					//활성화 메뉴 초기화
					initActiveMenu();
					
				});
				
				function initActiveMenu() {
					
                    var currentPath = window.location.pathname;
					var activeMenuIndex = 0;
					
					for( var i =0; i < menuList.length; i++ ) {
						
						// menuList 변경: '/designer/designer.do' ---> '/designer/';
						var menu = menuList[i];
						if(currentPath.startsWith(menu)) {
							//console.log('>>> menu=' + menu + ', currentPath=' + currentPath);
							activeMenu = $( "#menuBox li:eq("+activeMenuIndex+")" ).get(0);
							$(activeMenu).addClass("active");
							hoverMenu = activeMenu;
							filterMenus(true);
							return;
						}
						
						activeMenuIndex++;
					}
				}
				
				/**
				* 메뉴 필터링
				* 현재는 자연 카테고리만 상단 메뉴에 맞게 필터링 함
				*/
				function filterMenus(mouseLeave) {
					
					if( mouseLeave ) {
						if( $(activeMenu).attr('id') == "product" || $(activeMenu).attr('id') == "project" ) {
							$(natureCategory).show();
						} else {
							$(natureCategory).hide();
						}
					} else {
						
						if( $(hoverMenu).attr('id') == "designer" || $(hoverMenu).attr('id') == "producer" ) {
							$(natureCategory).hide();
						} else {
							$(natureCategory).show();
						}
					}
				}
				
				function searchCategory(searchCode) {
					var menuURI = $(hoverMenu).find('a').attr('href');
					window.location.href = menuURI + "?schCate=" + searchCode;
					//javascript:searchCategory(); schCate=
				}
				
			</script>
			<h2 class="skip">메인메뉴</h2>
			<div id="menuArea">
				<div class="nav">
					<ul id="menuBox">
						<li id="product" class="first"><a href="/product/product.do">디자인</a></li>
						<li id="project"><a href="/project/project.do">프로젝트</a></li>
						<li id="designer"><a href="/designer/designer.do">디자이너</a></li>
						<li id="producer" class="last"><a href="/producer/producer.do">제작자</a></li>
					</ul>
				</div>
				<!-- 카테고리 -->
				<% if("Y".equals(headerCategoryYN) ) { %>
				
				<div class="nav-cate <%=hideCategories ? "mainNavCate" : "" %>">
					<ul class="depth2 <%=hideCategories ? "mainCategory" : "" %>" >
						<jsp:include page="/openHeaderNaverCate.do" />
					</ul>
				</div>
				
				<% } %>
				<!-- //카테고리 -->
			</div>
		</div>
		<!-- //naver -->
	</div>
	<!-- //header --> --%>