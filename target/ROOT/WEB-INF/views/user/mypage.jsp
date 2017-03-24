<%-- 화면ID : OD01-02-01 --%>
<%-- 화면ID : OD01-02-02 --%>
<%-- 화면ID : OD01-02-03 --%>
<%-- 화면ID : OD01-03-01 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.MemberCategoryVO"%>
<%@page import="com.opendesign.vo.MyUserVO"%>
<%@page import="com.opendesign.vo.UserVO"%>
<%@page import="com.opendesign.vo.MyUserPointVO"%>
<%@page import="com.opendesign.utils.StringUtil"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
List<MemberCategoryVO> cateList = (List<MemberCategoryVO>)request.getAttribute("cateList");
List<UserVO> myInfoList = (List<UserVO>)request.getAttribute("myInfoList");

		String userName = (String)request.getAttribute("UserName");
		String comment = (String)request.getAttribute("Comment");
		String imageUrl = (String)request.getAttribute("ImageUrl");
		String memType = (String)request.getAttribute("MemType");

		if( myInfoList != null ){
		for (UserVO mVo : myInfoList) {
            userName = (String) mVo.getUname().toString();
            comment = (String) mVo.getComments().toString();
            imageUrl = (String) mVo.getImageUrl().toString();
            memType = (String) mVo.getMemberType().toString();
    		}
		}

		String myPoint = (String)request.getAttribute("MyPoint").toString();
		String myPointF = CmnUtil.nFormatter(myPoint);
		myPoint = CmnUtil.getDisplayNumber(myPoint);

		Integer cntWork = (Integer)request.getAttribute("cntWork");
		Integer cntLike = (Integer)request.getAttribute("cntLike");
		Integer cntTalk = (Integer)request.getAttribute("cntTalk");

		String cntWorkF = CmnUtil.nFormatter(cntWork);
		String cntLikeF = CmnUtil.nFormatter(cntLike);
		String cntTalkF = CmnUtil.nFormatter(cntTalk);

		Integer memberSeq = (Integer)request.getAttribute("memberSeq");
		Integer chkLayer = (Integer)request.getAttribute("chkLayer");
        String divLayer;
        if ( "00".equals(memType) == false && chkLayer <= 0){
            divLayer = "";
            }else{
				divLayer = "style='display:none;'";
            }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/WEB-INF/views/common/head.jsp"%>
	<div class="modal fade" id="modal-my" role="dialog" style="z-index:10000">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content-design-my modal-content-one" style="height:100%; >
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="title"></h4>
				</div>
				<div class="modal-body">
					<p id="content"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
    <!--모달창 끄기-->
<script>
    //ESC
 $(document).keyup(function(e){
	if(e.keyCode==27){
		modalHide();
       $("#modal-my").modal('hide').data('bs.modal',null);
	}
});

</script>
	<script id="tmpl-projectTemplate" type="text/x-jsrender">
    <li><a href="/project/openProjectDetail.do?projectSeq={{:wseq}}">{{:pjname}}</a></li>
</script>

<script id="tmpl-workTemplate" type="text/x-jsrender">
	<li class="swiper-slide" style="width:283px; height:347px; margin-buttom:20px; padding:15px; background:white; list-style:none; border-bottom:2px solid red;">
		<div class="thumbnail_card" id="{{:wseq}}" data-toggle="modal" data-target="#modal{{:wseq}}">
			<a href="javascript:void(0);" onclick="goProductView({{:wseq}});" >
				 <img src="{{:thumbUri}}" style="width:283px;height:175px"onerror="setDefaultImg(this, 2);" alt="">
					<div class="product-info">
						<p class="product-title">{{:wtitle}}</p>
						<p class="designer">{{:uname}}</p>
					 </div>
					<p class="cate">{{:wcate}}</p>
					 <div class="item-info">
						 <span class="like mr-5"><img src="/resources/image/common/ico_like.png" alt="좋아요"> {{:cntLikeF}}</span>
						 <span class="hit mr-5"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:wvcountF}}</span>
						 <span class="update">{{:displayTime}}</span>
					</div>
			</a>
		</div>
    </li>
</script>


	<script id="tmpl-likeTemplate" type="text/x-jsrender">
	<li class="swiper-slide" style="width:299px; height:347px; padding:15px; background:white;list-style-type:none; border-bottom:2px solid red;" align="center">
	<a href="javascript:goProductView({{:wseq}});" class="thumbnail_card;">
	 <img src="{{:thumbUri}}" style="width:283px;height:175px" onerror="setDefaultImg(this, 2);" alt="">
	 <div class="product-info">
		<p class="product-title">{{:wtitle}}</p>
		<p class="designer">{{:uname}}</p>
	 </div>
	 <p class="cate">{{:wcate}}</p>
	 <div class="item-info">
	 <span class="like mr-5"><img src="/resources/image/common/ico_like_active.png" alt="좋아요"> {{:cntLikeF}}</span>
	 <span class="hit mr-5"><img src="/resources/image/common/ico_hit.png" alt="열람"> {{:wvcountF}}</span>
	 <span class="update">{{:displayTime}}</span>
	 </div>
    </a></li>
