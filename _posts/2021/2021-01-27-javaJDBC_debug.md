---
layout: post
title: Oracle JDBC DAO debug
categories: debug
author: boki
tags: java JAVA JDBC debug error commit
comments: true
sitemap:
  changefreq: daily
  priority: 1.0
---

# Oracle JDBC DAO debug

## DB insert 안됨...

### 1. 개요

자바랑 DB랑 연동해서 처리해보다가 진짜 죽어도 안되서 이곳저곳 찾다가도 안되서 4시간 벙쪄있다가 해결책을 찾았다
![image](https://user-images.githubusercontent.com/39071798/105951133-ece7ee00-60b2-11eb-8908-fca663d933dd.png)
문제가 있는 코드같은가..?
휴... 사실 하나 추가한게 있다면 28번째 줄에 conn.commit(); 이 부분이다.

### 2. How To

![image](https://user-images.githubusercontent.com/39071798/105951447-5e27a100-60b3-11eb-9695-c4415c6411c6.png)
사실 추가로 SQL develop를 켜서 DB에 데이터가 잘 들어갔나 테스트를 하고 있었는데 문제는 여기에 있었다. SELECT를 제외한 나머지 INSERT, DELETE, UPDATE는 무엇을 필요로 하는지 아는가?
바로 commit이다.
![image](https://user-images.githubusercontent.com/39071798/105951526-88795e80-60b3-11eb-85da-2d9ed37da382.png)
작업을 할때 F11을 눌러서 커밋이나 혹은 롤백을 시켜주는 습관을 들이자.
혹은 다른 방법으로 autocommit을 on시켜주는 방법이 있는데,
![image](https://user-images.githubusercontent.com/39071798/105951619-b363b280-60b3-11eb-9bec-55a9529d6010.png)
이런 방식으로 사용이 가능하다. 혼자 mock데이터(가짜 데이터) 혹은 서비스하지 않고 local에서 개발하는단계라면 모를까 실 서비스하는 데이터를 갖고 autocommit을 켜두기에는 위험부담이 클거같다. commit이나 rollback을 습관화하거나 autocimmit을 하는 습관을 갖자!
추가로 JAVA에서도 conn.commit();코드를 작성해두는 것이 좋을 것 같다.
