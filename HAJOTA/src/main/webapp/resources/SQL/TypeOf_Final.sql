select *
from tbl_lodge;








--테이블명 또는 뷰명 무엇을 만들던 자기만의 index를 이름에 넣어서 만들어야 한다.(예 : 선효가 만드는 테이블 => SH_tbl_****)
--만들다가 다른쪽 테이블,뷰 등을 바꾸거나 추가적인것을 원한다면 그사람과 이야기를 한 후에 바꾸도록 한다.
--항상 주석을 달고 누가봐도 알아볼수있게 최대한 정리해서 만든다.
--자신이 만든거에대한 모든 쿼리문은 사소한것이라도 다있어야한다.

-----------------------------------------------------------------------------------------------------------------------------------------------------
--이선효도르 구역!

-----------------------------------------------------------------------------------------------------------------------------------------------------
--최호올스형 구역!

-----------------------------------------------------------------------------------------------------------------------------------------------------
--미스타 리 구역! 

-----------------------------------------------------------------------------------------------------------------------------------------------------
--유블랑형 구역!

-----------------------------------------------------------------------------------------------------------------------------------------------------
--김희쑥대머리 구역!

-----------------------------------------------------------------------------------------------------------------------------------------------------
--박박이 구역!

-----------------------------------------------------------------------------------------------------------------------------------------------------