</script>

	<script id="tmpl-orderTemplate" type="text/x-jsrender">
   <li class="swiper-slide">
   <a href="javascript:goProductView({{:wseq}});" class="thumbnail_card;">
	<img src="{{:thumbUri}}" alt="" onerror="setDefaultImg(this, 2);">
	 <ul class="purchase-info">
	 <li><span class="sbj">구입날짜</span>{{:displayTimeYMD}}</li>
	 <li><span class="sbj">구입 포인트</span>{{:displayNumber}}pt</li>
	 <li><span class="sbj">작가명</span>{{:uname}}<button type="button" onclick="goShowMsgView({{:useq}}); return false;"><img src="/resources/image/mypage/btn_msg.png" alt="메시지 보내기"></button></li>
	 <li><span class="sbj">디자인 제목</span><span class="ellip1" style="width:100px;display:inline-block;vertical-align:middle;">{{:wtitle}}</span></li>
	</ul>
	</a>
   </li>
</script>


	<script id="tmpl-pointTemplate" type="text/x-jsrender">
   <tr>
	 <td class="first">{{:cntI}}</td>
	 <td>{{:displayTimeYMD}}</td>
	 <td>{{:wsign}}</td>
	 <td>{{:wcomments}}</td>
	 <td>{{:displaywamountF}}pt</td>
	 <td class="last">{{:displaywaccumamountF}}pt</td>
   </tr>
</script>

	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
	<!--<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>  -->

	<!-- ################## 나의그룹 ############################################# -->
	<script id="tmpl-groupTemplate" type="text/x-jsrender">
    <li><a href="javascript:goGroupDetailView('{{:seq}}');">{{:groupName}}</a></li>
