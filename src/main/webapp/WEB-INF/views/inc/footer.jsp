<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />   
<!-- 푸터 -->

<!doctype html>
<html>
<head>
    <title>footer 100</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <style>
        body {
            font-family: sans-serif;
        }

        body *,
        body *:before,
        body *:after {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        body .wrapper {
            width: 1140px;
            margin: 0 auto;
            max-width: 100%;
            padding: 0 15px;
        }

        body .clearfix:after {
            content: " ";
            clear: both;
            display: table;
        }

        .footer {
            border-top: 1px solid #ddd;
            margin-top: 30px;
            padding-top: 45px;
            padding-bottom: 45px;
        }

        .footer .brand {
            float: left;
            color: #1259a7;
            cursor: pointer;
            font-family: sans-serif;
            font-size: 42px;
            font-weight: bold;
            text-decoration: none;
            padding-right: 50px;
        }

        .footer .copyright {
            padding-top: 5px;
            font-size: 12px;
            float: left;
        }

        .footer .copyright>div {
            margin-bottom: 10px;
        }

        .footer .sns {
            float: right;
            padding-top: 12.5px;
        }

        .footer .sns>a {
            width: 37px;
            height: 37px;
            line-height: 37px;
            color: #fff;
            cursor: pointer;
            border-radius: 50%;
            text-align: center;
            border: 1px solid #ddd;
            margin-left: 5px;
            text-decoration: none;
        }

        .footer .sns>a.fa-twitter {
            background: #1e8ddf;
            border-color: #1e8ddf;
        }

        .footer .sns>a.fa-facebook {
            background: #33488b;
            border-color: #33488b;
        }

        .footer .sns>a.fa-instagram {
            background: #cc245f;
            border-color: #cc245f;
        }

        @media(max-width:767px) {
            .footer {
                text-align: center;
            }

            .footer .brand {
                float: none;
                margin-bottom: 15px;
                padding-right: 0;
            }

            .footer .copyright {
                float: none;
                margin: 15px 0 25px 0;
            }

            .footer .sns {
                float: none;
            }
        }
    </style>
</head>
<body>
    <div class="footer">
        <div class="wrapper clearfix">
            <a class="brand">Gentle monster</a>
            <div class="copyright">
                <div>주) 아이아이컴바인드 | 대표자명: 김한국 | 사업자번호: 119-86-38589 | 통신판매신고번호: 제 2014-서울마포-1050 호 (사업자 정보 확인) | 이메일 문의: cs@gentlemonster.com | 개인정보보호책임자: 정태호 | 주소: 서울특별시 마포구 어울마당로5길 41 | 대표번호: 1600-2126
고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다. 서비스 가입사실 확인</div>
                <div>© 2022 GENTLE MONSTER</div>
            </div>
            <div class="sns">
                <a class="fa fa-twitter"></a>
                <a class="fa fa-facebook"></a>
                <a class="fa fa-instagram"></a>
            </div>
        </div>
    </div>
    <script></script>
</body>
</html>