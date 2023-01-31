CREATE TABLE Book (
  bookid      INTEGER PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INTEGER 
);

CREATE TABLE  Customer (
  custid      INTEGER PRIMARY KEY,  
  name        VARCHAR(40),
  address     VARCHAR(50),
  phone       VARCHAR(20)
);

CREATE TABLE Orders (
  orderid INTEGER PRIMARY KEY,
  custid  INTEGER ,
  bookid  INTEGER ,
  saleprice INTEGER ,
  orderdate DATE,
  FOREIGN KEY (custid) REFERENCES Customer(custid),
  FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 20. 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT * FROM orders 
	INNER JOIN customer ON orders.custid = customer.custid;
SELECT * FROM customer, orders
WHERE customer.custid = orders.custid;

-- 21. 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT * FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    ORDER BY C.custid;
SELECT * FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid;

-- 22. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT C.name, B.bookname, O.saleprice FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid;
SELECT name, saleprice FROM orders, customer
WHERE customer.custid = orders.custid;	  
    

-- 23. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT C.name, SUM(O.saleprice) AS '총 판매액' FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid
    GROUP BY C.name;
SELECT name, SUM(saleprice) AS '총 판매액' 
FROM customer, orders 
WHERE customer.custid = orders.custid
GROUP BY customer.name
ORDER BY customer.name;  
    
-- 24. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT C.name, B.bookname FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid;
    
 SELECT Customer.name, Book.bookname
 FROM customer, orders, book
 WHERE customer.custid = orders.custid
 AND Orders.bookid = Book.bookid;

-- 25. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT C.name, B.bookname, B.price FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid
    WHERE B.price = 20000;
    
SELECT Customer.name, Book.bookname   
FROM customer, orders, book   
WHERE customer.custid = orders.custid
AND Orders.bookid = Book.bookid AND book.price = 20000;
 
 
-- 26. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT C.name, O.saleprice FROM customer C
	LEFT OUTER JOIN orders O ON O.custid = C.custid
	;

SELECT Customer.name, saleprice FROM customer
	LEFT OUTER JOIN orders ON customer.custid = orders.custid;

-- 27. 가장 비싼 도서의 이름을 보이시오.
SELECT bookname FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 28. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT DISTINCT C.name FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid;

-- 29. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT C.name, B.publisher FROM orders O
	INNER JOIN customer C ON O.custid = C.custid
    INNER JOIN book B ON O.bookid = B.bookid
    WHERE B.publisher = '대한미디어';

SELECT name
FROM customer
WHERE custid IN (SELECT custid
        FROM orders
        WHERE bookid IN (SELECT bookid
                FROM book
                WHERE publisher = '대한미디어'));   


-- 30. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.

SELECT B1.bookname FROM Book B1
WHERE B1.price > (SELECT AVG(B2.price) FROM Book B2 WHERE B2.publisher=B1.publisher);

SELECT  B.publisher	'출판사'
       ,R.avg_price	'출판사 도서별 평균 가격'
       ,B.bookname	'출판사 도서별 평균 가격보다 비싼 도서'
       ,B.price	'도서의 가격'
FROM Book B JOIN (
	SELECT  publisher
	       ,ROUND(AVG(price))'avg_price'
	FROM Book
	GROUP BY  publisher
) R
ON B.publisher = R.publisher
WHERE B.price > R.avg_price;

-- 31. 주문이 있는 고객의 이름과 주소를 보이시오.

SELECT DISTINCT C.name, C.address FROM Customer C
	INNER JOIN orders O ON O.custid = C.custid
   WHERE C.name NOT IN ( SELECT C.name WHERE O.custid IS NULL) ;
   
SELECT name, address
FROM Customer cs
WHERE EXISTS (SELECT * FROM orders od WHERE cs.custid = od.custid);

SELECT name, address
FROM customer
WHERE custid IN ( SELECT DISTINCT custid FROM orders);
