-- 문제 1.
-- 맴버중 100만원 이상 구매한 맴버 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요

SELECT
    (member.name) AS "이름", SUM(PAYMENT_HISTORY.order_price) AS "결제 금액"
FROM
    member, PAYMENT_HISTORY
WHERE
    PAYMENT_HISTORY.member_id = member.id
GROUP BY
    member.name, member.id
HAVING 
    SUM(PAYMENT_HISTORY.order_price) >= 1000000
ORDER BY    
    "결제 금액" DESC;

-- 문제 2.
-- 맴버중 평균 결제 금액이 10만원 이상인 맴버의 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요

SELECT
    MEMBER.NAME, AVG(PAYMENT_HISTORY.ORDER_PRICE)
FROM
    MEMBER, PAYMENT_HISTORY
WHERE
    PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID
GROUP BY
    MEMBER.ID, MEMBER.NAME
HAVING
    AVG(PAYMENT_HISTORY.ORDER_PRICE) >= 100000

-- 문제 3.
-- 카테고리중 상품이 5개 이상 등록된 카테고리의 이름을 출력하세요
-- category, product 사용

SELECT
    (category.name) AS "이름", COUNT(product.category_id) AS "상품 개수"
FROM
    product, category
WHERE
    product.category_ID = category.ID 
GROUP BY
    category.name, product.category_id
HAVING
    COUNT(product.category_id) >= 5
ORDER BY
    "상품 개수" DESC;

-- 문제 4.
-- CATALOGUE 테이블을 신규로 만들어주세요
-- 테이블의 구성은 ID, NAME, PRICE, ORIGIN 입니다
-- 데이터는 PRODUCT 안의 데이터를 INSERT SELECT 문을 사용하여 데이터를 넣어 주세요
-- ID, NAME, PRICE, ORIGIN 의 데이터 타입은 PRODUCT 테이블과 동일합니다



-- 문제 5.
-- PRODUCT 테이블에서 가격이 10000000(천만)원 이상인 상품의 가격을 일괄적으로 1000000(백만원) 으로 변경하세요
-- PRODUCT 테이블 사용, UPDATE 구문 사용



-- 문제 6.
-- 문제 5번을 푸신 후, PRODUCT 의 가격 != PAYMENT_HISTORY.ORDER_PRICE / PAYMNET_HISTORY.ORDER_COUNT 
-- 인 값들을 찾으세요
-- 5번으로 인해 가격이 다운된 상품들을 찾고, PAYMENT_HISTORY 에서 구한 단가로 비교하면 됩니다



-- 추가 문제 #1.
-- 카탈로그 테이블에 CATEGORY_ID 를 추가로 생성해주시고
-- NAME 기준으로 PRODUCT 테이블에 있는 데이터(카테고리 id)를 CATALOGUE 테이블에 추가해 주시고
-- CATALOGUE 테이블에서 FK(외래키) 를 설정해주세요



-- 문제 7.
-- CATEGORY, MEMBER, PAYMENT_HISTORY, PRODUCT 테이블을 모두 조인하여
-- 상품명, 카테고리명, 구매한 유저명, 구매 금액, 구매 개수를 출력하세요



-- 문제 8.
-- PAYMENT_HISTORY 와 PRODUCT 테이블을 사용하여 원산지별 판매 액수를 출력해주세요
-- 만약, 원산지가 없는 경우 원산지 없음 이라고 나오게끔 작성해주세요
-- NVL 함수 사용 (https://gent.tistory.com/189)