</script>
	<script>
        /**
         * group 상세 페이지
         */
        function goGroupDetailView(seq) {
            window.location.href='/project/project.do?schMyGroup=' + seq;
            window.location.href='/project/project.do?schMyGroup=' + seq;
        }
	</script>
	<script>
        var groupListView = null; //나의 그룹 view
        var groupTemplate = null;
        $(function(){
            //뷰
            groupListView = new ListView({
                htmlElement : $('#groupArea')
                ,htmlElementNoData: $('<p class="none">등록되어 있는 그룹이 없습니다.</p>')
            });
            groupTemplate = $('#tmpl-groupTemplate').html();

            // load
            loadGroup();
        });

        function loadGroup() {
            // 조회 및 load : 내가 포함된 그룹 조회
            $.ajax({
                url: '/selectMyGroupList.ajax',
                type: 'get',
                data: { },
                error : function(_data) {
                    console.log(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    // load
                    loadGroupWithData(_data.result);
                }
            });
        }

        function loadGroupWithData(resultDatas) {
            groupListView.clear();

            if(!resultDatas || resultDatas.length == 0) {
                console.log('>>> loadGroupWithData no data.');
                return;
            }
            //
            groupListView.addAll({
                keyName : "seq",
                data : resultDatas,
                htmlTemplate : groupTemplate
            });

            swipeInitGroup();
        }

        function swipeInitGroup() {
            var myGroup = new Swiper('.my-group', {
                scrollbar: '.my-group .swiper-scrollbar',
                direction: 'vertical',
                slidesPerView: 'auto',
                mousewheelControl: true,
                freeMode: true,
                scrollbarHide: false
            });
        }
	</script>
	<!-- ################## ]]나의그룹 ############################################# -->

	<script>
        /**
         * 디자인 상세
         */
        function goProductView(seq) {
		    $('.modal-design').attr('id','modal'+seq);
			$.get("/product/productView.do?seq="+seq, function(html){
				$(".modal-content-design-my").html(html);
				$('#modal-my').modal('show');
			});
        }
	</script>
	<script>
        var memberSeq = '<%=memberSeq%>';

        //뷰 컨트롤러 생성
        var projectView = null;
        var workView = null;
        var likeView = null;
        var orderView = null;
        var pointView = null;

        // 프로젝트 탬플릿
        var projectTemplate = $("#tmpl-projectTemplate").html();

        // 디자인 탬플릿
        var workTemplate = $("#tmpl-workTemplate").html();

        // 관심 탬플릿
        var likeTemplate = $("#tmpl-likeTemplate").html();

        // 구입목록 템플릿
        var orderTemplate = $("#tmpl-orderTemplate").html();

        // 마이포인트 템플릿
        var pointTemplate = $("#tmpl-pointTemplate").html();

        /**
         * 초기화
         */
        $(function(){

            // load
            loadProject();
            loadWork();
            loadLike();
            loadOrder();
            loadPoint();

            // slide-btn init
            $('.slide-btn').hide();


            $("#fromDate").datepicker(
                {
                    numberOfMonths: 1,
                    buttonImage: "/resources/image/mypage/ico_calendar.png", // 버튼 이미지
                    dateFormat: "yy-mm-dd",
                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    changeMonth: false, //월변경가능
                    changeYear: false, //년변경가능
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                    showOn: "both"

                }
            );

            $("#toDate").datepicker(
                {
                    numberOfMonths: 1,
                    buttonImage: "/resources/image/mypage/ico_calendar.png", // 버튼 이미지
                    dateFormat: "yy-mm-dd",
                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                    changeMonth: false, //월변경가능
                    changeYear: false, //년변경가능
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                    showOn: "both"

                }
            );


            $("#1year").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#1year").addClass("active");
                $("#fromDate").val(getCalculatedDate(-1,0,0,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))
            });

            $("#6month").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#6month").addClass("active");
                $("#fromDate").val(getCalculatedDate(0,-6,0,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))
            });

            $("#3month").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#3month").addClass("active");
                $("#fromDate").val(getCalculatedDate(0,-3,0,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))
            });


            $("#1month").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#1month").addClass("active");
                $("#fromDate").val(getCalculatedDate(0,-1,0,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))
            });


            $("#1week").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#1week").addClass("active");
                $("#fromDate").val(getCalculatedDate(0,0,-7,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))

            });

            $("#today").click(function(){
                $('.btn-sorting').find('button').removeClass("active");
                $("#today").addClass("active");
                $("#fromDate").val(getCalculatedDate(0,0,0,'-'))
                $("#toDate").val(getCalculatedDate(0,0,0,'-'))

            });


        });

        // ============== project ===================
        /**
         * 나의 프로젝트 load
         */
        var flag_loadProject = false; //flag
        function loadProject() {

            //뷰 컨트롤러 생성
            projectView = new ListView({
                htmlElement : $('#projectArea')
                ,htmlElementNoData: $('<p class="none">등록되어 있는 프로젝트가 없습니다.</p>')
            });


            if(flag_loadProject) {
                return;
            }
            flag_loadProject = true;

            //alert(memberSeq);

            // 디자인 조회 및 load
            $.ajax({
                url: '/selectProjectList.ajax',
                type: 'get',
                data: { 'memberSeq' : memberSeq },
                complete : function(_data){
                    flag_loadProject = false;
                },
                error : function(_data) {
                    console.log(_data);
                    //alert(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    var projectDatas = _data.projectList;
                    // load
                    //alert(ProjectDatas.length);
                    loadProjectWithData(projectDatas);
                }
            });
        }

        /**
         * 나의 디자인 load
         */
        function loadProjectWithData(projectDatas) {
            projectView.clear();

            if(!projectDatas || projectDatas.length == 0) {
                console.log('>>> loadProjectWithData no data.');
                return;
            }
            // 주제:
            projectView.addAll({
                keyName : "wseq",
                data : projectDatas,
                htmlTemplate : projectTemplate,
            });
            swipeInitProject();
        }

        function swipeInitProject() {
            var myProject = new Swiper('.my-project', {
                scrollbar: '.my-project .swiper-scrollbar',
                direction: 'vertical',
                slidesPerView: 'auto',
                mousewheelControl: true,
                freeMode: true,
                scrollbarHide: false
            });
        }

        // ============== work ===================
        /**
         * 나의 디자인 load
         */
        var flag_loadWork = false; //flag
        function loadWork() {
            //뷰 컨트롤러 생성
            workView = new ListView({
                htmlElement : $('#workArea')
                ,htmlElementNoData: $('<p class="none">등록되어 있는 디자인이 없습니다.</p>')
            });

            if(flag_loadWork) {
                return;
            }
            flag_loadWork = true;

            //alert(memberSeq);

            // 디자인 조회 및 load
            $.ajax({
                url: '/selectProjectWork.ajax',
                type: 'get',
                data: { 'memberSeq' : memberSeq },
                complete : function(_data){
                    flag_loadWork = false;
                },
                error : function(_data) {
                    console.log(_data);
                    //alert(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    var workDatas = _data.workList;
                    // load
                    //alert(workDatas.length);
                    loadWorkWithData(workDatas);
                }
            });
        }

        /**
         * 나의 디자인 load
         */
        function loadWorkWithData(workDatas) {
            workView.clear();

            if(!workDatas || workDatas.length == 0) {
                console.log('>>> loadWorkWithData no data.');
                //$('.portfolio.product-list').append('<div style="width:100%;top:50%;position:absolute;text-align:center;">등록되어 있는 제작물이 없습니다.</div>');
                return;
            }
            // 주제:
            workView.addAll({
                keyName : "wseq",
                data : workDatas,
                htmlTemplate : workTemplate,
            });
            swipeInitWork();
        }

        var workSwipe = null;
        function swipeInitWork() {
            var item = $('.portfolio').find('li').length;

            if(item > 4){
                if( workSwipe == null ) {
                    $('.portfolio').find('.slide-btn').show();
                    workSwipe = new Swiper('.portfolio-slide', {
                        slidesPerView: 4,
                        slidesPerColumn: 1,
                        spaceBetween: 23,
                        nextButton: '.portfolio-next',
                        prevButton: '.portfolio-prev'
                    });
                } else {
                    workSwipe.onResize();
                }
            } else{
                $('.portfolio').find('.slide-btn').hide();
            }
        }

        // ============== like ===================
        var flag_loadLike = false; //flag
        function loadLike() {
            //뷰 컨트롤러 생성
            likeView = new ListView({
                htmlElement : $('#likeArea')
                ,htmlElementNoData: $('<p class="none">등록되어 있는 관심디자인이 없습니다.</p>')
            });
            // 디자인 조회 및 load
            $.ajax({
                url: '/selectProjectLike.ajax',
                type: 'get',
                data: { 'memberSeq' : memberSeq },
                complete : function(_data){
                    flag_loadLike = false;
                },
                error : function(_data) {
                    console.log(_data);
                    //alert(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    var likeDatas = _data.likeList;
                    // load
                    //alert(likeDatas.length);
                    loadLikeWithData(likeDatas);
                }
            });
        }


        function loadLikeWithData(likeDatas) {
            likeView.clear();
            //listView.htmlElement = $('#likeArea');
            if(!likeDatas || likeDatas.length == 0) {
                //$('.favorite.product-list').append('<div style="width:100%;top:50%;position:absolute;text-align:center;">등록되어 있는 관심디자인이 없습니다.</div>');
                console.log('>>> loadLikeWithData no data.');
                return;
            }
            // 주제:
            likeView.add({
                keyName : "wseq",
                data : likeDatas,
                htmlTemplate : likeTemplate,
            });
            swipeInitLike();
        }

        var likeSwipe = null;
        function swipeInitLike() {
            var item2 = $('.favorite').find('li').length;
            if(item2 > 4){
                if(likeSwipe == null) {
                    $('.favorite').find('.slide-btn').show();
                    likeSwipe = new Swiper('.favorite-slide', {
                        slidesPerView: 4,
                        spaceBetween: 23,
                        nextButton: '.favorite-next',
                        prevButton: '.favorite-prev'
                    });
                } else {
                    likeSwipe.onResize();
                }
            } else{
                $('.favorite').find('.slide-btn').hide();
            }
        }


        // ============== order ===================
        var flag_loadOrder = false; //flag
        function loadOrder() {
            //뷰 컨트롤러 생성
            orderView = new ListView({
                htmlElement : $('#orderArea')
                ,htmlElementNoData: $('<p class="none">등록되어 있는 구입디자인이 없습니다.</p>')
            });
            // 디자인 조회 및 load
            $.ajax({
                url: '/selectProjectOrder.ajax',
                type: 'get',
                data: { 'memberSeq' : memberSeq },
                complete : function(_data){
                    flag_loadOrder = false;
                },
                error : function(_data) {
                    console.log(_data);
                    //alert(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    var orderDatas = _data.orderList;
                    // load
                    //alert(orderDatas.length);
                    loadOrderWithData(orderDatas);
                }
            });
        }

        function loadOrderWithData(orderDatas) {
            orderView.clear();
            //listView.htmlElement = $('#orderArea');
            //alert(orderDatas.length);
            if(!orderDatas || orderDatas.length == 0) {
                console.log('>>> loadOrderWithData no data.');
                return;
            }
            // 주제:
            orderView.add({
                keyName : "wseq",
                data : orderDatas,
                htmlTemplate : orderTemplate,
            });
            swipeInitOrder();
        }

        var orderSwipe = null;
        function swipeInitOrder() {
            var item3 = $('.purchase').find('li').length;

            if(item3 > 4*2){
                if(orderSwipe == null) {
                    $('.purchase').find('.slide-btn').show();
                    orderSwipe = new Swiper('.purchase-list', {
                        slidesPerView: 4,
                        //slidesPerColumn: 1,
                        spaceBetween: 14,
                        //slidesPerColumnFill : "row",
                        //simulateTouch: false,
                        nextButton: '.purchase-next',
                        prevButton: '.purchase-prev'
                    });
                } else {
                    orderSwipe.onResize();
                }
            } else{
                $('.purchase').find('.slide-btn').hide();
            }
        }


        // ============== point ===================
        /**
         * 포인트 view
         */
        function loadPoint() {
            //포인트 컨트롤러 생성
            pointView = new ListView({
                htmlElement : $('#pointArea')
                ,htmlElementNoData: $('</p>')
            });

        }

        var flag_loadPoint = false; //flag
        function goSearch()
        {
            var myForm = $('.my-point').find('form');
            var fdate = myForm.find('[name="fromDate"]');
            var tdate = myForm.find('[name="toDate"]');
            if(fdate.val() == '' || tdate.val() == '') {
                alert('조회기간을 선택 선택하세요.');
                return;
            }

            if(flag_loadPoint) {
                return;
            }
            flag_loadPoint = true;
            //alert(myForm.serialize());
            // 퍼가기

            $('#noPointDiv').hide();

            $.ajax({
                url: '/selectMyPoint.ajax',
                type: 'get',
                data: myForm.serialize(),
                complete : function(_data){
                    flag_loadPoint = false;
                },
                error : function(_data) {
                    console.log(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    var pointDatas = _data.pointList;
                    //alert(pointDatas);
                    loadPointWithData(pointDatas);
                }
            });
        }

        function loadPointWithData(pointDatas) {

            pointView.clear();

            //listView.htmlElement.clear();
            //alert(orderDatas.length);
			/*listView._removeByKey({
			 keyName : "point",
			 });*/

            //뷰 컨트롤러 생성

            //listView.htmlElement = $('#pointArea');

            if(!pointDatas || pointDatas.length == 0) {
                console.log('>>> loadpointWithData no data.');
                $('#noPointDiv').show();
                return;
            } else {
                $('#noPointDiv').hide();
            }

            pointView.addAll({
                keyName : "wseq",
                data : pointDatas,
                htmlTemplate : pointTemplate,
            });

        }


        function getCalculatedDate(iYear, iMonth, iDay, seperator)
        {
            //현재 날짜 객체를 얻어옴.
            var gdCurDate = new Date();
            //현재 날짜에 날짜 게산.
            gdCurDate.setYear( gdCurDate.getFullYear() + iYear );
            gdCurDate.setMonth( gdCurDate.getMonth() + iMonth );
            gdCurDate.setDate( gdCurDate.getDate() + iDay );

            //실제 사용할 연, 월, 일 변수 받기.
            var giYear = gdCurDate.getFullYear();
            var giMonth = gdCurDate.getMonth()+1;
            var giDay = gdCurDate.getDate();
            //월, 일의 자릿수를 2자리로 맞춘다.
            giMonth = "0" + giMonth;
            giMonth = giMonth.substring(giMonth.length-2,giMonth.length);
            giDay   = "0" + giDay;
            giDay   = giDay.substring(giDay.length-2,giDay.length);
            //display 형태 맞추기.
            return giYear + seperator + giMonth + seperator +  giDay;
        }

        //가이드 창 닫기
        function closeGuide() {
            $("#guide").css("display", "none");
        }

	</script>

	<style>
		/*카드 내용*/
		.product-title{text-align: left; color:black; padding: 9px}
		.designer{text-align: right; margin-bottom: 10px}
		.cate{text-align:left}
		.like{float:left; padding-right:15px; font-size: 11px;}
		.hit{float:left; font-size: 11px;}
		.item-info{margin-top: 20px; letter-spacing:0px;}
		.update{float:right; font-size: 11px;}

		/* mypage */
		.mypage-wrap{padding:0px 0 0;}
		.sub-title h2{float:left; font-size:46px; font-weight:400; color:#414141;}
		.sub-title h2 img{width:75px; margin:0 15px 0 0;}
		.sub-title .btn-modi{float:left; width:83px; height:27px; margin:40px 0 0 10px; font-size:14px; text-align:center; color:#fff; line-height:27px; border-radius:5px; background:red;}
		.sub-title .btn-regi{float:right; width:123px; height:42px; margin:30px 20px 0 0; padding:0 0 0 0px; font-size:15px; text-align:center; color:#fff; line-height:42px; border-radius:7px; background:red; url(../image/mypage/blt_regi.png) no-repeat 34px 11px;}
		.regi-guide{position:absolute; top:100px; right:500px; width:280px; height:95px; padding:0px 0 0; text-align:center; border:1px solid #a4a4a4; border-radius:5px; background:#113b88;}
		.regi-guide:after{position:absolute; top:50%; right:-33px; width:33px; height:36px; margin:-18px 0 0; content:''; background:url(../image/mypage/blt_arrowRegi.png) no-repeat;}
		.regi-guide p{padding:45px 0 0; font-size:16px; font-weight:700; color:#fff; background:url(../image/mypage/bg_regi.png) no-repeat center top;}
		.mypage-wrap .hello{clear:both; padding:20px 0 30px; color:#737373; line-height:1.5;}
		.my-info{overflow:hidden; margin:0 0 0px; border:1px solid #a4a4a4; background:white;}
		.my-info .info-list{float:left; width:50%; height:300px; padding:30px 0 20px 120px; box-sizing:border-box; border-right:1px solid #a4a4a4; margin: 0px; -15px 0px;}
		.my-info .info-list li{padding:13px 0; font-size:20px; color:#9e9e9e;}
		.my-info .info-list .sbj{display:inline-block; width:250px; color:#414141;}
		.my-info .project{float:left; overflow-y:auto; max-height:300px; width:50%; padding:45px 26px 0 32px; box-sizing:border-box; text-align:center;}
		.my-info .project h3{margin:0 0 15px; font-size:34px; color:black;}
		.my-info .project li{margin:0 0 10px;}
		.my-info .project li:last-child{margin:0;}
		.my-info .project a{display:block; height:46px; padding:0 0 0 48px; font-size:20px; text-align:left; color:#fff; line-height:46px; border-radius:12px;  background:#a4a4a4 url(../image/mypage/blt_project.png) no-repeat 97% center;}
		.my-project{position:relative; min-height:50px; overflow:hidden; padding:0 6px 0 0;}
		.my-project .swiper-slide{overflow:visible;}
		.my-group{position:relative; min-height:50px; overflow:hidden; padding:0 6px 0 0;}
		.my-group .swiper-slide{overflow:visible;}
		.mypage-wrap .hello{clear:both; padding:20px 0 30px; color:#737373; line-height:1.5;}
		.product-list{position:relative; overflow:hidden; margin:0 0 40px; border:0px solid #a4a4a4; background:none;}
		.product-list h3{float:left; width:250px; height:390px; box-sizing:border-box; padding:25px 0 0; font-size:20px; font-weight:400; text-align:center; color:#fff; line-height:390px;}
		.product-list .slide{position:relative; float:left; width:1330px; overflow:hidden; margin:30px 0px 0px; padding-left:15px;}
		.product-list .slide-btn{position:absolute; top:50%; right:0; width:100%;}
		.product-list button{ top:50%; z-index:2; margin:-39px 0 0; border-width: 0px; background: none;}
		.product-list .btn-prevSlide{left:0px; background-color: transparent; float:left;}
		.product-list .btn-nextSlide{right:0px; background-color: transparent; float:right;}
		.product-list .list-type1{margin:0 0px 0 0;}
		.product-list .list-type1 li{width:230px; height:288px; overflow:hidden; margin:0 0 24px; box-sizing:border-box; background-color: white; border-bottom: 1px solid red;}
		.product h3{width:213px; height:54px; font-size:20px; font-weight:400; color:#fff; text-align:center; line-height:54px; background:red url(../image/mypage/bg_purchase.png) no-repeat 45px center; margin-top:0px; margin-bottom:0px;}

		.portfolio{padding:0px; }
		.portfolio h3{width:213px; height:54px; font-size:20px; font-weight:400; color:#fff; text-align:center; line-height:54px; background:red url(../image/mypage/bg_purchase.png) no-repeat 45px center; margin-top:0px; margin-bottom:0px;}
		.favorite h3{width:213px; height:54px; font-size:20px; font-weight:400; color:#fff; text-align:center; line-height:54px; background:red url(../image/mypage/bg_purchase.png) no-repeat 45px center; margin-top:0px; margin-bottom:0px;}
		.purchase h3{width:213px; height:54px; font-size:20px; font-weight:400; color:#fff; text-align:center; line-height:54px; background:red url(../image/mypage/bg_purchase.png) no-repeat 45px center; margin-top:0px; margin-bottom:0px;}
		.purchase-list{position:relative; overflow:hidden; margin:0 0 40px; padding:0px 14px 40px 14px; border:0px; background:none;}
		.purchase-list .slide-btn button{position:absolute; top:50%; z-index:2; margin:-39px 0 0;}
		.purchase-list .purchase-prev{left:0; background: transparent; border: 0px}
		.purchase-list .purchase-next{right:0; background: transparent; border: 0px}
		.list-type3{overflow:hidden;}
		.list-type3 > li{width:296px; background:#fff;}
		.list-type3 > li a{display:block; padding:20px 14px 0; border-bottom:2px solid red;}
		.list-type3 > li a  > img{width:283px; height:208px;}
		.purchase-info{padding:15px 12px 0; font-size:17px; font-weight:700; color:#666;}
		.purchase-info li{margin:0 0 10px; color:#a4a4a4;}
		.purchase-info .sbj{display:inline-block; width:140px; color:#414141;}
		.purchase-info button{margin:0 0 0 9px;}
		.paging a{display:inline-block; width:22px; height:22px; margin:0 2px; font-size:15px; color:#414141; text-align:center; line-height:22px;}
		.paging a.active{display:inline-block; width:22px; height:22px; margin:0 2px; font-size:15px; color:red; text-align:center; line-height:22px;}
		.paging{padding:11px 0 25px; text-align:center;}

		.point-inner{padding:20px 40px 0; background:white; border:1px solid #b1b1b1;}
		.my-point {margin-top:40px}
		.my-point h3{width:213px; height:54px; padding:15px 40px; font-size:20px; color:#fff; background:red; margin-top:0px; margin-bottom:0px; text-align: center;}
		.my-point strong{font-size:26px; color:black;}
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

		<!--틀 맞추기 위해 변경-->
		.h3-red{background-color: red; font-size: 20px;}
		.My-layout{padding:0px; margin:50px 0px 0px; height:460px;}
		.portfolio_icon > span{ font-size:11px;}
		/* swiper */
		.wrap{overflow-x:hidden;}
		.swiper-wrapper{
			padding-left:0px;
			position:relative;
			width:100%;
			height:100%;
			z-index:0;
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

		/* 조회 버튼*/
		.notborder{border-width:0px;}
		.textcenter{text-align: center;}


		.maintitle{width:250px; height:42px;}
		.mainAlpha{color:red;background-color:white;font-weight: 600;font-size: 20px;padding: 3px 6px 0px 6px}
	</style>
</head>
<body>
<div class="wrap" style="margin-top: 40px">
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- //header -->

	<!-- content -->
	<div class="container">

		<!--자기소개 카드-
		<div class="inner mypage-wrap">
				<h2><img src="<%=imageUrl%>" onerror="setDefaultImg(this, 1);" alt="프로필 사진"> <%=userName%>님의 페이지</h2>
				<a href="javascript:goMemModi('<%=memberSeq%>')" class="btn-modi btn-modal">정보수정</a>
				<a href="/product/productRegi.do" class="btn-regi">디자인 등록</a>
				<!-- <a href="#" class="btn-regi">디자인 등록</a>
				<div class="regi-guide" <%=divLayer%> id="guide">
				<button style="background: url('../../../resources/image/common/x-mark-icon-ie.png'); width: 20px; height: 20px; float: right; margin-right: 10px; margin-top: -7px;" onclick="javascript:closeGuide();"></button>
				<p>디자이너 / 제작자인 경우,<br>디자인을 등록해야 메인에 노출이 됩니다!</p>
			</div>
		</div>
		<p class="hello" style="width:1024px; word-wrap:break-word;">
			<%=comment%>
		</p>
		-->
		<!-- 정보수정
		<div class="container" style="padding: 0px; margin-top:40px; border-top: 1px red solid;">
			<div class="row" style="background-color: white; border-bottom: 1px red solid;border-left: 1px red solid;border-right:1px red solid; margin:0px;";>
				<div class="col-sm-5">
					<div class="row" style="border-right: 1px red solid;">
						<div class="col-sm-8" style="padding: 20px 0px 20px 0px">
							<img src="<%=imageUrl%>" onerror="setDefaultImg(this, 1);" alt="프로필 사진" width="200px" height="200px"> <%=userName%>님의 페이지
						</div>
						<div class="col-sm-7" style="padding-left:30px;" align="center">
						</div>
					</div>
				</div>
				<div class="col-sm-7" style="padding:40px 10px 30px 40px;">
					<div class="row">
						<div class="col-sm-8">
							<a href="javascript:goMemModi('<%=memberSeq%>')" class="btn-modi btn-modal">정보수정 /</a>
							<a href="/product/productRegi.do" class="btn-regi">디자인 등록</a>
							<ul class="designer"style="list-style:none; padding-left:0px; text-align:left;"></ul>
							<!-- <a href="#" class="btn-regi">디자인 등록</a>
							<div class="regi-guide" <%=divLayer%> id="guide">
							<button style="background: url('../../../resources/image/common/x-mark-icon-ie.png'); width: 20px; height: 20px; float: right; margin-right: 10px; margin-top: -7px;" onclick="javascript:closeGuide();"></button>
							<p>디자이너 / 제작자인 경우,<br>디자인을 등록해야 메인에 노출이 됩니다!</p>
						</div>
						<p class="hello" style="width:1024px; word-wrap:break-word;">
							<%=comment%>
						</p>
					</div>
				</div>
			</div>
		</div>
		-->
		<div class="sub-content">
			<div class="container mypage-wrap">
				<div class="sub-title">
					<h2><img src="<%=imageUrl%>" onerror="setDefaultImg(this, 1);" alt="프로필 사진"> <%=userName%>님의 페이지</h2>
					<a href="javascript:goMemModi('<%=memberSeq%>')" class="btn-modi btn-modal">정보수정</a>
					<a href="/product/productRegi.do" class="btn-regi">디자인 등록</a>
					<!-- <a href="#" class="btn-regi">디자인 등록</a>-->
						<div class="regi-guide" <%=divLayer%> id="guide">
						<button style="background: url('../../../resources/image/common/x-mark-icon-ie.png'); width: 20px; height: 20px; float: right; margin-right: 10px; margin-top: -7px;" onclick="javascript:closeGuide();"></button>
						<p>디자이너 / 제작자인 경우,<br>디자인을 등록해야 메인에 노출이 됩니다!</p>
				</div>
				<p class="hello" style="width:1024px; word-wrap:break-word;">
					<%=comment%>
				</p>



				<div class="my-info" style="border:1px solid lightgrey">
			<ul class="row info-list">
				<li><span class="sbj">닉네임</span> <%=userName%></li>
				<li><span class="sbj">디자인</span> <%=cntWorkF%> 디자인</li>
				<li><span class="sbj">카테고리</span>
					<%
					String strCagegory = "";
					if( cateList != null ){
					List<String> ctgList = new ArrayList<String>();
						for (MemberCategoryVO myCtg : cateList) {
						ctgList.add(myCtg.getCategoryName());
						}
						strCagegory = StringUtils.join(ctgList, ",");
						}
						%>
						<%=strCagegory%>
				</li>
				<li><span class="sbj">총 좋아요 수</span> 총 <%=cntLikeF%>개</li>
				<%-- <li><span class="sbj">메시지</span> <%=cntTalk%>건</li> --%>
<!--
				<li><span class="sbj">마이 포인트</span> <%=myPointF%> pt</li>
-->
			</ul>
			<div class="project" >
				<h3>나의 프로젝트</h3>
				<div class="my-project">
					<div class="swiper-wrapper">
						<ul class="swiper-slide" style="list-style-type: none;" id="projectArea">
						</ul>
					</div>
					<div class="swiper-scrollbar"></div>
				</div>

				<!-- 나의 그룹 -->
				</br>
				<h3>나의 그룹</h3>
				<div class="my-group">
					<div class="swiper-wrapper" >
						<ul class="swiper-slide" style="list-style-type: none;" id="groupArea">
						</ul>
					</div>
					<div class="swiper-scrollbar"></div>
				</div>
				<!-- //나의 그룹 -->
			</div>
		</div>

		<div class="container portfolio My-layout mt-5">
			<div class="container maintitle" >
				<span class="mainAlpha">D</span>
				<span class="maintitle2 mb-5">최근 등록한 디자인</span>
			</div>
				<div class="portfolio product-list">
			<div class="row">
				<div class="slide portfolio-slide">

					<div class="swiper-wrapper" id="workArea">

					</div>
				</div>
				<div class="slide-btn">
					<button type="button" class="btn-prevSlide portfolio-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
					<button type="button" class="btn-nextSlide portfolio-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
				</div>
			</div>
		</div>
		</div>
		<!--
		<div class="portfolio product-list">
			<h3>최근 등록한 디자인</h3>
			<div class="slide portfolio-slide">
				<ul class="list-type1 swiper-wrapper" id="workArea">
				</ul>
			</div>
			<div class="slide-btn">
				<button type="button" class="btn-prevSlide portfolio-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
				<button type="button" class="btn-nextSlide portfolio-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
			</div>
		</div>
		-->

		<!--
		<div class="favorite product-list">
			<h3>관심 디자인</h3>
			<div class="slide favorite-slide">
				<ul class="list-type1 swiper-wrapper" id="likeArea">
				</ul>
			</div>
			<div class="slide-btn">
				<button type="button" class="btn-prevSlide favorite-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
				<button type="button" class="btn-nextSlide favorite-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
			</div>
		</div>
		-->
		<div class="container favorite My-layout mt-5">
			<div class="container maintitle" >
				<span class="mainAlpha"">D</span>
				<span class="maintitle2">관심 디자인</span>
			</div>
			<div class="favorite product-list">
				<div class="row">
					<div class="slide favorite-slide">
						<ul class="list-type1 swiper-wrapper" id="likeArea">
						</ul>
					</div>
					<div class="slide-btn">
						<button type="button" class="btn-prevSlide favorite-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
						<button type="button" class="btn-nextSlide favorite-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
					</div>
				</div>
			</div>
		</div>

<!--		<div class="container purchase My-layout mt-5">
			<div class="container maintitle mt-5 mb-5" >
				<span class="mainAlpha">D</span>
				<span class="maintitle2">구입한 디자인</span>
			</div>
			<div class="row">
			<div class="purchase-list">
				<ul class="list-type3 swiper-wrapper" id="orderArea">
				</ul>
				<div class="slide-btn">
					<button type="button" class="btn-prevSlide purchase-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
					<button type="button" class="btn-nextSlide purchase-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
				</div>
			</div>
			</div>
		</div>-->

				<!--
		<div class="container purchase My-layout mt-5">
			<div class="container maintitle" >
				<span style="color:red;background-color:white;font-weight: 600;font-size: 25px;padding: 3px 6px 3px 6px">D</span>
				<span class="maintitle2">구입한 디자인</span>
			</div>
				<div class="row">
					<div class="slide">
					<div class="purchase-list">
						<ul class="list-type3 swiper-wrapper" id="orderArea">
						</ul>
					</div>
					<div class="slide-btn">
						<button type="button" class="btn-prevSlide purchase-prev"><img src="/resources/image/mypage/btn_prevSlide.png" alt="이전"></button>
						<button type="button" class="btn-nextSlide purchase-next"><img src="/resources/image/mypage/btn_nextSlide.png" alt="다음"></button>
					</div>
					</div>
				</div>
			</div>
		</div>
		-->

<!--
		<div class="my-point" style="margin-top: 100px;">
			<div class="container maintitle mb-5" >
				<span class="mainAlpha">P</span>
				<span class="maintitle2">보유 포인트</span>
			</div>
			<div class="point-inner">

				<div class="row">
				<strong>보유 포인트   :   <%=myPointF%> pt</strong>
				<h4>포인트 내역 조회하기</h4>
				<form name="frmMypoint">
					<input type="hidden" name="wseq" value="<%=memberSeq%>"/>
					<dl>
						<dt>조회기간</dt>
						<dd>
							<div class="btn-sorting">
								<button type="button" id="today" class="notborder">오늘</button>
								<button type="button" id="1week" class="notborder">일주일</button>
								<button type="button" id="1month" class="notborder">1개월</button>
								<button type="button" id="3month" class="notborder">3개월</button>
								<button type="button" id="6month" class="notborder">6개월</button>
								<button type="button" id="1year" class="last">1년</button>
							</div>
							<div class="period">
								<input type="text" id="fromDate" readonly name="fromDate" style="text-indent: 5px;">&lt;!&ndash;<button type="button"><img src="/resources/image/mypage/ico_calendar.png" alt="달력보기"></button>  &ndash;&gt;
								<span>~</span>
								<input type="text" id="toDate" readonly name="toDate" style="text-indent: 5px;">&lt;!&ndash;<button type="button"><img src="/resources/image/mypage/ico_calendar.png" alt="달력보기"></button> &ndash;&gt;
								<button type="button" class="btn-check" onClick="goSearch();">조회하기</button>
							</div>
						</dd>
					</dl>
				</form>
				</div>

				<table class="tbl-point">
					<colgroup>
						<col style="width:70px">
						<col style="width:115px">
						<col style="width:200px">
						<col style="width:630px">
						<col style="width:160px">
						<col style="width:160px">
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="first textcenter">번호</th>
						<th scope="col" class="textcenter">날짜</th>
						<th scope="col" class="textcenter">유형</th>
						<th scope="col" class="textcenter">내용</th>
						<th scope="col" class="textcenter">포인트 내역</th>
						<th scope="col" class="last textcenter">잔여 포인트</th>
					</tr>
					</thead>
					<tbody id="pointArea">

					</tbody>
				</table>
				<p class="none" style="padding-bottom:20px; margin-bottom: 0px" id="noPointDiv"> 검색 결과가 없습니다. </p>
				&lt;!&ndash;<div class="paging">
                    <a href="#"><img src="/resources/image/common/btn_prev.gif" alt="이전"></a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><img src="/resources/image/common/btn_next.gif" alt="다음"></a>
                </div>&ndash;&gt;
			</div>
		</div>
-->
	</div>
</div>
	</div>
</div>
<!-- //content -->

<!-- footer -->
<%@include file="/WEB-INF/views/common/footer.jsp"%>
<!-- //footer -->
	<%@include file="/WEB-INF/views/common/modal.jsp"%>
	<%@include file="/WEB-INF/views/common/modal_member_modi.jsp"%>
<!-- //modal -->
</body>
</html>