-- 테이블 생성
/* 게스트 테이블 */
CREATE TABLE tbl_guest (
	guest_email VARCHAR2(50) NOT NULL, /* 게스트 이메일 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	first_name VARCHAR2(20) NOT NULL, /* 성 */
	last_name VARCHAR2(20) NOT NULL, /* 이름 */
	birth DATE NOT NULL, /* 생년월일 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_guest IS '게스트 테이블';

COMMENT ON COLUMN tbl_guest.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_guest.pwd IS '비밀번호';

COMMENT ON COLUMN tbl_guest.first_name IS '성';

COMMENT ON COLUMN tbl_guest.last_name IS '이름';

COMMENT ON COLUMN tbl_guest.birth IS '생년월일';

COMMENT ON COLUMN tbl_guest.status IS '회원 0 비회원 1';

CREATE UNIQUE INDEX PK_tbl_guest
	ON tbl_guest (
		guest_email ASC
	);

ALTER TABLE tbl_guest
	ADD
		CONSTRAINT PK_tbl_guest
		PRIMARY KEY (
			guest_email
		);

/* 쿠폰 테이블 */
CREATE TABLE tbl_coupon (
	seq_coupon NUMBER NOT NULL, /* 쿠폰 시퀀스 */
	guest_email VARCHAR2(50) NOT NULL, /* 게스트 이메일 */
	name VARCHAR2(40) NOT NULL, /* 쿠폰이름 */
	startday DATE NOT NULL, /* 쿠폰시작날 */
	endday DATE NOT NULL, /* 쿠폰끝나는날 */
	percent NUMBER NOT NULL, /* 쿠폰퍼센트 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_coupon IS '쿠폰 테이블';

COMMENT ON COLUMN tbl_coupon.seq_coupon IS '쿠폰 시퀀스';

COMMENT ON COLUMN tbl_coupon.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_coupon.name IS '쿠폰이름';

COMMENT ON COLUMN tbl_coupon.startday IS '쿠폰을 받는날 : 쿠폰 적용날짜';

COMMENT ON COLUMN tbl_coupon.endday IS '쿠폰이 끝나는 날 : 그달의 마지막날';

COMMENT ON COLUMN tbl_coupon.percent IS '쿠폰이 적용됬을 때 50% 차감 받도록하자';

COMMENT ON COLUMN tbl_coupon.status IS '상태';

CREATE UNIQUE INDEX PK_tbl_coupon
	ON tbl_coupon (
		seq_coupon ASC
	);

ALTER TABLE tbl_coupon
	ADD
		CONSTRAINT PK_tbl_coupon
		PRIMARY KEY (
			seq_coupon
		);

/* 공지사항 테이블 */
CREATE TABLE tbl_notice (
	seq_notice NUMBER NOT NULL, /* 공지사항 시퀀스 */
	admin_id VARCHAR2(20) NOT NULL, /* 관리자 아이디 */
	subject VARCHAR2(50) NOT NULL, /* 제목 */
	content VARCHAR2(3000) NOT NULL, /* 내용 */
	writeday DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_notice IS '공지사항 테이블';

COMMENT ON COLUMN tbl_notice.seq_notice IS '공지사항 시퀀스';

COMMENT ON COLUMN tbl_notice.admin_id IS '관리자 아이디';

COMMENT ON COLUMN tbl_notice.subject IS '제목';

COMMENT ON COLUMN tbl_notice.content IS '내용';

COMMENT ON COLUMN tbl_notice.writeday IS '작성일자';

COMMENT ON COLUMN tbl_notice.status IS '0 : 삭제
1 : alive
2 : 최신 공지 사항 아니면 Controller 단에서 최신 몇개 뽑아오기';

CREATE UNIQUE INDEX PK_tbl_notice
	ON tbl_notice (
		seq_notice ASC
	);

ALTER TABLE tbl_notice
	ADD
		CONSTRAINT PK_tbl_notice
		PRIMARY KEY (
			seq_notice
		);

/* 후기 신고 테이블 */
CREATE TABLE tbl_report_review (
	seq_report_review NUMBER NOT NULL, /* 후기 신고 시퀀스 */
	seq_review_guest NUMBER NOT NULL, /* 후기 시퀀스 */
	guest_email VARCHAR2(50) NOT NULL, /* 게스트 이메일 */
	content VARCHAR2(200) NOT NULL /* 신고 내용 */
);

COMMENT ON TABLE tbl_report_review IS '후기 신고 테이블';

COMMENT ON COLUMN tbl_report_review.seq_report_review IS '후기 신고 시퀀스';

COMMENT ON COLUMN tbl_report_review.seq_review_guest IS '후기 시퀀스';

COMMENT ON COLUMN tbl_report_review.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_report_review.content IS '신고 내용';

CREATE UNIQUE INDEX PK_tbl_report_review
	ON tbl_report_review (
		seq_report_review ASC
	);

ALTER TABLE tbl_report_review
	ADD
		CONSTRAINT PK_tbl_report_review
		PRIMARY KEY (
			seq_report_review
		);

/* 후기 추천 테이블 */
CREATE TABLE tbl_review_recommend (
	seq_review NUMBER NOT NULL, /* 후기 추천시퀀스 */
	seq_review_guest NUMBER NOT NULL, /* 후기 시퀀스 */
	guest_email VARCHAR2(50) NOT NULL /* 게스트 이메일 */
);

COMMENT ON TABLE tbl_review_recommend IS '후기 추천 테이블';

COMMENT ON COLUMN tbl_review_recommend.seq_review IS '후기 추천시퀀스';

COMMENT ON COLUMN tbl_review_recommend.seq_review_guest IS '후기 시퀀스';

COMMENT ON COLUMN tbl_review_recommend.guest_email IS '게스트 이메일';

CREATE UNIQUE INDEX PK_tbl_review_recommend
	ON tbl_review_recommend (
		seq_review ASC
	);

ALTER TABLE tbl_review_recommend
	ADD
		CONSTRAINT PK_tbl_review_recommend
		PRIMARY KEY (
			seq_review
		);

/* 결제 내역 테이블 */
CREATE TABLE tbl_payment (
	seq_payment NUMBER NOT NULL, /* 결제 시퀀스 */
	seq_lodge NUMBER NOT NULL, /* 숙소 시퀀스 */
	guest_email VARCHAR2(50) NOT NULL, /* 게스트 이메일 */
	checkin_date DATE NOT NULL, /* 체크인날짜 */
	checkout_date DATE NOT NULL, /* 체크아웃날짜 */
	checkin_person NUMBER NOT NULL, /* 숙박 인원수 */
	seq_coupon NUMBER NOT NULL, /* 쿠폰 시퀀스 */
	total_saleprice NUMBER NOT NULL, /* 총 금액 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

ALTER TABLE tbl_payment
ADD (salesdate DATE DEFAULT sysdate NOT NULL);

COMMENT ON TABLE tbl_payment IS '결제 내역 테이블';

COMMENT ON COLUMN tbl_payment.seq_payment IS '결제 시퀀스';

COMMENT ON COLUMN tbl_payment.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_payment.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_payment.checkin_date IS '체크인날짜';

COMMENT ON COLUMN tbl_payment.checkout_date IS '체크아웃날짜';

COMMENT ON COLUMN tbl_payment.checkin_person IS '숙박 인원수';

COMMENT ON COLUMN tbl_payment.seq_coupon IS '쿠폰 시퀀스';

COMMENT ON COLUMN tbl_payment.total_saleprice IS '총 금액';

COMMENT ON COLUMN tbl_payment.status IS '상태
0: 삭제
1: 예약중';

COMMENT ON COLUMN tbl_payment.salesdate IS '결제일자';

CREATE UNIQUE INDEX PK_tbl_payment
	ON tbl_payment (
		seq_payment ASC
	);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT PK_tbl_payment
		PRIMARY KEY (
			seq_payment
		);

/* 호스트 언어 */
CREATE TABLE tbl_host_language (
	host_email VARCHAR2(50) NOT NULL, /* 호스트 이메일 */
	language VARCHAR2(20) NOT NULL /* 사용 언어 */
);

COMMENT ON TABLE tbl_host_language IS '호스트 언어';

COMMENT ON COLUMN tbl_host_language.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_host_language.language IS '사용 언어';

CREATE UNIQUE INDEX PK_tbl_host_language
	ON tbl_host_language (
		host_email ASC
	);

ALTER TABLE tbl_host_language
	ADD
		CONSTRAINT PK_tbl_host_language
		PRIMARY KEY (
			host_email
		);

/* 게스트 후기 테이블 */
CREATE TABLE tbl_review_guest (
	seq_review_guest NUMBER NOT NULL, /* 후기 시퀀스 */
	guest_email VARCHAR2(50), /* 게스트 이메일 */
	seq_payment NUMBER NOT NULL, /* 결제 시퀀스 */
	score NUMBER(1) NOT NULL, /* 별점 */
	guest_comment VARCHAR2(2000) NOT NULL, /* 게스트코멘트 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_review_guest IS '게스트 후기 테이블';

COMMENT ON COLUMN tbl_review_guest.seq_review_guest IS '후기 시퀀스';

COMMENT ON COLUMN tbl_review_guest.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_review_guest.seq_payment IS '결제 시퀀스';

COMMENT ON COLUMN tbl_review_guest.score IS '1~5점';

COMMENT ON COLUMN tbl_review_guest.guest_comment IS '게스트코멘트';

COMMENT ON COLUMN tbl_review_guest.status IS '상태';

CREATE UNIQUE INDEX PK_tbl_review_guest
	ON tbl_review_guest (
		seq_review_guest ASC
	);

ALTER TABLE tbl_review_guest
	ADD
		CONSTRAINT PK_tbl_review_guest
		PRIMARY KEY (
			seq_review_guest
		);

/* 숙소 기본 정보 테이블 */
CREATE TABLE tbl_lodge (
	seq_lodge NUMBER NOT NULL, /* 숙소 시퀀스 */
	host_email VARCHAR2(50) NOT NULL, /* 호스트 이메일 */
	name VARCHAR2(100) NOT NULL, /* 숙소이름 */
	type_lodge VARCHAR2(20) NOT NULL, /* 숙소유형 */
	type_building VARCHAR2(20) NOT NULL, /* 건물유형 */
	location VARCHAR2(200) NOT NULL, /* 숙소지역 */
	lat NUMBER NOT NULL, /* 지역위도 */
	lon NUMBER NOT NULL, /* 지역경도 */
	img_main VARCHAR2(200) NOT NULL, /* 메인이미지1 */
	num_of_people NUMBER NOT NULL, /* 숙박가능인원 */
	padd_price NUMBER NOT NULL, /* 가격(추가인원) */
	deposit_price NUMBER NOT NULL, /* 가격(보증금) */
	clean_price NUMBER NOT NULL, /* 가격(청소비) */
	total_price NUMBER NOT NULL, /* 숙소금액 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_lodge IS '숙소 기본 정보 테이블';

COMMENT ON COLUMN tbl_lodge.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_lodge.name IS '숙소이름';

COMMENT ON COLUMN tbl_lodge.type_lodge IS '0 : 집 전체
1 ~ : 방 n 개';

COMMENT ON COLUMN tbl_lodge.type_building IS '건물유형';

COMMENT ON COLUMN tbl_lodge.location IS '지오코딩을 사용하여 위도와 경도를 받을 예정';

COMMENT ON COLUMN tbl_lodge.lat IS '지역위도';

COMMENT ON COLUMN tbl_lodge.lon IS '지역경도';

COMMENT ON COLUMN tbl_lodge.img_main IS '메인이미지1';

COMMENT ON COLUMN tbl_lodge.num_of_people IS '숙박가능인원';

COMMENT ON COLUMN tbl_lodge.padd_price IS '가격(추가인원)';

COMMENT ON COLUMN tbl_lodge.deposit_price IS '가격(보증금)';

COMMENT ON COLUMN tbl_lodge.clean_price IS '가격(청소비)';

COMMENT ON COLUMN tbl_lodge.total_price IS '숙소금액';

COMMENT ON COLUMN tbl_lodge.status IS '상태';

CREATE UNIQUE INDEX PK_tbl_lodge
	ON tbl_lodge (
		seq_lodge ASC
	);

ALTER TABLE tbl_lodge
	ADD
		CONSTRAINT PK_tbl_lodge
		PRIMARY KEY (
			seq_lodge
		);

/* 숙소 소개 테이블 */
CREATE TABLE tbl_lodge_intro (
	seq_lodge NUMBER NOT NULL, /* 숙소 시퀀스 */
	COL VARCHAR2(3000) NOT NULL, /* 호스트숙소설명 */
	rooms_rule VARCHAR2(3000) NOT NULL, /* 숙소이용규칙 */
	refund_policy VARCHAR2(3000) NOT NULL, /* 환불정책 */
	safety_function VARCHAR2(3000) NOT NULL, /* 안전기능 */
	local_infomation VARCHAR2(3000) NOT NULL /* 지역정보 */
);

COMMENT ON TABLE tbl_lodge_intro IS '숙소 소개 테이블';

COMMENT ON COLUMN tbl_lodge_intro.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_intro.COL IS '호스트숙소설명';

COMMENT ON COLUMN tbl_lodge_intro.rooms_rule IS '숙소이용규칙';

COMMENT ON COLUMN tbl_lodge_intro.refund_policy IS '환불정책';

COMMENT ON COLUMN tbl_lodge_intro.safety_function IS '안전기능';

COMMENT ON COLUMN tbl_lodge_intro.local_infomation IS '지역정보';

CREATE UNIQUE INDEX PK_tbl_lodge_intro
	ON tbl_lodge_intro (
		seq_lodge ASC
	);

ALTER TABLE tbl_lodge_intro
	ADD
		CONSTRAINT PK_tbl_lodge_intro
		PRIMARY KEY (
			seq_lodge
		);

/* 숙소 상세 테이블 */
CREATE TABLE tbl_lodge_detail (
	seq_lodge NUMBER NOT NULL, /* 숙소 시퀀스 */
	num_of_bathroom NUMBER NOT NULL, /* 욕실 */
	num_of_bedroom NUMBER NOT NULL, /* 침실 */
	num_of_bed NUMBER NOT NULL, /* 침대 */
	checkin_time VARCHAR2(4) NOT NULL, /* 체크인시간 */
	checkout_time VARCHAR2(4) NOT NULL /* 체크아웃시간 */
);

COMMENT ON TABLE tbl_lodge_detail IS '숙소 상세 테이블';

COMMENT ON COLUMN tbl_lodge_detail.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_detail.num_of_bathroom IS '욕실';

COMMENT ON COLUMN tbl_lodge_detail.num_of_bedroom IS '침실';

COMMENT ON COLUMN tbl_lodge_detail.num_of_bed IS '침대';

COMMENT ON COLUMN tbl_lodge_detail.checkin_time IS '24시로 계산하여 시, 분 2자씩 입력받아 붙여서 넣기로 하자';

COMMENT ON COLUMN tbl_lodge_detail.checkout_time IS '24시로 계산하여 시, 분 2자씩 입력받아 붙여서 넣기로 하자';

CREATE UNIQUE INDEX PK_tbl_lodge_detail
	ON tbl_lodge_detail (
		seq_lodge ASC
	);

ALTER TABLE tbl_lodge_detail
	ADD
		CONSTRAINT PK_tbl_lodge_detail
		PRIMARY KEY (
			seq_lodge
		);

/* 숙소 시설 테이블 */
CREATE TABLE tbl_lodge_detail2 (
	seq_lodge NUMBER NOT NULL, /* 숙소 시퀀스 */
	elevator NUMBER(1) DEFAULT 0 NOT NULL, /* 엘리베이터 */
	wifi NUMBER(1) DEFAULT 0 NOT NULL, /* 무선인터넷 */
	air_controller NUMBER(1) DEFAULT 0 NOT NULL, /* 에어컨 */
	heating NUMBER(1) DEFAULT 0 NOT NULL, /* 난방 */
	washing_machine NUMBER(1) DEFAULT 0 NOT NULL, /* 세탁기 */
	hair_dryer NUMBER(1) DEFAULT 0 NOT NULL, /* 헤어드라이기 */
	tv NUMBER(1) DEFAULT 0 NOT NULL, /* TV */
	essential_item NUMBER(1) DEFAULT 0 NOT NULL /* 필수품목 */
);

COMMENT ON TABLE tbl_lodge_detail2 IS '숙소 시설 테이블';

COMMENT ON COLUMN tbl_lodge_detail2.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_detail2.elevator IS '엘리베이터';

COMMENT ON COLUMN tbl_lodge_detail2.wifi IS '무선인터넷';

COMMENT ON COLUMN tbl_lodge_detail2.air_controller IS '에어컨';

COMMENT ON COLUMN tbl_lodge_detail2.heating IS '난방';

COMMENT ON COLUMN tbl_lodge_detail2.washing_machine IS '세탁기';

COMMENT ON COLUMN tbl_lodge_detail2.hair_dryer IS '헤어드라이기';

COMMENT ON COLUMN tbl_lodge_detail2.tv IS 'TV';

COMMENT ON COLUMN tbl_lodge_detail2.essential_item IS '필수품목';

CREATE UNIQUE INDEX PK_tbl_lodge_detail2
	ON tbl_lodge_detail2 (
		seq_lodge ASC
	);

ALTER TABLE tbl_lodge_detail2
	ADD
		CONSTRAINT PK_tbl_lodge_detail2
		PRIMARY KEY (
			seq_lodge
		);

/* 호스트 테이블 */
CREATE TABLE tbl_host (
	host_email VARCHAR2(50) NOT NULL, /* 호스트 이메일 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	last_name VARCHAR2(30) NOT NULL, /* 성 */
	first_name VARCHAR2(30) NOT NULL, /* 이름 */
	birthday DATE NOT NULL, /* 생년월일 */
	status NUMBER(1) DEFAULT 1 NOT NULL, /* 상태 */
	grade VARCHAR2(2) DEFAULT 'D' NOT NULL, /* 등급 */
	commission NUMBER DEFAULT 10 NOT NULL /* 수수료 */
);

COMMENT ON TABLE tbl_host IS '호스트 테이블';

COMMENT ON COLUMN tbl_host.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_host.pwd IS '비밀번호';

COMMENT ON COLUMN tbl_host.last_name IS '성';

COMMENT ON COLUMN tbl_host.first_name IS '이름';

COMMENT ON COLUMN tbl_host.birthday IS '생년월일';

COMMENT ON COLUMN tbl_host.status IS '회원 0 비회원 1';

COMMENT ON COLUMN tbl_host.grade IS '등급';

COMMENT ON COLUMN tbl_host.commission IS 'A : 5%
B : 7%
C : 9%
D : 11%';

CREATE UNIQUE INDEX PK_tbl_host
	ON tbl_host (
		host_email ASC
	);

ALTER TABLE tbl_host
	ADD
		CONSTRAINT PK_tbl_host
		PRIMARY KEY (
			host_email
		);

/* 관리자 테이블 */
CREATE TABLE tbl_admin (
	admin_ID VARCHAR2(20) NOT NULL, /* 관리자 아이디 */
	admin_Pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	admin_grade NUMBER(1) NOT NULL /* 등급 */
);

ALTER TABLE tbl_admin
ADD (status NUMBER(1) DEFAULT 1 NOT NULL); /* 상태 */

COMMENT ON TABLE tbl_admin IS '관리자 테이블';

COMMENT ON COLUMN tbl_admin.admin_ID IS '관리자 아이디';

COMMENT ON COLUMN tbl_admin.admin_Pwd IS '비밀번호';

COMMENT ON COLUMN tbl_admin.admin_grade IS '1: 부계정
5: 마스터';

COMMENT ON COLUMN tbl_admin.status IS '상태';

CREATE UNIQUE INDEX PK_tbl_admin
	ON tbl_admin (
		admin_ID ASC
	);

ALTER TABLE tbl_admin
	ADD
		CONSTRAINT PK_tbl_admin
		PRIMARY KEY (
			admin_ID
		);

/* 호스트 디테일 */
CREATE TABLE tbl_host_detail (
	host_email VARCHAR2(50) NOT NULL, /* 호스트 이메일 */
	tel VARCHAR2(20) NOT NULL /* 연락처 */
);

COMMENT ON TABLE tbl_host_detail IS '호스트 디테일';

COMMENT ON COLUMN tbl_host_detail.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_host_detail.tel IS '휴대전화 인증 api 사용하여 본인 확인';

CREATE UNIQUE INDEX PK_tbl_host_detail
	ON tbl_host_detail (
		host_email ASC
	);

ALTER TABLE tbl_host_detail
	ADD
		CONSTRAINT PK_tbl_host_detail
		PRIMARY KEY (
			host_email
		);

/* 숙소 상세 이미지 테이블 */
CREATE TABLE tbl_lodge_image (
	seq_lodge_image NUMBER NOT NULL, /* 숙소 이미지 시퀀스 */
	seq_lodge NUMBER, /* 숙소 시퀀스 */
	image VARCHAR2(200) /* 이미지 */
);

COMMENT ON TABLE tbl_lodge_image IS '숙소 상세 이미지 테이블';

COMMENT ON COLUMN tbl_lodge_image.seq_lodge_image IS '숙소 이미지 시퀀스';

COMMENT ON COLUMN tbl_lodge_image.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_image.image IS '이미지';

CREATE UNIQUE INDEX PK_tbl_lodge_image
	ON tbl_lodge_image (
		seq_lodge_image ASC
	);

ALTER TABLE tbl_lodge_image
	ADD
		CONSTRAINT PK_tbl_lodge_image
		PRIMARY KEY (
			seq_lodge_image
		);

/* 호스트 후기 테이블 */
CREATE TABLE tbl_review_host (
	seq_review_host NUMBER NOT NULL, /* 후기 시퀀스 */
	host_email VARCHAR2(50), /* 호스트 이메일 */
	host_comment VARCHAR2(2000) NOT NULL, /* 호스트코멘트 */
	status NUMBER(1) DEFAULT 1 NOT NULL /* 상태 */
);

COMMENT ON TABLE tbl_review_host IS '호스트 후기 테이블';

COMMENT ON COLUMN tbl_review_host.seq_review_host IS '후기 시퀀스';

COMMENT ON COLUMN tbl_review_host.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_review_host.host_comment IS '호스트코멘트';

COMMENT ON COLUMN tbl_review_host.status IS '상태';

CREATE UNIQUE INDEX PK_tbl_review_host
	ON tbl_review_host (
		seq_review_host ASC
	);

ALTER TABLE tbl_review_host
	ADD
		CONSTRAINT PK_tbl_review_host
		PRIMARY KEY (
			seq_review_host
		);

/* 구인 테이블 */
CREATE TABLE tbl_recruit (
	seq_recruit NUMBER NOT NULL, /* 구인 시퀀스 */
	last_name VARCHAR2(30) NOT NULL, /* 성 */
	first_name VARCHAR2(30) NOT NULL, /* 이름 */
	COL VARCHAR2(50) NOT NULL, /* 이메일 */
	tel VARCHAR2(20) NOT NULL, /* 연락처 */
	resume VARCHAR2(200) NOT NULL /* 이력서 */
);

COMMENT ON TABLE tbl_recruit IS '구인 테이블';

COMMENT ON COLUMN tbl_recruit.seq_recruit IS '구인 시퀀스';

COMMENT ON COLUMN tbl_recruit.last_name IS '성';

COMMENT ON COLUMN tbl_recruit.first_name IS '이름';

COMMENT ON COLUMN tbl_recruit.COL IS '이메일';

COMMENT ON COLUMN tbl_recruit.tel IS '연락처';

COMMENT ON COLUMN tbl_recruit.resume IS '이력서는 파일 주소';

CREATE UNIQUE INDEX PK_tbl_recruit
	ON tbl_recruit (
		seq_recruit ASC
	);

ALTER TABLE tbl_recruit
	ADD
		CONSTRAINT PK_tbl_recruit
		PRIMARY KEY (
			seq_recruit
		);

/* 호스트 탈퇴 테이블 */
CREATE TABLE tbl_host_withdraw (
	host_email VARCHAR2(50) NOT NULL, /* 호스트 이메일 */
	seq_host_withdraw_reason NUMBER /* 호스트 탈퇴 이유 시퀀스 */
);

COMMENT ON TABLE tbl_host_withdraw IS '호스트 탈퇴 테이블';

COMMENT ON COLUMN tbl_host_withdraw.host_email IS '호스트 이메일';

COMMENT ON COLUMN tbl_host_withdraw.seq_host_withdraw_reason IS '호스트 탈퇴 이유 시퀀스';

CREATE UNIQUE INDEX PK_tbl_host_withdraw
	ON tbl_host_withdraw (
		host_email ASC
	);

ALTER TABLE tbl_host_withdraw
	ADD
		CONSTRAINT PK_tbl_host_withdraw
		PRIMARY KEY (
			host_email
		);

/* 게스트 탈퇴 테이블 */
CREATE TABLE tbl_guest_withdraw (
	guest_email VARCHAR2(50) NOT NULL, /* 게스트 이메일 */
	seq_guest_withdraw_reason NUMBER /* 게스트 탈퇴 이유 시퀀스 */
);

COMMENT ON TABLE tbl_guest_withdraw IS '게스트 탈퇴 테이블';

COMMENT ON COLUMN tbl_guest_withdraw.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_guest_withdraw.seq_guest_withdraw_reason IS '게스트 탈퇴 이유 시퀀스';

CREATE UNIQUE INDEX PK_tbl_guest_withdraw
	ON tbl_guest_withdraw (
		guest_email ASC
	);

ALTER TABLE tbl_guest_withdraw
	ADD
		CONSTRAINT PK_tbl_guest_withdraw
		PRIMARY KEY (
			guest_email
		);

/* 환율 정보 테이블 */
CREATE TABLE tbl_exchange (
	before_currency NUMBER NOT NULL, /* 기존 통화 */
	after_currency NUMBER NOT NULL, /* 변환할 통화 */
	rate_currency NUMBER NOT NULL, /* 환율 */
	update_date DATE NOT NULL /* 갱신날짜 */
);

COMMENT ON TABLE tbl_exchange IS '환율 정보 테이블';

COMMENT ON COLUMN tbl_exchange.before_currency IS '기존 통화';

COMMENT ON COLUMN tbl_exchange.after_currency IS '변환할 통화';

COMMENT ON COLUMN tbl_exchange.rate_currency IS '환율';

COMMENT ON COLUMN tbl_exchange.update_date IS '아마존 DB 가 어디 기준 시각인지 확인해야함';

/* 호스트 탈퇴 이유 시퀀스 */
CREATE TABLE tbl_host_withdraw_reason (
	seq_host_withdraw_reason NUMBER NOT NULL, /* 호스트 탈퇴 이유 시퀀스 */
	withdraw_reason VARCHAR2(100) NOT NULL /* 탈퇴 이유 */
);

COMMENT ON TABLE tbl_host_withdraw_reason IS '호스트 탈퇴 이유 시퀀스';

COMMENT ON COLUMN tbl_host_withdraw_reason.seq_host_withdraw_reason IS '호스트 탈퇴 이유 시퀀스';

COMMENT ON COLUMN tbl_host_withdraw_reason.withdraw_reason IS '탈퇴 이유';

CREATE UNIQUE INDEX PK_tbl_host_withdraw_reason
	ON tbl_host_withdraw_reason (
		seq_host_withdraw_reason ASC
	);

ALTER TABLE tbl_host_withdraw_reason
	ADD
		CONSTRAINT PK_tbl_host_withdraw_reason
		PRIMARY KEY (
			seq_host_withdraw_reason
		);

/* 게스트 탈퇴 이유 시퀀스 */
CREATE TABLE tbl_guest_withdraw_reason (
	seq_guest_withdraw_reason NUMBER NOT NULL, /* 게스트 탈퇴 이유 시퀀스 */
	withdraw_reason VARCHAR2(100) NOT NULL /* 탈퇴 이유 */
);

COMMENT ON TABLE tbl_guest_withdraw_reason IS '게스트 탈퇴 이유 시퀀스';

COMMENT ON COLUMN tbl_guest_withdraw_reason.seq_guest_withdraw_reason IS '게스트 탈퇴 이유 시퀀스';

COMMENT ON COLUMN tbl_guest_withdraw_reason.withdraw_reason IS '탈퇴 이유';

CREATE UNIQUE INDEX PK_tbl_guest_withdraw_reason
	ON tbl_guest_withdraw_reason (
		seq_guest_withdraw_reason ASC
	);

ALTER TABLE tbl_guest_withdraw_reason
	ADD
		CONSTRAINT PK_tbl_guest_withdraw_reason
		PRIMARY KEY (
			seq_guest_withdraw_reason
		);

/* 호스트 신고 테이블 */
CREATE TABLE tbl_host_report (
	seq_host_report NUMBER NOT NULL, /* 호스트 신고 시퀀스 */
	seq_payment NUMBER, /* 결제 시퀀스 */
	guest_email VARCHAR2(50), /* 게스트 이메일 */
	content VARCHAR2(1000) NOT NULL /* 신고 내용 */
);

COMMENT ON TABLE tbl_host_report IS '호스트 신고 테이블';

COMMENT ON COLUMN tbl_host_report.seq_host_report IS '호스트 신고 시퀀스';

COMMENT ON COLUMN tbl_host_report.seq_payment IS '결제 시퀀스';

COMMENT ON COLUMN tbl_host_report.guest_email IS '게스트 이메일';

COMMENT ON COLUMN tbl_host_report.content IS '신고 내용';

CREATE UNIQUE INDEX PK_tbl_host_report
	ON tbl_host_report (
		seq_host_report ASC
	);

/* 가고 싶은 숙소 테이블 */
CREATE TABLE tbl_lodge_wish (
	seq_lodge_wish NUMBER NOT NULL, /* 가고 싶은 숙소 시퀀스 */
	seq_lodge NUMBER, /* 숙소 시퀀스 */
	guest_email VARCHAR2(50) /* 게스트 이메일 */
);

COMMENT ON TABLE tbl_lodge_wish IS '가고 싶은 숙소 테이블';

COMMENT ON COLUMN tbl_lodge_wish.seq_lodge_wish IS '가고 싶은 숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_wish.seq_lodge IS '숙소 시퀀스';

COMMENT ON COLUMN tbl_lodge_wish.guest_email IS '게스트 이메일';

CREATE UNIQUE INDEX PK_tbl_lodge_wish
	ON tbl_lodge_wish (
		seq_lodge_wish ASC
	);

ALTER TABLE tbl_lodge_wish
	ADD
		CONSTRAINT PK_tbl_lodge_wish
		PRIMARY KEY (
			seq_lodge_wish
		);

ALTER TABLE tbl_host_report
	ADD
		CONSTRAINT PK_tbl_host_report
		PRIMARY KEY (
			seq_host_report
		);

ALTER TABLE tbl_coupon
	ADD
		CONSTRAINT FK_tbl_coupon_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_notice
	ADD
		CONSTRAINT FK_tbl_notice_id
		FOREIGN KEY (
			admin_id
		)
		REFERENCES tbl_admin (
			admin_ID
		);

ALTER TABLE tbl_report_review
	ADD
		CONSTRAINT FK_tbl_report_review_seq
		FOREIGN KEY (
			seq_review_guest
		)
		REFERENCES tbl_review_guest (
			seq_review_guest
		);

ALTER TABLE tbl_report_review
	ADD
		CONSTRAINT FK_tbl_report_review_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_review_recommend
	ADD
		CONSTRAINT FK_tbl_review_recommend_seq
		FOREIGN KEY (
			seq_review_guest
		)
		REFERENCES tbl_review_guest (
			seq_review_guest
		);

ALTER TABLE tbl_review_recommend
	ADD
		CONSTRAINT FK_tbl_review_recommend_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT FK_tbl_payment_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT FK_tbl_payment_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_payment
	ADD
		CONSTRAINT FK_tbl_payment_seq
		FOREIGN KEY (
			seq_coupon
		)
		REFERENCES tbl_coupon (
			seq_coupon
		);

ALTER TABLE tbl_host_language
	ADD
		CONSTRAINT FK_tbl_host_language_email
		FOREIGN KEY (
			host_email
		)
		REFERENCES tbl_host (
			host_email
		);

ALTER TABLE tbl_review_guest
	ADD
		CONSTRAINT FK_tbl_review_guest_seq
		FOREIGN KEY (
			seq_payment
		)
		REFERENCES tbl_payment (
			seq_payment
		);

ALTER TABLE tbl_review_guest
	ADD
		CONSTRAINT FK_tbl_review_guest_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_lodge
	ADD
		CONSTRAINT FK_tbl_lodge_email
		FOREIGN KEY (
			host_email
		)
		REFERENCES tbl_host (
			host_email
		);

ALTER TABLE tbl_lodge_intro
	ADD
		CONSTRAINT FK_tbl_lodge_intro_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_lodge_detail
	ADD
		CONSTRAINT FK_tbl_lodge_detail_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_lodge_detail2
	ADD
		CONSTRAINT FK_tbl_lodge_detail2_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_host_detail
	ADD
		CONSTRAINT FK_tbl_host_detail_email
		FOREIGN KEY (
			host_email
		)
		REFERENCES tbl_host (
			host_email
		);

ALTER TABLE tbl_lodge_image
	ADD
		CONSTRAINT FK_tbl_lodge_image_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_review_host
	ADD
		CONSTRAINT FK_tbl_review_host_seq
		FOREIGN KEY (
			seq_review_host
		)
		REFERENCES tbl_review_guest (
			seq_review_guest
		);

ALTER TABLE tbl_review_host
	ADD
		CONSTRAINT FK_tbl_review_host_email
		FOREIGN KEY (
			host_email
		)
		REFERENCES tbl_host (
			host_email
		);

ALTER TABLE tbl_host_withdraw
	ADD
		CONSTRAINT FK_tbl_host_withdraw_email
		FOREIGN KEY (
			host_email
		)
		REFERENCES tbl_host (
			host_email
		);

ALTER TABLE tbl_host_withdraw
	ADD
		CONSTRAINT FK_tbl_host_withdraw_seq
		FOREIGN KEY (
			seq_host_withdraw_reason
		)
		REFERENCES tbl_host_withdraw_reason (
			seq_host_withdraw_reason
		);

ALTER TABLE tbl_guest_withdraw
	ADD
		CONSTRAINT FK_tbl_guest_withdraw_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);

ALTER TABLE tbl_guest_withdraw
	ADD
		CONSTRAINT FK_tbl_guest_withdraw_seq
		FOREIGN KEY (
			seq_guest_withdraw_reason
		)
		REFERENCES tbl_guest_withdraw_reason (
			seq_guest_withdraw_reason
		);

ALTER TABLE tbl_host_report
	ADD
		CONSTRAINT FK_tbl_host_report_seq
		FOREIGN KEY (
			seq_payment
		)
		REFERENCES tbl_payment (
			seq_payment
		);

ALTER TABLE tbl_host_report
	ADD
		CONSTRAINT FK_tbl_host_report_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);
                
ALTER TABLE tbl_lodge_wish
	ADD
		CONSTRAINT FK_tbl_lodge_wish_seq
		FOREIGN KEY (
			seq_lodge
		)
		REFERENCES tbl_lodge (
			seq_lodge
		);

ALTER TABLE tbl_lodge_wish
	ADD
		CONSTRAINT FK_tbl_lodge_wish_email
		FOREIGN KEY (
			guest_email
		)
		REFERENCES tbl_guest (
			guest_email
		);
		

		
// 시퀀스 생성
create sequence seq_host_withdraw_reason
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_notice
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_recruit
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_lodge_image
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_lodge
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_coupon
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_payment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_host_report
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_report_review
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_review
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_review_guest
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_review_host
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_guest_withdraw_reason
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence seq_lodge_wish
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;