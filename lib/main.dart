import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';

void main() {
  runApp(const TikTikApp());
}

class TikTikApp extends StatelessWidget {
  const TikTikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TikTok",
      theme: ThemeData(
        //기본 scaffold background를 설정한다.
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
          // selectionColor: Color(0xFFE9435A),
        ),
        // 이거를 하면 material design에서 버튼 누르면 생기는 잔상을 없앨 수 있음
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20 - Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const ActivityScreen(),
    );
  }
}
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

/// An example of using the plugin, controlling lifecycle and playback of the
/// video.

