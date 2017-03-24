<%@page import="com.opendesign.utils.CmnConst.FileUploadDomain"%>
<%@page import="com.opendesign.utils.ControllerUtil"%>
<%@page import="com.opendesign.utils.ThumbnailManager"%>
<%@page import="com.opendesign.utils.CmnConst.MemberDiv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.opendesign.vo.UserVO"%>
<%@page import="com.opendesign.vo.ItemCmmtVO.ItemCmmtType"%>
<%@page import="com.opendesign.vo.ItemLikeVO.ItemType"%>
<%@page import="com.opendesign.vo.DesignWorkFileVO"%>
<%@page import="com.opendesign.vo.DesignPreviewImageVO"%>
<%@page import="com.opendesign.utils.CmnUtil"%>
<%@page import="com.opendesign.vo.DesignerVO"%>
<%@page import="com.opendesign.vo.DesignWorkVO"%>
<%@page import="com.opendesign.utils.CmnConst.RstConst"%>
<%@page import="com.opendesign.utils.StringUtil"%>

<%@ page import = "java.sql.*" %>
<%
//
String schMemberDiv = (String)request.getAttribute("schMemberDiv");  //회원구분
String loginSeq = null;
UserVO loginUser = CmnUtil.getLoginUser(request);
if (loginUser != null && StringUtil.isNotEmpty(loginUser.getSeq())) {
loginSeq = loginUser.getSeq();
}
//디자인
DesignWorkVO itemVO = (DesignWorkVO)request.getAttribute(RstConst.P_NAME);
DesignWorkVO originVO = (DesignWorkVO)request.getAttribute("originVO");
//디자이너
DesignerVO designerVO = (DesignerVO)request.getAttribute("designerVO");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/WEB-INF/views/common/head.jsp"%>
	<style>
		.design_contents {
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 4; /* 라인수 */
			-webkit-box-orient: vertical;
			word-wrap:break-word;
		}
	</style>
	<script>
        /**
         * 구매하기 view
         */
        function goProductPurchaseView(seq) {
            checkedLogin(function(){
                <%	if(MemberDiv.DESIGNER.equals(schMemberDiv)) { %>
                    window.location.href = '/designer/productPurchase.do?seq=' + seq;
                <% } else if(MemberDiv.PRODUCER.equals(schMemberDiv))  { %>
                    window.location.href = '/producer/productPurchase.do?seq=' + seq;
                <% } else if(MemberDiv.PRODUCT.equals(schMemberDiv))  { %>
                    window.location.href = '/product/productPurchase.do?seq=' + seq;
                <% } %>
            }); //end of checkedLogin
        }
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
         * 다운로드
         */
        function fileDownload(fileUrl, dispName) {
            common.fileDownload(fileUrl, dispName);
        }

        /**
         * 좋아요
         */
        var flag_prodViewWorkLike = false; //flag
        function prodViewWorkLike(thisObj) {
            checkedLogin(function(invokeAfterLogin){

                if(flag_prodViewWorkLike) {
                    return;
                }
                flag_prodViewWorkLike = true;

                $.ajax({
                    url: '/common/likeItemWork.ajax',
                    type: 'post',
                    data: {"itemSeq":"<%=itemVO.getSeq()%>", "itemType":"<%=ItemType.DESIGN_WORK%>"},
                    complete : function(_data){
                        flag_prodViewWorkLike = false;
                    },
                    error : function(_data) {
                        console.log(_data);
                        alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                    },
                    success : function(_data){
                        console.log(_data);
                        if(_data.result == '1') {

                            // 좋아요 class 변경 @todo 디자인 요청
                            window.location.reload();
                        } else {
                            alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                        }
                    }
                });

            }); //end of checkedLogin
        }
	</script>

	<%

	String actionURL = ControllerUtil.getHostName(request) + "/product/productView.do?seq=" + itemVO.getSeq();
	String ogTitle = "openDesign " + itemVO.getTitle();
	String ogDesc = itemVO.getTitle();
	String ogImage = ControllerUtil.getHostName(request) + itemVO.getThumbUriL();
	int ogImageW = 600;
	int ogImageH = 278;

	%>
	<meta property="og:title" content="<%=ogTitle%>"/>
	<meta property="og:type" content="article"/>
	<meta property="og:url" content="<%=actionURL%>"/>
	<meta property="og:description" content="<%=ogDesc%>"/>
	<meta property="og:image" content="<%=ogImage%>"/>
	<meta property="og:image:width" content="<%=ogImageW %>" />
	<meta property="og:image:height" content="<%=ogImageH %>" />

	<script>

        function is_ie() {
            if(navigator.userAgent.toLowerCase().indexOf("chrome") != -1) return false;
            if(navigator.userAgent.toLowerCase().indexOf("msie") != -1) return true;
            if(navigator.userAgent.toLowerCase().indexOf("windows nt") != -1) return true;
            return false;
        }

        function browserCheck() {
            var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
            var is_explorer = navigator.userAgent.toLowerCase().indexOf('msie') > -1;
            var is_firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
            var is_safari = navigator.userAgent.toLowerCase().indexOf("safari") > -1;
            var is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1;
            if ((is_chrome)&&(is_safari)) {is_safari=false;}
            if ((is_chrome)&&(is_opera)) {is_chrome=false;}
            return {
                is_ie :is_explorer
                ,is_safari: is_safari
                ,is_chromeLike: (is_chrome || is_firefox || is_opera)
            };
        }

        function facebookLink(){

            var linkURL = 'https://www.facebook.com/sharer/sharer.php?u=<%=actionURL%>';

            var opener=window.open('','_blank');
            opener.location=linkURL;
        }

        function copy2Clipboard() {
            var bc = browserCheck();
            console.log(bc);
            if( bc.is_ie ) {
                window.clipboardData.setData("Text", '<%=actionURL%>');
                alert("복사되었습니다.");
                return;
            }
            prompt("Ctrl+C를 눌러 복사하세요.", '<%=actionURL%>');

        }

        /**
         * 상세 내용 더보기
         */
        function showContents(ele) {

            $('#contents_more_btn').hide();
            $('.design_contents').removeClass('design_contents');
        }


        $(function() {
			/*
			 * 상세 내용이 4줄 이상 있을 경우 '더보기' 버튼 보여줄지 말지 여부
			 */
            if ($('.design_contents')[0].scrollHeight >  $('.design_contents').innerHeight()) {
                $('#contents_more_btn').show();
            } else {
                $('#contents_more_btn').hide();
            }

        });

	</script>

	<style>
		#contents_more_btn {
			text-align:center;
			padding-top:5px;
			border:1px solid;
			border-radius: 3px;
		}
	</style>

