---
layout: post
title: " GirdView를 이용해 MoviePoster 만들기 "
categories: android
author: boki
tags: GridView MoviePoster
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## GirdView를 이용해 영화 포스터 앱을 만들어보자

* 목표

![image](https://user-images.githubusercontent.com/39071798/70386498-74b8f780-19dc-11ea-95c2-343d07d859ff.png)

* 영화 포스터

#### 다른 이름으로 저장해서 다운받기를 바란다

![mov01](https://user-images.githubusercontent.com/39071798/70386519-cceff980-19dc-11ea-9740-434ea215587f.jpg){: width="20%" height="20%"}
![mov02](https://user-images.githubusercontent.com/39071798/70386520-cceff980-19dc-11ea-9955-dd6040dad7d8.jpg){: width="20%" height="20%"}
![mov03](https://user-images.githubusercontent.com/39071798/70386521-cceff980-19dc-11ea-8d14-00a4e5f8f3d9.jpg){: width="20%" height="20%"}
![mov04](https://user-images.githubusercontent.com/39071798/70386522-cceff980-19dc-11ea-9976-b7d19513c35a.jpg){: width="20%" height="20%"}
![mov05](https://user-images.githubusercontent.com/39071798/70386523-cd889000-19dc-11ea-834e-4aa7b465c399.jpg){: width="20%" height="20%"}
![mov06](https://user-images.githubusercontent.com/39071798/70386524-cd889000-19dc-11ea-9387-71cabcf18579.jpg){: width="20%" height="20%"}
![mov07](https://user-images.githubusercontent.com/39071798/70386525-cd889000-19dc-11ea-9a00-78775d7f35b3.jpg){: width="20%" height="20%"}
![mov08](https://user-images.githubusercontent.com/39071798/70386526-cd889000-19dc-11ea-8a45-007299f05673.jpg){: width="20%" height="20%"}
![mov09](https://user-images.githubusercontent.com/39071798/70386527-ce212680-19dc-11ea-838a-f41eb74e241c.jpg){: width="20%" height="20%"}
![mov10](https://user-images.githubusercontent.com/39071798/70386528-ce212680-19dc-11ea-99af-4985c2bfa3eb.jpg){: width="20%" height="20%"}
![mov11](https://user-images.githubusercontent.com/39071798/70386529-ce212680-19dc-11ea-8590-3cf058e7403e.jpg){: width="20%" height="20%"}
![mov12](https://user-images.githubusercontent.com/39071798/70386530-ce212680-19dc-11ea-96f1-0aaac1772b8a.jpg){: width="20%" height="20%"}
![mov13](https://user-images.githubusercontent.com/39071798/70386531-ceb9bd00-19dc-11ea-9f8b-fc8cdfa752e6.jpg){: width="20%" height="20%"}
![mov14](https://user-images.githubusercontent.com/39071798/70386532-ceb9bd00-19dc-11ea-9a92-a87a5c55aa2d.jpg){: width="20%" height="20%"}
![mov15](https://user-images.githubusercontent.com/39071798/70386533-ceb9bd00-19dc-11ea-80ec-919b3a9d497f.jpg){: width="20%" height="20%"}
![mov16](https://user-images.githubusercontent.com/39071798/70386534-cf525380-19dc-11ea-9e83-537dc12a39bc.jpg){: width="20%" height="20%"}
![mov17](https://user-images.githubusercontent.com/39071798/70386535-cf525380-19dc-11ea-8aa1-a747a0cdd931.jpg){: width="20%" height="20%"}
![mov18](https://user-images.githubusercontent.com/39071798/70386536-cf525380-19dc-11ea-8895-89b4fe11e856.jpg){: width="20%" height="20%"}
![mov19](https://user-images.githubusercontent.com/39071798/70386537-cfeaea00-19dc-11ea-9a58-c03b3f24ccc5.jpg){: width="20%" height="20%"}
![mov20](https://user-images.githubusercontent.com/39071798/70386538-cfeaea00-19dc-11ea-98c7-1591389577c3.jpg){: width="20%" height="20%"}
![mov21](https://user-images.githubusercontent.com/39071798/70386539-cfeaea00-19dc-11ea-8303-c9aa36937f76.jpg){: width="20%" height="20%"}
![mov22](https://user-images.githubusercontent.com/39071798/70386540-d0838080-19dc-11ea-8d43-6dd488b5f1c4.jpg){: width="20%" height="20%"}
![mov23](https://user-images.githubusercontent.com/39071798/70386541-d0838080-19dc-11ea-81e9-1a96b95d902e.jpg){: width="20%" height="20%"}
![mov24](https://user-images.githubusercontent.com/39071798/70386542-d0838080-19dc-11ea-9bdd-769d62c2f8df.jpg){: width="20%" height="20%"}
![mov25](https://user-images.githubusercontent.com/39071798/70386543-d0838080-19dc-11ea-8599-b38870d7fadf.jpg){: width="20%" height="20%"}

* 아이콘

![movie_icon](https://user-images.githubusercontent.com/39071798/70386544-d11c1700-19dc-11ea-828f-d5beb3d42f0d.png)

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

    <GridView android:id="@+id/gridView1"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:gravity="center"
        android:numColumns="4">

    </GridView>
</LinearLayout>
```

`dialog.xml`
```html
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:gravity="center">

    <ImageView android:id="@+id/ivPoster"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
</LinearLayout>
```

`MainActivity.java`
```java
package com.example.boki.movieposter_gridview;

import android.content.Context;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setTitle("그리드뷰 영화 포스터");

        final GridView gv = (GridView) findViewById(R.id.gridView1);
        MyGridAdapter gAdapter = new MyGridAdapter(this);
        gv.setAdapter(gAdapter);
    }
    public class MyGridAdapter extends BaseAdapter {
        Context context;

        public MyGridAdapter(Context c) {
            context = c; // context 변수를 다른 메소드에서 사용하기 위함
        }

        @Override
        public int getCount() { // 그리드뷰에 보여질 이미지의 개수를 반환하도록 수정
            return posterID.length;
        }

        @Override
        public Object getItem(int position) {
            return null;
        }

        @Override
        public long getItemId(int position) {
            return 0;
        }

        // 이미지 파일을 배열로 초기화
        Integer[] posterID = {R.drawable.mov01, R.drawable.mov02, R.drawable.mov03, R.drawable.mov04, R.drawable.mov05, R.drawable.mov06, R.drawable.mov07, R.drawable.mov08, R.drawable.mov09, R.drawable.mov10,
                R.drawable.mov11, R.drawable.mov12, R.drawable.mov13, R.drawable.mov14, R.drawable.mov15, R.drawable.mov16, R.drawable.mov17, R.drawable.mov18, R.drawable.mov19, R.drawable.mov20,
                R.drawable.mov21, R.drawable.mov22, R.drawable.mov23, R.drawable.mov24, R.drawable.mov25};

        // 영화제목을 문자 배열로 초기화
        String[] posterTitle = {"써니","완득이","괴물","라디오스타","비열한거리","왕의남자","아일랜드","웰컴투동막골","헬보이","빽투더퓨처","여인의향기","쥬라기공원","포레스트검프","그라운드데이","혹성탈출-진화의시작",
        "아름다운비행","내이름은칸","해리포터","마더","킹콩을들다","쿵푸팬더2","짱구는못말려-미래의신부를구하라","아저씨","아바타","대부"};
        @Override
        public View getView(int position, View convertView, ViewGroup parent) { // 영화 포스터를 각 그리드뷰의 칸마다 이미지뷰를 생성해서 보여주게 함
            ImageView imageView = new ImageView(context);
            imageView.setLayoutParams(new GridView.LayoutParams(200, 300));
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER); // 그리드뷰 칸의 중앙에 배치
            imageView.setPadding(5,5,5,5);

            imageView.setImageResource(posterID[position]); // R.drawable.mov0x 이미지를 로드하여 출력
            //TODO 이미지를 클릭했을 때, 원래 이미지 크기가 보이도록 함
            final int pos = position;
            imageView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    View dialogView = (View)View.inflate(MainActivity.this, R.layout.dialog, null);
                    AlertDialog.Builder dlg = new AlertDialog.Builder(MainActivity.this);
                    ImageView ivPoster = (ImageView)dialogView.findViewById(R.id.ivPoster);
                    ivPoster.setImageResource(posterID[pos]);
                    dlg.setTitle(posterTitle[pos]);
                    dlg.setIcon(R.drawable.movie_icon);
                    dlg.setView(dialogView);
                    dlg.setNegativeButton("닫기", null);
                    dlg.show();
                }
            });
            return imageView;
        }
    }
}

```
