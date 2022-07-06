<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />   

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="/css/page.css" rel="stylesheet" no-export="">
        <style>
    #hd { clear:both; width: 100%; height: 180px; position: fixed; top: 0; left: 0; z-index: 999; }
	.hd_wrap { clear:both; width: 1600px; height: 160px; ; margin: 0 auto;  }
	.logo { display:block; width: 250px; float:left; margin-top: 20px;}
	.logo img { display:block; width: 80%; }
	#gnb { float:left; margin-top: 20px;}
	#gnb > ul > li { float:left; padding-left: 50px; padding-right: 20px; position: relative; }
	#gnb > ul > li > span { display:block; line-height: 36px; cursor:pointer; color:white;}
	#gnb ul li .sub { display:none; position:absolute; left: 10px; top: 35px; z-index: 999;
    padding-left: 25px; width: 150px; height: auto;} 
    #gnb ul li .sub li {line-height: 38px;}
    #gnb ul li .sub li:hover a {color:darkseagreen;}
    #gnb ul li:hover .sub { display:block; }
    #gnb ul li:hover span { color: cornflowerblue;}

    #tnb { float:right; padding-top: 10px; padding-bottom:14px; margin-top: 15px; font-size: 17px; }
    #tnb a { margin-left: 40px;  }
    #tnb a:hover { text-decoration: underline;}

    #content { clear:both; width :1200px; margin: 0 auto; height: auto; margin-top: 180px;}
    </style>
</head>
<body>
  	<div class="wrap">
    <header id="hd">
        <div class="hd_wrap">
        	 <nav id="tnb">
   
               	<c:if test="${empty sid }">
					<a href="${path }/member/loginForm.do" class="item point">로그인</a>
					<a href="${path }/member/agree.do" class="item">회원가입</a>
				</c:if>
				<c:if test="${!empty sid }">
					<span>${sid }님</span>
					<c:if test="${sid=='admin' }">
               			<a href="${path }/goods/goodsAddForm.do" class="item">상품추가</a>
						<a href="${path }/admin/memberList.do" class="item">회원목록</a>
						<a href="${path }/goods/list.do" class="item">상품목록</a> 
					</c:if>
					<a href="${path }/member/detail.do?uid=${sid }" class="item">내정보</a>
					<a href="${path }/member/logout.do" class="item">로그아웃</a>
				<c:if test="${sid == 'admin' }">
					<a href="${path }/admin/admin.do" class="item">관리자페이지</a>
				</c:if>
				</c:if>
            </nav>
            <nav id="gnb">
                <ul>
                	<li>
						<a class="navbar-brand" style="color:#1259a7; font-size: 30px;" href="${path }/">GENTLE MONSTER</a>
                    </li>
                    <li>
                        <a href="${path }/goods/typeList.do?gtype=선글라스">선글라스</a>
                        <ul class="sub">
                            <li><a href="">클래식디자인</a></li>
                            <li><a href="">틴트렌즈</a></li>
                            <li><a href="">사각프레임</a></li>
                            <li><a href="">캣아이프레임</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${path }/goods/typeList.do?gtype=안경">안경</a>
                        <ul class="sub">
                            <li><a href="#">틴트 렌즈</a></li>
	            			<li><a href="#">블루라이트 차단</a></li>
	           				<li><a href="#">클래식디자인</a></li>
	           				<li><a href="#">사각 프레임</a></li>
	           				<li><a href="#">원형 프레임</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${path }/goods/typeList.do?gtype=콜라보레이션">콜라보레이션</a>
                        <ul class="sub">
                            <li><a href="#">몸클레르</a></li>
	            			<li><a href="#">HBA</a></li>
	          				<li><a href="#">젠틀가든</a></li>
	            			<li><a href="#">코페르니</a></li>
                        </ul>
                    </li>
                    <li>
						<a href="${path }/board/list.do">게시판</a>
                    </li>
                    <li>
						<a href="${path }/notice/pageList.do?curPage=1">공지사항</a>
                    </li>
                </ul>
            </nav>
          
        </div>
    </header>

 </div>  
</body>
</html>