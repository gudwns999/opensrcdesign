<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/views/common/head.jsp"%>
</head>
<body>
<div class="wrap">
	<!-- header -->
	<div class="header">
		<!-- inner -->
		<jsp:include page="/openHeaderInner.do" />
		<!-- //inner -->

		<!-- naver -->
		<div class="nav-section">
			<!-- nav -->
			<%@include file="/WEB-INF/views/common/header_naver_nav.jsp"%>

			<!-- 카테고리 -->
			<div class="nav-cate">
				<ul>
					<jsp:include page="/openHeaderNaverCate.do" />
					<!-- custom -->
					<li class="last"><a href="#" class="btn-design">제작 의뢰</a></li>
				</ul>
			</div>
			<!-- //카테고리 -->
		</div>
		<!-- //naver -->
	</div>
	<!-- //header -->

	<!-- content -->
	<div class="content">
		<div class="inner">
			<h2 class="title">제작자 (2,340)</h2>
			<div class="sorting">
				<a href="#" class="first active">최신순</a>
				<a href="#">인기순</a>
			</div>
			<ul class="list-type2">
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
				<li><a href="#">
					<div class="profile-section">
						<div class="picture">
							<img src="../resources/image/main/pic_profile.jpg" alt="김민희">
						</div>
						<div class="profile">
							<p class="designer">천재비행소년</p>
							<p class="cate">의상디자인</p>
							<div class="item-info">
								<span><img src="../resources/image/common/ico_portfolio.png" alt="포트폴리오"> 38</span>
								<span><img src="../resources/image/common/ico_like.png" alt="좋아요"> 380</span>
								<span><img src="../resources/image/common/ico_hit.png" alt="열람"> 181</span>
							</div>
						</div>
					</div>
					<ul class="portfolio-section">
						<li><img src="../resources/image/main/img_portfolio1.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio2.jpg" alt="포트폴리오"></li>
						<li><img src="../resources/image/main/img_portfolio3.jpg" alt="포트폴리오"></li>
					</ul>
				</a></li>
			</ul>
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