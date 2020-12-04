---
layout: post
title: 스크래치 7강 - balloon pop
categories: scratch
author: boki
tags: 스크래치
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## 7강! 풍선 터트리기 게임을 만들어볼거에요
## 출처-이 강의들은 코드클럽SW교육기부단 자료를 토대로 재구성하였습니다.
## 완성사진
![image](https://user-images.githubusercontent.com/39071798/101196871-aa062d00-36a4-11eb-8b3d-99a71a57a0f6.png)
> 조준도 랜덤, 풍선 움직임도 랜덤. 스페이스를 타이밍에 맞게 눌러주세요!

# 그림 크기가 너무 작아서 안보인다하시는분들은 그림에 마우스 우측클릭->새 탭에서 이미지 열기를 눌러주시거나 맨 밑에 코드 완성본이 있습니다.

#### 스크래치를 켜줍니다! 이번 강의부터는 조금더 빠르게 갈거에요!!
#### 안쓰는 고양이를 삭제하고, 배경에서 Night City를 골라주고, 스프라이트는 직접 그릴거에요!
#### 스프라이트 그리기->그리기를 클릭하고 굵기는 25로해서 조준점모양을 자기마음대로 그려봐요. 가운데 + 모양에 조준점을 맞춰주세요
#### 그리고 맵에 너무 크게 나타났다싶으면 크기를 30~60정도로 조절해서 바꿔주세요
![image](https://user-images.githubusercontent.com/39071798/101197153-13863b80-36a5-11eb-8a3a-f21928ff37c9.png)
![image](https://user-images.githubusercontent.com/39071798/101197158-15e89580-36a5-11eb-976f-bfb84f30c7f1.png)

#### 그리고 balloon 스프라이트를 추가해주세요
#### 추가로 복사를 해서 스프라이트가 총 3개가 되도록 만들어주세요 각각 풍선의 색을 바꿔주세요!
![image](https://user-images.githubusercontent.com/39071798/101197597-ab842500-36a5-11eb-8542-5e90f2f5ccd3.png)
#### 변수 탭에가서 점수,시간을 추가해주세요
#### 그리고 스프라이트1(저희가 만든)을 눌러서 클릭했을때->x:0,y:0으(로)이동하기를 밑에 붙여주시고
#### 점수를 0으로 정하기, 시간을 15로 정하기. 그리고 시간=0까지 반복. 1초 기다리고 시간을 -1만큼 바꾸고 끝부분에 멈추기-모두! 아시죠?
![image](https://user-images.githubusercontent.com/39071798/101197816-f56d0b00-36a5-11eb-8905-8dc5a419cfae.png)
#### 그 옆에 클릭했을 때 블록을새로 만들어줘요
#### 밑에 무한 반복하기, 그 안에 동작->1초 동안 무작위 위치로 이동하기를 끌어서 두세요. 그리고 시간을 1초에서 0.8초로 바꿔주세요
#### 그리고 실행해보세요. 조준점이 계속 움직이나요?
![image](https://user-images.githubusercontent.com/39071798/101198042-35cc8900-36a6-11eb-80af-7e8bd0beb0e7.png)
#### 그 옆에다가 또 만들어줄거에요 이벤트->스페이스를 눌렀을 때를 따로 새로운 블럭으로 끌어다 놓아주세요
#### 그 밑에 만약 ~라면 블록을 두고 시간 > 0이라면을 만들어줍니다(연산과 변수를 이용하면돼요)
![image](https://user-images.githubusercontent.com/39071798/101198263-89d76d80-36a6-11eb-9036-dba11ad4d952.png)
#### 시간>0이라면 블록 안에 제어->만약~라면을 3개 겹치지 않게 놓아주세요
#### 그리고 각각 Ballono1/2/3에 닿았는가?로 바꿔주세요(감지)
#### 풍선1에 닿았다면(감지) 점수를 5만큼 바꾸고(변수), 5점!을 1초동안 말할거에요(형태)
#### 같은 방법으로 풍선2에 닿았다면(감지) 점수를 10만큼 바꾸고(변수), 10점!을 1초동안 말할거에요(형태)
#### 같은 방법으로 풍선3에 닿았다면(감지) 점수를 15만큼 바꾸고(변수), 15점!을 1초동안 말할거에요(형태)
#### 추가로 각 풍선제어문의 중간 혹은 끝에 이벤트-메세지1보내기를 끌어서 넣어주고 새로운메세지를 만들어서 풍선1,풍선2,풍선3으로 바꿔주세요!
![image](https://user-images.githubusercontent.com/39071798/101198660-26017480-36a7-11eb-96e0-e46f17fb15d7.png)
#### 자 이제 각 풍선마다 터뜨려졌을 때의 터진 모습을 추가해볼거에요. 아시죠? 모양에서 복사 누르고 복사본을 찢어(?)주시면 됩니다. 
#### 다른 색 풍선 3개 다 똑같이 만들어줄게요
![image](https://user-images.githubusercontent.com/39071798/101198775-56491300-36a7-11eb-8d7c-9e16afde86fc.png)
![image](https://user-images.githubusercontent.com/39071798/101198779-58ab6d00-36a7-11eb-85e6-9daea7939480.png)
![image](https://user-images.githubusercontent.com/39071798/101198786-5b0dc700-36a7-11eb-8f1a-df88daae8a1c.png)
#### 그리고 다시 첫번째 풍선을 클릭하고 코드로 돌아와서 클릭했을 때를 끌어서 놓아주세요
#### 처음의 모양은 안터진 형태가 되어야겠죠? 형태탭에서 모양을 balloon1-a로 바꾸기를 붙여주세요
#### 형태-보이기를 그 다음에 붙여주시고, 제어-무한반복하기, 동작-1초동안 무작위 위치로 이동하기를 해주세요
![image](https://user-images.githubusercontent.com/39071798/101198993-a1632600-36a7-11eb-8138-ff7a98ebfb38.png)
#### 이벤트-풍선1 신호를 받았을때를 끌어서 옆의 블록으로 새로 만들어주세요
#### 터진 상황이니 형태에서 모양을 balloon1-a2로 바꾸기를 해주시고, 펑!을 1초동안 말하기, 숨기기를 해주세요
![image](https://user-images.githubusercontent.com/39071798/101199129-d1122e00-36a7-11eb-8321-b8d569065732.png)
#### 이것처럼 똑같이 풍선 2와 3도 만들어주세요
![image](https://user-images.githubusercontent.com/39071798/101199184-e1c2a400-36a7-11eb-9dcb-521c0b612f8d.png)
![image](https://user-images.githubusercontent.com/39071798/101199212-e8511b80-36a7-11eb-83af-7a667d03222f.png)

### 이제 게임 시작을 해서 클리어를 해볼까요? 순전히 운빨일수도있지만, 순발력도 있어야하는 게임이랍니다. 15초 내에 풍선 3개를 다 터뜨릴수있을까요!???
## 모두 고생많았어요. 여기까지 마무리해볼게요!! 이 파일은 자기 컴퓨터에 저장해서 스크래치 홈페이지에 로그인하고 파일 올려서 자기만의 작업실에 업데이트하는거를 추천합니다!
## 코드 완성본
![image](https://user-images.githubusercontent.com/39071798/101199448-3ebe5a00-36a8-11eb-840e-e424599aeb08.png)
![image](https://user-images.githubusercontent.com/39071798/101199460-4251e100-36a8-11eb-8b88-4f7e54f6db1e.png)
![image](https://user-images.githubusercontent.com/39071798/101199466-43830e00-36a8-11eb-86a9-8287d8395dee.png)
![image](https://user-images.githubusercontent.com/39071798/101199475-45e56800-36a8-11eb-8067-5d5765a924a6.png)

## 영상입니다.
[![유튜브](https://img.youtube.com/vi/Kc952ECLNsw/0.jpg)](https://www.youtube.com/watch?v=Kc952ECLNsw)