---
layout: post
title: " 액션바와 프래그먼트를 활용하여 화면 구현 "
categories: android
author: boki
tags: ActionBar Fragment
comments: true
sitemap :
  changefreq : daily
  priority : 1.0
---

## 액션바와 프래그먼트를 활용하여 화면 구현

* 액션바를 Java로만 만들고 메뉴처럼 활용해서 다른 화면을 동적으로 구성해보려고 한다

![image](https://user-images.githubusercontent.com/39071798/70378694-c3c44580-1966-11ea-9cc4-bcdcde6293c1.png)

`activity_main.xml`
```html
필요 없다! 왜냐하면 java로만 구현할것이기 때문에
```
* 그동안 MainActivity의 onCreate에서 작성했었던 setContentView는 지워주도록 하자
* 맨처음에 ActionBar.TabListener를 상속받을때 v7로 상속받자

`MainActivity.java`
```java
package com.example.boki.viewcontainer;

import android.graphics.Color;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

@SuppressWarnings("deprecation")
public class MainActivity extends AppCompatActivity implements ActionBar.TabListener { // 여기에서 ActionBar를 v7로 받아야함!!

    ActionBar.Tab tabSong, tabArtist, tabAlbum;
    MyTabFragment myFrags[] = new MyTabFragment[3];

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActionBar bar = getSupportActionBar();
        bar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

        tabSong = bar.newTab();
        tabSong.setText("음악별");
        tabSong.setTabListener(this);
        bar.addTab(tabSong);

        tabArtist = bar.newTab();
        tabArtist.setText("가수별");
        tabArtist.setTabListener(this);
        bar.addTab(tabArtist);

        tabAlbum = bar.newTab();
        tabAlbum.setText("앨범별");
        tabAlbum.setTabListener(this);
        bar.addTab(tabAlbum);
    } // onCreate

    @Override
    public void onTabSelected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
        MyTabFragment myTabFrag = null;

        if(myFrags[tab.getPosition()] == null) {
            myTabFrag = new MyTabFragment();
            Bundle data = new Bundle();
            data.putString("tabName", tab.getText().toString());
            myTabFrag.setArguments(data);
            myFrags[tab.getPosition()] = myTabFrag;
        } else myTabFrag = myFrags[tab.getPosition()];

        fragmentTransaction.replace(android.R.id.content, myTabFrag);
    }

    @Override
    public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {

    }

    @Override
    public void onTabReselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {

    }

    public static class MyTabFragment extends Fragment {
        String tabName;

        @Override
        public void onCreate(@Nullable Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            Bundle data = getArguments();
            tabName = data.getString("tabName");
        } //onCreate

        @Nullable
        @Override
        public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.MATCH_PARENT
            );
            LinearLayout baseLayout = new LinearLayout(super.getActivity());
            baseLayout.setOrientation(LinearLayout.VERTICAL);
            baseLayout.setLayoutParams(params);

            if(tabName == "음악별") baseLayout.setBackgroundColor(Color.RED);
            if(tabName == "가수별") baseLayout.setBackgroundColor(Color.GREEN);
            if(tabName == "앨범별") baseLayout.setBackgroundColor(Color.BLUE);

            return baseLayout;
        } //onCreateView
    } // MyTabFragment
}

```

### 결과화면

![image](https://user-images.githubusercontent.com/39071798/70378772-b8bde500-1967-11ea-9246-2585a1708977.png)

![image](https://user-images.githubusercontent.com/39071798/70378774-c07d8980-1967-11ea-8066-3eefe4863421.png)

![image](https://user-images.githubusercontent.com/39071798/70378777-c96e5b00-1967-11ea-98f5-00b610904c63.png)
