---
layout: post
title: " ImageView를 이용하지않고 Bitmap을 이용해서 이미지 출력 "
categories: android
author: boki
tags: Bitmap BitmapFactory MyGraphicView
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---
## View 클래스를 상속받아 새로운 클래스를 만들고 onDraw를 재정의해준다

![image](https://user-images.githubusercontent.com/39071798/70383814-8cca5000-19b7-11ea-9325-c84ae2542fd2.png)

![image](https://user-images.githubusercontent.com/39071798/70383816-99e73f00-19b7-11ea-964b-b5274f5cbd3e.png)

### 미리 자신이 준비한 그림파일들을 drawble 폴더에 넣어주자
#### 파일 Ctrl+C 해주고 자기만의 IDE에서 drawable 폴더를 선택한 채로 Ctrl+V해주면 된다

* 이름을 클릭하면 원본 크기로 파일을 다운받을 수 있다

![jeju14](https://user-images.githubusercontent.com/39071798/70384690-1da82800-19c6-11ea-93ed-43e823e6df7e.jpg)
[jeju14](https://user-images.githubusercontent.com/39071798/70384690-1da82800-19c6-11ea-93ed-43e823e6df7e.jpg)

`activity_main.xml`
```html
필요없다~! java에서 View를 커스터마이징해줄거니깐
```

`MainActivity.java`

```java
package com.example.boki.basicbitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
        //TODO 클래스를 직접 setContentView할거임
        setContentView(new MyGraphicView(this));
    }

    private static class MyGraphicView extends View {
        public MyGraphicView(Context context) {
            super(context);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            Bitmap picture = BitmapFactory.decodeResource(getResources(),R.drawable.jeju14);
            int picX = (this.getWidth() - picture.getWidth()) / 2;
            int picY = (this.getHeight() - picture.getHeight()) / 2;
            canvas.drawBitmap(picture, picX, picY, null);
            picture.recycle();
        }
    }
}

```

### 실행화면

![image](https://user-images.githubusercontent.com/39071798/70383825-d5820900-19b7-11ea-9dc2-f494ee26d61e.png)
