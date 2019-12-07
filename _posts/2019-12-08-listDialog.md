---
layout: post
title: " ListDialog를 써서 사용자 정보 입력 앱 만들기 "
categories: android
author: boki
tags: ContextMenu
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## listDialog를 이용한다

![image](https://user-images.githubusercontent.com/39071798/70379552-61bd0d80-1971-11ea-9537-fb7548abbe87.png)

![image](https://user-images.githubusercontent.com/39071798/70379556-77323780-1971-11ea-96d4-86ac9592a8a8.png)

* 추가로 dialog1.xml, toast1.xml을 만들어준다
![image](https://user-images.githubusercontent.com/39071798/70379564-93ce6f80-1971-11ea-9b72-5bab44ea07b9.png)

`dialog1.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <TextView android:text="사용자 이름"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />
    <EditText android:id="@+id/dlgEdt1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />
    <TextView android:text="이메일"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />
    <EditText android:id="@+id/dlgEdt2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content" />
</LinearLayout>
```

`toast1.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="horizontal"
    android:background="#FF0000"
    android:gravity="center">
    <ImageView android:src="@drawable/icon1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />

    <TextView android:id="@+id/toastText1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="TextView"
        android:textSize="20dp"/>

    <ImageView android:src="@drawable/icon1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
</LinearLayout>
```

`activity_main.xml
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity"
    android:orientation="vertical"
    android:gravity="center_horizontal">

    <TextView android:id="@+id/tvName"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="사용자 이름"/>
    <TextView android:id="@+id/tvEmail"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="이메일"/>
    <Button android:id="@+id/button1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="여기를 클릭"/>
</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.listdialog;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    TextView tvName, tvEmail;
    Button button1;
    EditText dlgEdtName, dlgEdtEmail;
    TextView toastText;
    View dialogView, toastView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("사용자 정보 입력");

        tvName = (TextView)findViewById(R.id.tvName);
        tvEmail = (TextView)findViewById(R.id.tvEmail);
        button1 = (Button)findViewById(R.id.button1);
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialogView = (View)View.inflate(MainActivity.this, R.layout.dialog1, null); // dialog1.xml파일을 inflate하여 dialogView에 대입
                AlertDialog.Builder dlg = new AlertDialog.Builder(MainActivity.this);
                dlg.setTitle("사용자 정보 입력");
                dlg.setIcon(R.drawable.icon1);
                dlg.setView(dialogView); // 인플레이트한 뷰를 대화상자로 사용
                dlg.setPositiveButton("확인", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dlgEdtName = (EditText)dialogView.findViewById(R.id.dlgEdt1);
                        dlgEdtEmail = (EditText)dialogView.findViewById(R.id.dlgEdt2);
                        tvName.setText(dlgEdtName.getText().toString());
                        tvEmail.setText(dlgEdtEmail.getText().toString());
                    }
                });
                dlg.setNegativeButton("취소", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Toast toast = new Toast(MainActivity.this);
                        toastView = (View)View.inflate(MainActivity.this, R.layout.toast1, null); // toast1.xml파일을 inflate하여 toastView에 대입
                        toastText = (TextView)toastView.findViewById(R.id.toastText1);
                        toastText.setText("취소했습니다");
                        toast.setView(toastView);
                        toast.show();
                    }
                });
                dlg.show();
            }
        });
    }
}
```

### 결과 화면

![image](https://user-images.githubusercontent.com/39071798/70379616-2c64ef80-1972-11ea-8771-50d8d56eef1f.png)

![image](https://user-images.githubusercontent.com/39071798/70379619-3f77bf80-1972-11ea-9b96-00fab8b7ee1e.png)

![image](https://user-images.githubusercontent.com/39071798/70379624-47cffa80-1972-11ea-9a03-2ef06012a713.png)

![image](https://user-images.githubusercontent.com/39071798/70379627-51596280-1972-11ea-9d01-67d6abd55e79.png)
