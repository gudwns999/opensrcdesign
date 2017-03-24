<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

var menuList = new Array();

menuList[0] = 	"/product/";

menuList[1] = 	"/project/";

menuList[2] = "/designer/";
				
menuList[3] = "/producer/";

$(function(){
	
	var currentPath = window.location.pathname;
	
	var index = 0;
	for( var i =0; i < menuList.length; i++ ) {
		/*
		var menu = menuList[i];
		var menus = menu.split(",");
		
		for( var menuKey in menus ) {
			var menuName = menus[menuKey];
			//console.log('menuName=' + menuName + ", currentPath=" + currentPath);
			if( menuName == currentPath ) {
				$( "#menuBox li:eq("+index+")" ).addClass("active");
				return;
			}
		}*/
		
		// menuList 변경: '/designer/designer.do' ---> '/designer/';
		var menu = menuList[i];
		if(currentPath.startsWith(menu)) {
			//console.log('>>> menu=' + menu + ', currentPath=' + currentPath);
			$( "#menuBox li:eq("+index+")" ).addClass("active");
			return;
		}
		
		index++;
	}
	
})

</script>
		<h2 class="skip">메인메뉴</h2>
		<div class="nav">
			<%-- @todoLocal--%>
			<ul id="menuBox">
				<li class="first"><a href="/product/product.do">작품</a></li>
				<li><a href="/project/project.do">프로젝트</a></li>
				<li><a href="/designer/designer.do">디자이너</a></li>
				<li class="last"><a href="/producer/producer.do">제작자</a></li>
			</ul>
			<%--
			<ul>
				<li class="first"><a href="#">작품</a></li>
				<li><a href="/project/project.do">프로젝트</a></li>
				<li><a href="#">디자이너</a></li>
				<li class="last"><a href="#">제작자</a></li>
			</ul>--%>
		</div>
		
