# Logitech
_주변기기 판매 쇼핑몰_

<img src="https://github.com/tnqlsdl1300/GitHub/blob/d1e3450e41814bb60a3b0e36cd30590bc25b7da0/shoppingmall_src/squadgLogo.png" width="200" />

## 소개

- 마우스, 키보드, 헤드셋 등의 주변기기를  판매하는 주변기기 판매 쇼핑몰 입니다.
- 개발기간: 2020.10.28 ~ 2020.11.30 (약 4주)
- 개발인원: 5명

## 기술스택

> Back-end/Server

- Java
- Jsp
- Java Servlet
- Apache Tomcat v8.5
- OracleDB

> Front-end

- Javascript
- JQuery
- HTML 5 & CSS3
- Bootstrap 3

> Devops

- Eclipse
- Git
- Github

## DB 구조

![exerd](https://github.com/tnqlsdl1300/GitHub/blob/ce51d037025fed42a9586c8561aeda0d71afd944/shoppingmall_src/exerd.PNG)

## 기능

본인이 구현한 기능은 **굵게** 강조했습니다.

- **회원**
  - **로그인 / 로그아웃**
    - **휴면 계정 / 3개월 마다 비밀번호 변경 요구 알림**
  - **아이디 찾기**
  - **비밀번호 찾기**
    - **COOLSMS API 를 통한 SMS 인증번호 발송**
  - **회원가입**
    - **기입 항목 유효성 검사**
    - **패스워드 암호화 진행**
- **검색**
  - **인기검색어**
    - **제품 특성 / 제품 카테고리 키워드로  구성**
  - **제품 검색**
    - **제품명 / 제품 특성을 통해 검색**
    - **검색한 키워드는 인기검색어에 반영**
- **최근 본 상품**
  - **localStorage를 통해 구현**
- **이벤트 참여**
- **제품 추천 서비스**
- **메인페이지 구현**
- 제품
  - 제품 필터
  - 제품 리스트
  - 제품 구매 및 결제
  - 제품 리뷰
- 고객지원
  - 자주하는 질문
  - 1:1 문의
- 마이 페이지
  - 장바구니
    - 제품 추가 / 삭제 / 전체구매
  - 주문내역
    - 구매 정보 및 제품 리스트
  - 포인트 및 쿠폰 기능
  - 회원정보 수정
- 관리자
  - 회원 정보 등록 / 수정 / 삭제 / 조회
  - 제품 통계 구현
  - 제품 재고 관리

## 시연영상(ToDo+/일정/예약 - 본인 구현 파트)

<a href="https://youtu.be/muJ4CnbfRNo">
  <img src="https://github.com/tnqlsdl1300/GitHub/blob/a29ed625eac866a6042080a59f8677903e279a03/shoppingmall_src/main.PNG" width="500" />
</a>

`기능 설명을 위한 자막이 있습니다. 유튜브 자막을 켜주시길 바랍니다.` 

## 수정사항

- 비밀번호 변경 시 [lastpwdchangeday - 비밀번호 변경 시점] 이 업데이트 되지 않는 오류를 수정

