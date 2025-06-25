# db_soccer 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS db_soccer;

# db_soccer 데이터베이스 사용
USE db_soccer;

# 경기장 테이블
CREATE TABLE IF NOT EXISTS tbl_stadium (
    stadium_id   CHAR(3) NOT NULL,
    stadium_name VARCHAR(40) NOT NULL,
    hometeam_id  CHAR(3),
    seat_count   INT,
    address      VARCHAR(60),
    ddd          VARCHAR(3),
    tel          VARCHAR(10),
    CONSTRAINT pk_stadium PRIMARY KEY (stadium_id)
);

# 팀 테이블
CREATE TABLE IF NOT EXISTS tbl_team (
    team_id     CHAR(3) NOT NULL,
    region_name VARCHAR(8) NOT NULL,
    team_name   VARCHAR(40) NOT NULL,
    e_team_name VARCHAR(50),
    orig_yyyy   CHAR(4),
    stadium_id  CHAR(3) NOT NULL,
    zip_code1   CHAR(3),
    zip_code2   CHAR(3),
    address     VARCHAR(80),
    ddd         VARCHAR(3),
    tel         VARCHAR(10),
    fax         VARCHAR(10),
    homepage    VARCHAR(50),
    team_owner  VARCHAR(10),
    CONSTRAINT pk_team PRIMARY KEY (team_id),
    CONSTRAINT fk_team_stadium FOREIGN KEY (stadium_id) REFERENCES tbl_stadium(stadium_id)
);

# 경기일정 테이블
CREATE TABLE IF NOT EXISTS tbl_schedule (
    stadium_id  CHAR(3) NOT NULL,
    schedule_dt CHAR(8) NOT NULL,
    gubun       CHAR(1) NOT NULL,
    hometeam_id CHAR(3) NOT NULL,
    awayteam_id CHAR(3) NOT NULL,
    home_score  INT,
    away_score  INT,
    CONSTRAINT pk_schedule PRIMARY KEY (stadium_id, schedule_dt),
    CONSTRAINT fk_schedule_stadium FOREIGN KEY (stadium_id) REFERENCES tbl_stadium(stadium_id)
);

# 선수 테이블
CREATE TABLE IF NOT EXISTS tbl_player (
    player_id     CHAR(7) NOT NULL,
    player_name   VARCHAR(20) NOT NULL,
    team_id       CHAR(3) NOT NULL,
    e_player_name VARCHAR(40),
    nickname      VARCHAR(30),
    join_yyyy     CHAR(4),
    position      VARCHAR(10),
    back_no       INT,
    nation        VARCHAR(20),
    birth_dt      DATE,
    solar         CHAR,
    height        INT,
    weight        INT,
    CONSTRAINT pk_player PRIMARY KEY (player_id),
    CONSTRAINT fk_player_team FOREIGN KEY (team_id) REFERENCES tbl_team(team_id)
);

INSERT INTO tbl_stadium VALUES ("D03","전주월드컵경기장","K05",28000,"전북 전주시 덕진구 반월동 763-1","063","273-1763");
INSERT INTO tbl_stadium VALUES ("B02","성남종합운동장","K08",27000,"경기도 성남시 분당구 야탑동 486","031","753-3956");
INSERT INTO tbl_stadium VALUES ("C06","포항스틸야드","K03",25000,"경북 포항시 남구 괴동 1","054","282-2002");
INSERT INTO tbl_stadium VALUES ("D01","광양전용경기장","K07",20009,"전남 광양시 금호동 700","061","792-5600");
INSERT INTO tbl_stadium VALUES ("B05","서울월드컵경기장","K09",66806,"서울특별시 마포구 난지도길 66","02","2128-2973");
INSERT INTO tbl_stadium VALUES ("B01","인천월드컵경기장","K04",35000,"인천광역시 남구 문학동 482","031","666-0496");
INSERT INTO tbl_stadium VALUES ("C05","창원종합운동장","K11","27085","경남 창원시 두대동 145","055","6644-8468");
INSERT INTO tbl_stadium VALUES ("C04","울산문수경기장","K01",46102,"울산광역시 남구 옥산 산5","052","220-2468");
INSERT INTO tbl_stadium VALUES ("D02","대전월드컵경기장","K10",41000,"대전광역시 유성구 노은동 270","042","252-2002");
INSERT INTO tbl_stadium VALUES ("B04","수원월드컵경기장","K02",50000,"수원시 팔달구 우만1동 228번지","031","259-2150");
INSERT INTO tbl_stadium VALUES ("A02","광주월드컵경기장","K12","40245","광주광역시 서구 풍암동 423-2","062","2468-8642");
INSERT INTO tbl_stadium VALUES ("C02","부산아시아드경기장","K06",30000,"부산광역시 서구 서대신동 3가 210번지","051","247-5771");
INSERT INTO tbl_stadium VALUES ("A03","강릉종합경기장","K13",33000,"강원 강릉시 교동 산58","033","459-3631");
INSERT INTO tbl_stadium VALUES ("A04","제주월드컵경기장","K14",42256,"제주 서귀포시 법환동","064","3631-2460");
INSERT INTO tbl_stadium VALUES ("A05","대구월드컵경기장","K15",66422,"대구광역시 수성구 대흥동 504","053","602-2011");
INSERT INTO tbl_stadium VALUES ("F01","대구시민경기장",NULL,30000,"대구광역시","054",NULL);
INSERT INTO tbl_stadium VALUES ("F02","부산시민경기장",NULL,30000,"부산광역시","051",NULL);
INSERT INTO tbl_stadium VALUES ("F03","일산경기장",NULL,20000,"경기도 일산시","031",NULL);
INSERT INTO tbl_stadium VALUES ("F04","마산경기장",NULL,20000,"경남 마산시","055",NULL);
INSERT INTO tbl_stadium VALUES ("F05","안양경기장",NULL,20000,"경기도 안양시","031",NULL);

INSERT INTO tbl_team VALUES ("K05","전북","현대모터스","CHUNBUK HYUNDAI MOTORS FC","1995","D03","560","190",
"전북 전주시 덕진구 반월동 763-1 전주월드컵경기장 내","063","273-1763","273-1762","http://www.hyundai-motorsfc.com",NULL);
INSERT INTO tbl_team VALUES ("K08","성남","일화천마","SEONGNAM ILHWA CHUNMA FC","1988","B02","462",
"130","경기도 성남시 분당구 야탑동 486번지 성남 제2종합운동장 내","031","753-3956","753-4443","http://www.esifc.com",NULL);
INSERT INTO tbl_team VALUES ("K03","포항","스틸러스","FC POHANG STEELERS","1973","C06","790","050",
"경북 포항시 죽도동 614-8 동양빌딩 7층","054","282-2002","282-5955","http://www.steelers.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K07","전남","드래곤즈","CHUNNAM DRAGONS FC","1994","D01","544","010",
"전남 광양시 중동 1318-5 신한은행빌딩 2층","061","792-5600","792-5605","http://www.dragons.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K09","서울","FC서울","FOOTBALL CLUB SEOUL","1983","B05","138","221",
"서울 마포구 성산동 515 월드컵 경기장 내","02","2005-5746","2005-5802","http://www.fcseoul.com",NULL);
INSERT INTO tbl_team VALUES ("K04","인천","유나이티드","INCHEON UNITED FC","2004","B01","110","728",
"인천광역시 남구 문학동 482 인천월드컵경기장 내","032","2121-5271","2121-5276","http://www.incheonutd.com",NULL);
INSERT INTO tbl_team VALUES ("K11","경남","경남FC","GYEONGNAM FC","2006","C05","111","222",
"경남 창원시 두대동 145 창원종합운동장","055","6644-8468","6644-8488","http://www.gsndfc.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K01","울산","울산현대","ULSAN HYUNDAI FC","1986","C04","682","060",
"울산광역시 동구 서부동 산137-1 현대스포츠클럽하우스","052","230-6141","230-6145","http://www.uhfc.tv",NULL);
INSERT INTO tbl_team VALUES ("K10","대전","시티즌","DAEJEON CITIZEN FC","1996","D02","301","030",
"대전광역시 유성구 노은동 270 대전월드컵경기장 서관 3층","042","252-2002","221-0669","http://www.dcfc.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K02","수원","삼성블루윙즈","SUWON SAMSUNG BLUEWINGS FC","1995","B04","440","220",
"수원시 팔달구 우만1동 228 수원월드컵경기장 4층","031","247-2002","257-0766","http://www.bluewings.kr",NULL);
INSERT INTO tbl_team VALUES ("K12","광주","광주상무","GWANGJU SANGMU FC","1984","A02","450","419",
"광주광역시 서구 풍암동 423-2 광주월드컵경기장 내","062","777-5180","777-5181","http://www.gwangjusmfc.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K06","부산","아이파크","BUSAN IPARK FC","1983","C02","570","050",
"부산광역시 강서구 대저1동 2155번지 강서체육공원 내","051","555-7101","555-7103","http://www.busanipark.co.kr",NULL);
INSERT INTO tbl_team VALUES ("K13","강원","강원FC","GANGWON FC","2008","A03","333","444",
"강원 춘천시 중앙로 7 강원도 개발공사 빌딩 내","033","459-3631","459-3630","http://www.gangwon-fc.com",NULL);
INSERT INTO tbl_team VALUES ("K14","제주","제주유나이티드FC","JEJU UNITED FC","1982","A04","555","666",
"제주 서귀포시 강정동 3355-5","064","3631-2460","3631-2468","http://www.jeju-utd.com",NULL);
INSERT INTO tbl_team VALUES ("K15","대구","대구FC","DAEGU FC","2002","A05","777","888",
"대구광역시 수성구 대흥동 504 대구스타디움 내","053","5566-3967","5566-3970","http://www.daegufc.co.kr",NULL);

