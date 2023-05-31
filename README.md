# :movie_camera: Spring-Project-MovieMate
스프링 MVC패턴을 기반으로 제작
   
##  :pushpin: 프로젝트 소개
'왓챠피디아'를 참고한 영화 커뮤니티 사이트입니다.

##  :pushpin: 개발 기간
**2023.04.10 ~ 2023.05.15**
- 04.10 ~ 04.11   주제 선정
- 04.11 ~ 04.14   데이터베이스 스키마 설계 및 HTML 전개도 구축
- 04.14 ~ 04.19 Open Api 기반 영화 데이터 정제 후 데이터베이스 구축 및 스프링 배포
- 04.19 ~ 05.15 사이트 제작
- 05.15 ~ 코드 리팩토링 (refactoring)    

## :pushpin: 개발 환경
- "Java 11"
- "JDK 1.11.0"
- "IDE : STS 3.7"
- "Database : Oracle DB (11xe)"
- "ORM : Mybatis"

## :pushpin: 멤버
### 고민지
- **영화 선택 페이지** - 댓글 수정, 삭제, 좋아요, 댓글 수 기능 구현
- **영화 선택 캐스트 페이지** - 캐스트 정보 출력 및 좋아요 증가 기능 구현
- **영화 선택 캐스트 페이지** - 해당 캐스트의 작품 리스트 출력
- **댓글 목록 페이지** - 해당 댓글 클릭시 해당 댓글과 대댓글 목록 출력 및 기능 상호작용
- **대댓글 페이지** - 댓글 수정, 삭제 , 좋아요, 댓글 수 기능 상호작용 가능하도록 데이터 가져오기
- **대댓글 페이지** - 대댓글 등록, 수정, 삭제 기능 구현
- **검색창** - 영화, 배우, 감독, 유저 검색 기능 구현
- **검색창** - 내가 검색한 영화, 영화들을 만든 감독리스트, 출연한 배우리스트 출력하기
- **헤더** - 홈키, 선택, 검색, 로그인, 회원가입, 다크모드 기능 추가
- **헤더** - 다크모드 기능 구현

### 채민석
- **메인 화면** -  임의의 기준으로 인플루언서를 뽑아 추천한 영화 데이터 가져오기
- **메인 화면** - 박스오피스 기준 영화 데이터 가져오기
- **메인 화면** - 명작 영화 데이터 가져오기
- **메인 화면** - 임의의 기준으로 배우를 뽑아 배우가 출연한 영화 데이터 가져오기
- 평균별점 높은 기준 영화 데이터 가져오기
- 메인 화면 장르 기반으로 추천한 영화 데이터 가져오기
- 마이페이지 
- **로그인** - 카카오 open api

### 김현준
- 기본 SPRING  배포 버전 제작
- **상호작용 리스트** - 좋아요, 댓글일 경우 리스트 출력, 더보기, 시간순 영화리스트 출력   
- **상호작용 리스트** - 별점일 경우, 드랍다운 구현, 별점별 영화출력 더보기 구현   
- **상호작용 리스트** - 별점일 경우 별점순, 각종 기준점 정하기    
- **메인화면** - 예상별점 높은 영화 데이터 추출
- **메인화면** - 임의의 태그를 뽑아 태그가 포함된 영화 데이터 가져오기
- **영화 선택 페이지** - 영화를 만든 제작진과 댓글달린 목록 출력
- **영화 선택 페이지** - 선택한 영화정보 출력
- **영화 선택 페이지** - 비슷한 작품 영화리스트 출력
- **헤더** - 자체 회원가입 기능 구현
- **대댓글 페이지** - 클린봇 기능 구현

### 박성준
- **메인 화면** - Top10 기준 영화 데이터 가져오기
- **메인 화면** - 임의의 기준으로 감독을 뽑아 감독이 만든 영화 데이터 가져오기  
- **마이 페이지** - 상호작용리스트 댓글일 경우 내가 단 영화 리스트 출력
- **마이 페이지** - 상호작용리스트 내가 댓글 단 목록
- 수정 페이지


### 장현상
- **메인 화면** - 임의의 기준으로 인플루언서를 뽑아 추천한 영화 데이터 가져오기
- **메인 화면** - 박스오피스 기준 영화 데이터 가져오기
- **메인 화면** - 명작 영화 데이터 가져오기
- **메인 화면** - 임의의 기준으로 배우를 뽑아 배우가 출연한 영화 데이터 가져오기
- **로그인** - 네이버 open api, 자체 회원가입 기능 구현
- **영화 선택 페이지** - 더 보기 영화 모든 정보 출력
- **풋터(footer)** - 개발자 정보 담은 링크 배열 출력








