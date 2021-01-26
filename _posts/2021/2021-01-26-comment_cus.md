---
layout: post
title: IntelliJ(+WebStorm) 주석 커스터마이징
categories: IDE
author: boki
tags: IDE intelliJ WebStorm
comments: true
sitemap:
  changefreq: daily
  priority: 1.0
---

# IntelliJ(+WebStorm) 주석 커스터마이징

## IntelliJ, WebStorm comment customizing

### 1. 개요

알고리즘으로는 파이참(파이썬), Node.js로는 vscode, 스프링으로는 인텔리J, 그리고 리액트로는 이번에 최근에 웹스톰을 쓰게되었다. (C로는 Visual Studio..)
![image](https://user-images.githubusercontent.com/39071798/105783444-d90c9100-5fb9-11eb-973f-7d23c781e99a.png)
파이썬을 보면 주석이 """ """와 # 두가지가 있는 것을 볼 수가 있다.
나는 주석이 언어자체에만 있는건줄 알았다. C언어를 배울때 //와 /\* \*/를 배웠고, HTML을 배울때는 <!-- --> 를 배웠으니 말이다.
하지만 코드 작성시, 동작은 하지 않지만, 이 코드를 메모로, 혹은 버그로, 혹은 기타 등등으로 표시하고 싶을때가 있다. 표시는 할 수 있지만 에디터에서 눈에 띄지 않는 회색으로 처리되는게 싫었다.

### 2. How To

이번에 리액트를 공부하면서 JetBrains사의 WebStorm IDE를 쓰게 되었는데, 주석을 커스터마이징 할 수 있다는 것을 알았다
(+기타 JetBrains의 모든 IDE가능<Ex: intelliJ>)

결과화면
![image](https://user-images.githubusercontent.com/39071798/105783605-3c96be80-5fba-11eb-92ce-4bc83ff5f875.png)

File-Settings를 들어가준다. 윈도우 기준 단축키는 Ctrl+Alt+S이다.
![image](https://user-images.githubusercontent.com/39071798/105783716-81baf080-5fba-11eb-9ba6-cac43d6f1a87.png)
todo를 쳐서 검색해준 후 밑에 +를 눌러 하나씩 추가해준다.
![image](https://user-images.githubusercontent.com/39071798/105783861-dcece300-5fba-11eb-835d-101ffb4ad67c.png)
위에보면 원래 있던 // todo와 // fixme를 볼 수 있을 것이다.참고로 이건 이클립스에도 있다.
![image](https://user-images.githubusercontent.com/39071798/105784064-5ab0ee80-5fbb-11eb-9250-03d80b1d4add.png) +를 눌러서 위에 패턴을 그대로 따라 쳐준다. 가운데 추가하고 싶은 단어만 추가하고 Use color scheme TODO default colors만 체크를 해제해준 후 밑에서 색상이나 Effects 등 추가해서 바꿔주면된다!
