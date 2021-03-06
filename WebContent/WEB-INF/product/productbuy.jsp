<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions"%>
   
    <%
    	String ctxPath = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>

<style>
* {
    box-sizing: border-box;
}
body {
    font-family: Arial;
    
    background: #f1f1f1;
}

.header {
    padding: 30px;
    text-align: center;
    background: white;
}
.header h1 {
    font-size: 50px;
}

/* .topnav {
    overflow: hidden;
    background-color: #333;
} */

.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
 
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

.leftcolumn {   
    float: left;
    width: 75%;
}

.rightcolumn {
    float: left;
    width: 25%;
    background-color: white;
    padding-left: 20px;
}

.fakeimg {
    background-color:white;
    width: 100%;
    padding: 20px;
}

.card {
    background-color: hsl(0, 100%, 90%);
    padding: 20px;
    margin-top: 20px;
}

.row:after {
    content: "";
    display: table;
    clear: both;
}

.footer {
    padding: 20px;
    text-align: center;
    background: #ddd;
    margin-top: 20px;
}

@media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}

@media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
}

	div#wrap{
		border: solid 0px blue;
		width: 1150px;
		margin: 0 auto;
	}
	
	footer#page_footer{
		background-color: #cccccc;
		
		clear: both;
		height: 80px;
	}
	
	
	
	
	@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap");

select {
  /* ?????? */
  font-family: "Noto Sansf KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;

  color: #444;
  background-color: #fff;

  padding: 0.6em 1.4em 0.5em 0.8em;
  margin: 0;

  border: 1px solid #aaa;
  border-radius: 0.5em;
  box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
}


select:hover {
  border-color: #888;
}

select:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, 0.7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222;
  outline: none;
}

select:disabled {
  opacity: 0.5;
}
	
	
	
	
	
	
	

</style>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var origincost = $("#originCost").val();
		
		var discountcost = 0;
		
		var totalcost = Number(origincost) - Number(discountcost);
				
		$("input#totalCost").val(totalcost); 
		
		$("input#amount").val(sessionStorage.getItem("amount"));
		 
		
		
		
		var totalPrice = 0;

		$("div.byproduct").each(function(){
		  
			var eachPrice = $(this).children().children().children(".eachPrice").text();
		   //console.log(eachPrice);
		   
		   var amount = $(this).children().children().children(".amount").val();
		   //console.log(amount);
		   totalPrice += Number(eachPrice) * Number(amount);
		   
		});

		$("span#totalCost").html(totalPrice);
		
		
		/*
		var paymoney = Number( ${rProductVO.price} ) * Number( $("input#amount").val() ) ;
		$("span#paymoney1").text(paymoney.toLocaleString('en')); 
		*/ 
		
		
		// ?????? ?????? ??????
		$("select#choiceCoupon").change(function(){
			var discount = $(this).val();
		//	alert(discount);
			
			if(discount == null) {
				discount = 0;
			}
		
			
			$("span#discountCost").html(discount);
			
			// ?????? ????????? ????????? ????????????
			var paymoney = totalPrice - Number($("span#discountCost").text());
			$("span#paymoney").html(paymoney);
			
			
		});
		
		 
		 
		
		
		
		
		//????????????
		$("img#zipcodeSearch").click(function(){
	
		new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("detailAddress").focus();
            }
        }).open();

	});// end of $("img#zipcodeSearch").click(function()-----------------------------------------
	
			
			//???????????? ????????? ????????? ?????????,??????,??????????????? ?????? ??????.
			$("input#originalInfo").click(function(){
				
				$("input:text[name=userid]").val("${sessionScope.loginuser.userid}");
				$("input:text[name=name]").val("${sessionScope.loginuser.name}");
				$("input:text[name=mobile]").val("${sessionScope.loginuser.mobile}");
		
			});// ---------------------------------------------------------
			
			
			// ???????????? ????????? ????????? ????????????.
			$("input#newInfo").click(function(){
				
				$("input.form-control").val("");  
				
			});// ---------------------------------------------------------
	
		
			
	
	
	
	});//end of document.ready() -----------------------------------------------------------------
	
	function goPayment(){
		
	}
	
	
	
</script>

</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="wrap"> 

