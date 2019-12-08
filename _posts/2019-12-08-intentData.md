---
layout: post
title: " (명시적 인텐트)Intent를 이용해 다른 액티비티와 데이터 송수신1 "
categories: android
author: boki
tags: Activity Intent data
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## intent를 이용해서 두 액티비티 간에 데이터를 전송하고 계산된 값을 넘겨본다

![image](https://user-images.githubusercontent.com/39071798/70384136-5394de80-19bd-11ea-81f9-2819d473d62a.png)

* 이제는 액티비티를 추가하면 AndroidManifest.xml에 새로운 액티비티 태그를 추가시켜줘야되는것을 알 것이다


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

    <EditText android:id="@+id/edtNum1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="1번째 숫자"/>
    <EditText android:id="@+id/edtNum2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="2번째 숫자"/>
    <Button android:id="@+id/btnNewActivity"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="더하기"/>

</LinearLayout>
```

`second.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="match_parent">
    <Button android:id="@+id/btnReturn"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="돌아가기"/>
</LinearLayout>
```

`SecondActivity.java`
```java
package com.example.boki.dataintent;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SecondActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.second);
        setTitle("Second 액티비티");

        Intent inIntent = getIntent();
        final int hapValue = inIntent.getIntExtra("Num1", 0) + inIntent.getIntExtra("Num2", 0);

        Button btnReturn = (Button)findViewById(R.id.btnReturn);
        btnReturn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent outIntent = new Intent(getApplicationContext(), MainActivity.class);
                outIntent.putExtra("Hap", hapValue);
                setResult(RESULT_OK, outIntent);
                finish();
            }
        });
    }
}

```

`MainActivity.java`
```java
package com.example.boki.dataintent;

import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("메인 액티비티");

        Button btnNewActivity = (Button)findViewById(R.id.btnNewActivity);
        btnNewActivity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText edtNum1 = (EditText)findViewById(R.id.edtNum1);
                EditText edtNum2 = (EditText)findViewById(R.id.edtNum2);
                Intent intent = new Intent(getApplicationContext(), SecondActivity.class);
                intent.putExtra("Num1",Integer.parseInt(edtNum1.getText().toString()));
                intent.putExtra("Num2",Integer.parseInt(edtNum2.getText().toString()));
                startActivityForResult(intent, 0);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(resultCode == RESULT_OK) {
            int hap = data.getIntExtra("Hap", 0);
            Toast.makeText(getApplicationContext(), "합계 :" +hap, Toast.LENGTH_SHORT).show();
        }
    }
}

```

`AndroidManifest.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.dataintent">

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
        <activity android:name=".SecondActivity" android:label="Second 액티비티"/>
    </application>

</manifest>
```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70384159-d453da80-19bd-11ea-8336-4a4d2d931de0.png)

![image](https://user-images.githubusercontent.com/39071798/70384161-da49bb80-19bd-11ea-8757-05f43d16728a.png)

![image](https://user-images.githubusercontent.com/39071798/70384164-e46bba00-19bd-11ea-9e4a-273f9d73479f.png)
