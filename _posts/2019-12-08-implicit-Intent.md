---
layout: post
title: " 간단한 암시적(Implicit) 인텐트 앱 "
categories: android
author: boki
tags: Implicit Intent
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## implicit intent를 이용해서 여러가지 기능들을 동작해본다

* 먼저 AndroidManifest.xml에 uses-permission 권한을 3개 추가시켜준다

`AndroidManifest.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.implicitintent">
    <uses-permission android:name="android.permission.CALL_PHONE"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

`activity_main.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <Button android:id="@+id/btnDial"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="전화 걸기"/>
    <Button android:id="@+id/btnWeb"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="홈페이지 열기"/>
    <Button android:id="@+id/btnGoogle"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="구글 맵 열기"/>
    <Button android:id="@+id/btnSearch"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="구글 검색하기"/>
    <Button android:id="@+id/btnSms"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="문자 보내기"/>
    <Button android:id="@+id/btnPhoto"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="사진 찍기"/>

</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.implicitintent;

import android.app.SearchManager;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("암시적 인텐트 예제");

        Button btnDial = (Button)findViewById(R.id.btnDial);
        Button btnWeb = (Button)findViewById(R.id.btnWeb);
        Button btnGoogle = (Button)findViewById(R.id.btnGoogle);
        Button btnSearch = (Button)findViewById(R.id.btnSearch);
        Button btnSms = (Button)findViewById(R.id.btnSms);
        Button btnPhoto = (Button)findViewById(R.id.btnPhoto);

        btnDial.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Uri uri = Uri.parse("tel:01012345678");
                Intent intent = new Intent(Intent.ACTION_DIAL, uri);
                startActivity(intent);
            }
        });

        btnWeb.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Uri uri = Uri.parse("http://www.hanbit.co.kr");
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                startActivity(intent);
            }
        });

        btnGoogle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Uri uri = Uri.parse("http://maps.google.com/maps?q="+37.554264+","+126.913598);
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                startActivity(intent);
            }
        });

        btnSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_WEB_SEARCH);
                intent.putExtra(SearchManager.QUERY, "안드로이드");
                startActivity(intent);
            }
        });

        btnSms.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_SENDTO);
                intent.putExtra("sms_body", "안녕하세요?");
                intent.setData(Uri.parse("smsto:"+Uri.encode("010-1234-4567")));
                startActivity(intent);
            }
        });

        btnPhoto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivity(intent);
            }
        });
    }
}

```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70384459-1c74fc00-19c2-11ea-9589-ef0fe411450e.png)