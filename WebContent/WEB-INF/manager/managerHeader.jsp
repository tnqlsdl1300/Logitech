<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> --%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
#yjwrapper {margin: 0 auto;}

#sideMenu {
	float: left;
	width: 20%;
	min-height: 1000px;
	border-radius: 8px;
}

#logOutdiv {margin: 10px 20px;}

#logOutdiv:hover {
	background-color: #f2f2f2;
	cursor: pointer;
}

ul {border-radius: 8px;}

.menu {
	margin: 20px;
	border: none;
}

.menuList {line-height: 65px;}

.lowermenu {width: 150px;}

.lowermenuA {
/*	border: solid 1px gray;*/
	display: table;
	width: 100%;
	height: 100%;
	text-align: center;
}

.lowermenuSpan {
	display: table-cell;
	width: 100%;
	height: 100%;
	vertical-align: middle;
}

#content, #content div {
	background-color: #e6e6e6;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".menu").menu();
		
		$( "#accordion" ).accordion({
			collapsible: true
		});
	});// end of $(document).ready(function(){})--------------------------
	
	function goSignOut() {
		location.href = "<%= ctxPath%>/manager/signOut.sg";
	}// end of function goSignOut(){}----------------------------
</script>
</head>
<body>

<div id="yjwrapper">
	<div id="sideMenu">
		<img src="<%= ctxPath%>/images/daum.png" width="200px;" height="100px;" style="margin: 20px;" />
		
		<div id="logOutdiv">
			<img src="<%= ctxPath%>/images/icon_log out.png" width="40px;" height="40px;" onclick="goSignOut();" />&nbsp;&nbsp;
			<span onclick="goSignOut();">????????????</span>
		</div>
		
		<ul class="menu">
			<%-- ??? --%>
	        <li class="menuList">
		      	<a href="<%= ctxPath%>/manager/managerIndex.sg">
					<img src="<%= ctxPath%>/images/icon_home.png" width="40px;" height="40px;" />&nbsp;&nbsp;???
		      	</a>
	        </li>
	        
	        <%-- ???????????? --%>
	        <li class="menuList">
		      	<a href="<%= ctxPath%>/manager/member/memberList.sg">
					<img src="<%= ctxPath%>/images/icon_find.png" width="40px;" height="40px;" />&nbsp;&nbsp;????????????
		      	</a>
	        </li>
	        <%--
	        <li class="menuList">
		       	<div>
					<img src="<%= ctxPath%>/images/icon_user.png" width="40px;" height="40px;" />&nbsp;&nbsp;????????????
		       	</div>
		       	<ul>
					<li class="lowermenu">
						<a href="<%= ctxPath%>/manager/memberList.sg" class="lowermenuA">&nbsp;&nbsp;<span class="lowermenuSpan">????????????</span></a>
					</li>
					
					<li class="lowermenu">
						<a href="manageMembership.jsp" class="lowermenuA">&nbsp;&nbsp;<span class="lowermenuSpan">????????????</span></a>
					</li>
			    </ul>
	        </li>
	        --%>
	        
	        <%-- ???????????? --%>
	        <li class="menuList">
		       	<div>
					<img src="<%= ctxPath%>/images/icon_product-description.png" width="40px;" height="40px;" />&nbsp;&nbsp;????????????
		       	</div>
		       	<ul>
					<li class="lowermenu">
						<a href="<%= ctxPath%>/manager/product/productOptionList.sg">????????????</a>
					</li>
					
					<li class="lowermenu">
						<a href="<%= ctxPath%>/manager/product/productRegister.sg">????????????</a>
					</li>
			    </ul>
	        </li>
	        
	        <%-- ???????????? --%>
	        <li class="menuList">
		      	<a href="<%= ctxPath%>/manager/purchase/purchaseList.sg">
		      		<img src="<%= ctxPath%>/images/icon_presentation.png" width="40px;" height="40px;" />&nbsp;&nbsp;????????????
		      	</a>
	        </li>
	        
	        <%-- ???????????? --%>
	        <li class="menuList">
		       	<div>
					<img src="<%= ctxPath%>/images/icon_shopping.png" width="40px;" height="40px;" />&nbsp;&nbsp;????????????
		       	</div>
		       	<ul>
					<li class="lowermenu menuList">
						????????????
						<ul>
							<li class="lowermenu">
								<a href="<%= ctxPath%>/manager/promotion/couponList.sg">????????????</a>
							</li>
							
							<li class="lowermenu">
								<a href="<%= ctxPath%>/manager/promotion/eventList.sg">???????????????</a>
							</li>
						</ul>
					</li>
					
					<li class="lowermenu">
						<a href="<%= ctxPath%>/manager/promotion/couponRegister.sg">????????????</a>
					</li>
					
					<li class="lowermenu">
						<a href="<%= ctxPath%>/manager/promotion/eventRegister.sg">???????????????</a>
					</li>
			    </ul>
	        </li>
      	</ul>
      	
      	<hr style="width: 95%; color: black;">
      	
      	<ul class="menu">
	        <li class="menuList">
	        	<a href="<%= ctxPath%>/manager/manager/managerRegister.sg">&nbsp;&nbsp;????????? ?????? ??????</a>
	        </li>
	        
	        <li class="menuList">
	        	<a href="<%= ctxPath%>/manager/manager/managerUpdate.sg?&managerid='${sessionScope.loginManager.managerid}'">&nbsp;&nbsp;????????? ?????? ??????</a>
	        </li>
	        
	        <li class="menuList">
				<a href="<%= ctxPath %>/index.sg">&nbsp;&nbsp;????????? ???????????? ??????</a>
			</li>
      	</ul>
      	
      	<div id="copyright">
			<h5>Copyright. Logitech 2020</h4>
		</div>
	</div>
	
	<div id="content" style="float: left; width: 80%">