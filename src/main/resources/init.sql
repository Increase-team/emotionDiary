-- 회원 테이블
CREATE TABLE IF NOT EXISTS member(
	member_id INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '회원 아이디',
	member_name VARCHAR(20) COMMENT '회원 이름',
	member_password VARCHAR(200) COMMENT '회원 비밀번호',
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '가입 날짜',
    ismember BOOLEAN COMMENT '회원 탈퇴여부 (1: 탈퇴, 0: 미탈퇴)'
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 캘린더 테이블
CREATE TABLE IF NOT EXISTS calendar
(
    calendar_id INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY COMMENT '캘린더 아이디',
    member_id INTEGER(4) COMMENT '회원 아이디',
    calendar_emotion VARCHAR(30) CHECK(calendar_emotion IN ('angry','happy','soso','sad','romance','irritation')) COMMENT '감정',
   	content VARCHAR(100) COMMENT '내용',
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '작성 날짜',
    CONSTRAINT calendar_member_id_fk FOREIGN KEY (member_id) REFERENCES member(member_id) on DELETE set NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
