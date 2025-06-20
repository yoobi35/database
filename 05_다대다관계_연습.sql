# 고객(Customer), 제품(Product), 구매(Purchase), 구매상세(PurchaseDetail) 테이블을 생성합니다.
# 여러 고객은 여러 제품을 구매할 수 있습니다.
# 한 번의 구매에는 여러 제품이 포함될 수 있습니다.
# 고객명, 고객연락처, 제품명, 제품가격, 재고, 구매일, 구매한제품갯수 정보를 저장하세요.

# db_model 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS db_model;

# db_model 데이터베이스 사용
USE db_model;

