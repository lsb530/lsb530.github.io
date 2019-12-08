---
layout: post
title: " 뷰 플리퍼를 이용하여 자동 사진보기 앱을 만들어보자 "
categories: android
author: boki
tags: ViewFlipper ViewContainer Flipping
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## 뷰플리퍼를 이용하여 자동 사진 보기앱 예제

* 자동으로 돌아가는 사진앱이다

![image](https://user-images.githubusercontent.com/39071798/70378462-f456b000-1963-11ea-8a13-ee945c28c905.png)

### 미리 자신이 준비한 그림파일들을 drawble 폴더에 넣어주자
#### 파일 Ctrl+C 해주고 자기만의 IDE에서 drawable 폴더를 선택한 채로 Ctrl+V해주면 된다

* 이름을 클릭하면 원본 크기로 파일을 다운받을 수 있다

![honeycomb](https://user-images.githubusercontent.com/39071798/70384498-a58c3300-19c2-11ea-8fdc-4c0ba5f375e5.jpg){: width="20%" height="20%"}[honeycomb](https://user-images.githubusercontent.com/39071798/70384498-a58c3300-19c2-11ea-8fdc-4c0ba5f375e5.jpg)

![cupcake](https://user-images.githubusercontent.com/39071798/70384499-a58c3300-19c2-11ea-9bb5-6bb83265f3f0.jpg){: width="20%" height="20%"}
[cupcake](https://user-images.githubusercontent.com/39071798/70384499-a58c3300-19c2-11ea-9bb5-6bb83265f3f0.jpg)

![donut](https://user-images.githubusercontent.com/39071798/70384500-a624c980-19c2-11ea-8c19-e5842244252e.jpg){: width="20%" height="20%"}
[donut](https://user-images.githubusercontent.com/39071798/70384500-a624c980-19c2-11ea-8c19-e5842244252e.jpg)

![eclair](https://user-images.githubusercontent.com/39071798/70384501-a624c980-19c2-11ea-90bd-6d17f2bd8b7c.jpg){: width="20%" height="20%"}
[eclair](https://user-images.githubusercontent.com/39071798/70384501-a624c980-19c2-11ea-90bd-6d17f2bd8b7c.jpg)

`activity_main.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity"
    android:orientation="vertical">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">
        <Button android:id="@+id/btnStart"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="사진보기 시작"/>
        <Button android:id="@+id/btnStop"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="사진보기 정지"/>
    </LinearLayout>

    <ViewFlipper android:id="@+id/viewFlipper1"
        android:layout_width="match_parent"
        android:layout_height="match_parent">
        <ImageView android:id="@+id/imageView1"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/cupcake"/>
        <ImageView android:id="@+id/imageView2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/donut"/>
        <ImageView android:id="@+id/imageView3"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/eclair"/>
        <ImageView android:id="@+id/imageView4"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:src="@drawable/honeycomb"/>
    </ViewFlipper>
</LinearLayout>
```

#### package 부분은 개개인마다 다르므로 import 구문부터 복사하는 것을 권장한다
#### 추가로 MainActivity이름도 다를 수 있기때문에 주의해서 복사하고, 복사보다는 직접 쳐보는 것을 권장하는 바이다

`MainActivity.java`
```java
package com.example.boki.viewflipper;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ViewFlipper;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btnStart, btnStop;
        final ViewFlipper viewFlipper;

        btnStart = (Button)findViewById(R.id.btnStart);
        btnStop = (Button)findViewById(R.id.btnStop);

        viewFlipper = (ViewFlipper)findViewById(R.id.viewFlipper1);

        viewFlipper.setFlipInterval(1000);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewFlipper.startFlipping();
            }
        });
        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewFlipper.stopFlipping();
            }
        });
    }
}
```

### 결과 화면

![image](https://user-images.githubusercontent.com/39071798/70378508-67602680-1964-11ea-9f98-93502590f655.png)

![image](https://user-images.githubusercontent.com/39071798/70378512-76df6f80-1964-11ea-8085-602e739eb4c9.png)

