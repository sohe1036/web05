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

    <style>
    	#content { clear:both; width :1200px; margin: 0 auto; height: 1200px;}
    </style>
</head>
<body>
    <div nid="root" class="root">
        <style>
            .root {
                font-family: sans-serif;
            }

            .root *,
            .root *:before,
            .root *:after {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            .root .wrapper {
                width: 1140px;
                margin: 0 auto;
                max-width: 100%;
                padding: 0 15px;
            }

            .root .clearfix:after {
                content: " ";
                clear: both;
                display: table;
            }
        </style>
        <div nid="top1" class="top1">
            <style>
                .top1 {
                    margin-bottom: 30px;
                    border-bottom: 1px solid #ddd;
                }

                .top1>.wrapper:after {
                    content: " ";
                    display: table;
                    clear: both;
                }

                .top1>.wrapper .item {
                    float: left;
                    cursor: pointer;
                    padding: 10px 15px;
                    color: #3a3a3a;
                    font-size: 13px;
                    position: relative;
                    text-align: center;
                    margin-top: 15px;
                }

                .top1>.wrapper .item:hover {
                    background: #f7f7f7;
                }

                .top1>.wrapper .point {
                    color: #146ece;
                }


                .top1>.wrapper>.right {
                    float: right;
                }


                @media(max-width:767px) {
                    .top1>.wrapper .item {
                        font-size: 12px;
                        padding: 10px;
                    }
                }
                
                .wrapper nav {
                	display: inline-block;
                }
                
             .wrapper nav ul ul {
                    display: none;
                }

                .wrapper nav ul li {
                    position: relative;
                }

                .wrapper nav ul li a {
                    cursor: pointer;
                    font-size: 13px;
                }

                .wrapper nav ul li:hover>a {
                    color: #1259a7;
                    text-decoration: underline;
                }

                .wrapper nav>ul {
                    text-align: center;
                }

                .wrapper nav>ul>li {
                    display: inline-block;
                    font-size: 20px;
                    margin: 0 px;
                }

                .wrapper nav>ul>li:last-child {
                    margin-right: 0;
                }

                .wrapper nav>ul>li>a {
                    display: inline-block;
                    padding: 10px 15px;
                    margin-top: 15px;
                }

                .wrapper nav ul>li:hover>ul {
                    display: block;
                }

                .wrapper nav>ul>li>ul {
                    position: absolute;
                    background: #fff;
                    border: 1px solid #ddd;
                    width: 140px;
                    left: 50%;
                    margin-left: -70px;
                    z-index: 5;
                }

                .wrapper nav>ul>li>ul>li>a {
                    display: block;
                    padding: 15px;
                    font-size: 15px;
                }

                .wrapper nav>ul>li:last-child>a {
                    padding-right: 0;
                }

                .wrapper nav>ul>li>ul>li:last-child>a {
                    border-bottom: 0;
                }

                .wrapper .toggle {
                    display: none;
                }    
            </style>
            <div class="wrapper">
                <div class="right">
                <nav>
                	<ul>
                		<li>
                			<a>상품</a>
                			<ul>
                				<li><a href="${path }/goods/goodsAddForm.do" class="item">상품추가</a></li>
                				<li><a href="${path }/goods/list.do" class="item">상품목록</a></li>
                			</ul>
                		</li>
                		<li>
                			<a>공지사항</a>
                			<ul>
                				<li><a href="${path }/" class="item">공지사항수정</a></li>
                				<li><a href="${path }/" class="item">공지사항추가</a></li>
                			</ul>
                		</li>
                		<li>
                			<a>회원관리</a>
                			<ul>
                				<li><a href="${path }/" class="item">회원보기</a></li>
                				<li><a href="${path }/" class="item">회원수정</a></li>
                			</ul>
                		</li>	
                	</ul>
                </nav>	
                
                	<c:if test="${sid=='admin' }">
                		<a href="${path }/goods/goodsAddForm.do" class="item">상품추가</a>
						<a href="${path }/admin/memberList.do" class="item">회원목록</a>
						<a href="${path }/goods/list.do" class="item">상품목록</a>
					</c:if>
                	<c:if test="${empty sid }">
						<a href="${path }/member/loginForm.do" class="item point">로그인</a>
						<a href="${path }/member/agree.do" class="item">회원가입</a>
					</c:if>
					<c:if test="${!empty sid }">
						<h1 class="item point">${sid }님</h1>
						<a href="${path }/member/detail.do?uid=${sid }" class="item">내정보</a>
						<a href="${path }/member/logout.do" class="item">로그아웃</a>
					</c:if>	
                </div>
            </div>
        </div>
        <header nid="header1" class="header1">
            <style>
                .header1 {
                    position: relative;
                    padding: 25px 0;
                    border-bottom: 1px solid #ddd;
                    margin-bottom: 30px;
                }

                .header1 .wrapper:after {
                    content: " ";
                    display: table;
                    clear: both;
                }

                .header1 .brand {
                    float: left;
                }

                .header1 .brand>a {
                    color: #1259a7;
                    cursor: pointer;
                    font-family: sans-serif;
                    font-size: 35px;
                    font-weight: bold;
                    text-decoration: none;
                }

                .header1 nav {
                    float: right;
                }

                .header1 nav ul {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                }

                .header1 nav ul ul {
                    display: none;
                }

                .header1 nav ul li {
                    position: relative;
                }

                .header1 nav ul li a {
                    cursor: pointer;
                    font-size: 17px;
                }

                .header1 nav ul li:hover>a {
                    color: #1259a7;
                    text-decoration: underline;
                }

                .header1 nav>ul {
                    text-align: center;
                }

                .header1 nav>ul>li {
                    display: inline-block;
                    font-size: 20px;
                    margin: 0 10px;
                }

                .header1 nav>ul>li:last-child {
                    margin-right: 0;
                }

                .header1 nav>ul>li>a {
                    display: inline-block;
                    padding: 10px 15px;
                }

                .header1 nav ul>li:hover>ul {
                    display: block;
                }

                .header1 nav>ul>li>ul {
                    position: absolute;
                    background: #fff;
                    border: 1px solid #ddd;
                    width: 140px;
                    left: 50%;
                    margin-left: -70px;
                    z-index: 5;
                }

                .header1 nav>ul>li>ul>li>a {
                    display: block;
                    padding: 15px;
                    font-size: 15px;
                }

                .header1 nav>ul>li:last-child>a {
                    padding-right: 0;
                }

                .header1 nav>ul>li>ul>li:last-child>a {
                    border-bottom: 0;
                }

                .header1 .toggle {
                    display: none;
                }

                @media(max-width:991px) {
                    .header1 .brand {
                        padding: 0 5px;
                    }

                    .header1 nav {
                        display: none;
                        position: absolute;
                        left: 0;
                        top: 84px;
                        width: 100%;
                        background: #fff;
                        z-index: 10;
                    }

                    .header1.opened nav {
                        display: block;
                        border-top: 1px solid #ddd;
                        border-bottom: 1px solid #ddd;
                    }

                    .header1 nav>ul>li {
                        display: block;
                        text-align: left;
                        margin: 0;
                    }

                    .header1 nav>ul>li a {
                        padding: 15px;
                        width: 100%;
                    }

                    .header1 nav>ul>li>ul {
                        position: static;
                        width: 100%;
                        margin: 0;
                        border: 0;
                    }

                    .header1 nav>ul>li>ul>li>a {
                        padding-left: 25px;
                    }

                    .header1 nav>ul>li>ul>li>a:before {
                        content: "- ";
                    }

                    .header1 nav ul>li:hover>ul {
                        display: none;
                    }

                    .header1 nav ul>li.on>ul {
                        display: block;
                    }

                    .header1 .toggle {
                        display: inline-block;
                        height: 25px;
                        width: 25px;
                        padding: 0;
                        position: absolute;
                        right: 20px;
                        top: 35px;
                        cursor: pointer;
                    }

                    .header1 .toggle>div {
                        height: 2px;
                        width: 100%;
                        background: #000;
                        position: absolute;
                        top: 0;
                        left: 0;
                        transition: all 0.25s;
                    }

                    .header1 .toggle>div:nth-child(2) {
                        top: 8px;
                    }

                    .header1 .toggle>div:nth-child(3) {
                        top: 16px;
                    }

                    .header1.opened .toggle>div:nth-child(1) {
                        top: 8px;
                        transform: rotate(45deg);
                    }

                    .header1.opened .toggle>div:nth-child(2) {
                        opacity: 0;
                    }

                    .header1.opened .toggle>div:nth-child(3) {
                        top: 8px;
                        transform: rotate(-45deg);
                    }
                }
            </style>
			<div class="wrapper">
                <div class="brand">
                    <a href="${path }/">GENTLE MONSTER</a>
                </div>
                <nav>
                    <ul>
                        <li>
                            <a href="${path }/goods/typeList.do?gtype=선글라스">선글라스</a>
                            <ul>
                                <li><a>클래식 디자인</a></li>
                                <li><a>틴트 렌즈</a></li>
                                <li><a href="${path }/goods/shapeList.do?gtype=선글라스&&gshape=사각">사각 프레임</a></li>
                                <li><a href="${path }/goods/shapeList.do?gtype=선글라스&&gshape=캣아이">캣아이 프레임</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${path }/goods/typeList.do?gtype=안경">안경</a>
                            <ul>
                                <li><a>틴트 렌즈</a></li>
                                <li><a>블루라이트 차단</a></li>
                                <li><a>클래식디자인</a></li>
                                <li><a>사각 프레임</a></li>
                                <li><a>원형 프레임</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${path }/goods/typeList.do?gtype=콜라보레이션">콜라보레이션</a>
                            <ul>
                                <li><a>몽클레르</a></li>
                                <li><a>HBA</a></li>
                                <li><a href="${path }/goods/shapeList.do?gtype=콜라보레이션&&gshape=젠틀가든">젠틀가든</a></li>
                                <li><a>코페르니</a></li>
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
               <div class="toggle">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            
            <script>
                $(".header1 .toggle").on("click", function() {
                    $(this).closest(".header1").toggleClass("opened");
                });

                $(".header1 nav > ul > li > a").on("click", function() {
                    $(this).closest("li").toggleClass("on");
                });
            </script>
        </header>
    </div>
</body>
</html>