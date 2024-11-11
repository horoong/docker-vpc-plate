# docker-vpc-plate
--- 
### docker plate for vpc with SSH tunneling 

#### 기본구조 기반으로 RDS를 프로젝트 database로 사용하기 위한 초기 docker 설정

##### 연결구조
```
local -> SSH tunnel -> EC2 -> RDS(private)
   |        |           |          |
 3306     docker     퍼블릭 IP  RDS 엔드포인트(private)
 ```


##### 필수 요건
* EC2: public subnet
* RDS: private subnet
* SSH tunneling

* EC2 보안그룹 - SSH 엑세스 허용(22포트)

* RDS 보안그룹 설정 - MySQL/Aurora(3306)

##### 기본 구조

```
.
├── .env
├── .gitignore
├── README.md
├── docker-compose.yml
└── ssh
    └── key.pem
```




##### clone 후 필수 변경사항
* `docker-compose.yml`내부의 key.pem을 개인 .pem 파일 이름으로 변경할 것


##### 실행
```
# docker container 시작
docker compose up -d 

# 로그 확인
docker compose logs -f mysql-tunnel
```

* docker desktop의 버전에 따라 `docker-compose`일 수 있음

##### RDS 연결(MySQL Workbench)
```
connection name: your connection name
connection method: Standard TCP/IP
Hostname: 127.0.0.1
Port: 3306
Username: your RDS name(AWS RDS)
Password: your RDS password(AWS RDS)
```

##### 🚨주의사항
* .pem 파일 공유 금지
* .env 공유금지


