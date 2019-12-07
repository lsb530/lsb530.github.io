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

