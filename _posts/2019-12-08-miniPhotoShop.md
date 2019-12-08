---
layout: post
title: " 미니 포토샵 앱 만들기 "
categories: android
author: boki
tags: iconLayout pictureLayout Bitmap inflate
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## View를 상속받은 클래스를 만들어서 inflate를 해준다

![image](https://user-images.githubusercontent.com/39071798/70383869-c51e5e00-19b8-11ea-86f8-2b31aa47c791.png)

![image](https://user-images.githubusercontent.com/39071798/70383872-d1a2b680-19b8-11ea-85fa-bf891d5e57b5.png)

### 미리 자신이 준비한 그림파일들을 drawble 폴더에 넣어주자
#### 파일 Ctrl+C 해주고 자기만의 IDE에서 drawable 폴더를 선택한 채로 Ctrl+V해주면 된다

* 이름을 클릭하면 원본 크기로 파일을 다운받을 수 있다

![lena256](https://user-images.githubusercontent.com/39071798/70384604-88f0fa80-19c4-11ea-8e3c-766019db5063.jpg){: width="20%" height="20%"}
[lena256](https://user-images.githubusercontent.com/39071798/70384604-88f0fa80-19c4-11ea-8e3c-766019db5063.jpg)

![bright](https://user-images.githubusercontent.com/39071798/70384608-93ab8f80-19c4-11ea-8b59-e0be7f7e34ce.png)
[bright](https://user-images.githubusercontent.com/39071798/70384608-93ab8f80-19c4-11ea-8b59-e0be7f7e34ce.png)

![dark](https://user-images.githubusercontent.com/39071798/70384610-93ab8f80-19c4-11ea-997d-10ee4a637621.png)
[dark](https://user-images.githubusercontent.com/39071798/70384610-93ab8f80-19c4-11ea-997d-10ee4a637621.png)

![gray](https://user-images.githubusercontent.com/39071798/70384611-94442600-19c4-11ea-9a5f-d4861cb37cc4.png)
[gray](https://user-images.githubusercontent.com/39071798/70384611-94442600-19c4-11ea-9a5f-d4861cb37cc4.png)

![rotate](https://user-images.githubusercontent.com/39071798/70384612-94442600-19c4-11ea-9e2c-fea1277a8b07.png)
[rotate](https://user-images.githubusercontent.com/39071798/70384612-94442600-19c4-11ea-9e2c-fea1277a8b07.png)

![zoom_in](https://user-images.githubusercontent.com/39071798/70384613-94442600-19c4-11ea-9c7d-22e420219dd6.png)
[zoom_in](https://user-images.githubusercontent.com/39071798/70384613-94442600-19c4-11ea-9c7d-22e420219dd6.png)

![zoom_out](https://user-images.githubusercontent.com/39071798/70384614-94442600-19c4-11ea-9398-826bbad4bdb8.png)
[zoom_out](https://user-images.githubusercontent.com/39071798/70384614-94442600-19c4-11ea-9398-826bbad4bdb8.png)

`AndroidManifest.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.boki.miniphotoshop">

    <application
        android:allowBackup="true"
        android:icon="@drawable/lena256"
        android:hardwareAccelerated="false"
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
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:orientation="vertical"
    tools:context=".MainActivity">

    <LinearLayout android:id="@+id/iconLayout"
        android:layout_width="fill_parent"
        android:layout_height="0dip"
        android:layout_weight="1"
        android:gravity="center"
        android:orientation="horizontal">
        <ImageButton android:id="@+id/ibZoomin"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/zoom_in"/>
        <ImageButton android:id="@+id/ibZoomout"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/zoom_out"/>
        <ImageButton android:id="@+id/ibRotate"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/rotate"/>
        <ImageButton android:id="@+id/ibBright"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/bright"/>
        <ImageButton android:id="@+id/ibDark"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/dark"/>
        <ImageButton android:id="@+id/ibGray"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/gray"/>
    </LinearLayout>

    <LinearLayout android:id="@+id/pictureLayout"
        android:layout_width="fill_parent"
        android:layout_height="0dip"
        android:layout_weight="9"
        android:gravity="center"
        android:orientation="horizontal">
    </LinearLayout>

</LinearLayout>
```

#### package 부분은 개개인마다 다르므로 import 구문부터 복사하는 것을 권장한다
#### 추가로 MainActivity이름도 다를 수 있기때문에 주의해서 복사하고, 복사보다는 직접 쳐보는 것을 권장하는 바이다

`MainActivity.java`
```java
package com.example.boki.miniphotoshop;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    ImageButton ibZoomin, ibZoomout, ibRotate, ibBright, ibDark, ibGray;
    MyGraphicView graphicView;
    static float scaleX = 1, scaleY = 1;
    static float angle = 0;
    static float color = 1;
    static float satur = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("미니 포토샵");

        LinearLayout pictureLayout = (LinearLayout)findViewById(R.id.pictureLayout);
        graphicView = (MyGraphicView) new MyGraphicView(this);
        pictureLayout.addView(graphicView);
//        setContentView(new MyGraphicView(this));
        clickIcons(); // 6개 아이콘을 클릭했을 때 수행할 기능을 메소드로 정의함
    } //onCreate

    private void clickIcons() {
        ibZoomin = (ImageButton)findViewById(R.id.ibZoomin);
        ibZoomin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                scaleX += 0.2f;
                scaleY += 0.2f;
                graphicView.invalidate();
            }
        }); // 확대아이콘 클릭리스너

        ibZoomout = (ImageButton)findViewById(R.id.ibZoomout);
        ibZoomout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                scaleX -= 0.2f;
                scaleY -= 0.2f;
                graphicView.invalidate();
            }
        }); // 축소아이콘 클릭리스너

        ibRotate = (ImageButton)findViewById(R.id.ibRotate);
        ibRotate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                angle += 20;
                graphicView.invalidate();
            }
        }); // 회전아이콘 클릭리스너

        ibBright = (ImageButton)findViewById(R.id.ibBright);
        ibBright.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                color += 0.2f;
                graphicView.invalidate();
            }
        }); // 밝기아이콘 클릭리스너

        ibDark = (ImageButton)findViewById(R.id.ibDark);
        ibDark.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                color -= 0.2f;
                graphicView.invalidate();
            }
        }); // 어둡게아이콘 클릭리스너

        ibGray = (ImageButton)findViewById(R.id.ibGray);
        ibGray.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (satur == 0) {
                    satur = 1;
                }
                else satur = 0;
                graphicView.invalidate();
            }
        }); // 흑백아이콘 클릭리스너
    }

    //TODO 임의 View클래스 만들기
    private static class MyGraphicView extends View {
        public MyGraphicView(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);

            int cenX = this.getWidth() / 2;
            int cenY = this.getHeight() / 2;
            canvas.scale(scaleX, scaleY, cenX, cenY);
            canvas.rotate(angle, cenX, cenY);

            Paint paint = new Paint();
            float[] array = {
                    color, 0, 0, 0, 0,
                    0, color, 0, 0, 0,
                    0, 0, color, 0, 0,
                    0, 0, 0, 1, 0
                            };
            ColorMatrix cm = new ColorMatrix(array);

            if(satur == 0)
                cm.setSaturation(satur);

            paint.setColorFilter(new ColorMatrixColorFilter(cm)); // paint 이게 satur 밑에 있어야 작동함!

            Bitmap picture = BitmapFactory.decodeResource(getResources(), R.drawable.lena256);
            int picX = (this.getWidth() - picture.getWidth()) / 2;
            int picY = (this.getHeight() - picture.getHeight()) / 2;
            canvas.drawBitmap(picture, picX, picY, paint);
            picture.recycle();
        }
    }
}
```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70383917-7624f880-19b9-11ea-8a82-fd9c17cab815.png)