<div class="header" style="background-color:black;">
  <img src="<%=ctxPath%>/images/logitecha.png"/>
  <p style="color:white; font-weight:bold;">??????????????? ????????? ????????? ????????????</p>
</div>
 
<!-- <div class="topnav">
  <a href="#">???</a>
  <a href="#">??????</a>
  <a href="#">??????</a>
   <a href="#" style="float:right"></a>
</div> -->
 
<div class="row">

  <div class="leftcolumn">
  
    <div class="card" >
      
      <h2  style="font-weight:bold;">?????? ??????</h2>
      
      
  
     
   <div class="fakeimg" style="height:1200px;">
   <c:forEach var="pvo" items="${purchaseList}">
      <div class="byproduct">
         <img src="${pvo.imgfilename}" style="width:100%"/>

         <%--  <ol><h2  style="font-weight:bold;">??????ID : ${pvo.productid} </h2></ol> --%>
         <ol><h2  style="font-weight:bold;">?????????????????? : ${pvo.povo.productserialid} </h2></ol>
         <ol><h2  style="font-weight:bold;">?????????  : ${pvo.productname} </h2></ol>
         <%--  <ol><h2  style="font-weight:bold;">??????  : <fmt:formatNumber value="${rProductVO.price}" pattern="###,###"/>???</h2></ol> --%>
         <ol><h2 style="font-weight:bold;" value="${pvo.povo.color}">??????  : ${pvo.povo.color}</h2></ol>
         <ol><h2 style="font-weight:bold;" value="${pvo.price}">????????????  :<span class="eachPrice">${pvo.price}</span> </h2></ol>
         <ol><h2 style="font-weight:bold;">??????  : <input type="text" name="amount" class="amount" id="amount" value="" size="1" readonly style="border: none;" /></h2></ol>
      </div>
   </c:forEach>
</div>

<br>
  
<div>
	<input type="radio" name="chk_info" id="originalInfo" value="originalInfo" checked="checked">
	<label for = "originalInfo">???????????? ??????</label>
	<input type="radio" name="chk_info" id="newInfo" value="newInfo">
	<label for = "newInfo">?????????</label>
</div>
  
  <br>
  
   <div class="form-group">
    <label for="inputdefault">?????????</label>
    <!-- <input class="form-control" id="inputdefault" type="text"> -->
      <input class="form-control" type="text" name="userid" id="inputdefault userid" value="${sessionScope.loginuser.userid}" required /> 
                <!-- id?????? ???????????? ????????????????????? ???????????? ?????????????????? ?????? -->
             
  </div>
  
  <div class="form-group">
    <label for="inputdefault">?????????</label>
    <!-- <input class="form-control" id="inputdefault" type="text"> -->
     <input type="text" class="form-control" name="name" id="name" value="${sessionScope.loginuser.name}" class="requiredInfo" required />
  </div>
  
  <div class="form-group">
    <label for="inputdefault">???????????? <span style="color:red";> (-??? ?????? ???????????????)</span></label>
   <input type="text" class="form-control" name="mobile" id="mobile" value="${sessionScope.loginuser.mobile}" class="requiredInfo" required />
  </div>
  
  
  <div class="form-group">
  <tr>
         <td style="width: 20%; font-weight: bold;">????????????</td>
         <td style="width: 80%; text-align: left;">
            <input type="text" id="postcode"  class="form-control" name="postcode" size="6" maxlength="5" required/>&nbsp;&nbsp;
            <%-- ???????????? ?????? --%>
            <img id="zipcodeSearch" src="../images/b_zipcode.gif" style="vertical-align: middle;" />
            
         </td>
      </tr>
  </div>
  
  
  <div class="form-group">
    <tr>
         <td style="width: 20%; font-weight: bold;">??????</td>
         <td style="width: 80%; text-align: left;">
            <input type="text" class="form-control" id="address" name="address" size="40" placeholder="??????" /><br/>
            <input type="text" class="form-control" id="detailAddress" name="detailAddress" size="40" placeholder="????????????" />&nbsp;
            <input type="text" class="form-control" id="extraAddress" name="extraAddress" size="40" placeholder="????????????" />
            <span class="error">????????? ???????????????</span> 
            
         </td>
      </tr>
  </div>
  
  
  <div>
    <select class="myselect" name="orderList" >
                  <option>?????? ??? ??????????????? ??????????????????</option>
                  <option value="1">????????? ???????????? ???????????????</option>
                  <option value="2">????????? ???????????? ???????????????</option>
                  <option value="3">????????? ??? ?????? ????????????</option>
                  <option value="4">?????? ??? ???????????????</option>
                  <option value="5">????????? ????????? ?????? ???????????????. ????????? ??????????????????.</option>
    </select>
  </div>
  
 
 

      
      </div>
      
    </div>
     
     
     <!-- <div class="card">
      <h2>2??????</h2>
      <h5>?????????????</h5>
      <div class="fakeimg" style="height:200px;">?????????</div>
      <p>ABC</p>
      <p>
      </p>
    </div>
  </div>  -->
  
  
  
  <div class="rightcolumn">
    <div class="card" style="width:300px;">
      <h4 style="font-weight:bold;">?????? ????????? ???????????????.</h4>
      <div class="fakeimg" style="height:100px;">
				
				
				  <c:if test="${couponList.size() == 0}">
                  <span style="color:red; font-weight:bold;">???????????? ????????? ????????????.</span>
                  </c:if>
                
                  <c:if test="${couponList.size() > 0}">
                  <select id="choiceCoupon" class="myselect" name="coupon">
                  <option selected>????????? ???????????????</option>
                  <c:forEach var="ecvo" items="${couponList}"><option id="choice"value="${ecvo.coupvo.discount}"> ${ecvo.coupvo.couponname} : ${ecvo.coupvo.discount}???</option></c:forEach>
                  </select>
                  </c:if>
               
               
               
              <%--  <c:if test="${not empty imgList}">
			<c:forEach var="imgfilename" items="${imgList}">
				<div class="col-md-3 line">
				   <img src="/MyMVC/images/${imgfilename}" style="width: 200px; height: 170px;" />
				</div>
			</c:forEach>
		</c:if> --%>
		
		</div>     
      <p></p>
    </div>
    
    
    <div class="card" style="width:300px;">
      <h3>????????????</h3>
