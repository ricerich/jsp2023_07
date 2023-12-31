--시퀀스

drop SEQUENCE id_seq;

CREATE SEQUENCE id_seq
START WITH 1
INCREMENT BY 1;

select * from USER_SEQUENCES;

--트리거
CREATE OR REPLACE TRIGGER id_sequence_trigger
BEFORE INSERT
ON member
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
	SELECT id_seq.nextval INTO :NEW.id FROM dual;
END;