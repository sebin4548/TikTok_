// import 'package:flutter/material.dart';
// import 'package:tiktok_clone/features/authentication/videos/widgets/video_post.dart';

// class VideoTimelineScreen extends StatefulWidget {
//   const VideoTimelineScreen({super.key});

//   @override
//   State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
// }

// class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
//   final int _itemCount = 4;

//   List<Color> colors = [
//     Colors.yellow,
//     Colors.blue,
//     Colors.red,
//     Colors.teal,
//   ];

//   void _onPageChanged(int page) {
//     _pageController.animateToPage(
//       page,
//       duration: const Duration(microseconds: 100),
//       curve: Curves.linear,
//     );
//     // if (page == _itemCount - 1) {
//     //   // print("its time");

//     //   setState(() {
//     //     _itemCount = _itemCount + 4;
//     //   });

//     //   colors.addAll([
//     //     Colors.yellow,
//     //     Colors.blue,
//     //     Colors.red,
//     //     Colors.teal,
//     //   ]);
//     // }
//   }

//   final Duration _scrollDuration = const Duration(milliseconds: 250);
//   final Curve _scrollCurve = Curves.linear;

//   final PageController _pageController = PageController();
//   void _onVideoFinished() {
//     _pageController.nextPage(
//       duration: _scrollDuration,
//       curve: _scrollCurve,
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       //builder을 넣어야 한거번에 모든 것들이 동시에 진행되지 않는다.
//       //만약에 100개 동영상이라면 100개를 모두 다 다운 해야 하잖아.
//       scrollDirection: Axis.vertical,
//       onPageChanged: _onPageChanged,
//       // onPageChanged: ,
//       itemCount: _itemCount,
//       // itemBuilder: (context, index) => Container(
//       //   color: colors[index],
//       //   child: Center(
//       //     child: Text(
//       //       "Screen $index",
//       //       style: const TextStyle(fontSize: Sizes.size64),
//       //     ),
//       //   ),
//       // ),
//       itemBuilder: (context, index) => VideoPost(
//         onVideoFinished: _onVideoFinished,
//       ),

//       // pageSnapping: false,
//       // children: [
//       //   Container(color: Colors.amber),
//       //   Container(color: Colors.teal),
//       //   Container(color: Colors.yellow),
//       //   Container(color: Colors.blue),
//       // ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) =>
          VideoPost(onVideoFinished: _onVideoFinished),
    );
  }
}
