# 1. Example Database 다운로드 받기
#   1) https://dev.mysql.com/doc/index-other.html 접속
#   2) Example Databases - sakila database - zip 파일 다운로드
#   3) 다운로드 받은 sakila-db.zip 파일 압축 풀어 D:/dev/Database/sakila 경로에 저장
#      D:/dev/Database/sakila/sakila-schema.sql
#      D:/dev/Database/sakila/sakila-data.sql

# 2. 명령 프롬프트 열고 MySQL 접속
#   mysql -u root -p

# 3. 스키마 파일과 데이터 파일 순서대로 실행
#   source D:/dev/Database/sakila/sakila-schema.sql;
#   source D:/dev/Database/sakila/sakila-data.sql;

# 4. MySQL Workbench 접속 후 데이터베이스 생성 확인
#   USE sakila;
#   SHOW FULL TABLES;
#   SELECT COUNT(*) FROM film;  -- 1000개 데이터 존재

