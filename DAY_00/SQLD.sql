SELECT chr(65) FROM DUAL -- A
SELECT ltrim('블랙핑크','블랙') FROM DUAL  --블랙 빼기
SELECT rtrim('JENNIE    ') FROM DUAL 
SELECT trim('   jennie    ') FROM DUAL --양쪽 다듬기
SELECT trim(LEADING '블' FROM '블랙핑크') FROM DUAL --랙핑크
SELECT substr('블랙핑크제니',3,4) FROM DUAL --핑크제니
SELECT length('jennie') FROM DUAL --길이 6
SELECT replace('블랙핑크제니','블랙') FROM DUAL --블랙을 빼기
SELECT replace('블랙핑크제니','블랙','제니') FROM DUAL --블랙을 제니로 바꾸기
SELECT lpad('JENNIE',10,'V') FROM DUAL -- 왼쪽으로 10칸 출력, 빈공간은 V출력
SELECT sign(-7) FROM DUAL 
SELECT round(163.76, 1) FROM DUAL -- 소수 첫째 자리에서 반올림
SELECT round(163.76, -2) FROM DUAL --100의 자리에서 반올림
SELECT trunc(54.29,-1) FROM DUAL --얘는 round와 다르게 그냥 버린다
SELECT ceil(72.86) FROM DUAL --얘는 올림
SELECT sysdate FROM DUAL 
SELECT add_months(date'2022-10-31',1)FROM DUAL -- 지정한 달에 +1
SELECT extract(YEAR FROM sysdate) AS YEAR, --현재 시각에서 년,월,일을 뽑아옴
	   extract(MONTH FROM sysdate) AS MONTH,
	   EXTRACT(DAY FROM sysdate) AS DAY
	   FROM DUAL 
SELECT nvl(1,0) FROM DUAL  -- 해당 값이 NULL이면 0출력, NULL이 아니면 1출력
SELECT nullif(review_score, 0) FROM review -- 두 값이 똑같으면 NULL반환, 다르면 review_score반환
SELECT COALESCE(a,b,c) FROM DUAL -- a,b,c 중 NULL이 아닌 최초의 인수를 반환
SELECT nvl2(review_score,1,0) FROM DUAL --review_score가 null이면 1반환, null이 아니면 0반환
 