<%--        <div class="fakeimg"><h4  style="font-weight:bold;">????????????  :  <fmt:formatNumber value="${pvo.price}" pattern="###,###"/>???</h4></div>
      <div class="fakeimg"><h4  style="font-weight:bold;">??????  :  <input type="text" name="amount" id="amount" value="" size="1" readonly style="border: none;" /></h4></div>
--%>  

	
	<input id="originCost" type="hidden" value="totalPrice">
      
      <div class="fakeimg"><p>??? ??????: <span id="totalCost"></span>???</p></div>
      <%-- 
      <c:if test="${eachcouponcode == null}">
      		<div class="fakeimg"><p>????????????: <span id="nodiscountCost">0</span>???</p></div>
      		<div class="fakeimg"><h4  style="font-weight:bold;">????????????&nbsp;:&nbsp;<span id="paymoney1"></span>???</h4></div>
      	    <input id="totalCost" type="hidden" value="">
      </c:if>
      --%>
 <%--     <c:if test="${eachcouponcode != null}"> --%>
      		<div class="fakeimg"><p>????????????: -<span id ="discountCost">${eachcouponcode}</span>???</p></div>
      		<div class="fakeimg"><h4  style="font-weight:bold;">????????????&nbsp;:&nbsp;<span id="paymoney"></span>???</h4></div>
      	    <input id="totalCost" type="hidden" value="">
 <%--     </c:if> --%>
      
      
      <!-- <div class="fakeimg"><p>??????:<span id="totalCost"></span>???</p></div> -->
      
      <%--  <div class="fakeimg"><h4  style="font-weight:bold;">????????????  :  <fmt:formatNumber value="${rProductVO.price - eachcouponcode}" pattern="###,###"/>???</h4></div>
      <input id="totalCost" type="hidden" value=""> --%>
    </div>
   
    <div class="card" align="center" style="width:300px;">
    <button type="button" class="btn btn-info" onclick="goPayment()">????????????</button> &nbsp;&nbsp;&nbsp;
    <button type="button" class="btn btn-danger" onclick="location.href='javascript:history.back()'">??????</button>
      
      
      <p></p>
      
    	</div>
	  </div>
	</div>
 </div>
 
 

 <jsp:include page="../footer.jsp" />  
 
</body>
</html>