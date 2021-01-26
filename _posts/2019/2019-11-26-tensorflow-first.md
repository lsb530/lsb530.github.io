---
layout: post
title: " AttributeError : module 'tensorflow' has no attribute 'Session' "
categories: tensorflow
author: boki
tags: tensorflow python error
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
# excerpt: from jekyll 발췌
# matajax: true 수학식을 그리는 마크다운문법
---
* content
{:toc}

## 텐서플로우 Hello 출력하기

* 나동빈님의 강의를 보며 1강을 진행하던 도중 에러를 만났다.

![20191126_014437](https://user-images.githubusercontent.com/39071798/69564977-5d026c00-0ff7-11ea-9590-1eca9edbe6ec.png)

`My Code`
```python
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
printf(sess.run(hello))
```

![20191126_014606](https://user-images.githubusercontent.com/39071798/69565014-6be91e80-0ff7-11ea-91c8-27ff6777769f.png)

`Error Log`
```
Traceback (most recent call last):
~~~~ in <module>
sess = tf.Session()
AttributeError: module 'tensorflow' has no attribute 'Session'
```

# Skip Tip) 마우스 스크롤을 내려서 해결했다 < 부분을 찾아보자!
* 구글링을 열심히 하면서 찾아본 결과....
* 최근에 바뀐 텐서플로우 2.0이 문제인것 같았다. 결국 하위 버전으로 설치하기로 했다.
* + 파이썬 3.7 버전과 텐서플로우의 매칭이 문제가 있는 것으로 확인이 되었고, 환경변수로 pip가 있더라도 명령프롬프트보다는 아나콘다를 이용한 설치를 권장하고 있다고 한다.
* 3.6까지만 텐서플로우 지원을 했는데, 최근에 3.7도 지원을 한다고 하는데 아마 내가 못하는걸지도..
* 그래서 파이썬을 제거후 콘다(Conda)를 설치하기로 결정. 또한 이 콘다에도 문제가 있었다.
* 위에서 말한것처럼 머신러닝에 필요한 텐서플로우 프레임워크는 파이썬 3.6 버전까지 지원하고, 콘다에서는 3.6까지와 호환되는 버전인(Conda 5.2) 설치를 권장했다. 한마디로 파이썬3.7이랑 호환되는건 Conda5.2이후 버전부터이다.
> (Fix) 파이썬3.7을 제거후 아나콘다로 5.2를 설치해 conda에서 파이썬 3.6을 설치하고 텐서플로우 2.0 버전이 아닌 1.x버전을 설치할것이다.(1.6에는 몇몇 이슈가 있다고 발견이 되어 1.5로 설치)

![20191126_023156](https://user-images.githubusercontent.com/39071798/69563951-6c80b580-0ff5-11ea-82c3-2f0171211df8.png)

* (부끄...) 지금도 컴알못이지만, 파이썬을 다뤄보지는 않아서 예전에 버전관리 없이 콘다로도 여러버전 설치하고 파이썬으로도 여러버전 설치했었나보다.

> 결국 싹 밀고 (Fix) 대로 하기로 정했다

+ 지우는데 무진장 시간 오래 걸린다 -_-+ 하..

`Links`

1. [아나콘다 5.2 윈도우(64bit)](https://repo.continuum.io/archive/Anaconda3-5.2.0-Windows-x86_64.exe)

2. [아나콘다 5.2 윈도우(32bit)](https://repo.continuum.io/archive/Anaconda3-5.2.0-Windows-x86.exe)

* 설치파일은 관리자 권한으로 실행시켜주자

![20191126_031330](https://user-images.githubusercontent.com/39071798/69566581-c0da6400-0ffa-11ea-9046-30c399920201.png)

> 위의 Anaconda를 path로 등록해주면 기존 아나콘다 버전과의 충돌등이 있을 수 있다고 한다. 나는 모든 버전의 파이썬 및 아나콘다를 지웠기때문에 체크함

![20191126_035631](https://user-images.githubusercontent.com/39071798/69569371-d81c5000-1000-11ea-8661-a8d2981b59df.png)

* 자 이제 Anaconda Prompt를 이용할 수 있다!

* 나는 보통 꼭 써야될 개발툴,IDE 등등은 작업표시줄에 추가시켜놓는다

![20191126_035659](https://user-images.githubusercontent.com/39071798/69569452-0732c180-1001-11ea-9869-6a4ad9f071e5.png)

   ~~새벽 4시가 다 되도록 뭐한다냐...에효~~

* 자 이제 아나콘다 프롬프트를 실행시켜주자

> 꼭!!!! 관리자 권한으로 실행시켜주자.. 나는 이렇게 안해서 패키지업데이트 다 해놓고 전부다 deny되었다. 이게 안되고있는지 몰랐다..한 15분 날림

* 이제 콘다의 패키지를 업데이트 시켜주자. 어차피 5.2 버전에 맞게 다운받았으므로 파이썬이 3.7버전이 깔리는 일은 없다. 걱정마시라

+ Proceed ([y]/n)?이 나오면 y를 살포시 입력해주자. 안나오는 경우도 있다. PC마다 다른것 같다

```
>conda --version
conda 4.5.4
>python --version
Python 3.6.5 :: Anaconda, Inc.
>conda update -n base conda
```

![20191126_040233](https://user-images.githubusercontent.com/39071798/69569739-99d36080-1001-11ea-9bdc-5ef572955152.png)

> 끝부분에 Verifying transaction: done / Excuting transaction: done이 떴는지 꼭 확인하자. deny혹은 오류가 났다면 관리자 권한이 아닌것이다!

```
>conda update --all
...
done
```

> 여기 업데이트는 오랜 시간을 요한다. 유튜브나 다른 코딩하다가 5~10분정도 뒤에 돌아오자

```
>python -m pip install --upgrade pip
...
>conda --version
conda 4.7.12
>python --version
Python 3.6.9 :: Anaconda, Inc.
```
![20191126_044001](https://user-images.githubusercontent.com/39071798/69572141-d6558b00-1006-11ea-9847-ad80ce51e5c6.png)

> 확실하게 처음과 비교해서 conda의 버전과 python의 버전이 바뀐것을 알 수 있다. 3.7을 넘지않는 3.6.9로 설치가 되었다.

* 이제 텐써플로우(tensorflow)를 설치해보겠습니다. (3.6버전 이하의 파이썬이어야됩니다)

* 먼저 아나콘다3의 가상환경을 구축해야된다.

```
#conda create -n '가상환경 이름'(임의) python='파이썬 버전'(3.6)
>conda create -n boki python=3.6
```
![20191126_044110](https://user-images.githubusercontent.com/39071798/69572219-056bfc80-1007-11ea-9beb-822f66d19992.png)

```
#activate '가상환경 이름' / deactivate '가상환경 이름'
>(base)activate 'boki'
>(boki)
```
![20191126_044352](https://user-images.githubusercontent.com/39071798/69572382-60055880-1007-11ea-9a07-e703587edf99.png)

> 앞에 (base)에서 (접속한 가상환경명)으로 바뀐것을 확인할수 있을것이다

~~conda install tensorflow~~를 하지말고
```
>pip install tensorflow==1.5
....
Successfully uninstalled tensorflow-2.0.0(만약에 위에 그냥 설치한 경우에 이렇게 뜬다)
...
>conda list
...
tensorflow 1.5.0
>pip freeze
tensorflow==1.5.0
```
![20191126_052210](https://user-images.githubusercontent.com/39071798/69574927-b628ca80-100c-11ea-8a5a-4a32e5815205.png)

> 드디어... 원래 깔려있던 아나콘다와 파이썬을 모두 지우고 원래 목표로했던 파이썬 3.6버전을 아나콘다로 설치하고 텐써플로우를 1.5버전으로 설치했다.

* 이제 원래 했던 예제를 실행해보겠다...제발

`Not Fix Error`
```
>python
>>>import tensorflow as tf
>>>hello = tf.constant('Hello, TensorFlow!')
>>>sess = tf.Session()
>>>print(sess.run(hello))
b'Hello, TensorFlow!'
```
![20191126_052312](https://user-images.githubusercontent.com/39071798/69575046-df495b00-100c-11ea-93c4-a10bc20bbbd1.png)

* b가 출력되는건 문자열 형태가 byte형태로 나타내지기 때문에 그렇단다

* 이제 Python 인터프리터로 확인해보겠다.
```
C:\ProgramData\Anaconda3\Lib\idlelib(나같은 경우)
C:\Anaconda3\Lib\idlelib(다른분들)
```
이 경로로 이동을 해서 idle.bat파일을 우클릭-보내기-바탕화면에 바로가기 만들기를 해준다

![20191126_053750](https://user-images.githubusercontent.com/39071798/69576073-ea04ef80-100e-11ea-9858-4c7bc07179ed.png)

* 실행을 해준다

![20191126_055541](https://user-images.githubusercontent.com/39071798/69577295-6dbfdb80-1011-11ea-89f8-c1c046d4a6bb.png)

~~ㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂ~~

* 졸라게 검색해본 결과 다시 지우고 설치하는 방법이 있는데..

Link : [새로운 가상환경을 만들어서 해보란다](https://github.com/tensorflow/tensorflow/issues/27935)

* 아니면 쥬피터 노트북 아니면 스파이더에서 코딩하는 방법이 있다 해보자 나 아직 안죽었다 ~~지금 새벽 6시~~

* 쥬피터 노트북 설치해서 웹으로 돌리던중 노트북을 오래써서 그런지는 모르겠지만 너무 느려터져서 스파이더를 설치해보았다.

---

## 해결했다

* 다 때려치고 ㅋㅋ나의 첫 텐서플로우 초기설정은 인터넷보고하는건 포기하기로 했다. 결국 다 지웠다.

* 저녁11시부터 아침 8시까지 하다가 안되서 자려다가 책을 펴봤다. update같은거 안하고 했다 그리고 성공했다...

>> Anaconda로 설치를 했다. 버전은 최신버전이 아닌 위에 링크된 5.2.0버전

* 초기에 텐서플로우 2.0 버전일때 다른 문법(2.0ver)을 쓰면 실행이 되긴했다. 하지만 예제들과 호환되는건 1.x버전이다 

* <strong>팬더스(pandas)</strong> : 데이터를 수정하고 목적에 맞게 변경하는 데 사용되는 파이썬 라이브러리이다.
* <strong>넘파이(NumPy)</strong> : 머신러닝의 입력값으로 사용되는 벡터 및 행렬을 수정하고 목적에 맞게 변경하는 데 사용되는 파이썬 라이브러리이다.
* <strong>케라스(Keras)</strong> : 딥러닝 모델을 손쉽게 구현하고 실험하는 데 중점을 둔 딥러닝 상위 레벨 파이썬 라이브러리이다.
* <strong>텐서플로(TensorFlow)</strong> : 딥러닝 모델의 상용화를 중점으로 둔 딥러닝 상위 및 하위 레벨 파이썬 라이브러리이다.
* <strong>사이킷런(sciket-learn)</strong> : 대표적인 파이썬 머신러닝 라이브러리이다.
* <strong>씨본(seaborn)</strong> : 데이터 시각화 파이썬 라이브러리이다. 맷플롯립(Matplotlib)이라는 데이터 시각화 파이썬 라이브러리를 바탕으로 구현.
* <strong>주피터 노트북(Jupyter Notebook)</strong> : 웹 IDE이다. PC는 빠르다던데 노트북은 느려서..나는 스파이더를 이용한다
* <strong>스파이더(Spyder)</strong> : 프로그램 IDE이다. 일반 Python IDLE 또는 주피터 노트북, 스파이더중에서 골라서 개발을 한다고 한다.

---

```
>(base)conda create -n test python=3.6.4
>(base)conda activate test
>(test)conda install pandas=0.22.0
>(test)conda install numpy=1.14.1
>(test)conda install keras=2.1.6
>(test)pip install tensorflow==1.8
>(test)conda install scikit-learn=0.19.1
>(test)conda install seaborn=0.8.1
>(test)conda install jupyter notebook
>(test)conda install spyder
```

## 참고로 노트북이라 그런지 쥬피터서버는 너무 느려터져서 나는 스파이더를 깔고 실행을 했다.

> 쥬피터 실행은 jupyter notebook / 스파이더 실행은 spyder이다(꼭 activate base가 아닌 자기가 create한 가상환경에서 하자!)

* 해보니까 idle에서는 다 모듈에러가 뜨는것 같다

![20191126_153957](https://user-images.githubusercontent.com/39071798/69605297-19454c00-1063-11ea-99ba-247711083eac.png)

```python
Python 3.6.4 |Anaconda, Inc.| (default, Mar 12 2018, 20:20:50) [MSC v.1900 64 bit (AMD64)]
Type "copyright", "credits" or "license" for more information.

IPython 7.9.0 -- An enhanced Interactive Python.

import tensorflow as tf

hello = tf.constant('Hello, TensorFlow!')
#hello = tf.constant('안녕, 텐서플로우!')
sess = tf.Session()

print(sess.run(hello))
#print(sess.run(hello).decode('UTF-8'))
b'Hello, TensorFlow!'

```

## 다했다.. 이제부터 딱 이 환경설정 그대로 진행할것이다

* #된 코드는 한글을 출력하는 코드이다. 꼭 UTF-8로 맞춰줘야 한글이 출력될 수 있다

> 인터넷이 만능이 아니다. 안될때는 책에 적힌 그대로 따라해봐도 좋을것 같다.

* 참고도서 : [나의 첫 머신러닝/딥러닝(위키북스)](https://book.naver.com/bookdb/book_detail.nhn?bid=14414154)
* 참고사이트 : [수박님 네이버 블로그](https://m.blog.naver.com/hobbang143/221461726444)