</head>
<!-- header -->
<body>
<!-- body -->
<div class="modal-body" style="padding: 0px;background-color: white;overflow-x: hidden">

	<div class="row">
		<div class="col-xs-12 col-sm-10" style="text-align: center">
			<%
			if(!CmnUtil.isEmpty(itemVO.getImageList())) {
			for(DesignPreviewImageVO image : itemVO.getImageList()) {
			if( ControllerUtil.isImageFile(request, image.getFileUriL(),
			FileUploadDomain.PRODUCT)) {
			%>
			<img src="<%=image.getFileUriL()%>" alt="<%=image.getFilename()%>" class="img-responsive" style="margin: auto"> <br>
			<%
			} else {
			%>
			<div style="margin:auto;border-top: 1px solid #CACACA; padding-top:10px;padding-bottom:10px;width:85%;">
				<img src="/resources/image/common/ico_attachment.png" alt="파일첨부" style="width:20px;height:22px;margin:auto;">
				&nbsp;<a href="<%=image.getFileUri()%>"> <%=image.getFilename() %> </a>
			</div>
			<%
			}
			}
			}
			%>

			<div style="text-align: left;padding: 10px;">
				<!-- 디자인설명 -->
				<div class="well" style="margin-right: 1px">
					<h3>디자인 설명</h3>
					<p class="design_contents">
						<%=itemVO.getContents().replaceAll("\n", "<br/>")%>
					</p>

					<p id="contents_more_btn">
						<a href="javascript:showContents();"> 더보기
							<img src="/resources//image/sub/bg_arrowDown.png"  />
						</a>
					</p>
				</div>
				<div class="well" style="margin-right: 1px">
					<h3>오픈소스<span style="font-size: 6px;color: gray">(작업에 사용된 오픈소스는 자유롭게 변경 및 공유 가능)</span></h3>
					<ul>
						<!-- <li>Font_style.jpg <span>(580KB)</span></li> -->
						<%
						if(!CmnUtil.isEmpty(itemVO.getFileList())) {
						for(DesignWorkFileVO fItem : itemVO.getFileList()) {
						%>
						<li style="cursor:pointer" onclick="fileDownload('<%=fItem.getFileUri()%>', '<%=fItem.getFilename()%>');"><%=fItem.getFilename()%> <span>(<%=fItem.getFileSize()%>KB)</span></li>
						<%
						}
						}
						%>
					</ul>
				</div>
				<div class="well" style="margin-right: 1px">
					<form name="projDetailAddCmmtForm">
						<input type="hidden" name="itemSeq" value="<%=itemVO.getSeq()%>" /> <!-- itemSeq -->
						<input type="hidden" name="itemCmmtType" value="<%=ItemCmmtType.DESIGN_CMMT%>" /> <!-- 댓글 구분 -->
						<fieldset>
							<legend>댓글 쓰기</legend>
							<p id="allCnt" class="number">전체 댓글(0)</p>
							<textarea class="form-control"name="contents" maxlength="500"  rows="3"  style="resize:none" placeholder="댓글 입력(최대 500자)"></textarea>
							<button style="float: right;margin-top: 10px" type="button" class="btn btn-red btn-cmt" >등록</button>
						</fieldset>
					</form>
					<ul style="list-style-type: none"class="reply-list" id="pdrListView" data-seq="<%=itemVO.getSeq()%>">

					</ul>
					<button onclick="pdrLoadMore();" id="pdrLoadMore" type="button" class="btn btn-red btn-more">댓글 더 보기</button>
				</div>
			</div>

		</div>
		<div  class="hidden-xs col-xs-2 col-sm-2  col-sm-offset-10 col-xs-offset-10" style="position: fixed;background-color: rgb(250,250,250);height: 100%" >
			<div class="row">

				<table class="table table-bordered">

					<tbody>

					<tr>
						<td>
							<img src="<%=itemVO.getThumbUriL()%>"alt="대표 이미지" style="width:100%">
							<h4><%=itemVO.getTitle()%></h4>

							<%if( itemVO.getMemberSeq().equals(loginSeq) ){ %>
							<a href="/product/productModify.do?seq=<%=itemVO.getSeq() %>" class="btn btn-login">수정</a>
							<a href="javascript:deleteProduct('<%=itemVO.getSeq() %>');" class="btn btn-login">삭제</a>
							<%} %>
						</td>
					</tr>
					<tr>
						<td>
							<div class="media">
								<div class="media-left pull-right">
									<img class="design_profile_img"src="<%=designerVO.getImageUrl()%>" onerror="setDefaultImg(this, 1);" alt="">
								</div>
								<div class="media-body">
									<a href="javascript:goPortfolioView('<%=designerVO.getSeq()%>');" class="name"><%=designerVO.getUname()%></a>
									<a href="javascript:goShowMsgView('<%=designerVO.getSeq()%>');" class="btn-msg"><img src="/resources/image/sub/btn_msg.png" alt="메세지 보내기"></a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							좋아요 : <%=itemVO.getLikeCntF()%>
							<% if( !itemVO.isCurUserLikedYN() ) { %>
							<button style="float: right"type="button" class="btn btn-login btn-xs" onclick="prodViewWorkLike(this);" >좋아요</button>
							<% } else { %>
							<button style="float: right" type="button" class="btn btn-red btn-xs" onclick="prodViewWorkLike(this);" >좋아요</button>
							<% } %>
						</td>
					</tr>
					<!--<tr>
						<td>
							포인트 : <%=itemVO.getDisplayPoint()%>
							<%if( itemVO.isLogonUserPurchased() ) { %>
							<a  class="btn btn-red btn-xs disabled">구매완료</a>
							<%} else { %>
							<% if(itemVO.isUserProduct()  && !"0".equals(itemVO.getDisplayPoint())) { %>
							<a style="float: right" href="javascript:goProductPurchaseView('<%=itemVO.getSeq()%>');" class="btn btn-xs btn-red">구매하기</a>
							<%} else {%>
							<a style="float: right" class="btn btn-red btn-xs disabled">구매불가</a>
							<%} %>
							<%} %>
						</td>
					</tr>-->
					<tr>
						<td>
							조회수 : <%=itemVO.getViewCntF()%>
						</td>
					</tr>

					<tr>
						<td>
							게시일 : <%=itemVO.getDisplayRegTime()%>
						</td>
					</tr>
					<tr>
						<td>CCL :
							<% if("1".equals(itemVO.getLicenseBY())) { %><span><img src="/resources/image/sub/licenses_by.png" alt="BY"></span><% } %>
							<% if("1".equals(itemVO.getLicenseNC())) { %><span><img src="/resources/image/sub/licenses_nc.png" alt="NC"></span><% } %>
							<% if("1".equals(itemVO.getLicenseND())) { %><span><img src="/resources/image/sub/licenses_nd.png" alt="ND"></span><% } %>
						</td>
					</tr>
					<tr>
						<td>
							<% if(!originVO.getOriginSeq().equals("0")){  %>
							<a href = "/product/productOriginView.do?seq=<%=originVO.getOriginSeq()%>"  class="btn btn-primary btn-xs">원본디자인보기</a>
							<%}; %>
							<!--							<button id="originalBtn">BTN</button>
                                                        <form action="/product/productStemRegi.do" method="get">
                                                            <input type="text" name="origin" style="display:none" value=<%=originVO.getOriginSeq() %>>
                                                            <input type="submit" value="오리지날" class="btn btn-xs">
                                                        </form>
                                                        <a href = "/product/productOriginView.do?seq=<%=originVO.getOriginSeq()%>">SS</a>-->
							<form action="/product/productStemRegi.do" method="get">
								<input type="text" name="origin_seq" style="display:none" value=<%=itemVO.getSeq()%>>
								<input type="submit" value="파생디자인등록" class="btn btn-red btn-xs">
							</form>
							<div>

								<%
								Connection conn = null;                                     // null로 초기화 한다.
								PreparedStatement pstmt = null;
								ResultSet rs = null;
								try{
								String url = "jdbc:mysql://113.198.210.237:13306/opendesign?useUnicode=true&characterEncoding=UTF-8";        // 사용하려는 데이터베이스명을 포함한 URL 기술
								String id = "kim";                                                    // 사용자 계정
								String pw = "crc503";                                                // 사용자 계정의 패스워드
								Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
								conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
								String sql = "SELECT * FROM t_design_work WHERE origin_seq = ? AND del_flag = ?";                        // sql 쿼리
								pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
								pstmt.setString(1,itemVO.getSeq());
								pstmt.setString(2,"N");

								rs = pstmt.executeQuery();
								if(rs!=null && rs.isBeforeFirst()){%>
								<div class="dropdown">
									<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">파생된 디자인<span class="caret"></span></button>
									<ul class="dropdown-menu">
										<%
										}
										while(rs.next()){
										String SEQ = rs.getString("seq");
										String TITLE = rs.getString("title");
										%>
										<li><a href="/product/productOriginView.do?seq=<%=SEQ%>"><%=TITLE %></a></li>
										<%
										}
										}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
										e.printStackTrace();
										out.println("member 테이블 호출에 실패했습니다.");
										}finally{                                                            // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)
										if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset 객체 해제
										if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement 객체 해제
										if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection 해제
										}
										%>
									</ul>
								</div>
							</div>

						</td>
					</tr>
					<tr>
						<td>
							<span style="display: inline"><img src="/resources/image/sub/ico_tag.png" alt="태그"></span>
							<div class="tag-area">
								<%
								if(!CmnUtil.isEmpty(itemVO.getTagsArray())) {
								%>
								<%
								}
								%>

								<!-- <li>의상디자인</li> -->
								<%
								if(!CmnUtil.isEmpty(itemVO.getTagsArray())) {
								for(String tagItem : itemVO.getTagsArray()) {
								%>
								<span><%=tagItem%></span>
								<%
								}
								}
								%>
							</div>

						</td>
					</tr>
					</tbody>
				</table>

			</div>

			<div class="">



			</div>
			<a  onclick="facebookLink();"  href="#" class="btn azm-social azm-size-32 azm-facebook"><i class="fa fa-facebook"></i></a>
			<!--
                        <a onclick="copy2Clipboard();" href="#" class="btn azm-social azm-size-32 azm-share"><i class="fa fa-share-alt"></i></a>
            -->
		</div>
	</div>

	<!-- //content -->

	<!-- ******************** 댓글 ******************** -->
	<script id="tmpl-project-detail-reply" type="text/x-jsrender">
					<li>
						<div>
						  <div class="media">
							<div class="media-left">
							  <img class="design_profile_img" src="{{:memberImageUrl}}" onerror="setDefaultImg(this, 1);" alt="{{:memberName}}">
							</div>
							<div class="media-body">
							  <h4 class="media-heading">								{{if memberType == "00" }}
								<dt>{{:memberName}} <span class="date">{{:displayTime}}</span></dt>
								{{else memberType == "01" }}
								<dt><a onclick="javascript:producerPortfolio({{:memberSeq}})" style=" color: #666; font-size: 17px; cursor: pointer;">{{:memberName}}</a> <span class="date">{{:displayTime}}</span></dt>
								{{else}}
								<dt><a onclick="javascript:designerPortfolio({{:memberSeq}})" style="color: #666; font-size: 17px; cursor: pointer;">{{:memberName}}</a> <span class="date">{{:displayTime}}</span></dt>
								{{/if}}
								</h4>
							  {{:contents}}
							  <br><br>
							  	{{if curUserAuthYN}}
									<button style="float:right" class="btn btn-red btn-cmmt-del btn-xs" onclick="projDetailDelCmmt('<%=ItemCmmtType.DESIGN_CMMT%>','{{:seq}}');" >댓글 삭제</button>
								{{/if}}

							</div>
						  </div>
						</div>
					</li>
