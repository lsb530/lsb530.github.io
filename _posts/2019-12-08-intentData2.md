---
layout: post
title: " (명시적 인텐트)Intent를 이용해 다른 액티비티와 데이터 송수신2 "
categories: android
author: boki
tags: Activity Intent data
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## intent를 이용해서 두 액티비티 간에 데이터를 전송하고 계산된 값을 넘겨본다2

![image](https://user-images.githubusercontent.com/39071798/70384181-301e6380-19be-11ea-9ce3-0d935c96816b.png)

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

    <EditText android:id="@+id/editNum1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="숫자1"
        android:inputType="number"/>

    <EditText android:id="@+id/editNum2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="숫자2"
        android:inputType="number"/>

    <Button android:id="@+id/btnCalc"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="두 숫자의 곱 계산"/>
</LinearLayout>
```

`activity_sub.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <TextView android:id="@+id/textNum1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="숫자1"
        android:textSize="16dp"/>
    <TextView android:id="@+id/textNum2"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="숫자2"
        android:textSize="16dp"/>
    <Button android:id="@+id/btnQuit"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="화면 닫기"/>
</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.datatrans;

import android.content.Intent;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private EditText mEditNum1;
    private EditText mEditNum2;
    private Button btnCalc;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mEditNum1 = (EditText)findViewById(R.id.editNum1);
        mEditNum2 = (EditText)findViewById(R.id.editNum2);
        btnCalc = (Button)findViewById(R.id.btnCalc);

        btnCalc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), SubActivity.class);
                intent.putExtra("num1", Integer.parseInt(mEditNum1.getText().toString()));
                intent.putExtra("num2", Integer.parseInt(mEditNum2.getText().toString()));
                startActivityForResult(intent, 0);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if(requestCode == 0 && resultCode == RESULT_OK) {
            int result = data.getIntExtra("result", 0);
            Toast.makeText(this, "두 숫자의 곱: " + result, Toast.LENGTH_SHORT).show();
        }
        super.onActivityResult(requestCode, resultCode, data);
    }
}

```

`SubActivity.java`
```java
package com.example.boki.datatrans;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Locale;

public class SubActivity extends Activity {

    private int num1;
    private int num2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sub);

        TextView textNum1 = (TextView)findViewById(R.id.textNum1);
        TextView textNum2 = (TextView)findViewById(R.id.textNum2);
        Button btnQuit = (Button)findViewById(R.id.btnQuit);

        Intent intent = getIntent();
        num1 = intent.getIntExtra("num1", -1);
        num2 = intent.getIntExtra("num2", -1);
        if ( num1 != -1 && num2 != -1) {
            textNum1.setText(String.format(Locale.KOREAN, "숫자1: %d", num1));
            textNum2.setText(String.format(Locale.KOREAN, "숫자2: %d", num2));
        }

        btnQuit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent data = new Intent();
                data.putExtra("result", num1 * num2);
                setResult(RESULT_OK, data);
                finish();
            }
        });
    }
}

```

`AndroidManifest.xml`
```
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.datatrans">

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
        <activity android:name=".SubActivity"/>
    </application>

</manifest>
```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70384406-5560a100-19c1-11ea-9b90-7d56d0c7e531.png)

![image](https://user-images.githubusercontent.com/39071798/70384411-5c87af00-19c1-11ea-82a8-3f40a1f37096.png)

![image](https://user-images.githubusercontent.com/39071798/70384414-63aebd00-19c1-11ea-9bb1-5db81d9429a5.png)
