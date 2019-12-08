---
layout: post
title: " Intent를 이용해 다른 액티비티 이동 "
categories: android
author: boki
tags: Activity Intent
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## xml과 java를 이용해 Activity를 추가해서 화면이동을 해본다

* second.xml과 third.xml을 추가하고 SecondActivity.java와 ThirdActivity.java를 추가한다

![image](https://user-images.githubusercontent.com/39071798/70383983-b9cc3200-19ba-11ea-82c3-a9e95d7e8196.png)

![image](https://user-images.githubusercontent.com/39071798/70383981-b3d65100-19ba-11ea-9d66-9f77adf5613c.png)

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

    <RadioGroup android:id="@+id/gradioGroup1"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content">

        <RadioButton android:id="@+id/rdoSecond"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:checked="true"
            android:text="Second 액티비티"/>

        <RadioButton android:id="@+id/rdoThird"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:checked="true"
            android:text="Third 액티비티"/>
    </RadioGroup>
    <Button android:id="@+id/btnNewActivity"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="새 화면 열기"/>
</LinearLayout>
```

`second.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#00FF00">

    <Button android:id="@+id/btnReturn"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="돌아가기"/>

</LinearLayout>
```

`third.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#00FFFF">

    <Button android:id="@+id/btnReturn"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="돌아가기"/>

</LinearLayout>
```

`SecondActivity.java`
```java
package com.example.boki.intentbasic;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SecondActivity extends Activity {

    @Override
    protected void onCreate( Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.second);

        Button btnReturn = (Button)findViewById(R.id.btnReturn);
        btnReturn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
```

`ThirdActivity.java`
```java
package com.example.boki.intentbasic;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ThirdActivity extends Activity {

    @Override
    protected void onCreate( Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.third);

        Button btnReturn = (Button)findViewById(R.id.btnReturn);
        btnReturn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}

```

`MainActivity.java`
```java
package com.example.boki.intentbasic;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RadioButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("메인 액티비티 (수정)");

        final RadioButton rdoSecond = (RadioButton) findViewById(R.id.rdoSecond);

        Button btnNewActivity = (Button)findViewById(R.id.btnNewActivity);
        btnNewActivity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent;

                if(rdoSecond.isChecked() == true) intent = new Intent(getApplicationContext(), SecondActivity.class);
                else intent = new Intent(getApplicationContext(), ThirdActivity.class);
                
                startActivity(intent);
            }
        });
    }
}

```

* 추가적으로 새로운 액티비티를 추가했으면 manifest.xml에 추가해야 한다.
* activity 태그를 추가시켜준다

`AndroidManifest.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.intentbasic">

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
        <activity android:name=".ThirdActivity" android:label="Thrid 액티비티"/>
    </application>

</manifest>
```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70384028-876f0480-19bb-11ea-8d49-0ca172569b0f.png)

![image](https://user-images.githubusercontent.com/39071798/70384029-8d64e580-19bb-11ea-8822-d8a750553d4b.png)
