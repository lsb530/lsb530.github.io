---
layout: post
title: " XML을 이용한 컨텍스트 메뉴 만들기 "
categories: android
author: boki
tags: ContextMenu
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## menu xml들을 이용해서 contextMenu를 만들어보자

![image](https://user-images.githubusercontent.com/39071798/70379228-74cdde80-196d-11ea-83e4-1dcc0feb643b.png)

![image](https://user-images.githubusercontent.com/39071798/70379233-80210a00-196d-11ea-8c1a-891bf4aff686.png)

* res 밑에 menu 폴더(directory)를 만들고, menu1.xml, menu2.xml을 만들어준다
![image](https://user-images.githubusercontent.com/39071798/70379300-3127a480-196e-11ea-8960-7a9dcaf439de.png)

`menu1.xml`
```
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@+id/itemRed"
        android:title="배경색(빨강)"/>
    <item android:id="@+id/itemGreen"
        android:title="배경색(초록)"/>
    <item android:id="@+id/itemBlue"
        android:title="배경색(파랑)"/>
</menu>
```

`menu2.xml`
```
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@+id/subRotate"
        android:title="버튼 45도 회전"/>
    <item android:id="@+id/subSize"
        android:title="버튼 2개 확대"/>
</menu>
```

`activity_main.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <LinearLayout android:id="@+id/baseLayout"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical"
        android:gravity="center_horizontal">
        <Button android:id="@+id/button1"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="배경색 변경"/>
        <Button android:id="@+id/button2"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="버튼 변경"/>
    </LinearLayout>

</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.contextmenuusingxml;

import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    LinearLayout baseLayout;
    Button button1, button2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("배경색 바꾸기(컨텍스트 메뉴)");
        baseLayout = (LinearLayout)findViewById(R.id.baseLayout);
        button1 = (Button)findViewById(R.id.button1);
        button2 = (Button)findViewById(R.id.button2);
        registerForContextMenu(button1);
        registerForContextMenu(button2);
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);

        MenuInflater mInflater = getMenuInflater();
        if (v == button1) {
            menu.setHeaderTitle("배경색 변경");
            mInflater.inflate(R.menu.menu1, menu);
        }
        if (v == button2) {
            menu.setHeaderTitle("버튼 변경");
            mInflater.inflate(R.menu.menu2, menu);
        }
    }

    @Override
    public boolean onContextItemSelected(MenuItem item) {
//        return super.onContextItemSelected(item);
        switch (item.getItemId()) {
            case R.id.itemRed:
                baseLayout.setBackgroundColor(Color.RED);
                return true;
            case R.id.itemGreen:
                baseLayout.setBackgroundColor(Color.GREEN);
                return true;
            case R.id.itemBlue:
                baseLayout.setBackgroundColor(Color.BLUE);
                return true;
            case R.id.subRotate:
                button1.setRotation(45);
                button2.setRotation(45);
                return true;
            case R.id.subSize:
                button1.setScaleX(2);
                button2.setScaleY(2);
                return true;
        } return false;
    }
}
```

### 결과 화면

![image](https://user-images.githubusercontent.com/39071798/70379258-ec037280-196d-11ea-8947-e0a87893024f.png)

![image](https://user-images.githubusercontent.com/39071798/70379260-f4f44400-196d-11ea-85c6-9a3fc440e2ce.png)

![image](https://user-images.githubusercontent.com/39071798/70379264-00476f80-196e-11ea-92f6-9b8a8b4bac8e.png)


