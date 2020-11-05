SELECT T1.NAME AS NAME_X, T2.NAME AS NAME_Y
FROM (SELECT DISTINCT NAME FROM CART_PRODUCTS) T1 CROSS JOIN
     (SELECT DISTINCT NAME FROM CART_PRODUCTS) T2 
WHERE T1.NAME IN (SELECT DISTINCT CART_ID, NAME FROM CART_PRODUCTS WHERE NAME = T1.NAME) INNER JOIN 
(SELECT DISTINCT CART_ID, NAME FROM CART_PRODUCTS WHERE NAME = T2.NAME) 


SELECT T1.NAME AS NAME_X, T2.NAME AS NAME_Y, (SELECT COUNT(CART_ID) FROM CART_PRODUCTS WHERE NAME=NAME_X OR NAME=NAME_Y) "장바구니 수"
FROM (SELECT DISTINCT NAME FROM CART_PRODUCTS) T1 CROSS JOIN
     (SELECT DISTINCT NAME FROM CART_PRODUCTS) T2 WHERE T1.NAME != T2.NAME


SELECT DISTINCT T1.NAME AS NAME_X, T2.NAME AS NAME_Y, (SELECT COUNT(CART_ID) FROM CART_PRODUCTS WHERE NAME = NAME_X OR NAME = NAME_Y) 
FROM (SELECT CART_ID, NAME FROM CART_PRODUCTS) T1 CROSS JOIN 
(SELECT CART_ID, NAME FROM CART_PRODUCTS) T2
WHERE T1.CART_ID = T2.CART_ID AND T1.NAME != T2.NAME