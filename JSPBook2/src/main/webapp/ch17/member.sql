drop table member;

CREATE TABLE member(
   id VARCHAR(20) NOT NULL,
   passwd  VARCHAR(20),
   name VARCHAR(30),    
   PRIMARY KEY (id)
);
INSERT INTO member VALUES('1', '1234', '홍길동');
INSERT INTO member VALUES('2', '1235', '홍길순');


select * from member;
