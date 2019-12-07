---
layout: post
title: " 간단 웹 뷰 만들어보기 "
categories: android
author: boki
tags: WebView
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## 간단한 웹뷰를 만들어봅니다

![image](https://user-images.githubusercontent.com/39071798/70379009-00923b80-196b-11ea-96b2-9ed0513c70b5.png)

![image](https://user-images.githubusercontent.com/39071798/70379013-0851e000-196b-11ea-9197-0845107d8ecd.png)


### manifests->AndroidManifest.xml에서 추가시켜주자
* <application 행 위에 다음 한 행을 추가한다 - 인터넷 사용권한을 허용해주는 코드이다

```
<uses-permission android:name="android.permission.INTERNET"/>
```

`AndroidManifest.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.simplewebbrowser">

    <uses-permission android:name="android.permission.INTERNET"/>
    <application
        android:allowBackup="true"
        android:icon="@drawable/emo_im_cool"
        android:label="웹브라우저"
        android:logo="@drawable/web"
        android:roundIcon="@drawable/web"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity"
            android:label="간단 웹브라우저">
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
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <LinearLayout android:id="@+id/linearLayout1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">
        <EditText android:id="@+id/edtUrl"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:hint="URL을 입력하세요."
            android:singleLine="true"/>
        <Button android:id="@+id/btnGo"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="이동"/>
        <Button android:id="@+id/btnBack"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="이전"/>
    </LinearLayout>

    <WebView android:id="@+id/webView1"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:clickable="true">

    </WebView>
</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.simplewebbrowser;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;

@SuppressWarnings("deprecation")
public class MainActivity extends AppCompatActivity {

    EditText edtUrl;
    Button btnGo, btnBack;
    WebView web;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        edtUrl = (EditText)findViewById(R.id.edtUrl);
        btnGo = (Button)findViewById(R.id.btnGo);
        btnBack = (Button)findViewById(R.id.btnBack);
        web = (WebView)findViewById(R.id.webView1);

        web.setWebViewClient(new CookWebViewClient());

        WebSettings webSet = web.getSettings();
        webSet.setBuiltInZoomControls(true);

        btnGo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                web.loadUrl(edtUrl.getText().toString());
            }
        });

        btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                web.goBack();
            }
        });
    }

    public class CookWebViewClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return super.shouldOverrideUrlLoading(view, url);
        }

    }
}

```

![image](https://user-images.githubusercontent.com/39071798/70379117-063c5100-196c-11ea-93be-9a05f86728cf.png)

### 결과 화면

![image](https://user-images.githubusercontent.com/39071798/70379125-15bb9a00-196c-11ea-8c8f-99804129b168.png)

![image](https://user-images.githubusercontent.com/39071798/70379137-2cfa8780-196c-11ea-886f-d3cd79b1f244.png)


