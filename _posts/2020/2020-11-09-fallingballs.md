---
layout: post
title: 스크래치 6강 - fallingballs
categories: scratch
author: boki
tags: 스크래치
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## 6강! 공피하기 게임을 만들어볼거에요
## 출처-이 강의들은 코드클럽SW교육기부단 자료를 토대로 재구성하였습니다.
## 완성사진
![image](https://user-images.githubusercontent.com/39071798/101172884-18d38e00-3685-11eb-91bd-84fd88caddfa.png)
> 키보드로 하는 공피하기 게임을 만들어보겠습니다

# 그림 크기가 너무 작아서 안보인다하시는분들은 그림에 마우스 우측클릭->새 탭에서 이미지 열기를 눌러주시거나 맨 밑에 코드 완성본이 있습니다.

## 약간 4강과 5강을 조합한 프로그램입니다!
#### 스크래치를 켜줍니다! 이번 강의부터는 조금더 빠르게 갈거에요!!
#### 안쓰는 고양이를 삭제하고, 배경에서 Beach Malibu을 골라주고, 스프라이트고르기에서 Crab을 선택했어요. 그리고 Crab의 크기를 40으로!! 바꿔줍니다.
#### 시작은항상 이벤트-클릭했을때, 그리고 그 밑에 동작-x, y로 이동하기를 선택하시고요!
#### x는 0, y는 -170으로 바꿔주고 실행해봅니다. 꽃게가 맵의 중간, 가장 아래로 이동했나요?
![image](https://user-images.githubusercontent.com/39071798/101173191-87b0e700-3685-11eb-9483-b274d1b563d4.png)
#### 그리고 이번에는 시간 변수말고 점수변수만 만들어줍니다! 그리고 꽃게 시작했을때 밑에 점수를 0으로 정하기를 추가해주세요
#### 상어게임을 만들었을때처럼, 이벤트에서 스페이스를 눌렀을때를 끌어다 놓고, 스페이스를 왼쪽 화살표 키를 눌렀을 때로 바꿔줄게요
#### 그 밑에 동작에서 -10만큼 움직이기를 추가해주세요.
#### 꽃게는 좌우로밖에 이동못하죠? 또 우측 화살표 키를 눌렀을 때, 동작에서 10만큼 움직이기를 붙여주세요
#### 추가로! 스페이스를 눌렀을때도 만들어줄거에요. 스페이스를 눌렀을때는 x:-200부터 200사이의 난수, y:-170으로 이동하기를 해주세요
![image](https://user-images.githubusercontent.com/39071798/101173867-7a482c80-3686-11eb-9734-bf47b876daf5.png)

#### 5강처럼 Line스프라이트도 추가해주세요. 그리고 Line 스프라이트를 클릭해서 작성해줍니다.
#### 클릭했을 때 x:0, y:-180으로 이동하기!
#### Line이 맵 맨 아래로 이동한것을 체크하셨나요?
![image](https://user-images.githubusercontent.com/39071798/101174112-c4311280-3686-11eb-9c85-441d0b5a6c54.png)

#### 이제 추가 스프라이트로 노란색 Ball을 추가해주세요. 그리고 크기를 60으로!! 바꿔주세요.
#### 클릭했을때 x:-230부터 230사이의 난수, y:170(으)로 이동하기로 해주세요
#### 그 밑에 무한 반복하기
#### 무한반복하기 안에 동작-y좌표를 10만큼 바꾸기를 끌어서 y좌표를 -5만큼 바꾸기로 숫자를 바꿔주세요(정하기가 아니라 바꾸기에요)
![image](https://user-images.githubusercontent.com/39071798/101174476-4588a500-3687-11eb-8c75-c614f7c54bf7.png)
#### 그리고 무한 반복하기 안에 제어-만약 ~라면을 5개를 놓아주세요! 겹치지않게요
#### 첫번째 제어문에는 감지-Line에 닿았는가로 바꿔주시고, 닿았다면 점수를 1만큼 바꾸기. 그리고 x:-230~230사이의 난수 y:170으로 이동하기를 해주세요
#### 두번째 제어문에는 점수>5이라면 y좌표를 -1만큼 바꾸기. 세번째 제어문에는 점수>15이라면 y좌표를 -1만큼 바꾸기
#### 네번째 제어문에서는 점수>25이라면 y좌표를 -3만큼 바꾸기. 마지막 제어문에는 감지에서 Crab에 닿았다면 제어-멈추기 모두를 해주세요!!
![image](https://user-images.githubusercontent.com/39071798/101174950-e2e3d900-3687-11eb-92f1-6e142c411f78.png)

#### 이제 Ball을 총 4개까지 만들어볼거에요. 어떻게했죠? 스프라이트에서 마우스 오른쪽키에서 복사를 해주세요. Ball4까지 만들어질때까지 계속 복사해주세요.
#### 바꿔줄 부분이있습니다! Ball2에서는 무한 반복하기 위에 제어-0.5초 기다리기, Ball3에서는 무한 반복하기 위에 제어-1초 기다리기를 추가해주세요.
![image](https://user-images.githubusercontent.com/39071798/101175294-5554b900-3688-11eb-8fbe-3e55837de2cb.png)
![image](https://user-images.githubusercontent.com/39071798/101175302-57b71300-3688-11eb-9a37-03f8e3d4b14c.png)
![image](https://user-images.githubusercontent.com/39071798/101175327-61407b00-3688-11eb-92c8-bfa811618eea.png)

#### Ball4를 클릭해주고 모양으로 가서 노란색 공이 아닌 자기가 원하는 색의 공으로 바꿔주세요!! 그리고 다시 코드탭으로 돌아옵니다.
#### 제대로 복사를 했다면 Ball4에는 x초 기다리기가 없을거에요. 이건 건들지마시고, 무한 반복하기 안에서 점수>5, 점수>15, 점수>25 제어문 3개를 없애주세요.
#### 마지막 Crab에 닿았는가?에서 멈추기-모두를 없애주시고 점수를 1부터 5사이의 난수로 바꾸기. 그리고 x:-230~230까지 난수, y:170(으)로 이동하기를 해주세요
![image](https://user-images.githubusercontent.com/39071798/101175735-de6bf000-3688-11eb-93e3-cf8992525b04.png)
### 이제 게임 시작을 해서 친구와 점수경쟁을 해보세요! 키보드 좌우키로 노란공은 피하고, 다른색깔(저의경우는 초록색)공은 먹어주면서 위험한 상황에는 스페이스키를 눌러서 임의의곳으로 탈출하는 거에요

## 모두 고생많았어요. 여기까지 마무리해볼게요!! 이 파일은 자기 컴퓨터에 저장해서 스크래치 홈페이지에 로그인하고 파일 올려서 자기만의 작업실에 업데이트하는거를 추천합니다!
## 코드 완성본
![image](https://user-images.githubusercontent.com/39071798/101175993-386cb580-3689-11eb-897c-8e1877196863.png)
![image](https://user-images.githubusercontent.com/39071798/101176001-3b67a600-3689-11eb-93e9-556b6100d440.png)
![image](https://user-images.githubusercontent.com/39071798/101176013-3dca0000-3689-11eb-8e6c-d6b4b887cf48.png)
![image](https://user-images.githubusercontent.com/39071798/101176020-402c5a00-3689-11eb-9eb9-b78e962ae873.png)
![image](https://user-images.githubusercontent.com/39071798/101176028-41f61d80-3689-11eb-9cde-6056fdbc5497.png)
![image](https://user-images.githubusercontent.com/39071798/101176033-44587780-3689-11eb-8a14-e2643f36092b.png)

## 영상입니다.
[![유튜브](https://img.youtube.com/vi/ANFMR28VgRk/0.jpg)](https://www.youtube.com/watch?v=ANFMR28VgRk){: target="_blank"}