</script>
	<form id="pdrListParamForm" name="pdrListParamForm" method="GET" action="" >
		<input type="hidden" name="schSeq" value="" /> 	<!-- itemSeq -->
		<input type="hidden" name="schPage" value="1" /> 	<!-- 페이지번호 -->
		<input type="hidden" name="schLimitCount" value="10" /> <!-- 한 page 개수 -->
		<input type="hidden" name="schItemCmmtType" value="<%=ItemCmmtType.DESIGN_CMMT%>" /> <!-- 댓글 구분 -->
	</form>


	<script type="text/javascript">

        //start
        $(function(){
            initPdrListView();
            pdrLoadPage();

            // 등록 event:
            var myForm = $('form[name="projDetailAddCmmtForm"]');
            myForm.find('.btn-cmt').click(function (event) {
                //myForm.find('[name="contents"]').keydown(function (event) {
                //    if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                //    	event.preventDefault();
                //
                projDetailAddCmmt();
                return;
                //    }
            });
        });


		/* list 탬플릿 */
        var pdrListTemplete = $("#tmpl-project-detail-reply").html();

		/* pdrListView */
        var pdrListView = null;

		/* 초기화 */
        function initPdrListView(){
            // param set:
            var myForm = $('form[name="pdrListParamForm"]');
            var itemSeq = $('#pdrListView').data('seq');
            myForm.find('[name="schSeq"]').val(itemSeq);
            myForm.find('[name="schPage"]').val('1');

            //
            pdrListView = new ListView({
                htmlElement : $('#pdrListView')
            });

            // clear
            pdrListView.clear();

        }

        /**
         * 페이지 load
         */
        var flag_pdrLoadPage = false; //flag
        function pdrLoadPage() {

            if(flag_pdrLoadPage) {
                return;
            }
            flag_pdrLoadPage = true;

            var myForm = $('form[name="pdrListParamForm"]');
            // 데이터 조회 및 load
            $.ajax({
                url: '/common/selectItemCmmtPagingList.ajax',
                type: 'get',
                data: myForm.serialize(),
                complete : function(_data){
                    flag_pdrLoadPage = false;
                },
                error : function(_data) {
                    console.log(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    console.log(_data);
                    // load
                    pdrLoadPageWithData(_data);
                }
            });
        }

        /**
         *  pdrLoadPageWithData
         */
        function pdrLoadPageWithData(_data) {
            // allCount
            var allCount = _data.all_count;
            console.log('>>> allCount=' + allCount);
            $('#allCnt').html('전체 댓글(' + formatNumberCommaSeparate(allCount) + '건)');

            // pageNo
            var myForm = $('form[name="pdrListParamForm"]');
            var pageNo = myForm.find('[name="schPage"]').val();

            //
            var listData = _data.list;
            var listCount = listData.length;
            var existList = listCount > 0;
            pdrListView.putData('existList', existList);
            // loadMore button
            if((! existList) || ((pdrListView.items.length + listCount)  == allCount) ) {
                $('#pdrLoadMore').hide();
            } else {
                $('#pdrLoadMore').show();
            }
            if( ! existList ){
                console.log('>>> loadPageWithData no data.');
                return;
            }

            // data
            pdrListView.addAll({
                keyName:'seq',
                data:listData,
                htmlTemplate: pdrListTemplete
            });
        }


        /**
         * 더보기
         */
        function pdrLoadMore() {
            // pageNo + 1
            var myForm = $('form[name="pdrListParamForm"]');
            var pageNo = myForm.find('[name="schPage"]').val();
            if(pageNo == '') {
                pageNo = '1';
            }

            var nextPage = parseInt(pageNo, 10);
            nextPage++;
            myForm.find('[name="schPage"]').val(nextPage);

            // load
            pdrLoadPage();

        }

        /**
         * 댓글 등록
         */
        var flag_projDetailAddCmmt = false; //flag
        function projDetailAddCmmt() {
            checkedLogin(function(){
                var myForm = $('form[name="projDetailAddCmmtForm"]');
                if(!myForm.valid()) {
                    return;
                }

                if(flag_projDetailAddCmmt) {
                    return;
                }
                flag_projDetailAddCmmt = true;

                //
                $.ajax({
                    url: '/common/insertItemCmmt.ajax',
                    type: 'post',
                    data: myForm.serialize(),
                    complete : function(_data){
                        flag_projDetailAddCmmt = false;
                    },
                    error : function(_data) {
                        console.log(_data);
                        alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                    },
                    success : function(_data){
                        console.log(_data);
                        if(_data.result == '1') {
                            // reload 댓글
                            initPdrListView();
                            pdrLoadPage();
                            // clear
                            formValueClear('form[name="projDetailAddCmmtForm"]');

                        } else {
                            alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                        }
                    }
                });

            }); //end of checkedLogin
        }


        /**
         * 댓글 삭제
         */
        var flag_projDetailDelCmmt = false; //flag
        function projDetailDelCmmt(itemCmmtType, seq) {
            checkedLogin(function(invokeAfterLogin){

                if(!confirm('댓글 삭제하시겠습니까?')) {
                    return;
                }

                if(flag_projDetailDelCmmt) {
                    return;
                }
                flag_projDetailDelCmmt = true;

                //
                $.ajax({
                    url: '/common/deleteItemCmmt.ajax',
                    type: 'post',
                    data: {itemCmmtType: itemCmmtType,seq: seq},
                    complete : function(_data){
                        flag_projDetailDelCmmt = false;
                    },
                    error : function(_data) {
                        console.log(_data);
                        alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                    },
                    success : function(_data){
                        console.log(_data);
                        if(_data.result == '1') {
                            if( invokeAfterLogin ) { //로그인 후 처리되는 프로세스 라면
                                window.location.reload();
                                return;
                            }
                            // reload 댓글
                            initPdrListView();
                            pdrLoadPage();
                        } else {
                            alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                        }
                    }
                });

            }); //end of checkedLogin
        }


        function deleteProduct(seq){

            if(flag_projDetailAddCmmt) {
                return;
            }
            flag_projDetailAddCmmt = true;

            if( ! confirm('디자인을 삭제 하시겠습니까?') ){
                flag_projDetailAddCmmt = false;
                return;
            }

            $.ajax({
                url: '/product/deleteProduct.ajax',
                cache: false,
                type: 'post',
                data: {'seq': seq},
                complete : function(_data){
                    flag_projDetailAddCmmt = false;
                },
                error : function(_data){
                    console.log(_data);
                    alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");
                },
                success : function(_data){
                    if(_data.result == '1') {
                        window.location.href = '/product/product.do';
                    } else if(_data.result == '100') { //이메일 중복
                        if( confirm('로그인이 필요합니다. 로그인 하시겠습니까?') ){
                            modalShow('#login-modal');
                        }
                    } else if(_data.result == '101') { //이메일 중복
                        alert('수정 권한이 없습니다.');
                    } else {
                        alert("오류가 발생 하였습니다.\n관리자에게 문의 하세요.");

                    }
                }
            });
        }

        //=== 검증 ==========
        $(function(){
            projDetailAddCmmtFormValidRuleInit();
        });

        function projDetailAddCmmtFormValidRuleInit(){
            var myForm = $('form[name="projDetailAddCmmtForm"]');
            myForm.validate({
                rules:{
                    contents : { required: true }
                },
                messages: {
                    contents : { required: "필수로 입력해야 합니다." }
                },
                showErrors: function(errorMap, errorList) {
                    if( errorList && errorList.length > 0 ){
                        for( var i = 0; i < errorList.length; i++ ){
                            alert(errorList[i].message);
                            errorList[i].element.focus();
                            break;
                        }
                    }
                },
                ignore: [],
                focusInvalid:false,
                onfocusout: false,
                onkeyup: false,
                onclick: false
            });
        }

        //=== ]]검증 ==========

        //디자이너 포트폴리오
        function designerPortfolio(seq) {
            window.location.href = '/designer/portfolio.do?seq=' + seq;
        }

        //제작자 포트폴리오
        function producerPortfolio(seq) {
            window.location.href = '/producer/portfolio.do?seq=' + seq;
        }

        /////김형준 수정//////////////////////
        <%-- $(document).on("click","#originalBtn",function(){
            $('.modal-design').attr('id','modal'+<%=originVO.getOriginSeq()%>);
//   $('div.modal').modal({remote : '/product/productView.do?seq='+seq});
            $.get("/product/productView.do?seq="+<%=originVO.getOriginSeq()%>, function(html){
                $(".modal-content-design").html(html);
                $('#modal').modal('show');
            });
        }); --%>
	</script>
	<!-- ******************** ]]댓글 ******************** -->
</div>
</body>