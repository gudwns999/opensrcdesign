
<%@page import="java.util.Date"%>
<%@page import="com.opendesign.utils.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Open src Design</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/carousel.css">
<link rel="stylesheet" href="/resources/css/navbar.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<link rel="stylesheet" href="/resources/css/redmodules.css">
<link rel="stylesheet" href="/resources/css/icon.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/inputfile.css">
<link rel="stylesheet" href="/resources/css/detail.css">
<link rel="stylesheet" href="/resources/css/font-awesome/css/font-awesome2.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<!-- (Optional) Latest compiled and minified JavaScript translation files -->

<script src="/resources/js/swiper.min.js"></script>
<script src="/resources/js/jquery.validate.min.js"></script>		
<script src="/resources/js/jquery.form.js"></script>
<script src="/resources/js/jquery-ui.js"></script>	
<script src="/resources/js/jsrender.min.js"></script> <!-- js template -->

<!-- readonly -->
<script type="text/javascript" src="/resources/js/jquery.readonly.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/js/jquery.readonly.css">
<style type="text/css"> 
	.readonly_overlay {opacity: 0} 
</style>
<!-- ]]readonly -->
<script src="/resources/js/common.js"></script> <!-- util -->
<script src="/resources/js/wd-components.js"></script> <!-- custom template -->
<script src="/resources/js/wd-project-view.js"></script> <!-- project view -->
<script src="/resources/js/wd-category-view.js"></script> <!-- 카테고리 view -->
<script src="/resources/js/ui.jsp.js"></script> <!-- (ui.js html쪽과 충돌하지 않기 위해) -->
<script>
	/** wsGlobalHost: ws://localhost:8080 */
	var wsGlobalHost = '<%=PropertyUtil.getProperty("ws.global.host")%>';
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-89214303-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- ********************* websocket ********************* -->
<%@include file="/WEB-INF/views/common/inc_websocket.jsp"%> 
<!-- ********************* ]]websocket ********************* -->