INSERT INTO tbl_schedule VALUES ("C02","20120501","Y","K06","K10","2","0");
INSERT INTO tbl_schedule VALUES ("B04","20120505","Y","K02","K01","1","2");
INSERT INTO tbl_schedule VALUES ("B05","20120505","Y","K09","K08","1","3");
INSERT INTO tbl_schedule VALUES ("B02","20120512","Y","K08","K01","1","1");
INSERT INTO tbl_schedule VALUES ("C02","20120707","Y","K06","K01","1","2");
INSERT INTO tbl_schedule VALUES ("B02","20120707","Y","K08","K03","3","2");
INSERT INTO tbl_schedule VALUES ("D03","20120707","Y","K05","K09","2","1");
INSERT INTO tbl_schedule VALUES ("D01","20120707","Y","K07","K10","1","0");
INSERT INTO tbl_schedule VALUES ("B04","20120710","Y","K02","K01","2","1");
INSERT INTO tbl_schedule VALUES ("D03","20120710","Y","K05","K03","1","1");
INSERT INTO tbl_schedule VALUES ("D02","20120710","Y","K10","K04","0","2");
INSERT INTO tbl_schedule VALUES ("C02","20120710","Y","K06","K08","3","1");
INSERT INTO tbl_schedule VALUES ("D01","20120710","Y","K07","K09","0","0");
INSERT INTO tbl_schedule VALUES ("C06","20120713","Y","K03","K06","2","1");
INSERT INTO tbl_schedule VALUES ("B05","20120714","Y","K09","K02","3","0");
INSERT INTO tbl_schedule VALUES ("B01","20120714","Y","K04","K07","1","0");
INSERT INTO tbl_schedule VALUES ("D02","20120714","Y","K10","K08","1","1");
INSERT INTO tbl_schedule VALUES ("D01","20120717","Y","K07","K01","0","0");
INSERT INTO tbl_schedule VALUES ("C06","20120717","Y","K03","K02","2","0");
INSERT INTO tbl_schedule VALUES ("B02","20120717","Y","K08","K04","2","1");
INSERT INTO tbl_schedule VALUES ("C02","20120717","Y","K06","K05","1","2");
INSERT INTO tbl_schedule VALUES ("B05","20120717","Y","K09","K10","1","1");
INSERT INTO tbl_schedule VALUES ("D01","20120720","Y","K07","K03","1","1");
INSERT INTO tbl_schedule VALUES ("B04","20120721","Y","K02","K06","2","2");
INSERT INTO tbl_schedule VALUES ("D03","20120721","Y","K05","K08","2","2");
INSERT INTO tbl_schedule VALUES ("B01","20120721","Y","K04","K09","1","3");
INSERT INTO tbl_schedule VALUES ("D03","20120724","Y","K05","K02","1","1");
INSERT INTO tbl_schedule VALUES ("D02","20120724","Y","K10","K03","1","1");
INSERT INTO tbl_schedule VALUES ("C02","20120724","Y","K06","K07","0","1");
INSERT INTO tbl_schedule VALUES ("B02","20120724","Y","K08","K09","1","1");
INSERT INTO tbl_schedule VALUES ("C06","20120727","Y","K03","K04","2","1");
INSERT INTO tbl_schedule VALUES ("D01","20120727","Y","K07","K05","2","1");
INSERT INTO tbl_schedule VALUES ("C02","20120727","Y","K06","K10","3","0");
INSERT INTO tbl_schedule VALUES ("B05","20120728","Y","K09","K01","1","1");
INSERT INTO tbl_schedule VALUES ("B04","20120728","Y","K02","K08","2","2");
INSERT INTO tbl_schedule VALUES ("B02","20120731","Y","K08","K01","2","0");
INSERT INTO tbl_schedule VALUES ("B05","20120731","Y","K09","K03","3","1");
INSERT INTO tbl_schedule VALUES ("D02","20120731","Y","K10","K05","1","0");
INSERT INTO tbl_schedule VALUES ("B01","20120731","Y","K04","K06","3","2");
INSERT INTO tbl_schedule VALUES ("B04","20120731","Y","K02","K07","1","2");
INSERT INTO tbl_schedule VALUES ("B02","20120803","Y","K08","K07","1","0");
INSERT INTO tbl_schedule VALUES ("C02","20120803","Y","K06","K09","2","1");
INSERT INTO tbl_schedule VALUES ("D02","20120804","Y","K10","K02","0","3");
INSERT INTO tbl_schedule VALUES ("D03","20120804","Y","K05","K04","2","1");
INSERT INTO tbl_schedule VALUES ("B01","20120811","Y","K04","K02","0","2");
INSERT INTO tbl_schedule VALUES ("B05","20120811","Y","K09","K05","0","1");
INSERT INTO tbl_schedule VALUES ("C06","20120811","Y","K03","K08","2","0");
INSERT INTO tbl_schedule VALUES ("D01","20120811","Y","K07","K10","1","1");
INSERT INTO tbl_schedule VALUES ("D03","20120818","Y","K05","K01","0","2");
INSERT INTO tbl_schedule VALUES ("C02","20120818","Y","K06","K03","3","1");
INSERT INTO tbl_schedule VALUES ("B01","20120818","Y","K04","K07","1","0");
INSERT INTO tbl_schedule VALUES ("B04","20120818","Y","K02","K09","1","2");
INSERT INTO tbl_schedule VALUES ("B02","20120818","Y","K08","K10","3","1");
INSERT INTO tbl_schedule VALUES ("B04","20120824","Y","K02","K01","1","1");
INSERT INTO tbl_schedule VALUES ("D03","20120824","Y","K05","K03","3","3");
INSERT INTO tbl_schedule VALUES ("B02","20120824","Y","K08","K06","4","3");
INSERT INTO tbl_schedule VALUES ("D02","20120825","Y","K10","K04","1","1");
INSERT INTO tbl_schedule VALUES ("B05","20120825","Y","K09","K07","1","1");
INSERT INTO tbl_schedule VALUES ("C06","20120828","Y","K03","K02","0","0");
INSERT INTO tbl_schedule VALUES ("C02","20120828","Y","K06","K05","1","1");
INSERT INTO tbl_schedule VALUES ("B01","20120828","Y","K04","K08","2","3");
INSERT INTO tbl_schedule VALUES ("B05","20120828","Y","K09","K10","2","0");
INSERT INTO tbl_schedule VALUES ("D02","20120901","Y","K10","K01","2","3");
INSERT INTO tbl_schedule VALUES ("D01","20120901","Y","K07","K03","0","1");
INSERT INTO tbl_schedule VALUES ("B04","20120901","Y","K02","K06","1","1");
INSERT INTO tbl_schedule VALUES ("D03","20120901","Y","K05","K08","3","3");
INSERT INTO tbl_schedule VALUES ("B01","20120901","Y","K04","K09","2","1");
INSERT INTO tbl_schedule VALUES ("D01","20120911","N","K07","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20120911","N","K09","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20120911","N","K02","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20120911","N","K04","K03",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20120911","N","K10","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C02","20120914","N","K06","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20120914","N","K03","K09",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B02","20120914","N","K08","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20120914","N","K07","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D03","20120915","N","K05","K10",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20120918","N","K10","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B02","20120918","N","K08","K07",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20120918","N","K09","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D03","20120918","N","K05","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20120925","N","K02","K10",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20120925","N","K03","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20120925","N","K04","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20120925","N","K07","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20120925","N","K09","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20121019","N","K07","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20121019","N","K03","K09",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20121020","N","K10","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C02","20121020","N","K06","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20121023","N","K03","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D03","20121023","N","K05","K07",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C02","20121023","N","K06","K10",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B02","20121023","N","K08","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20121026","N","K07","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20121027","N","K10","K03",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20121027","N","K04","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20121027","N","K09","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20121027","N","K02","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20121030","N","K02","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20121030","N","K10","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20121102","N","K03","K07",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20121103","N","K09","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C02","20121103","N","K06","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B02","20121103","N","K08","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D03","20121106","N","K05","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20121106","N","K07","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20121106","N","K10","K09",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20121106","N","K04","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20121106","N","K02","K03",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20121109","N","K03","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20121110","N","K09","K07",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20121110","N","K04","K10",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B02","20121110","N","K08","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D01","20121113","N","K07","K04",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C02","20121113","N","K06","K03",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B04","20121113","N","K02","K09",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D03","20121113","N","K05","K01",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B05","20121117","N","K09","K05",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("D02","20121117","N","K10","K07",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20121117","N","K03","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("B01","20121117","N","K04","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20120508","Y","K01","K08","1","3");
INSERT INTO tbl_schedule VALUES ("C04","20120713","Y","K01","K05","0","0");
INSERT INTO tbl_schedule VALUES ("C04","20120720","Y","K01","K10","0","0");
INSERT INTO tbl_schedule VALUES ("C04","20120724","Y","K01","K04","1","1");
INSERT INTO tbl_schedule VALUES ("C04","20120803","Y","K01","K03","3","0");
INSERT INTO tbl_schedule VALUES ("C04","20120811","Y","K01","K06","0","0");
INSERT INTO tbl_schedule VALUES ("C04","20120828","Y","K01","K07","0","1");
INSERT INTO tbl_schedule VALUES ("C04","20120918","N","K01","K03",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121019","N","K01","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121023","N","K01","K09",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121102","N","K01","K10",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121110","N","K01","K02",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121117","N","K01","K06",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C04","20121124","N","K01","K08",NULL,NULL);
INSERT INTO tbl_schedule VALUES ("C06","20120317","Y","K03","K02","1","2");
INSERT INTO tbl_schedule VALUES ("B02","20120317","Y","K08","K04","6","0");
INSERT INTO tbl_schedule VALUES ("D02","20120317","Y","K10","K06","2","1");
INSERT INTO tbl_schedule VALUES ("C05","20120317","Y","K11","K09","2","2");
INSERT INTO tbl_schedule VALUES ("D01","20120320","Y","K07","K01","1","2");
INSERT INTO tbl_schedule VALUES ("D03","20120320","Y","K05","K03","1","0");
INSERT INTO tbl_schedule VALUES ("B04","20120320","Y","K02","K08","2","3");
INSERT INTO tbl_schedule VALUES ("B05","20120320","Y","K09","K10","2","0");
INSERT INTO tbl_schedule VALUES ("B04","20120323","Y","K02","K05","2","0");
INSERT INTO tbl_schedule VALUES ("C02","20120324","Y","K06","K01","1","2");
INSERT INTO tbl_schedule VALUES ("B01","20120324","Y","K04","K03","1","1");
INSERT INTO tbl_schedule VALUES ("B05","20120324","Y","K09","K07","1","0");
INSERT INTO tbl_schedule VALUES ("D01","20120327","Y","K07","K06","2","1");
INSERT INTO tbl_schedule VALUES ("C06","20120327","Y","K03","K08","1","0");
INSERT INTO tbl_schedule VALUES ("C05","20120327","Y","K11","K10","0","1");
INSERT INTO tbl_schedule VALUES ("D03","20120406","Y","K05","K04","3","2");
INSERT INTO tbl_schedule VALUES ("B01","20120410","Y","K04","K02","2","0");
INSERT INTO tbl_schedule VALUES ("B02","20120410","Y","K08","K05","2","1");
INSERT INTO tbl_schedule VALUES ("D02","20120410","Y","K10","K07","1","1");
INSERT INTO tbl_schedule VALUES ("C02","20120410","Y","K06","K09","1","4");
INSERT INTO tbl_schedule VALUES ("D02","20120414","Y","K10","K01","0","2");
INSERT INTO tbl_schedule VALUES ("B02","20120414","Y","K08","K03","1","1");
INSERT INTO tbl_schedule VALUES ("B01","20120414","Y","K04","K05","1","0");
INSERT INTO tbl_schedule VALUES ("C02","20120414","Y","K06","K07","2","0");
INSERT INTO tbl_schedule VALUES ("D03","20120420","Y","K05","K08","2","2");
INSERT INTO tbl_schedule VALUES ("D01","20120420","Y","K07","K10","0","1");
INSERT INTO tbl_schedule VALUES ("B04","20120421","Y","K02","K04","3","2");
INSERT INTO tbl_schedule VALUES ("B05","20120421","Y","K09","K06","1","0");
INSERT INTO tbl_schedule VALUES ("B02","20120424","Y","K08","K02","1","1");
INSERT INTO tbl_schedule VALUES ("C06","20120424","Y","K03","K05","1","2");
INSERT INTO tbl_schedule VALUES ("C05","20120424","Y","K11","K07","1","2");
INSERT INTO tbl_schedule VALUES ("D02","20120424","Y","K10","K09","1","3");
INSERT INTO tbl_schedule VALUES ("C06","20120427","Y","K03","K04","0","3");
INSERT INTO tbl_schedule VALUES ("C05","20120427","Y","K11","K06","5","2");
INSERT INTO tbl_schedule VALUES ("D01","20120427","Y","K07","K09","0","1");
INSERT INTO tbl_schedule VALUES ("D03","20120428","Y","K05","K02","1","2");
INSERT INTO tbl_schedule VALUES ("B05","20120501","Y","K09","K01","0","0");
INSERT INTO tbl_schedule VALUES ("B04","20120501","Y","K02","K03","1","2");
INSERT INTO tbl_schedule VALUES ("B01","20120501","Y","K04","K08","2","2");
INSERT INTO tbl_schedule VALUES ("D03","20120904","Y","K05","K02","1","2");
INSERT INTO tbl_schedule VALUES ("B02","20120904","Y","K08","K09","1","0");
INSERT INTO tbl_schedule VALUES ("C05","20120904","Y","K11","K04","2","2");
INSERT INTO tbl_schedule VALUES ("C06","20120904","Y","K03","K10","0","0");
INSERT INTO tbl_schedule VALUES ("C02","20120904","Y","K06","K07","2","2");

INSERT INTO tbl_player VALUES ("2009175","우르모브","K06",NULL,NULL,"2009","DF","4","유고",STR_TO_DATE("30-AUG-1987","%d-%b-%Y"),"1","180","70");
INSERT INTO tbl_player VALUES ("2007188","윤희준","K06",NULL,NULL,"2005","DF","15",NULL,STR_TO_DATE("01-NOV-1982","%d-%b-%Y"),"1","180","74");
INSERT INTO tbl_player VALUES ("2012073","김규호","K06",NULL,NULL,"2011","DF","23",NULL,STR_TO_DATE("13-JUL-1989","%d-%b-%Y"),"1","177","72");
INSERT INTO tbl_player VALUES ("2007178","김민성","K06",NULL,NULL,NULL,"DF","20",NULL,STR_TO_DATE("23-JUN-1983","%d-%b-%Y"),"1","182","73");
INSERT INTO tbl_player VALUES ("2007191","김장관","K06",NULL,"배추도사,작은삼손","2007","DF","18",NULL,STR_TO_DATE("05-JUN-1984","%d-%b-%Y"),"2","170","61");
INSERT INTO tbl_player VALUES ("2008384","김정효","K06",NULL,"깜둥이,통키통","2008","DF","19",NULL,STR_TO_DATE("23-JUL-1985","%d-%b-%Y"),"2","174","68");
INSERT INTO tbl_player VALUES ("2008395","장대일","K06",NULL,"달구","2010","DF","7",NULL,STR_TO_DATE("09-MAR-1985","%d-%b-%Y"),"2","184","79");
INSERT INTO tbl_player VALUES ("2011050","박상수","K06",NULL,"꼬마홍길동","2011","DF","36",NULL,STR_TO_DATE("14-JUN-1988","%d-%b-%Y"),"1","173","65");
INSERT INTO tbl_player VALUES ("2007189","정재영","K06",NULL,"제리","2006","MF","6",NULL,STR_TO_DATE("02-SEP-1983","%d-%b-%Y"),"2","187","75");
INSERT INTO tbl_player VALUES ("2011049","정태민","K06",NULL,"킹카","2011","MF","38",NULL,STR_TO_DATE("25-MAY-1992","%d-%b-%Y"),"1","180","71");
INSERT INTO tbl_player VALUES ("2010107","정현우","K06",NULL,NULL,"2010","MF","37",NULL,STR_TO_DATE("04-JUN-1991","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2011043","송종국","K06",NULL,"썰렁왕자","2011","MF","24",NULL,STR_TO_DATE("20-FEB-1989","%d-%b-%Y"),"1","177","73");
INSERT INTO tbl_player VALUES ("2011044","오정석","K06",NULL,"서경석","2011","MF","13",NULL,STR_TO_DATE("08-SEP-1988","%d-%b-%Y"),"1","178","74");
INSERT INTO tbl_player VALUES ("2012137","이고르","K06","이골 실바 데 페리이따스","이골","2012","MF","21","브라질",STR_TO_DATE("25-OCT-1989","%d-%b-%Y"),"1","181","76");
INSERT INTO tbl_player VALUES ("2007200","김용하","K06",NULL,"용식이","2007","MF","26",NULL,STR_TO_DATE("15-DEC-1983","%d-%b-%Y"),"2","173","66");
INSERT INTO tbl_player VALUES ("2012072","전상배","K06",NULL,NULL,"2012","MF","14",NULL,STR_TO_DATE("22-MAR-1989","%d-%b-%Y"),"1","176","67");
INSERT INTO tbl_player VALUES ("2009038","전우근","K06",NULL,"에너자이져","2009","MF","11",NULL,STR_TO_DATE("25-FEB-1987","%d-%b-%Y"),"2","175","68");
INSERT INTO tbl_player VALUES ("2008365","이태성","K06",NULL,NULL,"2011","MF","30",NULL,STR_TO_DATE("16-JUN-1987","%d-%b-%Y"),"1","177","64");
INSERT INTO tbl_player VALUES ("2011047","황철민","K06",NULL,"사다리맨","2011","MF","35",NULL,STR_TO_DATE("20-NOV-1988","%d-%b-%Y"),"1","175","68");
INSERT INTO tbl_player VALUES ("2008235","정관규","K06",NULL,NULL,NULL,"FW","39",NULL,STR_TO_DATE("10-OCT-1986","%d-%b-%Y"),"1","178","71");
INSERT INTO tbl_player VALUES ("2011048","정기종","K06",NULL,NULL,"2011","FW","25",NULL,STR_TO_DATE("22-MAY-1985","%d-%b-%Y"),"1","182","78");
INSERT INTO tbl_player VALUES ("2012074","정창오","K06",NULL,"임땡","2012","FW","27",NULL,STR_TO_DATE("10-JAN-1988","%d-%b-%Y"),"1","186","82");
INSERT INTO tbl_player VALUES ("2012127","디디","K06","Sebastiao Pereira do Nascimento",NULL,"2012","FW","8","브라질",STR_TO_DATE("24-FEB-1986","%d-%b-%Y"),"1","179","78");
INSERT INTO tbl_player VALUES ("2007182","마니치","K06",NULL,"바람의 아들","2006","FW","9",NULL,STR_TO_DATE("16-JAN-1982","%d-%b-%Y"),"2","184","80");
INSERT INTO tbl_player VALUES ("2007195","우성용","K06",NULL,"따따","2006","FW","22",NULL,STR_TO_DATE("18-AUG-1983","%d-%b-%Y"),"2","191","76");
INSERT INTO tbl_player VALUES ("2010103","장기봉","K06",NULL,"짝팔","2010","FW","12",NULL,STR_TO_DATE("08-JUL-1987","%d-%b-%Y"),"1","180","71");
INSERT INTO tbl_player VALUES ("2012075","이광수","K06",NULL,NULL,"2012","FW","29",NULL,STR_TO_DATE("25-SEP-1989","%d-%b-%Y"),"1","177","73");
INSERT INTO tbl_player VALUES ("2010087","하리","K06",NULL,NULL,"2010","FW","10","콜롬비아",STR_TO_DATE("14-MAY-1984","%d-%b-%Y"),"1","168","65");
INSERT INTO tbl_player VALUES ("2000017","박상남","K06",NULL,NULL,"2008","FW","32",NULL,STR_TO_DATE("07-SEP-1985","%d-%b-%Y"),"2","188","80");
INSERT INTO tbl_player VALUES ("2000018","빅토르","K06",NULL,"빅토르","2011","FW","28","나이지리아",STR_TO_DATE("05-JAN-1985","%d-%b-%Y"),"1","183","79");
INSERT INTO tbl_player VALUES ("2000021","이윤겸","K04","LEE, YOONGYUM",NULL,"2002","DF",NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"178","80");
INSERT INTO tbl_player VALUES ("2000022","하재훈","K04","HA, JAEHON",NULL,"2002","DF",NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"174","67");
INSERT INTO tbl_player VALUES ("2000023","김충호","K04","KIM, CHUNGHO",NULL,"2009","DF",NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"185","83");
INSERT INTO tbl_player VALUES ("2000024","임기한","K04","LIM, GIHAN",NULL,"2004","DF",NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"177","85");
INSERT INTO tbl_player VALUES ("2000025","김경태","K04","KIM, KYOUNGTAE",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,NULL,NULL);
INSERT INTO tbl_player VALUES ("2012054","남현우","K04",NULL,NULL,NULL,"GK","31",NULL,STR_TO_DATE("20-APR-1989","%d-%b-%Y"),"2","180","72");
INSERT INTO tbl_player VALUES ("2008499","김충호","K04",NULL,NULL,NULL,"GK","60",NULL,STR_TO_DATE("04-JUL-1978","%d-%b-%Y"),"2","185","83");
INSERT INTO tbl_player VALUES ("2011021","이현","K04",NULL,NULL,NULL,"GK","1",NULL,STR_TO_DATE("07-NOV-1988","%d-%b-%Y"),"2","192","85");
INSERT INTO tbl_player VALUES ("2012052","한동진","K04",NULL,NULL,NULL,"GK","21",NULL,STR_TO_DATE("25-AUG-1989","%d-%b-%Y"),"2","183","78");
INSERT INTO tbl_player VALUES ("2012126","다오","K04",NULL,NULL,NULL,"DF","61",NULL,STR_TO_DATE("25-SEP-1992","%d-%b-%Y"),"2","190","80");
INSERT INTO tbl_player VALUES ("2008182","최철","K04",NULL,NULL,NULL,"DF","15",NULL,STR_TO_DATE("20-AUG-1983","%d-%b-%Y"),"2","176","77");
INSERT INTO tbl_player VALUES ("2010112","송창남","K04",NULL,NULL,NULL,"DF","23",NULL,STR_TO_DATE("31-DEC-1987","%d-%b-%Y"),"2","175","67");
INSERT INTO tbl_player VALUES ("2008424","조승호","K04",NULL,NULL,NULL,"DF","2",NULL,STR_TO_DATE("13-MAY-1985","%d-%b-%Y"),"2","179","70");
INSERT INTO tbl_player VALUES ("2008450","윤중희","K04",NULL,NULL,NULL,"DF","5",NULL,STR_TO_DATE("08-DEC-1985","%d-%b-%Y"),"1","177","75");
INSERT INTO tbl_player VALUES ("2011022","김범직","K04",NULL,NULL,NULL,"DF","25",NULL,STR_TO_DATE("11-FEB-1989","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2012053","김상홍","K04",NULL,NULL,NULL,"DF","30",NULL,STR_TO_DATE("04-FEB-1989","%d-%b-%Y"),"1","178","68");
INSERT INTO tbl_player VALUES ("2000001","김태호","K10",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("29-JAN-1971","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000002","정상수","K10","JEONG, SAMSOO",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("08-FEB-1973","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000003","유동우","K10","YOU, DONGWOO",NULL,NULL,"DF","40",NULL,STR_TO_DATE("07-MAR-1978","%d-%b-%Y"),"1","177","70");
INSERT INTO tbl_player VALUES ("2000004","전기현","K10","JEON, GIHYUN",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("06-JUN-1975","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2012047","강성일","K10","KANG, SUNGIL",NULL,"2012","GK","30",NULL,STR_TO_DATE("04-JUN-1989","%d-%b-%Y"),"1","182","80");
INSERT INTO tbl_player VALUES ("2010057","김승준","K10","KIM, SEUNGJUN","개구멍","2010","GK","1",NULL,STR_TO_DATE("01-SEP-1982","%d-%b-%Y"),"1","183","77");
INSERT INTO tbl_player VALUES ("2007298","이은성","K10","LEE, EUNSUNG","수호천황","2007","GK","21",NULL,STR_TO_DATE("05-APR-1981","%d-%b-%Y"),"1","184","82");
INSERT INTO tbl_player VALUES ("2007312","정대수","K10","JEONG, DAESOO",NULL,"2007","DF","15",NULL,STR_TO_DATE("20-MAR-1985","%d-%b-%Y"),"1","184","74");
INSERT INTO tbl_player VALUES ("2012051","정민기","K10",NULL,NULL,NULL,"DF","3",NULL,STR_TO_DATE("25-APR-1988","%d-%b-%Y"),"1","171","65");
INSERT INTO tbl_player VALUES ("2010110","정성근","K10","JEONG, SUNGKEUN",NULL,"2010","DF","33",NULL,STR_TO_DATE("20-JUN-1987","%d-%b-%Y"),"1","180","73");
INSERT INTO tbl_player VALUES ("2011098","정영근","K10","JEONG, YOUNGKWEN",NULL,"2011","DF","5",NULL,STR_TO_DATE("12-OCT-1988","%d-%b-%Y"),"1","180","70");
INSERT INTO tbl_player VALUES ("2007301","정정수","K10","JEONG, JUNGSOO",NULL,"2002","DF","36",NULL,STR_TO_DATE("17-JAN-1985","%d-%b-%Y"),"2","180","74");
INSERT INTO tbl_player VALUES ("2007309","김창엽","K10","KIM, CHANGYUP",NULL,"2007","DF","6",NULL,STR_TO_DATE("19-NOV-1984","%d-%b-%Y"),"2","174","64");
INSERT INTO tbl_player VALUES ("2007299","장철우","K10","JANG, CHULWOO","폭주기관차","2010","DF","7",NULL,STR_TO_DATE("01-APR-1981","%d-%b-%Y"),"2","172","65");
INSERT INTO tbl_player VALUES ("2011116","콜리","K10","OMAR PAPA COLY","검은낙타(Black Camel)","2011","DF","29","세네갈",STR_TO_DATE("20-MAY-1985","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2007313","홍광철","K10","HONG, KWANGCHUL",NULL,"2007","DF","4",NULL,STR_TO_DATE("09-OCT-1984","%d-%b-%Y"),"2","172","65");
INSERT INTO tbl_player VALUES ("2008461","강정훈","K10","KANG, JUNGHOON",NULL,"2008","MF","38",NULL,STR_TO_DATE("20-FEB-1986","%d-%b-%Y"),"1","175","65");
INSERT INTO tbl_player VALUES ("2007306","공오균","K10","KONG, OHKYUN","CROW","2007","MF","22",NULL,STR_TO_DATE("10-AUG-1984","%d-%b-%Y"),"2","177","72");
INSERT INTO tbl_player VALUES ("2012049","정국진","K10","JEONG, KOOKJIN",NULL,"2012","MF","16",NULL,STR_TO_DATE("09-FEB-1988","%d-%b-%Y"),"1","172","62");
INSERT INTO tbl_player VALUES ("2011099","정동선","K10","JEONG, DONGSUN",NULL,"2011","MF","9",NULL,STR_TO_DATE("15-MAR-1988","%d-%b-%Y"),"1","170","65");
INSERT INTO tbl_player VALUES ("2010109","최경규","K10","CHOI, KUNGGUY",NULL,"2010","MF","10",NULL,STR_TO_DATE("10-MAR-1987","%d-%b-%Y"),"1","177","72");
INSERT INTO tbl_player VALUES ("2010111","최내철","K10","CHOI, RAECHEOL",NULL,"2010","MF","24",NULL,STR_TO_DATE("20-AUG-1987","%d-%b-%Y"),"1","177","71");
INSERT INTO tbl_player VALUES ("2012048","배성재","K10","BAE, SUNGJAE",NULL,"2012","MF","28",NULL,STR_TO_DATE("01-JUL-1989","%d-%b-%Y"),"1","178","74");
INSERT INTO tbl_player VALUES ("2012121","샴","K10",NULL,NULL,NULL,"MF","25",NULL,STR_TO_DATE("30-APR-1989","%d-%b-%Y"),"1","174","69");
INSERT INTO tbl_player VALUES ("2012136","오비나","K10",NULL,NULL,NULL,"MF","26",NULL,STR_TO_DATE("03-JUN-1990","%d-%b-%Y"),"1","169","70");
INSERT INTO tbl_player VALUES ("2010056","김관우","K10","KIM, KWANWOO","SIRIUS","2010","MF","8",NULL,STR_TO_DATE("25-FEB-1988","%d-%b-%Y"),"1","175","69");
INSERT INTO tbl_player VALUES ("2012050","김광진","K10","KIM, KWANGJIN",NULL,"2012","MF","13",NULL,STR_TO_DATE("27-MAY-1982","%d-%b-%Y"),"1","175","75");
INSERT INTO tbl_player VALUES ("2010113","김상규","K10","KIM, SANGKYU",NULL,"2010","MF","27",NULL,STR_TO_DATE("05-SEP-1987","%d-%b-%Y"),"1","175","65");
INSERT INTO tbl_player VALUES ("2009151","임영주","K10","LIM, YOUNGJOO",NULL,"2009","MF","23",NULL,STR_TO_DATE("08-MAR-1986","%d-%b-%Y"),"2","176","68");
INSERT INTO tbl_player VALUES ("2011101","박영훈","K10","PARK, YOUNGHOON",NULL,"2011","MF","12",NULL,STR_TO_DATE("01-MAY-1985","%d-%b-%Y"),"1","174","73");
INSERT INTO tbl_player VALUES ("2008178","한정국","K10","HAN, JUNGKOOK",NULL,"2011","MF","19",NULL,STR_TO_DATE("19-JUL-1981","%d-%b-%Y"),"1","179","71");
INSERT INTO tbl_player VALUES ("2012046","정광선","K10","JEONG, KWANGSUN",NULL,"2012","FW","32",NULL,STR_TO_DATE("17-JUN-1993","%d-%b-%Y"),"1","175","68");
INSERT INTO tbl_player VALUES ("2007315","정은중","K10","JEONG, EUNJUNG","샤프(SHARP)","2007","FW","18",NULL,STR_TO_DATE("08-APR-1989","%d-%b-%Y"),"2","184","72");
INSERT INTO tbl_player VALUES ("2009152","정찬중","K10","JEONG. CHANJOONG",NULL,"2009","FW","17",NULL,STR_TO_DATE("14-JUN-1986","%d-%b-%Y"),"2","182","72");
INSERT INTO tbl_player VALUES ("2011032","김석","K10","KIM, SEOK",NULL,"2012","FW","20",NULL,STR_TO_DATE("01-FEB-1989","%d-%b-%Y"),"1","194","85");
INSERT INTO tbl_player VALUES ("2011100","탁준석","K10","TAK, JUNSUK",NULL,"2011","FW","11",NULL,STR_TO_DATE("24-MAR-1988","%d-%b-%Y"),"1","178","69");
INSERT INTO tbl_player VALUES ("2000011","정호곤","K06",NULL,NULL,"2010","DF",NULL,NULL,STR_TO_DATE("26-MAR-1971","%d-%b-%Y"),"1","172","77");
INSERT INTO tbl_player VALUES ("2000012","최경훈","K06",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("19-JAN-1971","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000013","정동훈","K06",NULL,NULL,"2010","DF",NULL,NULL,STR_TO_DATE("11-JUN-1975","%d-%b-%Y"),"1","180","88");
INSERT INTO tbl_player VALUES ("2000014","정남표","K06",NULL,NULL,"2005","DF",NULL,NULL,STR_TO_DATE("27-JAN-1974","%d-%b-%Y"),"2","180","77");
INSERT INTO tbl_player VALUES ("2000015","정광재","K06",NULL,NULL,"2005","DF",NULL,NULL,STR_TO_DATE("30-MAY-1978","%d-%b-%Y"),"2","180","75");
INSERT INTO tbl_player VALUES ("2000016","권혁준","K06",NULL,NULL,"2006","DF",NULL,NULL,STR_TO_DATE("22-MAY-1980","%d-%b-%Y"),"1","173","82");
INSERT INTO tbl_player VALUES ("2011052","정경진","K06",NULL,"임꺽정","2011","GK","41",NULL,STR_TO_DATE("07-FEB-1988","%d-%b-%Y"),"2","186","78");
INSERT INTO tbl_player VALUES ("2012076","정용대","K06",NULL,NULL,"2012","GK","40",NULL,STR_TO_DATE("11-OCT-1989","%d-%b-%Y"),"1","189","83");
INSERT INTO tbl_player VALUES ("2010108","정지혁","K06",NULL,NULL,"2010","GK","31",NULL,STR_TO_DATE("22-NOV-1991","%d-%b-%Y"),"1","187","77");
INSERT INTO tbl_player VALUES ("2010059","박유석","K06",NULL,"터프가이","2010","GK","1",NULL,STR_TO_DATE("10-JUN-1987","%d-%b-%Y"),"2","186","78");
INSERT INTO tbl_player VALUES ("2011053","정진우","K06",NULL,"터프가이","2011","DF","33",NULL,STR_TO_DATE("28-FEB-1993","%d-%b-%Y"),"1","180","76");
INSERT INTO tbl_player VALUES ("2007185","정학철","K06",NULL,NULL,"2005","DF","3",NULL,STR_TO_DATE("07-NOV-1982","%d-%b-%Y"),"2","176","73");
INSERT INTO tbl_player VALUES ("2007193","류병훈","K06",NULL,NULL,"2005","DF","17",NULL,STR_TO_DATE("03-JUL-1986","%d-%b-%Y"),"2","184","68");
INSERT INTO tbl_player VALUES ("2011055","최준홍","K06",NULL,"말머리","2011","DF","2",NULL,STR_TO_DATE("13-APR-1988","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2011046","서용혁","K06",NULL,"터프가이","2011","DF","34",NULL,STR_TO_DATE("02-JUL-1988","%d-%b-%Y"),"1","183","79");
INSERT INTO tbl_player VALUES ("2010058","심재원","K06",NULL,"도날드 덕","2010","DF","5",NULL,STR_TO_DATE("11-MAR-1987","%d-%b-%Y"),"1","184","77");
INSERT INTO tbl_player VALUES ("2007123","김임생","K04",NULL,NULL,NULL,"DF","20",NULL,STR_TO_DATE("17-NOV-1981","%d-%b-%Y"),"1","183","80");
INSERT INTO tbl_player VALUES ("2007022","장형석","K04",NULL,NULL,NULL,"DF","36",NULL,STR_TO_DATE("07-JUL-1982","%d-%b-%Y"),"1","181","72");
INSERT INTO tbl_player VALUES ("2012058","박진성","K04",NULL,NULL,NULL,"DF","35",NULL,STR_TO_DATE("10-AUG-1993","%d-%b-%Y"),"1","184","76");
INSERT INTO tbl_player VALUES ("2009125","이거룩","K04",NULL,NULL,NULL,"DF","4",NULL,STR_TO_DATE("26-JUN-1986","%d-%b-%Y"),"1","183","77");
INSERT INTO tbl_player VALUES ("2010001","이정민","K04",NULL,NULL,NULL,"DF","3",NULL,STR_TO_DATE("07-OCT-1987","%d-%b-%Y"),"1","183","78");
INSERT INTO tbl_player VALUES ("2012134","페르난도","K04",NULL,NULL,NULL,"DF","44",NULL,STR_TO_DATE("24-FEB-1988","%d-%b-%Y"),"1","178","74");
INSERT INTO tbl_player VALUES ("2000094","김무건","K03","KIM, MUGYUN",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("18-MAR-1971","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2007001","정병지","K03","JEONG, BYUNGJI",NULL,"2011","GK","1",NULL,STR_TO_DATE("08-APR-1980","%d-%b-%Y"),"1","184","77");
INSERT INTO tbl_player VALUES ("2011069","최주호","K03","CHOI, JUHO",NULL,"2011","GK","51",NULL,STR_TO_DATE("16-JUL-1992","%d-%b-%Y"),"1","185","75");
INSERT INTO tbl_player VALUES ("2007130","김대희","K03","KIM, DAEHEE",NULL,"2010","GK","31",NULL,STR_TO_DATE("26-APR-1984","%d-%b-%Y"),"1","192","88");
INSERT INTO tbl_player VALUES ("2009133","김준호","K03","KIM, JUNHO",NULL,"2009","GK","21",NULL,STR_TO_DATE("28-APR-1983","%d-%b-%Y"),"1","185","77");
INSERT INTO tbl_player VALUES ("2011065","허인무","K03","HEO, INMOO",NULL,"2011","GK","41",NULL,STR_TO_DATE("14-APR-1988","%d-%b-%Y"),"1","187","81");
INSERT INTO tbl_player VALUES ("2011056","강용","K03","KANG, YONG",NULL,"2011","DF","2",NULL,STR_TO_DATE("14-JAN-1989","%d-%b-%Y"),"1","179","72");
INSERT INTO tbl_player VALUES ("2007080","고병운","K03","GO, BYUNGWOON",NULL,"2006","DF","16",NULL,STR_TO_DATE("28-SEP-1983","%d-%b-%Y"),"1","180","73");
INSERT INTO tbl_player VALUES ("2012069","정광석","K03","JEONG, KWANGSUK",NULL,"2012","DF","39",NULL,STR_TO_DATE("12-FEB-1993","%d-%b-%Y"),"1","183","72");
INSERT INTO tbl_player VALUES ("2007002","정상훈","K03","JEONG, SANGHUN",NULL,"2006","DF","13",NULL,STR_TO_DATE("08-JUN-1983","%d-%b-%Y"),"1","183","76");
INSERT INTO tbl_player VALUES ("2012062","정석우","K03","JEONG, SEOKWOO",NULL,"2012","DF","32",NULL,STR_TO_DATE("06-MAY-1993","%d-%b-%Y"),"1","181","72");
INSERT INTO tbl_player VALUES ("2009139","정은석","K03","JEONG, EUNSEOK",NULL,"2009","DF","5",NULL,STR_TO_DATE("14-MAR-1982","%d-%b-%Y"),"1","185","80");
INSERT INTO tbl_player VALUES ("2009030","최민서","K03","CHOI, MINSEO",NULL,"2009","DF","3",NULL,STR_TO_DATE("24-AUG-1986","%d-%b-%Y"),"2","180","78");
INSERT INTO tbl_player VALUES ("2012064","성종현","K03","SUNG, JONGHUN",NULL,"2012","DF","34",NULL,STR_TO_DATE("02-APR-1989","%d-%b-%Y"),"1","178","74");
INSERT INTO tbl_player VALUES ("2008468","싸빅","K03","Jasenko Sabitovic",NULL,"2007","DF","4",NULL,STR_TO_DATE("29-MAR-1983","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2007277","오명관","K03","OH, MYUNGKWAN",NULL,"2008","DF","15",NULL,STR_TO_DATE("29-APR-1984","%d-%b-%Y"),"1","185","76");
INSERT INTO tbl_player VALUES ("2012063","김동식","K03","KIM, DONGSIK",NULL,"2012","MF","33",NULL,STR_TO_DATE("15-MAR-1989","%d-%b-%Y"),"1","183","77");
INSERT INTO tbl_player VALUES ("2012067","김수길","K03","KIM, SOOKIL",NULL,"2012","DF","37",NULL,STR_TO_DATE("09-APR-1989","%d-%b-%Y"),"1","179","69");
INSERT INTO tbl_player VALUES ("2008444","김승엽","K03","KIM, SEUNGYUB",NULL,"2008","DF","12",NULL,STR_TO_DATE("12-OCT-1985","%d-%b-%Y"),"1","180","74");
INSERT INTO tbl_player VALUES ("2007101","김종화","K03",NULL,NULL,NULL,"DF","25",NULL,STR_TO_DATE("04-APR-1984","%d-%b-%Y"),"1","182","76");
INSERT INTO tbl_player VALUES ("2007190","하석주","K03","HA, SEOKJU",NULL,"2011","DF","17",NULL,STR_TO_DATE("20-FEB-1978","%d-%b-%Y"),"1","174","71");
INSERT INTO tbl_player VALUES ("2010065","허제정","K03","HEO, JAEJUNG",NULL,"2010","DF","29",NULL,STR_TO_DATE("02-JUN-1987","%d-%b-%Y"),"1","175","70");
INSERT INTO tbl_player VALUES ("2007096","홍명보","K03","HONG, MYUNGBO",NULL,"2012","DF","20",NULL,STR_TO_DATE("12-FEB-1979","%d-%b-%Y"),"1","181","72");
INSERT INTO tbl_player VALUES ("2008472","정기남","K03","JEONG, KINAM",NULL,"2010","MF","6",NULL,STR_TO_DATE("18-JAN-1981","%d-%b-%Y"),"1","174","72");
INSERT INTO tbl_player VALUES ("2011059","정상록","K03","JEONG, SANGROK",NULL,"2011","MF","14",NULL,STR_TO_DATE("25-FEB-1989","%d-%b-%Y"),"1","173","63");
INSERT INTO tbl_player VALUES ("2011068","나희근","K03","NA, HEEKEUN",NULL,"2011","FW","22",NULL,STR_TO_DATE("05-MAY-1989","%d-%b-%Y"),"1","178","72");
INSERT INTO tbl_player VALUES ("2012133","레오","K03",NULL,NULL,NULL,"MF","45",NULL,STR_TO_DATE("22-OCT-1984","%d-%b-%Y"),"1","179","74");
INSERT INTO tbl_player VALUES ("2012124","메도","K03","Medvid Ivan",NULL,"2012","MF","44",NULL,STR_TO_DATE("13-OCT-1987","%d-%b-%Y"),"1","180","78");
INSERT INTO tbl_player VALUES ("2012068","최길영","K03","CHOI, KILYOUNG",NULL,"2012","MF","38",NULL,STR_TO_DATE("04-FEB-1990","%d-%b-%Y"),"1","172","64");
INSERT INTO tbl_player VALUES ("2008203","최상인","K03","CHOI, SANGIN",NULL,"2005","DF","27",NULL,STR_TO_DATE("10-MAR-1986","%d-%b-%Y"),"1","174","63");
INSERT INTO tbl_player VALUES ("2011131","옐라","K03","Josko Jelicic",NULL,"2012","MF","8",NULL,STR_TO_DATE("05-JAN-1981","%d-%b-%Y"),"1","184","79");
INSERT INTO tbl_player VALUES ("2011061","유현구","K03","YOU, HYUNGOO",NULL,"2011","MF","26",NULL,STR_TO_DATE("25-JAN-1993","%d-%b-%Y"),"1","170","68");
INSERT INTO tbl_player VALUES ("2009033","김기부","K03","KIM, KIBU",NULL,"2009","MF","18",NULL,STR_TO_DATE("16-MAR-1986","%d-%b-%Y"),"2","183","76");
INSERT INTO tbl_player VALUES ("2012070","김상인","K03","KIM, SANGIN",NULL,"2012","DF","40",NULL,STR_TO_DATE("11-JUL-1989","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2011062","김정운","K03","KIM, JUNGWOON",NULL,"2011","MF","19",NULL,STR_TO_DATE("19-APR-1988","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2012071","김중규","K03","KIM, JUNGJYU",NULL,"2012","MF","42",NULL,STR_TO_DATE("06-JUN-1989","%d-%b-%Y"),"1","170","64");
INSERT INTO tbl_player VALUES ("2012066","김창호","K03","KIM, CHANGHO",NULL,"2012","MF","36",NULL,STR_TO_DATE("15-MAR-1991","%d-%b-%Y"),"1","175","75");
INSERT INTO tbl_player VALUES ("2011063","이종범","K03","LEE, JONGBUM",NULL,"2011","MF","24",NULL,STR_TO_DATE("27-MAR-1988","%d-%b-%Y"),"1","178","68");
INSERT INTO tbl_player VALUES ("2012061","남익경","K03","NAM, IKKYUNG",NULL,"2012","MF","30",NULL,STR_TO_DATE("26-JAN-1993","%d-%b-%Y"),"1","177","70");
INSERT INTO tbl_player VALUES ("2011064","윤보영","K03","YOON, BOYOUNG",NULL,"2011","FW","23",NULL,STR_TO_DATE("29-APR-1988","%d-%b-%Y"),"1","177","63");
INSERT INTO tbl_player VALUES ("2008443","김동국","K03","KIM, DONGGOOK",NULL,"2008","FW","10",NULL,STR_TO_DATE("29-APR-1989","%d-%b-%Y"),"1","185","80");
INSERT INTO tbl_player VALUES ("2012060","박종완","K03","PARK, JONGWAN",NULL,"2012","DF","28",NULL,STR_TO_DATE("05-AUG-1993","%d-%b-%Y"),"1","188","82");
INSERT INTO tbl_player VALUES ("2012059","김징요","K03","Jorge Claudio",NULL,"2011","FW","7","브라질",STR_TO_DATE("01-OCT-1985","%d-%b-%Y"),"1","174","70");
INSERT INTO tbl_player VALUES ("2010044","이철우","K03","LEE, CHULWOO",NULL,"2010","FW","9",NULL,STR_TO_DATE("30-NOV-1987","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2011057","코난","K03","Goram Petreski",NULL,"2010","FW","11",NULL,STR_TO_DATE("23-MAY-1982","%d-%b-%Y"),"1","180","76");
INSERT INTO tbl_player VALUES ("2000095","정민규","K03","JEONG, MINJYU",NULL,"2012","MF","35",NULL,STR_TO_DATE("29-SEP-1989","%d-%b-%Y"),"1","178","71");
INSERT INTO tbl_player VALUES ("2000062","제형진","K01","JAE, HYUNGJIN",NULL,"2012","DF","38",NULL,STR_TO_DATE("25-JUN-1989","%d-%b-%Y"),"1","179","75");
INSERT INTO tbl_player VALUES ("2000063","곽기훈","K01","KWAK, KIHOON",NULL,"2012","FW","33",NULL,STR_TO_DATE("05-NOV-1989","%d-%b-%Y"),"1","177","72");
INSERT INTO tbl_player VALUES ("2000064","최민영","K01","CHOI, MINYOUNG",NULL,"2010","FW","37",NULL,STR_TO_DATE("07-MAR-1991","%d-%b-%Y"),"1","174","67");
INSERT INTO tbl_player VALUES ("2000071","김회택","K07",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("11-OCT-1976","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000072","서현옥","K07",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("27-OCT-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000073","정상호","K07",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("05-OCT-1974","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000074","최철우","K07",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("29-SEP-1975","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2012081","정영광","K07",NULL,NULL,NULL,"GK","41",NULL,STR_TO_DATE("28-JUN-1993","%d-%b-%Y"),"1","185","80");
INSERT INTO tbl_player VALUES ("2007227","최종문","K07",NULL,NULL,NULL,"GK","1",NULL,STR_TO_DATE("02-OCT-1980","%d-%b-%Y"),"1","185","76");
INSERT INTO tbl_player VALUES ("2012088","염동균","K07",NULL,NULL,NULL,"GK","31",NULL,STR_TO_DATE("06-SEP-1993","%d-%b-%Y"),"1","189","83");
INSERT INTO tbl_player VALUES ("2012089","김정래","K07",NULL,NULL,NULL,"GK","33",NULL,STR_TO_DATE("12-NOV-1989","%d-%b-%Y"),"1","185","81");
INSERT INTO tbl_player VALUES ("2008212","강철","K07",NULL,NULL,NULL,"DF","3",NULL,STR_TO_DATE("02-NOV-1981","%d-%b-%Y"),"1","178","72");
INSERT INTO tbl_player VALUES ("2012077","정강선","K07",NULL,NULL,NULL,"DF","37",NULL,STR_TO_DATE("23-MAY-1989","%d-%b-%Y"),"1","180","73");
INSERT INTO tbl_player VALUES ("2012083","정인호","K07",NULL,NULL,NULL,"DF","39",NULL,STR_TO_DATE("09-JUN-1993","%d-%b-%Y"),"1","184","79");
INSERT INTO tbl_player VALUES ("2007213","정태영","K07",NULL,NULL,NULL,"DF","7",NULL,STR_TO_DATE("08-NOV-1980","%d-%b-%Y"),"1","180","74");
INSERT INTO tbl_player VALUES ("2007209","정현수","K07",NULL,NULL,NULL,"DF","21",NULL,STR_TO_DATE("14-FEB-1983","%d-%b-%Y"),"1","176","74");
INSERT INTO tbl_player VALUES ("2012084","정형주","K07",NULL,NULL,NULL,"DF","42",NULL,STR_TO_DATE("23-JUN-1989","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2012085","정홍철","K07",NULL,NULL,NULL,"DF","36",NULL,STR_TO_DATE("02-JUN-1989","%d-%b-%Y"),"1","181","69");
INSERT INTO tbl_player VALUES ("2008359","마시엘","K07",NULL,NULL,NULL,"DF","24",NULL,STR_TO_DATE("15-MAR-1982","%d-%b-%Y"),"1","177","70");
INSERT INTO tbl_player VALUES ("2011034","김창원","K07",NULL,NULL,NULL,"DF","5",NULL,STR_TO_DATE("10-JUL-1985","%d-%b-%Y"),"1","183","75");
INSERT INTO tbl_player VALUES ("2012090","장경진","K07",NULL,NULL,NULL,"DF","34",NULL,STR_TO_DATE("31-AUG-1993","%d-%b-%Y"),"1","184","82");
INSERT INTO tbl_player VALUES ("2008425","주영호","K07",NULL,NULL,NULL,"DF","6",NULL,STR_TO_DATE("24-OCT-1985","%d-%b-%Y"),"1","185","80");
INSERT INTO tbl_player VALUES ("2012092","홍성요","K07",NULL,NULL,NULL,"DF","28",NULL,STR_TO_DATE("26-MAY-1989","%d-%b-%Y"),"1","184","78");
INSERT INTO tbl_player VALUES ("2009115","정경일","K07",NULL,NULL,NULL,"MF","49",NULL,STR_TO_DATE("30-AUG-1990","%d-%b-%Y"),"1","170","65");
INSERT INTO tbl_player VALUES ("2011035","정길식","K07",NULL,NULL,NULL,"MF","12",NULL,STR_TO_DATE("24-AUG-1988","%d-%b-%Y"),"1","178","72");
INSERT INTO tbl_player VALUES ("2010030","정남일","K07",NULL,NULL,NULL,"MF","4",NULL,STR_TO_DATE("14-MAR-1987","%d-%b-%Y"),"1","182","76");
INSERT INTO tbl_player VALUES ("2010032","정대욱","K07",NULL,NULL,NULL,"MF","18",NULL,STR_TO_DATE("02-APR-1988","%d-%b-%Y"),"1","182","73");
INSERT INTO tbl_player VALUES ("2007210","정도근","K07",NULL,NULL,NULL,"MF","10",NULL,STR_TO_DATE("02-MAR-1982","%d-%b-%Y"),"2","181","69");
INSERT INTO tbl_player VALUES ("2012078","정동희","K07",NULL,NULL,NULL,"MF","38",NULL,STR_TO_DATE("06-MAY-1993","%d-%b-%Y"),"1","174","64");
INSERT INTO tbl_player VALUES ("2007102","정명곤","K07",NULL,NULL,NULL,"MF","2",NULL,STR_TO_DATE("15-APR-1984","%d-%b-%Y"),"1","177","73");
INSERT INTO tbl_player VALUES ("2012079","정성진","K07",NULL,NULL,NULL,"MF","44",NULL,STR_TO_DATE("20-JAN-1989","%d-%b-%Y"),"1","178","68");
INSERT INTO tbl_player VALUES ("2012080","정승현","K07",NULL,NULL,NULL,"MF","26",NULL,STR_TO_DATE("17-AUG-1989","%d-%b-%Y"),"1","181","71");
INSERT INTO tbl_player VALUES ("2012082","정요환","K07",NULL,NULL,NULL,"MF","25",NULL,STR_TO_DATE("23-MAY-1987","%d-%b-%Y"),"1","170","62");
INSERT INTO tbl_player VALUES ("2009100","정정겸","K07",NULL,NULL,NULL,"MF","13",NULL,STR_TO_DATE("09-JUN-1986","%d-%b-%Y"),"2","172","65");
INSERT INTO tbl_player VALUES ("2008428","정종현","K07",NULL,NULL,NULL,"MF","11",NULL,STR_TO_DATE("10-JUL-1983","%d-%b-%Y"),"1","173","68");
INSERT INTO tbl_player VALUES ("2012086","노병준","K07",NULL,NULL,NULL,"MF","22",NULL,STR_TO_DATE("29-SEP-1989","%d-%b-%Y"),"1","177","67");
INSERT INTO tbl_player VALUES ("2012087","최종우","K07",NULL,NULL,NULL,"MF","43",NULL,STR_TO_DATE("11-APR-1989","%d-%b-%Y"),"1","176","69");
INSERT INTO tbl_player VALUES ("2007305","조진원","K07",NULL,NULL,NULL,"MF","9",NULL,STR_TO_DATE("27-SEP-1984","%d-%b-%Y"),"1","176","75");
INSERT INTO tbl_player VALUES ("2012132","실바","K07",NULL,NULL,NULL,"MF","45",NULL,STR_TO_DATE("20-JUN-1987","%d-%b-%Y"),"1","173","67");
INSERT INTO tbl_player VALUES ("2010031","윤용구","K07",NULL,NULL,NULL,"MF","15",NULL,STR_TO_DATE("08-AUG-1987","%d-%b-%Y"),"1","168","60");
INSERT INTO tbl_player VALUES ("2011127","김반","K07",NULL,NULL,NULL,"MF","14",NULL,STR_TO_DATE("27-OCT-1984","%d-%b-%Y"),"1","174","69");
INSERT INTO tbl_player VALUES ("2011038","김영수","K07",NULL,NULL,NULL,"MF","30",NULL,STR_TO_DATE("30-JUL-1988","%d-%b-%Y"),"1","175","65");
INSERT INTO tbl_player VALUES ("2008423","임관식","K07",NULL,NULL,NULL,"MF","29",NULL,STR_TO_DATE("28-JUL-1985","%d-%b-%Y"),"1","172","68");
INSERT INTO tbl_player VALUES ("2011036","이정호","K07",NULL,NULL,NULL,"MF","23",NULL,STR_TO_DATE("06-APR-1988","%d-%b-%Y"),"1","176","71");
INSERT INTO tbl_player VALUES ("2011039","하기윤","K07",NULL,NULL,NULL,"MF","32",NULL,STR_TO_DATE("10-MAR-1992","%d-%b-%Y"),"1","180","65");
INSERT INTO tbl_player VALUES ("2010003","정대철","K07",NULL,NULL,NULL,"FW","20",NULL,STR_TO_DATE("26-AUG-1987","%d-%b-%Y"),"1","183","78");
INSERT INTO tbl_player VALUES ("2010154","꼬레아","K07",NULL,NULL,NULL,"FW","16",NULL,STR_TO_DATE("23-AUG-1984","%d-%b-%Y"),"1","172","70");
INSERT INTO tbl_player VALUES ("2007214","노상래","K07",NULL,NULL,NULL,"FW","8",NULL,STR_TO_DATE("15-DEC-1980","%d-%b-%Y"),"1","175","74");
INSERT INTO tbl_player VALUES ("2009149","성한수","K07",NULL,NULL,NULL,"FW","40",NULL,STR_TO_DATE("10-MAR-1986","%d-%b-%Y"),"2","177","69");
INSERT INTO tbl_player VALUES ("2009161","세자르","K07",NULL,NULL,NULL,"FW","17",NULL,STR_TO_DATE("09-DEC-1983","%d-%b-%Y"),"1","180","78");
INSERT INTO tbl_player VALUES ("2012032","조병호","K07",NULL,NULL,NULL,"FW","27",NULL,STR_TO_DATE("26-APR-1987","%d-%b-%Y"),"1","177","75");
INSERT INTO tbl_player VALUES ("2011120","찌코","K07",NULL,NULL,NULL,"FW","27",NULL,STR_TO_DATE("26-JAN-1985","%d-%b-%Y"),"1","180","67");
INSERT INTO tbl_player VALUES ("2010037","하성룡","K07",NULL,NULL,NULL,"FW","35",NULL,STR_TO_DATE("03-FEB-1992","%d-%b-%Y"),"1","179","68");
INSERT INTO tbl_player VALUES ("2012091","홍복표","K07",NULL,NULL,NULL,"FW","19",NULL,STR_TO_DATE("28-OCT-1989","%d-%b-%Y"),"1","182","73");
INSERT INTO tbl_player VALUES ("2000081","김윤환","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("24-MAY-1971","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000082","정은철","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("26-MAY-1978","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000083","김경춘","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("14-APR-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000084","최동우","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("03-NOV-1980","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000085","전명구","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("16-MAR-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000086","박경치","K05",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("06-JAN-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2007106","정이섭","K05","JEONG, ISUB","쾌남","2012","GK","45",NULL,STR_TO_DATE("06-APR-1984","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2012007","최관민","K05","CHOI, KWANMIN",NULL,"2012","GK","31",NULL,STR_TO_DATE("26-MAY-1989","%d-%b-%Y"),"1","188","85");
INSERT INTO tbl_player VALUES ("2008179","최동우","K05",NULL,NULL,NULL,"GK","60",NULL,STR_TO_DATE("03-NOV-1980","%d-%b-%Y"),"1","187","78");
INSERT INTO tbl_player VALUES ("2008138","김용발","K05","KIM, YONGBAL",NULL,"2004","GK","18",NULL,STR_TO_DATE("15-MAR-1983","%d-%b-%Y"),"1","183","77");
INSERT INTO tbl_player VALUES ("2012006","김창민","K05","KIM, CHANGMIN","고릴라","2012","GK","1",NULL,STR_TO_DATE("25-JAN-1990","%d-%b-%Y"),"1","191","87");
INSERT INTO tbl_player VALUES ("2010010","정대건","K05","JEONG, DAEKEON",NULL,"2010","DF","26",NULL,STR_TO_DATE("27-APR-1987","%d-%b-%Y"),"1","183","78");
INSERT INTO tbl_player VALUES ("2007159","정봉현","K05","JEONG, BONGHYUN",NULL,"2005","MF","23",NULL,STR_TO_DATE("07-JUL-1984","%d-%b-%Y"),"1","188","74");
INSERT INTO tbl_player VALUES ("2012009","정창민","K05","JEONG, CHANGMIN","야생마","2012","DF","36",NULL,STR_TO_DATE("22-SEP-1989","%d-%b-%Y"),"1","181","68");
INSERT INTO tbl_player VALUES ("2012005","최동혁","K05","CHOI, DONGHYUK","백호","2012","DF","23",NULL,STR_TO_DATE("18-APR-1989","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2012012","백인석","K05","BAEK, INSEOK","떡맨","2012","MF","40",NULL,STR_TO_DATE("08-AUG-1989","%d-%b-%Y"),"1","179","72");
INSERT INTO tbl_player VALUES ("2008391","서혁수","K05","SEO, HYUKSU","맷돌","2008","DF","6",NULL,STR_TO_DATE("01-OCT-1983","%d-%b-%Y"),"1","178","77");
INSERT INTO tbl_player VALUES ("2012004","안광호","K05","AN, KWANGHO","왕깡","2012","DF","15",NULL,STR_TO_DATE("10-JAN-1989","%d-%b-%Y"),"1","190","78");
INSERT INTO tbl_player VALUES ("2009076","임종훈","K05","LIM, HONGHUN","꺼시","2009","DF","31",NULL,STR_TO_DATE("14-JUN-1986","%d-%b-%Y"),"1","182","74");
INSERT INTO tbl_player VALUES ("2007148","이진철","K05","LEE, JINCHEUL",NULL,"2006","DF","4",NULL,STR_TO_DATE("26-MAR-1981","%d-%b-%Y"),"1","187","75");
INSERT INTO tbl_player VALUES ("2009061","한종성","K05","HAN, JONGSUNG",NULL,"2009","DF","13",NULL,STR_TO_DATE("30-JAN-1987","%d-%b-%Y"),"1","177","70");
INSERT INTO tbl_player VALUES ("2009160","호제리오","K05","Rogerio Prateat","저승사자","2009","DF","3",NULL,STR_TO_DATE("09-MAR-1983","%d-%b-%Y"),"1","185","85");
INSERT INTO tbl_player VALUES ("2007031","황승주","K05",NULL,NULL,NULL,"DF","98",NULL,STR_TO_DATE("09-MAY-1982","%d-%b-%Y"),"1","176","68");
INSERT INTO tbl_player VALUES ("2010023","고관영","K05","KO, KWANYOUNG","까우","2010","MF","32",NULL,STR_TO_DATE("07-DEC-1991","%d-%b-%Y"),"1","180","72");
INSERT INTO tbl_player VALUES ("2007155","정경량","K05","JEONG, KYUNGRYANG",NULL,"2006","MF","19",NULL,STR_TO_DATE("22-DEC-1983","%d-%b-%Y"),"1","173","65");
INSERT INTO tbl_player VALUES ("2010025","정은익","K05",NULL,NULL,NULL,"MF","35",NULL,STR_TO_DATE("09-MAR-1991","%d-%b-%Y"),"1","176","63");
INSERT INTO tbl_player VALUES ("2012001","레오마르","K05","Leomar Leiria","레오","2012","MF","5",NULL,STR_TO_DATE("26-JUN-1981","%d-%b-%Y"),"1","183","77");
INSERT INTO tbl_player VALUES ("2008269","명재용","K05","MYUNG, JAEYOENG",NULL,"2007","MF","7",NULL,STR_TO_DATE("26-FEB-1983","%d-%b-%Y"),"2","173","63");
INSERT INTO tbl_player VALUES ("2007149","변재섭","K05","BYUN, JAESUB","작은탱크","2007","MF","11",NULL,STR_TO_DATE("17-SEP-1985","%d-%b-%Y"),"2","170","63");
INSERT INTO tbl_player VALUES ("2012002","보띠","K05","Raphael JoseBotti Zacarias Sena","Botti","2012","MF","10",NULL,STR_TO_DATE("23-FEB-1991","%d-%b-%Y"),"1","174","68");
INSERT INTO tbl_player VALUES ("2011123","비에라","K05","Vieira",NULL,"2011","MF","21",NULL,STR_TO_DATE("25-FEB-1984","%d-%b-%Y"),"1","176","73");
INSERT INTO tbl_player VALUES ("2008460","서동원","K05","SEO, DONGWON",NULL,"2008","MF","22",NULL,STR_TO_DATE("14-AUG-1985","%d-%b-%Y"),"1","184","78");
INSERT INTO tbl_player VALUES ("2010019","안대현","K05","AN, DAEHYUN",NULL,"2010","MF","25",NULL,STR_TO_DATE("20-AUG-1987","%d-%b-%Y"),"1","179","72");
INSERT INTO tbl_player VALUES ("2010018","양현정","K05","YANG, HYUNJUNG",NULL,"2010","MF","14",NULL,STR_TO_DATE("25-JUL-1987","%d-%b-%Y"),"1","176","72");
INSERT INTO tbl_player VALUES ("2010022","유원섭","K05","YOU, WONSUOB","앙마","2010","MF","37",NULL,STR_TO_DATE("24-MAY-1991","%d-%b-%Y"),"1","180","77");
INSERT INTO tbl_player VALUES ("2012008","김수철","K05","KIM, SUCHEUL",NULL,"2012","MF","34",NULL,STR_TO_DATE("26-MAY-1989","%d-%b-%Y"),"1","171","68");
INSERT INTO tbl_player VALUES ("2012013","임다한","K05","LIM, DAHAN","달마","2012","DF","39",NULL,STR_TO_DATE("21-JUL-1989","%d-%b-%Y"),"1","181","67");
INSERT INTO tbl_player VALUES ("2007087","전경준","K05","JEON, KYOUNGJOON",NULL,"2001","MF","16",NULL,STR_TO_DATE("10-SEP-1983","%d-%b-%Y"),"1","178","68");
INSERT INTO tbl_player VALUES ("2010021","이영훈","K05","LEE, YOUNGHOON","깐돌이","2010","MF","27",NULL,STR_TO_DATE("18-MAR-1991","%d-%b-%Y"),"1","178","71");
INSERT INTO tbl_player VALUES ("2011028","추운기","K05","CHOO, WOONKI","코알라","2011","MF","17",NULL,STR_TO_DATE("03-APR-1988","%d-%b-%Y"),"1","173","69");
INSERT INTO tbl_player VALUES ("2008393","하은철","K05","HA, EUNCHEUL",NULL,"2008","MF","29",NULL,STR_TO_DATE("23-JUN-1985","%d-%b-%Y"),"1","176","69");
INSERT INTO tbl_player VALUES ("2011030","고민기","K05","GO, MINGI",NULL,"2011","FW","24",NULL,STR_TO_DATE("01-JUL-1988","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2008143","정도훈","K05","JEONG, DOHOON","폭격기","2005","FW","9",NULL,STR_TO_DATE("21-JUL-1980","%d-%b-%Y"),"1","182","77");
INSERT INTO tbl_player VALUES ("2012011","정연건","K05","JEONG, YEONGUN",NULL,"2012","FW","44",NULL,STR_TO_DATE("12-MAR-1991","%d-%b-%Y"),"1","188","77");
INSERT INTO tbl_player VALUES ("2011002","정현기","K05","JEONG, HYUNKI",NULL,"2011","FW","28",NULL,STR_TO_DATE("19-MAR-1992","%d-%b-%Y"),"1","190","82");
INSERT INTO tbl_player VALUES ("2011003","남궁도","K05","NAM, KUNGDO",NULL,"2011","FW","33",NULL,STR_TO_DATE("04-JUN-1992","%d-%b-%Y"),"1","186","80");
INSERT INTO tbl_player VALUES ("2010101","문태혁","K05","MOON, TAEHYUK",NULL,"2012","FW","41",NULL,STR_TO_DATE("31-MAR-1993","%d-%b-%Y"),"1","178","74");
INSERT INTO tbl_player VALUES ("2008392","최성배","K05","CHOI, SUNGBAE","흑상어","2008","FW","8",NULL,STR_TO_DATE("28-NOV-1985","%d-%b-%Y"),"2","181","76");
INSERT INTO tbl_player VALUES ("2012125","에드밀손","K05","Edmilson","EDY","2012","FW","20",NULL,STR_TO_DATE("29-MAY-1978","%d-%b-%Y"),"1","184","79");
INSERT INTO tbl_player VALUES ("2012003","쿠키","K05",NULL,NULL,NULL,"FW","99",NULL,STR_TO_DATE("30-APR-1981","%d-%b-%Y"),"1","170","76");
INSERT INTO tbl_player VALUES ("2000087","정은익","K05","JEONG, EUNIK",NULL,"2010","FW","35",NULL,STR_TO_DATE("09-MAR-1991","%d-%b-%Y"),"1","176","65");
INSERT INTO tbl_player VALUES ("2000091","이순호","K03","LEE, SOONHO",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("10-JAN-1972","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000092","유동관","K03","YOU, DONGKWAN",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("12-MAY-1973","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000093","박기동","K03","PARK, GIDONG",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("13-MAY-1971","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2011111","김반코비","K02",NULL,NULL,NULL,"MF","47",NULL,STR_TO_DATE("08-FEB-1985","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2012020","김선우","K02","KIM, SUNWOO",NULL,NULL,"FW","33",NULL,STR_TO_DATE("01-APR-1988","%d-%b-%Y"),"1","174","68");
INSERT INTO tbl_player VALUES ("2011074","김여성","K02","KIM, YEOSUNG",NULL,NULL,"MF","36",NULL,STR_TO_DATE("05-JAN-1993","%d-%b-%Y"),"1","179","63");
INSERT INTO tbl_player VALUES ("2007064","김용우","K02","KIM, YONGWOO",NULL,NULL,"FW","27",NULL,STR_TO_DATE("20-JUL-1987","%d-%b-%Y"),"1","175","70");
INSERT INTO tbl_player VALUES ("2012019","김종민","K02","KIM, JONGMIN",NULL,NULL,"MF","30",NULL,STR_TO_DATE("01-SEP-1993","%d-%b-%Y"),"1","174","65");
INSERT INTO tbl_player VALUES ("2008437","박용훈","K02","PARK, YONGHOON",NULL,NULL,"MF","9",NULL,STR_TO_DATE("11-MAR-1989","%d-%b-%Y"),"1","175","67");
INSERT INTO tbl_player VALUES ("2008436","김만근","K02","KIM, MANKEUN",NULL,NULL,"FW","34",NULL,STR_TO_DATE("28-NOV-1987","%d-%b-%Y"),"1","177","67");
INSERT INTO tbl_player VALUES ("2007070","김재민","K02","KIM, JAEMIN",NULL,NULL,"MF","35",NULL,STR_TO_DATE("22-MAY-1988","%d-%b-%Y"),"1","180","71");
INSERT INTO tbl_player VALUES ("2007043","김현두","K02","KIM, HYUNDOO",NULL,NULL,"MF","12",NULL,STR_TO_DATE("23-NOV-1983","%d-%b-%Y"),"1","176","68");
INSERT INTO tbl_player VALUES ("2012017","이성용","K02","LEE, SUNGYONG",NULL,NULL,"DF","20",NULL,STR_TO_DATE("25-DEC-1985","%d-%b-%Y"),"1","173","70");
INSERT INTO tbl_player VALUES ("2012018","하태근","K02","HA, TAEKEUN",NULL,NULL,"MF","29",NULL,STR_TO_DATE("01-JUL-1993","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2012122","미트로","K02","Mitrovic Slavisa",NULL,NULL,"FW","19","보스니아",STR_TO_DATE("05-JUL-1987","%d-%b-%Y"),"1","192","89");
INSERT INTO tbl_player VALUES ("2007048","최건하","K02","CHOI, KUNHA",NULL,NULL,"FW","18",NULL,STR_TO_DATE("25-JUL-1981","%d-%b-%Y"),"1","180","75");
INSERT INTO tbl_player VALUES ("2010168","산드로","K02","Sandro Cardoso Dos Santos",NULL,NULL,"FW","13","브라질",STR_TO_DATE("22-MAR-1990","%d-%b-%Y"),"1","182","78");
INSERT INTO tbl_player VALUES ("2012023","윤화평","K02","YOON, HWAPYUNG",NULL,NULL,"FW","42",NULL,STR_TO_DATE("26-MAR-1993","%d-%b-%Y"),"1","182","74");
INSERT INTO tbl_player VALUES ("2012022","김관희","K02","KIM, KWANHEE",NULL,NULL,"FW","39",NULL,STR_TO_DATE("29-JUN-1993","%d-%b-%Y"),"1","180","70");
INSERT INTO tbl_player VALUES ("2000051","김광래","K09",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("19-MAR-1974","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000052","김춘석","K09",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("03-FEB-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000053","조재흠","K09",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("26-MAR-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000054","김영진","K09",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("27-OCT-1973","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000055","정귀화","K09",NULL,NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("15-MAR-1980","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2012094","최동석","K09",NULL,NULL,NULL,"GK","1",NULL,STR_TO_DATE("03-MAY-1991","%d-%b-%Y"),"1","190","89");
INSERT INTO tbl_player VALUES ("2010125","백민철","K09",NULL,NULL,NULL,"GK","21",NULL,STR_TO_DATE("28-JUL-1987","%d-%b-%Y"),"1","185","78");
INSERT INTO tbl_player VALUES ("2007236","조의손","K09",NULL,NULL,NULL,"GK","44",NULL,STR_TO_DATE("12-JAN-1970","%d-%b-%Y"),"1","192","87");
INSERT INTO tbl_player VALUES ("2011018","우태식","K09",NULL,NULL,NULL,"GK","31",NULL,STR_TO_DATE("08-JAN-1993","%d-%b-%Y"),"1","185","75");
INSERT INTO tbl_player VALUES ("2010117","정동진","K09",NULL,NULL,NULL,"DF","4",NULL,STR_TO_DATE("29-JAN-1991","%d-%b-%Y"),"1","182","74");
INSERT INTO tbl_player VALUES ("2008414","정성일","K09",NULL,NULL,NULL,"DF","19",NULL,STR_TO_DATE("13-APR-1984","%d-%b-%Y"),"1","178","75");
INSERT INTO tbl_player VALUES ("2012093","정치곤","K09",NULL,NULL,NULL,"DF","17",NULL,STR_TO_DATE("29-JUL-1993","%d-%b-%Y"),"1","183","76");
INSERT INTO tbl_player VALUES ("2012095","최요셉","K09",NULL,NULL,NULL,"DF","5",NULL,STR_TO_DATE("03-DEC-1990","%d-%b-%Y"),"1","183","75");
INSERT INTO tbl_player VALUES ("2010119","최용호","K09",NULL,NULL,NULL,"DF","14",NULL,STR_TO_DATE("25-MAR-1991","%d-%b-%Y"),"1","182","69");
INSERT INTO tbl_player VALUES ("2007068","최정석","K09",NULL,NULL,NULL,"DF","6",NULL,STR_TO_DATE("19-APR-1987","%d-%b-%Y"),"1","182","78");
INSERT INTO tbl_player VALUES ("2007266","손현준","K09",NULL,NULL,NULL,"DF","45",NULL,STR_TO_DATE("20-MAR-1982","%d-%b-%Y"),"1","175","70");
INSERT INTO tbl_player VALUES ("2011012","안성훈","K09",NULL,NULL,NULL,"MF","2",NULL,STR_TO_DATE("11-SEP-1992","%d-%b-%Y"),"1","176","63");
INSERT INTO tbl_player VALUES ("2008420","김상헌","K09",NULL,NULL,NULL,"DF","25",NULL,STR_TO_DATE("11-OCT-1985","%d-%b-%Y"),"2","185","80");
INSERT INTO tbl_player VALUES ("2012102","박성호","K09",NULL,NULL,NULL,"DF","34",NULL,STR_TO_DATE("07-APR-1996","%d-%b-%Y"),"1","184","71");
INSERT INTO tbl_player VALUES ("2007225","이윤열","K09",NULL,NULL,NULL,"DF","3",NULL,STR_TO_DATE("17-APR-1984","%d-%b-%Y"),"1","185","79");
INSERT INTO tbl_player VALUES ("2009048","정도용","K09",NULL,NULL,NULL,"MF","40",NULL,STR_TO_DATE("28-MAY-1986","%d-%b-%Y"),"1","168","68");
INSERT INTO tbl_player VALUES ("2011072","정민성","K09",NULL,NULL,NULL,"MF","24",NULL,STR_TO_DATE("28-MAY-1992","%d-%b-%Y"),"1","175","64");
INSERT INTO tbl_player VALUES ("2011008","조재필","K09",NULL,NULL,NULL,"MF","41",NULL,STR_TO_DATE("25-MAY-1992","%d-%b-%Y"),"1","180","70");
INSERT INTO tbl_player VALUES ("2012096","조현국","K09",NULL,NULL,NULL,"MF","37",NULL,STR_TO_DATE("21-MAR-1993","%d-%b-%Y"),"1","172","65");
INSERT INTO tbl_player VALUES ("2010049","안드레","K09",NULL,NULL,NULL,"MF","18","브라질",STR_TO_DATE("16-NOV-1982","%d-%b-%Y"),"1","172","69");
INSERT INTO tbl_player VALUES ("2012097","안상현","K09",NULL,NULL,NULL,"MF","33",NULL,STR_TO_DATE("05-MAR-1996","%d-%b-%Y"),"1","176","67");
INSERT INTO tbl_player VALUES ("2012098","우진석","K09",NULL,NULL,NULL,"MF","39",NULL,STR_TO_DATE("26-AUG-1989","%d-%b-%Y"),"1","176","70");
INSERT INTO tbl_player VALUES ("2007133","유상수","K09",NULL,NULL,NULL,"MF","43",NULL,STR_TO_DATE("28-AUG-1983","%d-%b-%Y"),"2","175","67");
INSERT INTO tbl_player VALUES ("2010048","김영표","K09",NULL,NULL,NULL,"MF","12",NULL,STR_TO_DATE("23-APR-1987","%d-%b-%Y"),"1","176","66");
INSERT INTO tbl_player VALUES ("2012100","김준기","K09",NULL,NULL,NULL,"MF","36",NULL,STR_TO_DATE("25-APR-1992","%d-%b-%Y"),"1","183","74");
INSERT INTO tbl_player VALUES ("2012101","김지남","K09",NULL,NULL,NULL,"MF","42",NULL,STR_TO_DATE("21-NOV-1994","%d-%b-%Y"),"1","183","68");
INSERT INTO tbl_player VALUES ("2008413","박광민","K09",NULL,NULL,NULL,"FW","23",NULL,STR_TO_DATE("08-JAN-1986","%d-%b-%Y"),"1","180","70");
INSERT INTO tbl_player VALUES ("2009051","박창근","K09",NULL,NULL,NULL,"MF","27",NULL,STR_TO_DATE("10-AUG-1993","%d-%b-%Y"),"2","170","63");
INSERT INTO tbl_player VALUES ("2010118","이원권","K09",NULL,NULL,NULL,"MF","13",NULL,STR_TO_DATE("08-NOV-1991","%d-%b-%Y"),"1","173","65");
INSERT INTO tbl_player VALUES ("2010120","정병채","K09",NULL,NULL,NULL,"FW","15",NULL,STR_TO_DATE("14-APR-1991","%d-%b-%Y"),"1","180","72");
INSERT INTO tbl_player VALUES ("2009046","정성재","K09",NULL,NULL,NULL,"MF","8",NULL,STR_TO_DATE("17-SEP-1986","%d-%b-%Y"),"2","178","72");
INSERT INTO tbl_player VALUES ("2012119","뚜따","K09",NULL,NULL,NULL,"FW","99","브라질",STR_TO_DATE("20-JUN-1984","%d-%b-%Y"),"1","187","84");
INSERT INTO tbl_player VALUES ("2012105","마르코","K09",NULL,NULL,NULL,"FW","11","브라질",STR_TO_DATE("03-DEC-1986","%d-%b-%Y"),"1","175","77");
INSERT INTO tbl_player VALUES ("2011005","최성호","K09",NULL,NULL,NULL,"FW","30",NULL,STR_TO_DATE("27-JUL-1992","%d-%b-%Y"),"1","187","73");
INSERT INTO tbl_player VALUES ("2011108","최윤화","K09",NULL,NULL,NULL,"MF","16",NULL,STR_TO_DATE("13-JUN-1988","%d-%b-%Y"),"1","175","67");
INSERT INTO tbl_player VALUES ("2009047","최정환","K09",NULL,NULL,NULL,"FW","20",NULL,STR_TO_DATE("14-JAN-1987","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2009005","왕정현","K09",NULL,NULL,NULL,"FW","28",NULL,STR_TO_DATE("30-AUG-1986","%d-%b-%Y"),"2","181","73");
INSERT INTO tbl_player VALUES ("2012099","김정수","K09",NULL,NULL,NULL,"FW","7",NULL,STR_TO_DATE("08-JAN-1990","%d-%b-%Y"),"1","184","74");
INSERT INTO tbl_player VALUES ("2012103","김원광","K09",NULL,NULL,NULL,"FW","22",NULL,STR_TO_DATE("23-AUG-1995","%d-%b-%Y"),"1","183","68");
INSERT INTO tbl_player VALUES ("2009044","진순진","K09",NULL,NULL,NULL,"MF","26",NULL,STR_TO_DATE("01-MAR-1984","%d-%b-%Y"),"2","180","78");
INSERT INTO tbl_player VALUES ("2010053","이태욱","K09",NULL,NULL,NULL,"FW","9",NULL,STR_TO_DATE("13-MAR-1991","%d-%b-%Y"),"1","173","66");
INSERT INTO tbl_player VALUES ("2012104","한동원","K09",NULL,NULL,NULL,"FW","32",NULL,STR_TO_DATE("06-APR-1996","%d-%b-%Y"),"1","174","61");
INSERT INTO tbl_player VALUES ("2011004","한정화","K09",NULL,NULL,NULL,"FW","29",NULL,STR_TO_DATE("31-OCT-1992","%d-%b-%Y"),"1","173","63");
INSERT INTO tbl_player VALUES ("2010164","히카르도","K09",NULL,NULL,NULL,"MF","10","브라질",STR_TO_DATE("08-JUN-1986","%d-%b-%Y"),"1","189","71");
INSERT INTO tbl_player VALUES ("2011082","권정혁","K01","KWON, JUNGHYUK",NULL,"2011","GK","1",NULL,STR_TO_DATE("02-AUG-1988","%d-%b-%Y"),"1","195","80");
INSERT INTO tbl_player VALUES ("2009070","최창주","K01","CHOI, CHANGZOO",NULL,"2009","GK","40",NULL,STR_TO_DATE("30-SEP-1982","%d-%b-%Y"),"1","187","86");
INSERT INTO tbl_player VALUES ("2007020","서동명","K01","SEO, DONGMYUNG",NULL,"2012","GK","21",NULL,STR_TO_DATE("04-MAY-1984","%d-%b-%Y"),"1","196","94");
INSERT INTO tbl_player VALUES ("2008410","양지원","K01","YANG, JIWON",NULL,"2008","GK","45",NULL,STR_TO_DATE("28-APR-1984","%d-%b-%Y"),"1","181","75");
INSERT INTO tbl_player VALUES ("2012039","이무림","K01","LEE, MOOLIM",NULL,"2012","GK","31",NULL,STR_TO_DATE("15-APR-1989","%d-%b-%Y"),"1","185","79");
INSERT INTO tbl_player VALUES ("2012034","정윤구","K01","JEONG, YOONGOO",NULL,"2012","DF","20",NULL,STR_TO_DATE("01-SEP-1989","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2011106","끌레베르","K01","Cleber Arild",NULL,"2011","DF","3","브라질",STR_TO_DATE("21-JAN-1979","%d-%b-%Y"),"1","186","79");
INSERT INTO tbl_player VALUES ("2011080","최경삼","K01","CHOI, GYUNGSAM",NULL,"2011","DF","25",NULL,STR_TO_DATE("06-JUN-1988","%d-%b-%Y"),"1","188","74");
INSERT INTO tbl_player VALUES ("2007004","최종욱","K01","CHOI, JONGWOOK",NULL,"2007","DF","29",NULL,STR_TO_DATE("11-JAN-1985","%d-%b-%Y"),"1","185","74");
INSERT INTO tbl_player VALUES ("2012035","변성환","K01","BYUN, SUNGHWAN",NULL,"2012","DF","23",NULL,STR_TO_DATE("22-DEC-1989","%d-%b-%Y"),"1","176","69");
INSERT INTO tbl_player VALUES ("2008366","손상호","K01","SON, SANGHO",NULL,"2007","DF","28",NULL,STR_TO_DATE("04-MAY-1984","%d-%b-%Y"),"1","187","78");
INSERT INTO tbl_player VALUES ("2012044","유재형","K01","YOU, JAEHYUNG",NULL,"2012","DF","39",NULL,STR_TO_DATE("24-AUG-1987","%d-%b-%Y"),"1","180","79");
INSERT INTO tbl_player VALUES ("2011077","김세권","K01","KIM, SAEKWON",NULL,"2011","DF","4",NULL,STR_TO_DATE("26-JUN-1988","%d-%b-%Y"),"1","184","80");
INSERT INTO tbl_player VALUES ("2009069","하성용","K01","HA, SUNGYONG",NULL,"2009","DF","43",NULL,STR_TO_DATE("05-OCT-1986","%d-%b-%Y"),"1","179","75");
INSERT INTO tbl_player VALUES ("2010082","한정일","K01","HAN, JEUNGIL",NULL,"2010","DF","41",NULL,STR_TO_DATE("03-MAR-1987","%d-%b-%Y"),"1","172","65");
INSERT INTO tbl_player VALUES ("2010054","정건형","K01","JEONG, KUNHYUNG",NULL,"2010","MF","17",NULL,STR_TO_DATE("11-SEP-1989","%d-%b-%Y"),"1","176","70");
INSERT INTO tbl_player VALUES ("2009058","정도균","K01","JEONG, DOKYUN",NULL,"2009","MF","6",NULL,STR_TO_DATE("13-JAN-1987","%d-%b-%Y"),"1","184","78");
INSERT INTO tbl_player VALUES ("2011083","최기욱","K01","CHOI, KIWOOK",NULL,"2011","MF","18",NULL,STR_TO_DATE("22-DEC-1988","%d-%b-%Y"),"1","175","68");
INSERT INTO tbl_player VALUES ("2012028","최진섭","K01","CHOI, JINSUP",NULL,"2012","MF","2",NULL,STR_TO_DATE("11-MAR-1987","%d-%b-%Y"),"1","179","68");
INSERT INTO tbl_player VALUES ("2011079","서덕규","K01","SEO, DOUKGUY",NULL,"2011","DF","5",NULL,STR_TO_DATE("22-OCT-1988","%d-%b-%Y"),"1","182","72");
INSERT INTO tbl_player VALUES ("2012130","에디","K01","Edmilson Alves",NULL,"2012","MF","7","브라질",STR_TO_DATE("17-FEB-1986","%d-%b-%Y"),"1","182","70");
INSERT INTO tbl_player VALUES ("2009055","김길용","K01","KIM, KILYONG",NULL,"2009","MF","22",NULL,STR_TO_DATE("30-MAR-1986","%d-%b-%Y"),"2","183","78");
INSERT INTO tbl_player VALUES ("2012036","김윤섭","K01","KIM, YOONSUB",NULL,"2012","MF","26",NULL,STR_TO_DATE("30-JUL-1989","%d-%b-%Y"),"1","184","77");
INSERT INTO tbl_player VALUES ("2012029","김천수","K01","KIM, CHUNSU",NULL,"2012","MF","9",NULL,STR_TO_DATE("09-JUL-1991","%d-%b-%Y"),"1","174","65");
INSERT INTO tbl_player VALUES ("2012033","장성욱","K01","JANG, SUNGWOOK",NULL,"2012","MF","19",NULL,STR_TO_DATE("01-SEP-1989","%d-%b-%Y"),"1","174","71");
INSERT INTO tbl_player VALUES ("2007023","장철민","K01","JANG, CHULMIN",NULL,"2007","MF","24",NULL,STR_TO_DATE("19-MAY-1982","%d-%b-%Y"),"1","179","76");
INSERT INTO tbl_player VALUES ("2011084","전광철","K01","JEON, KWANGCHEOL",NULL,"2011","MF","34",NULL,STR_TO_DATE("16-JUL-1992","%d-%b-%Y"),"1","186","74");
INSERT INTO tbl_player VALUES ("2012045","전재운","K01","JEON, JAEWOON",NULL,"2012","MF","42",NULL,STR_TO_DATE("05-JUN-1991","%d-%b-%Y"),"1","177","67");
INSERT INTO tbl_player VALUES ("2007008","박정수","K01","PARK, JEONGSOO",NULL,"2003","MF","8",NULL,STR_TO_DATE("20-NOV-1979","%d-%b-%Y"),"1","170","61");
INSERT INTO tbl_player VALUES ("2012042","박주영","K01","PARK, HUYOUNG",NULL,"2012","MF","36",NULL,STR_TO_DATE("03-MAY-1989","%d-%b-%Y"),"1","172","65");
INSERT INTO tbl_player VALUES ("2012040","김원희","K01","KIM, WONHEE",NULL,"2012","MF","32",NULL,STR_TO_DATE("17-APR-1993","%d-%b-%Y"),"1","178","71");
INSERT INTO tbl_player VALUES ("2012041","곽기훈","K01",NULL,NULL,NULL,"FW","33",NULL,STR_TO_DATE("05-NOV-1989","%d-%b-%Y"),"1","177","72");
INSERT INTO tbl_player VALUES ("2007010","정현석","K01","JEONG, HYUNSEOK",NULL,"2011","FW","16",NULL,STR_TO_DATE("05-MAY-1977","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2011105","마르코스","K01","Marcos Antonio",NULL,"2011","FW","44","브라질",STR_TO_DATE("07-APR-1987","%d-%b-%Y"),"1","170","73");
INSERT INTO tbl_player VALUES ("2010045","최규선","K01","CHOI, GYUSUN",NULL,"2010","FW","15",NULL,STR_TO_DATE("24-SEP-1991","%d-%b-%Y"),"1","182","66");
INSERT INTO tbl_player VALUES ("2012129","알리송","K01","Alison Barros Moraes",NULL,NULL,"FW","14","브라질",STR_TO_DATE("30-JUN-1992","%d-%b-%Y"),"1","171","60");
INSERT INTO tbl_player VALUES ("2012038","김태유","K01","KIM, TAEYOO",NULL,"2012","FW","30",NULL,STR_TO_DATE("01-OCT-1989","%d-%b-%Y"),"1","175","64");
INSERT INTO tbl_player VALUES ("2012030","박성훈","K01",NULL,NULL,NULL,"FW","10",NULL,STR_TO_DATE("04-JUL-1989","%d-%b-%Y"),"1","187","83");
INSERT INTO tbl_player VALUES ("2012037","이인석","K01","LEE, INSUK",NULL,"2012","FW","27",NULL,STR_TO_DATE("07-AUG-1989","%d-%b-%Y"),"1","181","74");
INSERT INTO tbl_player VALUES ("2011104","파울링뇨","K01","Marcos Paulo Paulrini",NULL,"2011","FW","11","브라질",STR_TO_DATE("04-MAR-1987","%d-%b-%Y"),"1","174","75");
INSERT INTO tbl_player VALUES ("2012031","현영민","K01","HYUN, YOUNGMIN",NULL,"2012","FW","13",NULL,STR_TO_DATE("25-DEC-1989","%d-%b-%Y"),"1","179","73");
INSERT INTO tbl_player VALUES ("2000061","홍인기","K01","HONG, INKI",NULL,"2008","DF","35",NULL,STR_TO_DATE("15-MAR-1989","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2007114","정기동","K04",NULL,NULL,NULL,"MF","6",NULL,STR_TO_DATE("12-JAN-1981","%d-%b-%Y"),"1","171","66");
INSERT INTO tbl_player VALUES ("2010005","정기형","K04",NULL,NULL,NULL,"MF","19",NULL,STR_TO_DATE("10-JUL-1987","%d-%b-%Y"),"1","173","64");
INSERT INTO tbl_player VALUES ("2012055","정정현","K04",NULL,NULL,NULL,"MF","32",NULL,STR_TO_DATE("01-APR-1989","%d-%b-%Y"),"1","176","68");
INSERT INTO tbl_player VALUES ("2007122","정한윤","K04",NULL,NULL,NULL,"MF","14",NULL,STR_TO_DATE("11-JUL-1984","%d-%b-%Y"),"1","185","74");
INSERT INTO tbl_player VALUES ("2007137","남기일","K04",NULL,NULL,NULL,"MF","29",NULL,STR_TO_DATE("17-AUG-1984","%d-%b-%Y"),"1","177","69");
INSERT INTO tbl_player VALUES ("2012131","무스타파","K04",NULL,NULL,NULL,"MF","77",NULL,STR_TO_DATE("08-JAN-1985","%d-%b-%Y"),"1","180","73");
INSERT INTO tbl_player VALUES ("2012056","최정주","K04",NULL,NULL,NULL,"MF","33",NULL,STR_TO_DATE("26-JUN-1989","%d-%b-%Y"),"1","177","73");
INSERT INTO tbl_player VALUES ("2010004","조현호","K04",NULL,NULL,NULL,"MF","22",NULL,STR_TO_DATE("07-JUL-1987","%d-%b-%Y"),"1","183","71");
INSERT INTO tbl_player VALUES ("2007125","윤정춘","K04",NULL,NULL,NULL,"MF","17",NULL,STR_TO_DATE("18-FEB-1983","%d-%b-%Y"),"1","173","66");
INSERT INTO tbl_player VALUES ("2011103","장경호","K04",NULL,NULL,NULL,"MF","39",NULL,STR_TO_DATE("23-FEB-1993","%d-%b-%Y"),"1","174","66");
INSERT INTO tbl_player VALUES ("2008209","이문식","K04",NULL,NULL,NULL,"MF","10",NULL,STR_TO_DATE("23-OCT-1981","%d-%b-%Y"),"1","173","66");
INSERT INTO tbl_player VALUES ("2008457","곽경근","K04","GWAK, JYUNGKEUN","골든맨","2008","FW","9",NULL,STR_TO_DATE("10-OCT-1982","%d-%b-%Y"),"1","184","81");
INSERT INTO tbl_player VALUES ("2012120","다보","K04","Chelck Oumar Dabo",NULL,"2012","FW","63",NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),"1","183","76");
INSERT INTO tbl_player VALUES ("2007126","최성철","K04","CHOI, SUNGCHUL","코미디언","2007","FW","28",NULL,STR_TO_DATE("16-MAR-1985","%d-%b-%Y"),"1","190","78");
INSERT INTO tbl_player VALUES ("2007153","비탈리","K04","VITALIY",NULL,"2012","FW","24",NULL,STR_TO_DATE("04-MAY-1979","%d-%b-%Y"),"1","183","74");
INSERT INTO tbl_player VALUES ("2009026","안승인","K04","AN, SEUNGIN","안뽕","2009","FW","13",NULL,STR_TO_DATE("14-MAR-1983","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2011019","윤원철","K04",NULL,NULL,NULL,"FW","8",NULL,STR_TO_DATE("06-JAN-1989","%d-%b-%Y"),"1","184","75");
INSERT INTO tbl_player VALUES ("2009027","김성재","K04","KIM, SUNGJAE","까치,돌쇠","2009","FW","11",NULL,STR_TO_DATE("16-MAY-1986","%d-%b-%Y"),"1","178","67");
INSERT INTO tbl_player VALUES ("2007135","김원식","K04","KIM, WONSHIK","뺀, 밥식이","2006","FW","27",NULL,STR_TO_DATE("16-MAY-1983","%d-%b-%Y"),"1","172","64");
INSERT INTO tbl_player VALUES ("2012057","김종민","K04","KIM, JONGMIN",NULL,"2012","FW","34",NULL,STR_TO_DATE("01-AUG-1993","%d-%b-%Y"),"1","184","77");
INSERT INTO tbl_player VALUES ("2011020","박필석","K04","PARK, PILSUK","장신","2011","FW","18",NULL,STR_TO_DATE("23-JUL-1988","%d-%b-%Y"),"1","190","83");
INSERT INTO tbl_player VALUES ("2010084","제프유","K04","JEFF JI YOUNG",NULL,"2011","FW","16","미국",STR_TO_DATE("30-OCT-1988","%d-%b-%Y"),"1","184","76");
INSERT INTO tbl_player VALUES ("2000026","롤란","K04",NULL,NULL,"2010","FW",NULL,"리투아니아",STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"184","81");
INSERT INTO tbl_player VALUES ("2000027","셀라하틴","K04","Selahattin",NULL,"2012","FW","11","이탈리아",STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,"180","75");
INSERT INTO tbl_player VALUES ("2000031","차경복","K08",NULL,NULL,"2008","DF",NULL,NULL,STR_TO_DATE("10-JAN-1977","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000032","정학범","K08",NULL,NULL,NULL,NULL,NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,NULL,NULL);
INSERT INTO tbl_player VALUES ("2000033","안익수","K08",NULL,NULL,NULL,NULL,NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,NULL,NULL);
INSERT INTO tbl_player VALUES ("2000034","차상광","K08",NULL,NULL,NULL,NULL,NULL,NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),NULL,NULL,NULL);
INSERT INTO tbl_player VALUES ("2009045","권찬수","K08","KWON, CHANSOO",NULL,NULL,"GK","21",NULL,STR_TO_DATE("30-MAY-1984","%d-%b-%Y"),"2","183","77");
INSERT INTO tbl_player VALUES ("2012107","정경두","K08","JEONG, KYOUNGDOO",NULL,NULL,"GK","41",NULL,STR_TO_DATE(NULL,"%d-%b-%Y"),"1","194","76");
INSERT INTO tbl_player VALUES ("2007255","정해운","K08","JEONG, HAEWOON",NULL,NULL,"GK","1",NULL,STR_TO_DATE("25-DEC-1983","%d-%b-%Y"),"2","185","79");
INSERT INTO tbl_player VALUES ("2009101","양영민","K08","YANG, YOUNGMIN",NULL,NULL,"GK","31",NULL,STR_TO_DATE("19-JUL-1984","%d-%b-%Y"),"1","190","80");
INSERT INTO tbl_player VALUES ("2011087","가이모토","K08","KAIMOTO KOJIRO",NULL,NULL,"DF","3",NULL,STR_TO_DATE("14-OCT-1987","%d-%b-%Y"),"1","182","77");
INSERT INTO tbl_player VALUES ("2012108","정두영","K08","JEONG, DOYOUNG",NULL,NULL,"DF","30",NULL,STR_TO_DATE("07-OCT-1990","%d-%b-%Y"),"1","181","75");
INSERT INTO tbl_player VALUES ("2012118","정명휘","K08","JEONG, MYONGHWI",NULL,NULL,"DF","37",NULL,STR_TO_DATE("08-MAY-1991","%d-%b-%Y"),"1","185","76");
INSERT INTO tbl_player VALUES ("2007329","정영철","K08","JEONG, YOUNGCHUL",NULL,NULL,"DF","5",NULL,STR_TO_DATE("30-JUN-1986","%d-%b-%Y"),"1","183","80");
INSERT INTO tbl_player VALUES ("2007259","정정재","K08","JEONG, JUNGJAE",NULL,NULL,"DF","13",NULL,STR_TO_DATE("22-MAY-1984","%d-%b-%Y"),"2","184","80");
INSERT INTO tbl_player VALUES ("2007186","정현수","K08","JEONG, HYUNSOO",NULL,NULL,"DF","15",NULL,STR_TO_DATE("13-MAR-1983","%d-%b-%Y"),"2","186","80");
INSERT INTO tbl_player VALUES ("2007089","노태경","K08","NO, TAEKYOUNG",NULL,NULL,"DF","25",NULL,STR_TO_DATE("22-APR-1982","%d-%b-%Y"),"1","175","68");
INSERT INTO tbl_player VALUES ("2009098","문삼진","K08","MOON, SAMJIN",NULL,NULL,"DF","2",NULL,STR_TO_DATE("03-MAR-1983","%d-%b-%Y"),"1","173","68");
INSERT INTO tbl_player VALUES ("2012111","민경인","K08","MIN, KYUNGIN",NULL,NULL,"DF","12",NULL,STR_TO_DATE("09-MAY-1989","%d-%b-%Y"),"1","177","71");
INSERT INTO tbl_player VALUES ("2011091","최종남","K08","CHOI, JONGNAM",NULL,NULL,"DF","34",NULL,STR_TO_DATE("17-NOV-1986","%d-%b-%Y"),"1","182","76");
INSERT INTO tbl_player VALUES ("2007055","최충균","K08","CHOI, CHOONGKYUN",NULL,NULL,"DF","20",NULL,STR_TO_DATE("20-JUN-1983","%d-%b-%Y"),"1","184","70");
INSERT INTO tbl_player VALUES ("2010034","배진수","K08","BAE, JINSOO",NULL,NULL,"DF","38",NULL,STR_TO_DATE("25-JAN-1986","%d-%b-%Y"),"1","178","72");
INSERT INTO tbl_player VALUES ("2008471","김영진","K08","KIM, YOUNGJIN",NULL,NULL,"DF","23",NULL,STR_TO_DATE("27-MAR-1982","%d-%b-%Y"),"2","180","75");
INSERT INTO tbl_player VALUES ("2008399","임규식","K08","LIM, KYUSIK",NULL,NULL,"DF","27",NULL,STR_TO_DATE("09-MAY-1985","%d-%b-%Y"),"1","182","75");
INSERT INTO tbl_player VALUES ("2012106","곽치국","K08","KWAK, CHIGOOG",NULL,NULL,"MF","32",NULL,STR_TO_DATE("22-APR-1989","%d-%b-%Y"),"1","170","68");
INSERT INTO tbl_player VALUES ("2009095","정상식","K08","JEONG, SANGSIK",NULL,NULL,"MF","4",NULL,STR_TO_DATE("17-DEC-1986","%d-%b-%Y"),"1","184","71");
INSERT INTO tbl_player VALUES ("2011086","정용희","K08","JEONG, YONGHEE",NULL,NULL,"MF","18",NULL,STR_TO_DATE("15-OCT-1988","%d-%b-%Y"),"1","178","70");
INSERT INTO tbl_player VALUES ("2012109","노규영","K08",NULL,NULL,NULL,"MF","33",NULL,STR_TO_DATE("29-APR-1988","%d-%b-%Y"),"1","180","83");
INSERT INTO tbl_player VALUES ("2010126","최강조","K08","CHOI, KANGJO",NULL,NULL,"MF","6",NULL,STR_TO_DATE("24-JAN-1990","%d-%b-%Y"),"1","165","57");
INSERT INTO tbl_player VALUES ("2008171","최남열","K08","CHOI, NAMRYUL",NULL,NULL,"MF","8",NULL,STR_TO_DATE("07-MAY-1980","%d-%b-%Y"),"2","178","70");
INSERT INTO tbl_player VALUES ("2011088","백영철","K08","BAEK, YOUNGCHUL",NULL,NULL,"MF","22",NULL,STR_TO_DATE("11-NOV-1988","%d-%b-%Y"),"1","177","71");
INSERT INTO tbl_player VALUES ("2007242","조태용","K08","CHO, TAEYONG",NULL,NULL,"MF","7",NULL,STR_TO_DATE("11-OCT-1980","%d-%b-%Y"),"1","174","67");
INSERT INTO tbl_player VALUES ("2012117","올리베","K08","Alcir de Oliveira fonseca",NULL,NULL,"MF","29","브라질",STR_TO_DATE("14-NOV-1987","%d-%b-%Y"),"1","175","73");
INSERT INTO tbl_player VALUES ("2011128","김리네","K08","Ricardo Irineu",NULL,NULL,"MF","26","브라질",STR_TO_DATE("12-JUL-1987","%d-%b-%Y"),"1","172","69");
INSERT INTO tbl_player VALUES ("2012128","쟈스민","K08","Jasmin Mujidza",NULL,NULL,"MF","33","크로아티아",STR_TO_DATE("02-MAR-1984","%d-%b-%Y"),"1","180","78");
INSERT INTO tbl_player VALUES ("2012114","전재호","K08","CHUN, JAEHO",NULL,NULL,"MF","14",NULL,STR_TO_DATE("08-AUG-1989","%d-%b-%Y"),"1","168","64");
INSERT INTO tbl_player VALUES ("2008131","김진호","K08","KIM, JINHO",NULL,NULL,"MF","11",NULL,STR_TO_DATE("02-AUG-1983","%d-%b-%Y"),"1","174","68");
INSERT INTO tbl_player VALUES ("2012115","이낙훈","K08","LEE, NAKHOON",NULL,NULL,"MF","35",NULL,STR_TO_DATE("28-DEC-1989","%d-%b-%Y"),"1","172","62");
INSERT INTO tbl_player VALUES ("2007100","홍도표","K08","HONG, DOPYO",NULL,NULL,"MF","9",NULL,STR_TO_DATE("24-JUL-1983","%d-%b-%Y"),"1","173","66");
INSERT INTO tbl_player VALUES ("2010127","정대의","K08","JEONG, DAEEUI",NULL,NULL,"FW","19",NULL,STR_TO_DATE("30-MAY-1987","%d-%b-%Y"),"1","174","70");
INSERT INTO tbl_player VALUES ("2009084","정우재","K08","JEONG, WOOJAE",NULL,NULL,"FW","24",NULL,STR_TO_DATE("13-SEP-1986","%d-%b-%Y"),"1","173","71");
INSERT INTO tbl_player VALUES ("2007192","샤샤","K08","Drakulic sasa",NULL,NULL,"FW","10",NULL,STR_TO_DATE("28-AUG-1982","%d-%b-%Y"),"1","190","84");
INSERT INTO tbl_player VALUES ("2012112","서관수","K08","SEO, KWANSOO",NULL,NULL,"FW","17",NULL,STR_TO_DATE("25-FEB-1990","%d-%b-%Y"),"1","179","74");
INSERT INTO tbl_player VALUES ("2011095","김성운","K08","KIM, SUNGWOON",NULL,NULL,"FW","40",NULL,STR_TO_DATE("25-DEC-1988","%d-%b-%Y"),"1","173","64");
INSERT INTO tbl_player VALUES ("2012113","김정운","K08","KIM, JUNGWOON",NULL,NULL,"FW","28",NULL,STR_TO_DATE("14-MAR-1993","%d-%b-%Y"),"1","170","68");
INSERT INTO tbl_player VALUES ("2011094","장동현","K08","JANG, DONGHYUN",NULL,NULL,"FW","39",NULL,STR_TO_DATE("19-MAR-1992","%d-%b-%Y"),"1","178","67");
INSERT INTO tbl_player VALUES ("2007250","황연석","K08","HWANG, YOUNSUCK",NULL,NULL,"FW","16",NULL,STR_TO_DATE("17-OCT-1983","%d-%b-%Y"),"1","192","81");
INSERT INTO tbl_player VALUES ("2000041","정호","K02","JEONG, HO",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("24-NOV-1974","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000042","왕선재","K02","WANG, SUNJAE",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("16-MAR-1979","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000043","코샤","K02","Marco Antonio Alvarez Ferreira",NULL,NULL,"DF",NULL,"브라질",STR_TO_DATE("20-JUL-1970","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2000044","윤성효","K02","YOON, SUNGHYO",NULL,NULL,"DF",NULL,NULL,STR_TO_DATE("18-MAY-1972","%d-%b-%Y"),"1",NULL,NULL);
INSERT INTO tbl_player VALUES ("2007067","정광수","K02","JEONG, GWANGSOO",NULL,NULL,"GK","41",NULL,STR_TO_DATE("10-MAR-1987","%d-%b-%Y"),"1","182","79");
INSERT INTO tbl_player VALUES ("2009004","최호진","K02","CHOI, HOJIN",NULL,NULL,"GK","31",NULL,STR_TO_DATE("22-OCT-1986","%d-%b-%Y"),"1","190","82");
INSERT INTO tbl_player VALUES ("2007203","조범철","K02","CHO, BUMCHUL",NULL,NULL,"GK","21",NULL,STR_TO_DATE("27-SEP-1980","%d-%b-%Y"),"2","185","85");
INSERT INTO tbl_player VALUES ("2007035","김운재","K02","KIM, WOONJAE",NULL,NULL,"GK","1",NULL,STR_TO_DATE("26-APR-1983","%d-%b-%Y"),"1","182","82");
INSERT INTO tbl_player VALUES ("2008429","정영선","K02","JEONG, YOUNGSUN",NULL,NULL,"DF","16",NULL,STR_TO_DATE("03-APR-1985","%d-%b-%Y"),"1","184","81");
INSERT INTO tbl_player VALUES ("2012021","정유진","K02","JEONG, YOUJIN",NULL,NULL,"DF","37",NULL,STR_TO_DATE("19-JUN-1993","%d-%b-%Y"),"1","188","76");
INSERT INTO tbl_player VALUES ("2011073","손승준","K02","SON, SEUNGJUN",NULL,NULL,"DF","32",NULL,STR_TO_DATE("16-MAY-1992","%d-%b-%Y"),"1","186","72");
INSERT INTO tbl_player VALUES ("2007007","조홍기","K02","CHO, HONGGI",NULL,NULL,"DF","15",NULL,STR_TO_DATE("04-MAY-1978","%d-%b-%Y"),"1","175","66");
INSERT INTO tbl_player VALUES ("2012027","안동원","K02","AN, DONGWON",NULL,NULL,"DF","49",NULL,STR_TO_DATE("27-SEP-1992","%d-%b-%Y"),"1","184","78");
INSERT INTO tbl_player VALUES ("2012024","김강진","K02","KIM, KANGJIN",NULL,NULL,"DF","43",NULL,STR_TO_DATE("25-APR-1996","%d-%b-%Y"),"1","181","65");
INSERT INTO tbl_player VALUES ("2007036","김병근","K02","KIM, BYOUNGKEUN",NULL,NULL,"DF","3",NULL,STR_TO_DATE("28-APR-1983","%d-%b-%Y"),"1","175","63");
INSERT INTO tbl_player VALUES ("2012026","김태권","K02","KIM, TAE-KWON",NULL,NULL,"DF","46",NULL,STR_TO_DATE("14-JUL-1990","%d-%b-%Y"),"1","180","75");
INSERT INTO tbl_player VALUES ("2012014","김병국","K02","KIM, BYUNGKOOK",NULL,NULL,"DF","2",NULL,STR_TO_DATE("01-JUL-1991","%d-%b-%Y"),"1","183","78");
INSERT INTO tbl_player VALUES ("2011075","김성환","K02","KIM, SUNGHWAN",NULL,NULL,"DF","5",NULL,STR_TO_DATE("09-APR-1992","%d-%b-%Y"),"1","183","75");
INSERT INTO tbl_player VALUES ("2012123","가비","K02","Gabriel Popescu",NULL,NULL,"MF","10","루마니아",STR_TO_DATE("25-DEC-1983","%d-%b-%Y"),"1","177","74");
INSERT INTO tbl_player VALUES ("2010089","강대희","K02",NULL,NULL,NULL,"MF","26",NULL,STR_TO_DATE("02-FEB-1987","%d-%b-%Y"),"1","174","65");
INSERT INTO tbl_player VALUES ("2007051","고종수","K02","KO, JONGSU",NULL,NULL,"MF","22",NULL,STR_TO_DATE("30-OCT-1988","%d-%b-%Y"),"1","176","70");
INSERT INTO tbl_player VALUES ("2012015","고창현","K02","KO, CHANGHYUN",NULL,NULL,"MF","8",NULL,STR_TO_DATE("15-SEP-1993","%d-%b-%Y"),"1","170","64");
INSERT INTO tbl_player VALUES ("2009089","정기범","K02","JEONG, KIBUM",NULL,NULL,"MF","28",NULL,STR_TO_DATE("14-AUG-1986","%d-%b-%Y"),"1","173","65");
INSERT INTO tbl_player VALUES ("2009083","정동현","K02","JEONG, DONGHYUN",NULL,NULL,"MF","25",NULL,STR_TO_DATE("17-AUG-1990","%d-%b-%Y"),"1","175","72");
INSERT INTO tbl_player VALUES ("2011071","정두현","K02","JEONG, DOOHYUN",NULL,NULL,"MF","4",NULL,STR_TO_DATE("14-JUL-1992","%d-%b-%Y"),"1","175","67");
INSERT INTO tbl_player VALUES ("2012025","정준","K02","JEONG, JUN",NULL,NULL,"MF","44",NULL,STR_TO_DATE("09-DEC-1996","%d-%b-%Y"),"1","170","65");
INSERT INTO tbl_player VALUES ("2007040","정진우","K02","JEONG, JINWOO",NULL,NULL,"DF","7",NULL,STR_TO_DATE("09-OCT-1985","%d-%b-%Y"),"1","179","72");
INSERT INTO tbl_player VALUES ("2007069","데니스","K02","Laktionov Denis",NULL,NULL,"FW","11","러시아",STR_TO_DATE("04-SEP-1987","%d-%b-%Y"),"1","176","71");
INSERT INTO tbl_player VALUES ("2007274","서정원","K02","SEO, JUNGWON",NULL,NULL,"FW","14",NULL,STR_TO_DATE("17-DEC-1980","%d-%b-%Y"),"1","173","66");
INSERT INTO tbl_player VALUES ("2012016","손대호","K02","SON, DAEHO",NULL,NULL,"DF","17",NULL,STR_TO_DATE("11-SEP-1991","%d-%b-%Y"),"1","186","79");
INSERT INTO tbl_player VALUES ("2011070","오규찬","K02","OH, GUCHAN",NULL,NULL,"MF","24",NULL,STR_TO_DATE("28-AUG-1992","%d-%b-%Y"),"1","178","71");
INSERT INTO tbl_player VALUES ("2012135","윤원일","K02",NULL,NULL,NULL,"MF","45",NULL,STR_TO_DATE("31-MAR-1993","%d-%b-%Y"),"1","176","70");
INSERT INTO tbl_player VALUES ("2009131","김동욱","K02","KIM, DONGWOOK",NULL,NULL,"MF","40",NULL,STR_TO_DATE("10-APR-1986","%d-%b-%Y"),"1","176","68");
INSERT INTO tbl_player VALUES ("2010901","장성철","K11",NULL,NULL,NULL,"MF","27",NULL,STR_TO_DATE("09-MAR-1991","%d-%b-%Y"),"1","176","75");
INSERT INTO tbl_player VALUES ("2010902","장윤정","K11",NULL,NULL,NULL,"DF","17",NULL,STR_TO_DATE("14-MAR-1993","%d-%b-%Y"),"1","173","63");
INSERT INTO tbl_player VALUES ("2010903","장서연","K11",NULL,NULL,NULL,"FW","07",NULL,STR_TO_DATE("29-JAN-1995","%d-%b-%Y"),"1","180","60");
INSERT INTO tbl_player VALUES ("2009901","고규억","K12",NULL,NULL,NULL,"DF","29",NULL,STR_TO_DATE("14-AUG-1994","%d-%b-%Y"),"1","175","70");
INSERT INTO tbl_player VALUES ("2009902","장재우","K12",NULL,NULL,NULL,"FW","12",NULL,STR_TO_DATE("28-FEB-1987","%d-%b-%Y"),"1","172","63");
INSERT INTO tbl_player VALUES ("2008901","오재진","K13",NULL,NULL,NULL,"DF","49",NULL,STR_TO_DATE("23-JUL-1992","%d-%b-%Y"),"1","173","72");
INSERT INTO tbl_player VALUES ("2008902","선원길","K13",NULL,NULL,NULL,"GK","46",NULL,STR_TO_DATE("26-APR-1996","%d-%b-%Y"),"1","174","66");
INSERT INTO tbl_player VALUES ("2008903","안소정","K13",NULL,NULL,NULL,"FW","38",NULL,STR_TO_DATE("24-OCT-1997","%d-%b-%Y"),"1","174","63");
INSERT INTO tbl_player VALUES ("2007901","주시형","K14",NULL,NULL,NULL,"DF","33",NULL,STR_TO_DATE("11-NOV-1992","%d-%b-%Y"),"1","170","72");
INSERT INTO tbl_player VALUES ("2007902","홍종하","K14",NULL,NULL,NULL,"MF","32",NULL,STR_TO_DATE("21-DEC-1988","%d-%b-%Y"),"1","169","74");
INSERT INTO tbl_player VALUES ("2010801","오춘식","K15",NULL,NULL,NULL,"MF","22",NULL,STR_TO_DATE("08-MAR-1988","%d-%b-%Y"),"1","168","75");
INSERT INTO tbl_player VALUES ("2010802","박창우","K15",NULL,NULL,NULL,"DF","13",NULL,STR_TO_DATE("17-MAY-1989","%d-%b-%Y"),"1","177","68");
INSERT INTO tbl_player VALUES ("2010803","박진하","K15",NULL,NULL,NULL,"FW","11",NULL,STR_TO_DATE("09-JAN-1989","%d-%b-%Y"),"1","181","62");

############################## 문제 ##############################

# 1. 선수 테이블에서 "K02", "K05" 팀에 해당하는 선수들의 이름과 포지션을 조회하세요.
#    position이 "DF"이면 "수비수", "MF"이면 "미드필더", "FW"이면 "공격수", "GK"이면 "골키퍼"를 조회하세요. (CASE WHEN 활용)
/*
    선수이름  포지션
    -----------------
    정호      수비수
    왕선재    수비수
    코샤      수비수
    윤성효    수비수
    조홍기    수비수
    ...
    -----------------
    조회되는 순서는 다를 수 있습니다.
    100개의 행이 조회됩니다.
*/
SELECT player_name AS "선수이름",
    CASE 
        WHEN position = "DF" THEN "수비수"
        WHEN position = "MF" THEN "미드필더"
        WHEN position = "FW" THEN "공격수"
        WHEN position = "GK" THEN "골키퍼"
    END AS "포지션"
  FROM tbl_player
 WHERE team_id IN ("K02", "K05");

# 2. 선수 테이블에서 모든 선수들의 이름과 국적을 조회하세요. 국적의 내림차순으로 조회하세요.
#    국적이 없는 선수들은 "대한민국"이 국적입니다.
/*
    선수이름  국적
    --------------------
    쟈스민    크로아티아
    하리      콜롬비아
    우르모브  유고
    콜리      세네갈
    ...
    정상수    대한민국
    ...
    -------------------
    480개의 행이 조회됩니다.
*/
SELECT player_name AS "선수이름"
     , IFNULL(nation, "대한민국") AS "국적"
  FROM tbl_player
 ORDER BY nation DESC;

# 3. 선수 테이블에서 모든 선수들의 국적을 중복 없이 조회하세요. 
#    해당 국적을 가진 선수가 몇 명인지 함께 조회하세요. 국적이 없으면 조회하지 않습니다.
/*
    국적        선수
    -----------------
    나이지리아  1
    리투아니아  1
    이탈리아    1
    브라질      16
    ...
    -----------------
    조회되는 순서는 다를 수 있습니다.
    12개의 행이 조회됩니다.
*/
SELECT nation AS "국적"
     , COUNT(*) AS "선수"
  FROM tbl_player
 WHERE nation IS NOT NULL
 GROUP BY nation;

# 4. 팀 테이블에서 각 팀의 팀 ID와 우편번호와 연락처를 조회하세요.
#    우편번호 두 개는 하이픈("-")으로 연결하고, 연락처는 지역번호와 연락처를 괄호("()")로 연결하여 조회하세요.
/*
    팀ID  우편번호  연락처
    ------------------------------
    K01   682-060   (052)230-6145
    K02   440-220   (031)247-2002
    K03   790-050   (054)282-2002
    K04   110-728   (032)2121-5271
    ...
    ------------------------------
    조회되는 순서는 다를 수 있습니다.
    15개의 행이 조회됩니다.
*/
SELECT team_id AS "팀ID"
     , CONCAT_WS("-", zip_code1, zip_code2) AS "우편번호"
     , CONCAT("(", ddd, ")", tel) AS "연락처"
  FROM tbl_team;

# 5. 선수 테이블을 활용하여 전체 인원수, 키 등록 인원수, 키 미등록 인원수, 최대키, 최소키, 평균키(소수 2자리 반올림)를 조회하세요.
/*
    전체인원  키 등록  키 미등록  최대키  최소키  평균키
    ----------------------------------------------------
    480       447      33         196     165     179.31
    ----------------------------------------------------
*/
SELECT COUNT(*) AS "전체인원" 
     , COUNT(height) AS "키 등록"
     , COUNT(*) - COUNT(height) AS "키 미등록"
     , MAX(height) AS "최대키"
     , MIN(height) AS "최소키"
     , ROUND(AVG(height), 2) AS "평균키"
  FROM tbl_player;

# 6. 선수 테이블을 활용하여 각 팀 별 인원수를 조회하세요. 인원수의 내림차순으로 정렬하세요.
/*
    팀ID  인원수
    -------------
    K05   51
    K07   51
    K02   49
    K03   49
    K09   49
    ...
    ------------
    15개의 행이 조회됩니다.
*/
SELECT team_id AS "팀ID"
     , COUNT(*) AS "인원수"
  FROM tbl_player
 GROUP BY team_id
 ORDER BY 인원수 DESC;  -- ORDER BY 2 DESC; 도 가능합니다. (2열을 이용해 내림차순)

# 7. 선수 테이블과 팀 테이블을 활용하여 각 선수의 이름과 소속팀 이름을 조회하세요.
/*
   선수명   소속팀명
   ---------------------
   홍인기   울산현대
   제형진   울산현대
   곽기훈   울산현대
   최민영   울산현대
   ...
   ---------------------
   조회되는 순서는 다를 수 있습니다.
   480개의 행이 조회됩니다.
*/
# 조인 조건 활용
SELECT player_name AS "선수명"
     , team_name AS "소속팀명"
  FROM tbl_player p
 INNER JOIN tbl_team t
    ON p.team_id = t.team_id;
# USING 활용
SELECT player_name AS "선수명"
     , team_name AS "소속팀명"
  FROM tbl_player
 INNER JOIN tbl_team USING(team_id);

# 8. 선수, 팀, 경기장 테이블을 활용하여 선수명, 포지션, 국적, 소속팀, 홈경기장을 조회하세요.
/*
    선수명  포지션  국적      소속팀    홈경기장 
    ---------------------------------------------------
    홍인기  DF      (null)    울산현대  울산문수경기장
    제형진  DF      (null)    울산현대  울산문수경기장
    곽기훈  FW      (null)    울산현대  울산문수경기장
    최민영  FW      (null)    울산현대  울산문수경기장
    ...
    ---------------------------------------------------
    조회되는 순서는 다를 수 있습니다.
    480개의 행이 조회됩니다.
*/
# 조인 조건 활용
SELECT player_name AS "선수명"
     , position AS "포지션"
     , nation AS "국적"
     , team_name AS "소속팀"
     , stadium_name AS "홈경기장"
  FROM tbl_player p
 INNER JOIN tbl_team t ON p.team_id = t.team_id
 INNER JOIN tbl_stadium s ON t.stadium_id = s.stadium_id;
# USING 활용
SELECT player_name AS "선수명"
     , position AS "포지션"
     , nation AS "국적"
     , team_name AS "소속팀"
     , stadium_name AS "홈경기장"
  FROM tbl_player
 INNER JOIN tbl_team USING(team_id)
 INNER JOIN tbl_stadium USING(stadium_id);

# 9. 팀, 경기장 테이블을 활용하여 각 팀의 이름과 경기장ID, 경기장을 조회하세요.
#    경기장ID가 존재하는 팀만 조회하고 경기장의 오름차순 정렬으로 조회하세요.
/*
    팀명      경기장ID  경기장
    -------------------------------------
    강원FC    A03       강릉종합경기장
    드래곤즈  D01       광양전용경기장
    광주상무  A02       광주월드컵경기장
    대구FC    A05       대구월드컵경기장
    ...
    -------------------------------------
    15개의 행이 조회됩니다.
*/
# 조인 조건 활용
SELECT team_name AS "팀명"
     , s.stadium_id AS "경기장ID"
     , stadium_name AS "경기장명"
  FROM tbl_team t
 INNER JOIN tbl_stadium s ON t.stadium_id = s.stadium_id
 ORDER BY stadium_name ASC;
# USING 활용
SELECT team_name AS "팀명"
     , stadium_id AS "경기장ID"
     , stadium_name AS "경기장명"
  FROM tbl_team
 INNER JOIN tbl_stadium USING (stadium_id)
 ORDER BY stadium_name ASC;

# 10. 선수 테이블을 활용하여 키가 전체 키 평균 이상인 선수들을 조회하세요.
#     선수명, 포지션, 등번호를 선수명의 오름차순으로 조회하세요.
/*
    선수명     포지션  등번호
    --------------------------
    가이모토   DF      3
    강성일     GK      30
    고관영     MF      32
    고병운     DF      16
    ...
    ---------------------------
    219개의 행이 조회됩니다.
*/
SELECT player_name AS "선수명"
     , position AS "포지션"
     , back_no AS "등번호"
  FROM tbl_player
 WHERE height >= (SELECT AVG(height)
                    FROM tbl_player)
 ORDER BY player_name ASC;

# 11. "정현수"라는 이름을 가진 선수(동명이인)가 속한 팀의 한글 명칭과 영문 명칭, 소속 지역을 조회하세요.
/*
    한글 명칭  영문 명칭                 소속 지역
    ------------------------------------------------
    드래곤즈   CHUNNAM DRAGONS FC        전남
    일화천마   SEONGNAM ILHWA CHUNMA FC  성남
    ------------------------------------------------
*/
SELECT team_name AS "한글 명칭"
     , e_team_name AS "영문 명칭"
     , region_name AS "소속 지역"
  FROM tbl_team
 WHERE team_id IN (SELECT team_id 
                     FROM tbl_player
                    WHERE player_name = "정현수")
 ORDER BY team_name;

# 12. 경기일정에 기록된 정보들 중 HOME팀과 AWAY팀의 합산 점수가 가장 높은 경기의 정보를 조회하세요.
#     경기일자와 경기장, HOME팀, AWAY팀 그리고 각 팀이 기록한 골의 점수를 조회하세요.
/*
    경기일자  경기장          HOME팀    HOME팀점수  AWAY팀    AWAY팀점수
    --------------------------------------------------------------------------
    20120824  성남종합운동장  일화천마  4           아이파크  3
    20120427  창원종합운동장  경남FC    5           아이파크  2
    --------------------------------------------------------------------------
*/
SELECT schedule_dt AS "경기일자"
      , stadium_name AS "경기장"
      , home.team_name AS "HOME팀"
      , home_score AS "HOME팀점수"
      , away.team_name AS "AWAY팀"
      , away_score AS "AWAY팀점수"
  FROM tbl_schedule sc
 INNER JOIN tbl_stadium st ON sc.stadium_id = st.stadium_id
 INNER JOIN tbl_team home ON sc.hometeam_id = home.team_id
 INNER JOIN tbl_team away ON sc.awayteam_id = away.team_id
 WHERE (home_score + away_score) = (SELECT MAX(home_score + away_score)
                                       FROM tbl_schedule);