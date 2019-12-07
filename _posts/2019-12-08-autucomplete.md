---
layout: post
title: " 자동완성텍스트뷰와 멀티자동완성텍스트뷰 "
categories: android
author: boki
tags: AutoCompleteTextView MultiCompleteTextView
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## 자동완성텍스트뷰와 멀티자동완성텍스트뷰 예제

* 간단하게 자동으로 텍스트를 완성해주는 텍스트뷰를 작성해보려고한다

![image](https://user-images.githubusercontent.com/39071798/70378174-e05d7f00-1960-11ea-878f-4f9ca136fb78.png)

![image](https://user-images.githubusercontent.com/39071798/70378183-f10df500-1960-11ea-8876-a0496a024fd1.png)

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

    <AutoCompleteTextView android:id="@+id/autoCompleteTextView1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:completionHint="선택하세요"
        android:hint="자동완성텍스트뷰"
        android:completionThreshold="2"/>
    <MultiAutoCompleteTextView android:id="@+id/multiAutoCompleteTextView1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:completionHint="선택하세요"
        android:completionThreshold="2"
        android:hint="멀티자동완성텍스트뷰"/>

</LinearLayout>
```

### 이 밑의 부분을 작성할때는 package는 빼고 붙여넣기 하기를 바랍니다! 각자마다 해당되는 패키지는 다르기때문입니다.

`MainActivity.java`
```java
package com.example.boki.autocompletetextview;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.MultiAutoCompleteTextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        String [] items = { "CSI-뉴욕", "CSI-라스베가스", "CSI-마이애미", "Friends", "Fringe", "Lost" };

        AutoCompleteTextView auto = (AutoCompleteTextView)findViewById(R.id.autoCompleteTextView1);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_dropdown_item_1line, items);
        auto.setAdapter(adapter);

        MultiAutoCompleteTextView multi = (MultiAutoCompleteTextView)findViewById(R.id.multiAutoCompleteTextView1);
        MultiAutoCompleteTextView.CommaTokenizer token = new MultiAutoCompleteTextView.CommaTokenizer();
        multi.setTokenizer(token);
        multi.setAdapter(adapter);
    }
}
```

### 결과 화면

![image](https://user-images.githubusercontent.com/39071798/70378317-472f6800-1962-11ea-86e7-51681eb4662a.png)

![image](https://user-images.githubusercontent.com/39071798/70378327-5e6e5580-1962-11ea-9709-e745baf9a1a1.png)

![image](https://user-images.githubusercontent.com/39071798/70378337-76de7000-1962-11ea-881e-2564ee2773b8.png)