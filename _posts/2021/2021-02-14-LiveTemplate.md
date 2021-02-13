---
layout: post
title: LiveTemplate
categories: IDE
author: boki
tags: IntelliJ WebStorm Live Template
comments: true
sitemap:
  changefreq: daily
  priority: 1.0
---

# 이거 왜 안써? JetBrains사의 Live Template

## IntelliJ, WebStorm, PhpStrom 등등...

### 어느날 책을 보면서 공부하다가 VsCode의 Snipet에선 복잡하게 돌아가는걸 발견했다...!!

### 그래서 웹스톰(인텔리제이도 됨)에서는 그런기능이 없을까 찾아보다보니.. Live Template이란 것을 발견했다.

### 자 결론을 좋아하는 한국인들을 위해 사진 투척

#### 파일이름: test.js 일때 z를 치고 엔터를 치면

![image](https://user-images.githubusercontent.com/39071798/107855897-91668000-6e68-11eb-8e11-621bc60432e1.png)

![image](https://user-images.githubusercontent.com/39071798/107855908-a4795000-6e68-11eb-8014-99ae53bb9ac9.png)

#### 파일이름: I_Love_youSoMuchS2.js 일때 z를 치고 엔터를 치면

![image](https://user-images.githubusercontent.com/39071798/107855930-cf63a400-6e68-11eb-9273-207002a478fe.png)

![image](https://user-images.githubusercontent.com/39071798/107855935-d25e9480-6e68-11eb-905d-087c33088cf0.png)

### 추가로 한글 명령어도 가능하다 왜냐? 내가 추가해놨으니까^^

#### 리액트 라고 치고 엔터를 치면

![image](https://user-images.githubusercontent.com/39071798/107856081-2e291d80-6e69-11eb-9add-57e63681f93b.png)

#### 뿅! 기본 틀이 완성된다

![image](https://user-images.githubusercontent.com/39071798/107856084-33866800-6e69-11eb-9cc3-b43f13be1dfe.png)

#### 한글은 바로 추가툴팁이 뜨지는 않지만 잘 작동한다.

## [ How? ]

우리는 단축키를 사랑하는 민족이니까 나만 따라오시라. 대신 윈도우 기준으로 설명하겠다..
맥.. 부러워 갖고싶어..ㅠ 거지라서..
Ctrl + Alt + S를 누르면 Settins 창이 뜬다. 여기에서 Live라고 치고 Live Template을 선택해준다.
![image](https://user-images.githubusercontent.com/39071798/107856154-a5f74800-6e69-11eb-86b2-15cf92d51c10.png)

우측 상단의 + 버튼을 눌러서 템플릿 그룹을 추가한다. 그냥 자기 이름으로 하자
![image](https://user-images.githubusercontent.com/39071798/107856166-c3c4ad00-6e69-11eb-8293-b77ae6db65d3.png)

난 boki로 만들어줬고 5개의 명령어를 추가해줬다.
![image](https://user-images.githubusercontent.com/39071798/107856200-fc648680-6e69-11eb-9563-a3d22c917a82.png)

![image](https://user-images.githubusercontent.com/39071798/107856210-09817580-6e6a-11eb-945b-38ff757d857e.png)

z를 살펴보면... ㅋ로 할수도 있었지만, 코드를 치는순간 영문이 더 쓰이는 경우가 많을거같아서 z로했다.

![image](https://user-images.githubusercontent.com/39071798/107856290-7eed4600-6e6a-11eb-9ee5-f1cee68eabc4.png)

우측 상단의 +를 눌러서 이번에는 1번으로 추가를 해준다(그룹 x)
Abbreviation에는 명령어를, Description에는 말그대로 설명을 적으면된다. 한글도 상관없다.
근데 명령어는 한글이면 설명툴팁이 안뜬다..

![image](https://user-images.githubusercontent.com/39071798/107856305-8e6c8f00-6e6a-11eb-8a30-684b0a69b305.png)
그리고 밑에 Template Text에 코드를 적는다.
코드를 적으면 흰색으로 뜬다.
그럴때는 밑에 Define을 눌러서 어떤 형식의코드인지 알려줘야 한다. 리액트를 할것이기 때문에 나는 JavaScript and TypeScript라고 정했다. 그러면 코드에 색이 입혀지면서 적용되는 것을 알 수 있다.

![image](https://user-images.githubusercontent.com/39071798/107856480-c32d1600-6e6b-11eb-8867-3137ce24954b.png)
옆에 Expand With는 이 명령어를 치고 활성화시킬 동작들이다. 나는 탭보다는 엔터가 편해서 엔터로 전부 다 설정했다. Default는 Tab이다.

![image](https://user-images.githubusercontent.com/39071798/107856383-279ba580-6e6b-11eb-9ece-e750c0bb7f7d.png)

추가로 변수를 알아보자
변수는 $ $사이에다가 아무내용이나 적으면 EDIT VARIABLES 버튼이 활성화가 되면서 입력이 가능하다
날짜도 가능하고, 파일명, 확장자를 포함하지 않는 파일명 등등 엄청 다양하다.
추가로 내 스타일 컴포넌트 하나 설정을 알려주고 글을 마칠까한다..

```javascript
import React from "react";
import styled from "styled-components";

const $FILENAME$Block = styled.div``;

const $FILENAME$ = () => {
  return <$FILENAME$Block></$FILENAME$Block>;
};

export default $FILENAME$;
```

이 명령어를 스컴 이라고 등록했다. 스타일드 컴포넌트의 줄임말이다. $$뒤에 변수명이 와도 상관없다. 어차피 텍스트로 인식될거니깐(여기는 셋팅환경 안이다)

## 스컴의 결과

![image](https://user-images.githubusercontent.com/39071798/107856546-3040ab80-6e6c-11eb-8cb9-aff715b3b63e.png)

![image](https://user-images.githubusercontent.com/39071798/107856547-333b9c00-6e6c-11eb-81d7-8dc434ee9aee.png)
겁나 긴 파일이름명을 따라서 만들어진것을 볼 수 있다!

# 모두 IntelliJ, WebStrom 쓰세요!! ㅋㅋ
