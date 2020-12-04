---
layout: post
title: 스크래치 5강 - boundingballs
categories: scratch
author: boki
tags: 스크래치
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## 5강! 공튀기기 게임을 만들어볼거에요

## 완성사진
![image](https://user-images.githubusercontent.com/39071798/101164599-98a72b80-3678-11eb-9af2-914ce650b3db.png)
> 마우스로 하는 공 튀기기 게임을 만들어볼거에요!

# 그림 크기가 너무 작아서 안보인다하시는분들은 그림에 마우스 우측클릭->새 탭에서 이미지 열기를 눌러주시거나 맨 밑에 코드 완성본이 있습니다.

#### 스크래치를 켜줍니다! 이번 강의부터는 조금더 빠르게 갈거에요!!
#### 안쓰는 고양이를 삭제하고, 배경에서 Neon Tunnel을 골라주고, 스프라이트고르기에서 Button2를 선택했어요. 그리고 버튼 크기를 80으로 바꿔줍니다.
#### 시작은항상 이벤트-클릭했을때, 그리고 그 밑에 무한 반복하기를 놓고, 그 안에 동작-x, y로 이동하기를 선택하시고요!
#### x는 감지에 있는 마우스의x좌표, y는 -150으로 바꿔주고 실행해봅니다. 버튼이 가장 밑쪽에서 마우스를 계속 따라다니죠!???
![image](https://user-images.githubusercontent.com/39071798/101163463-f9356900-3676-11eb-8429-ffdb2135b426.png)

#### 그리고 스프라이트 추가에서 Line을 검색해서 추가해줍니다. Line스프라이트를 클릭하고 클릭했을때, x:0, y:-180(으)로 이동하기를 밑에 붙여주세요.
![image](https://user-images.githubusercontent.com/39071798/101163544-15390a80-3677-11eb-9041-841a035ea4e3.png)
#### 변수에서 점수,시간이라는 2개 변수를 추가해주세요.
#### 그리고 어느 스프라이트든 상관없어요. 전 Button2에다 만들게요.
#### 클릭했을 때를 새로 만들어주고, 점수는 0, 시간은 15로 정하기.
#### 시간=0까지 반복하기, 1초 기다리기, 시간을 -1만큼 바꾸기. 맨 밑은 멈추기 모두!! 이정도는 이제 할줄알겠죠?
![image](https://user-images.githubusercontent.com/39071798/101164062-ea9b8180-3677-11eb-986d-0685bb79026d.png)

#### 스프라이트 고르기에서 Ball이라는 노란색 공을 추가해주세요.
#### 클릭했을 때, x:0 y:0으로 이동하기. 그리고 밑에 동작-90도 방향보기를 끌어서. 90도 방향을 -45부터 45까지의 난수로 바꿔주세요.
#### 그 밑에 무한 반복하기, 안쪽에 동작-20만큼 움직이기. 벽에 닿으면 튕기기 이렇게까지 하고 실행해볼게요
![image](https://user-images.githubusercontent.com/39071798/101164781-eb80e300-3678-11eb-8a86-afc06bd4a61e.png)
#### 밑에 만약 ~라면을 2개 추가해주세요. 하나는 Button2에 닿았을때, 나머지 하나는 Line에 닿았을때 처리해줄거에요.
#### 감지-마우스포인터에 닿았는가?를 끌어서 위에쪽은 Button2, 밑은 Line에 닿았을 때로 바꿔주세요.
#### 노란공에 닿으면 점수를 1올려주고(정하기가 아니라 바꾸기에요), -60부터 60까지의 난수 도 방향 바라보기를 해주세요. 클릭했을때 밑의 두번째 블록이랑 똑같이 하면됩니다.
#### 실행해서 Button에 닿으면 튕기고 점수가 1점 올라가는지 테스트해보세요!
![image](https://user-images.githubusercontent.com/39071798/101165304-c640a480-3679-11eb-93b9-df4ef1b45e83.png)
#### 이젠 Line에 닿았을때를 처리해줄거에요. Line에 닿았다면, 점수를 -2만큼 바꾸기를 하고, 제어-1초기다리기를 0.3초 기다리기로 바꿔주세요.
#### 그리고 처음의 위치인 x:0, y:0로 이동시키고 맨 위처럼 -45부터 45사이의 난수도 방향보기를 해주세요! 실행해서 테스트를 해볼까요?
![image](https://user-images.githubusercontent.com/39071798/101165655-5e3e8e00-367a-11eb-9951-d65d09d86fb2.png)
#### 그럼 이제 공 2개를 더 추가해볼거에요! 어떻게했죠? 스프라이트 마우스 오른쪽 키->복사를 2번해주세요.
#### 그리고 Ball2, Ball3을 모양에 가서 노란색이 아닌 각각 다른색으로 바꿔주세요. 전 두번째는 파란색, 세번째는 분홍색 공으로 바꿨어요
![image](https://user-images.githubusercontent.com/39071798/101165772-91811d00-367a-11eb-8b2f-405ac97044bb.png)
#### 각 공이 다 똑같이 움직이면 재미없겠죠? Ball2(파란색 공)을 클릭해서 무한반복하기 밑에 20만큼 움직이기를 10만큼 움직이기로 바꿔주세요.
#### 그리고 Button2에 닿았을때 점수를 1점이 아닌 -2점으로 바꿔줄게요. 그리고 Line에 닿았을때는 점수를 -2가 아닌 1로 바꿔줄게요. 한마디로 파란색 공은 피하라는 거죠!
![image](https://user-images.githubusercontent.com/39071798/101166147-28e67000-367b-11eb-9b04-4ee90af9e08b.png)
#### 마지막 분홍색 공은 시간을 바꿔주는 공이에요. 가장 느린 5만큼 움직이기로 바꿔주시고, Button2에 닿으면 점수가 아닌 시간을 1로 바꾸기로 해주세요.
#### 그리고 Line에 닿으면 점수가 아닌 시간을 -1로 바꿔주세요!
![image](https://user-images.githubusercontent.com/39071798/101166322-7367ec80-367b-11eb-86f0-e01b5cb53707.png)
#### 추가로 해야될게 있어요. Line즉 땅에 닿으면 공이 뭔가 어색하죠? 그래서 부딪혀서 깨지는 모양을 만들어줄게요
#### 각각 공을 클릭하고 모양을 눌러서 그 공 색이 아닌 나머지 밑에 다른색들은 휴지통 버튼을 눌러서 없애주세요!! 이렇게요!
![image](https://user-images.githubusercontent.com/39071798/101166539-c8a3fe00-367b-11eb-9bda-b09f2ab38a36.png)
![image](https://user-images.githubusercontent.com/39071798/101166548-ccd01b80-367b-11eb-8e80-cffe8d94ce73.png)
![image](https://user-images.githubusercontent.com/39071798/101166557-cf327580-367b-11eb-9aa3-86a89e856651.png)
#### 그리고 모양에서 왼쪽 위에 공에서 마우스 오른쪽을 눌러서 복사를 해주세요! 같은색으로 된 공이 2개가 생길거에요.
#### 나머지 파란색과 분홍색 공에도 똑같이 만들어주세요.
![image](https://user-images.githubusercontent.com/39071798/101166816-3ea86500-367c-11eb-8102-def7117d9b88.png)
![image](https://user-images.githubusercontent.com/39071798/101166822-410abf00-367c-11eb-925a-e86f8be41aff.png)
![image](https://user-images.githubusercontent.com/39071798/101166872-554ebc00-367c-11eb-8861-bc172a91985d.png)
![image](https://user-images.githubusercontent.com/39071798/101166877-57b11600-367c-11eb-9ce2-c28edf16819f.png)

#### Ball(노란색 공)을 클릭해보면 ball-a는 처음 모양이고 ball-a2가 부딪혔을때 모양이 될거에요. 꼭! 이거 알아주시고 a2를 눌러주세요.
#### 그리고 처음에 swim 할때처럼 찢어(?) 줄거에요. 가운데 비트맵으로 바꾸기를 눌러주시고 저기 우측맨아래 네모를 클릭해주세요
#### 영역 드래그를 해서 따로따로 분해해주면 끝!
![image](https://user-images.githubusercontent.com/39071798/101167078-b5ddf900-367c-11eb-8368-441c69d6e4e2.png)
![image](https://user-images.githubusercontent.com/39071798/101167088-b8d8e980-367c-11eb-8d74-9bf1a6c8ea5a.png)
![image](https://user-images.githubusercontent.com/39071798/101167133-cdb57d00-367c-11eb-8335-5dace9ca0a82.png)
#### 나머지 Ball2와 Ball3에서도 ball-b2와 ball-c2가 잘 선택되었나 확인하고! 똑같이 찢어(?)주세요
![image](https://user-images.githubusercontent.com/39071798/101167299-0a817400-367d-11eb-8633-9eacec0645c4.png)
#### 자, 실행해보면..? ㅋㅋ 부서진채로 계속 공이 튀길거에요. 이현상을 고쳐주기위해 코딩을 몇개 더해줘야해요.
![image](https://user-images.githubusercontent.com/39071798/101167445-3b61a900-367d-11eb-8a1e-d7e6400542b5.png)
#### 똑똑한분들은 아 어떻게 해야겠다!하고 감이 오실거에요. 코드탭을 눌러주세요.
#### 일단 노란색 공을 클릭하고 무한 반복하기 이전에 클릭하기 밑에 형태-모양을 ball-a로 바꾸기를 추가해주세요.
#### 그리고 Line에 닿았는가? 밑에 형태-모양을 ball-a2로 바꾸기를 추가해주세요.
#### 또 다시 원래 모양으로 돌려줘야겠죠? 맨 밑에 모양을 ball-a로 바꾸기를 추가해주세요! 이렇게요
![image](https://user-images.githubusercontent.com/39071798/101167893-f0946100-367d-11eb-9bf9-fb78eda7fc5b.png)
#### 파란색 공과 분홍색 공도 똑같이 바꿔주세요
![image](https://user-images.githubusercontent.com/39071798/101168016-25081d00-367e-11eb-9d22-dad5aa55cb91.png)
![image](https://user-images.githubusercontent.com/39071798/101168022-28030d80-367e-11eb-9de5-df2840753f47.png)
#### 이제 bgm같은거를 추가해서 게임을 즐겨보세요!

## 모두 고생많았어요. 여기까지 마무리해볼게요!! 이 파일은 자기 컴퓨터에 저장해서 스크래치 홈페이지에 로그인하고 파일 올려서 자기만의 작업실에 업데이트하는거를 추천합니다!
## 코드 완성본
![image](https://user-images.githubusercontent.com/39071798/101168239-7b755b80-367e-11eb-8817-86cfb535566e.png)
![image](https://user-images.githubusercontent.com/39071798/101168254-829c6980-367e-11eb-9679-f9f34f7b7f1d.png)
![image](https://user-images.githubusercontent.com/39071798/101168269-89c37780-367e-11eb-82db-ef1ba80a164f.png)
![image](https://user-images.githubusercontent.com/39071798/101168286-91831c00-367e-11eb-81af-78a744f0b042.png)
![image](https://user-images.githubusercontent.com/39071798/101168301-9778fd00-367e-11eb-8211-792e9f6ae3a0.png)

## 영상입니다.
[![유튜브](https://img.youtube.com/vi/a-mo-ws7AEI/0.jpg)](https://www.youtube.com/watch?v=a-mo-ws7AEI)