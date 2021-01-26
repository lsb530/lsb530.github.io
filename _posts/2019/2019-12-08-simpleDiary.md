---
layout: post
title: " 간단한 일기장 앱 만들기 "
categories: android
author: boki
tags: Diary DatePicker File
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## 내장 메모리 파일 처리를 이용한다

![image](https://user-images.githubusercontent.com/39071798/70383700-905cd780-19b5-11ea-81cf-4e61f77a9054.png)

`activity_main.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:orientation="vertical"
    android:gravity="center"
    tools:context=".MainActivity">

    <DatePicker android:id="@+id/datePicker1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:datePickerMode="spinner"
        android:calendarViewShown="false"></DatePicker>
    <EditText android:id="@+id/edtDiary"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_weight="1"
        android:background="#00FF00"
        android:lines="8"/>
    <Button android:id="@+id/btnWrite"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:enabled="false"
        android:text="Button"/>
</LinearLayout>
```

#### package 부분은 개개인마다 다르므로 import 구문부터 복사하는 것을 권장한다
#### 추가로 MainActivity이름도 다를 수 있기때문에 주의해서 복사하고, 복사보다는 직접 쳐보는 것을 권장하는 바이다

`MainActivity.java`
```java
package com.example.boki.simplediary;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    DatePicker dp;
    EditText editDiary;
    Button btnWrite;
    String fileName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("간단 일기장");
        dp = (DatePicker)findViewById(R.id.datePicker1);
        editDiary = (EditText)findViewById(R.id.edtDiary);
        btnWrite = (Button)findViewById(R.id.btnWrite);

        //Todo 데이트피커 설정
        Calendar cal = Calendar.getInstance();
        int cYear = cal.get(Calendar.YEAR);
        int cMonth = cal.get(Calendar.MONTH);
        int cDay = cal.get(Calendar.DAY_OF_MONTH);

        dp.init(cYear, cMonth, cDay, new DatePicker.OnDateChangedListener() {
            @Override
            public void onDateChanged(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                fileName = Integer.toString(year) + "_" + Integer.toString(monthOfYear + 1) + "_" + Integer.toString(dayOfMonth) + ".txt";
                // month는 0부터 시작이 되어서 우리가 10을 선택해도 9가 되기때문에 1을 더해줬다
                String str = readDiary(fileName); // 현재 날짜의 파일을 읽어오는 메소드
                editDiary.setText(str);
                btnWrite.setEnabled(true);
            }
        });
        //Todo 버튼 클릭 리스너
        btnWrite.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try{
                    FileOutputStream outFs = openFileOutput(fileName, Context.MODE_PRIVATE);
                    String str = editDiary.getText().toString();
                    outFs.write(str.getBytes());
                    outFs.close();
                    Toast.makeText(getApplicationContext(),fileName+" 이 저장됨", Toast.LENGTH_SHORT).show();
                    readDiary(fileName);
                } catch (IOException e) {

                }
            }
        });
    }
    //Todo 현재 날짜의 파일을 얻어 일기 내용을 반환
    String readDiary(String fName) {
        String diaryStr = null;
        FileInputStream inputStream;
        try {
            inputStream = openFileInput(fName);
            byte[] txt = new byte[500];
            inputStream.read(txt);
            inputStream.close();
            diaryStr = (new String(txt)).trim();
            btnWrite.setText("수정하기");
        } catch (IOException e) {
            editDiary.setHint("일기 없음");
            btnWrite.setText("새로 저장");
        }
        return diaryStr;
    }
}
```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70383763-97d0b080-19b6-11ea-8c2e-29e4a663d6f0.png)

![image](https://user-images.githubusercontent.com/39071798/70383767-adde7100-19b6-11ea-87ed-3268362b843d.png)

![image](https://user-images.githubusercontent.com/39071798/70383775-b46ce880-19b6-11ea-8934-7fe31376f801.png)
