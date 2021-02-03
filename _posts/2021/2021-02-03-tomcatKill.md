---
layout: post
title: tomcat
categories: debug
author: boki
tags: tomcat port IDE
comments: true
sitemap:
  changefreq: daily
  priority: 1.0
---

# 톰캣 실행에러 쉽게 처리하자!(feat. 내가만든 프로그램...)

![image](https://user-images.githubusercontent.com/39071798/106701330-d0573300-6629-11eb-810e-4b100bcd0995.png)

![image](https://user-images.githubusercontent.com/39071798/106701352-da793180-6629-11eb-8d38-5f0e225a0b00.png)

## 이클립스 또는 스프링으로 톰캣을 돌리다 보면 이런 에러를 가끔 마주하곤 한다.

1. Starting Tomcat v 8.5 Server at localhost ...
2. Port 8080 is already in use ...

### ※ 나는 포트를 web.xml에서 변경해주는 식의 포스팅은 아니다

논외로 오라클을 먼저 설치하고 톰캣을 설치한 경우에는 포트번호가 충돌하기때문에 web.xml에서 포트번호를 바꿔야 한다. 하지만 여기에서는 이 내용을 다루지 않는다.

## 분명히 사용하던 IDE(이클립스, 인텔리J 등등)을 다 껐는데도 톰캣을 실행하면 오류가 난다. 이런 경우는 실행되고 있는 톰캣을 직접 꺼줘야한다.

뭐 cmd창을 열고 netstat에 등등..뭐 말이 많지만... 나는 방법론적인거보다 결과를 툭 던져드리겠다.
계속 이 오류를 마주칠 때마다 netstat ano find ~ 언제치고있을것인가..?
직접 만든 windows10 Batch(실행)파일을 첨부한다.

유튜브

[![유튜브](https://img.youtube.com/vi/mT1RFsL7cZ0/0.jpg)](https://youtu.be/mT1RFsL7cZ0)

파일

https://drive.google.com/file/d/1jBel3k-H3CFjl4PC3z07Q1XcF4kcHN6H/view?usp=sharing

![image](https://user-images.githubusercontent.com/39071798/106702441-b61e5480-662b-11eb-9cba-59e92c636415.png)

1. 실행 화면이다 출력된 그대로 '80'이 붙은 실행 중인 포트들을 출력한다. 나는 톰캣을 켜놓지 않은 상태라 없다.
   ![image](https://user-images.githubusercontent.com/39071798/106702492-ca625180-662b-11eb-85a6-4e7a9e0cff5a.png)
2. 기본포트인 8080 그대로 사용중이고, 종료하고 싶다면 그냥 엔터를 치면 된다.
   ![image](https://user-images.githubusercontent.com/39071798/106702517-d51ce680-662b-11eb-8049-98728989cb09.png)
   2-1. 다른 포트로 변경했다면(Ex: 나는 오라클이랑 충돌나서 8090포트로 변경했다) 다음줄에 포트번호를 입력한다.
   ![image](https://user-images.githubusercontent.com/39071798/106702552-e0701200-662b-11eb-9773-a3cfc0f42ad4.png)
3. 2초뒤 그 포트를 가진 프로세스를 죽인다
   ![image](https://user-images.githubusercontent.com/39071798/106702587-eebe2e00-662b-11eb-9cd5-ccbbc4af8925.png)
4. 결과화면을 보면 성공or오류 표시가 뜨지 않은 것을 볼수있다. 이 경우 실행중인 프로세스를 종료한 것이 아니기 때문이다.

## 실제 테스트

![image](https://user-images.githubusercontent.com/39071798/106702668-1a411880-662c-11eb-8c18-9971f4e14d96.png)

1. 톰캣이 설치된 곳으로가서 bin 폴더에서 startup 파일을 실행시켜준다.
   ![image](https://user-images.githubusercontent.com/39071798/106702721-32189c80-662c-11eb-9638-edfb5fd8d12f.png)
2. 한글이깨지는건 무시...) 하고 잘 동작중인것을 알 수 있다.
   ![image](https://user-images.githubusercontent.com/39071798/106702862-69874900-662c-11eb-895f-2a1914279a06.png)

![image](https://user-images.githubusercontent.com/39071798/106702819-5b392d00-662c-11eb-9637-7b632561b044.png)

3. 톰캣 kill 배치파일을 실행시켜서 8090포트(나의경우)가 실행중인 것을 확인 후 8090을 입력해주자
   ![image](https://user-images.githubusercontent.com/39071798/106702909-80c63680-662c-11eb-9fe8-6b5b0eec768e.png)
4. 뒤에 떠있던 프로세스가 죽고 성공과 오류 메세지를 볼 수 있다. 오류메세지는 반복문으로 돌리느라 표시된 것이니 걱정말자!

## 결론

그냥 내가 만든거 쓰자. 혹시나 불안하면 배치파일 까보면 된다 별거없다 ㅎㅎ
색깔 바뀌는건 귀엽게 추가해봤다. 많이 사용해주신다면 감사하겠다!!!
https://drive.google.com/file/d/1jBel3k-H3CFjl4PC3z07Q1XcF4kcHN6H/view?usp=sharing
