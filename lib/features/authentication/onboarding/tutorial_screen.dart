// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tiktok_clone/constants/gaps.dart';
// import 'package:tiktok_clone/constants/sizes.dart';

// enum Direction { right, left }

// enum Page { first, second }

// class TurorialScreen extends StatefulWidget {
//   const TurorialScreen({super.key});

//   @override
//   State<TurorialScreen> createState() => _TurorialScreenState();
// }

// // Padding(
// //   padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
// //   child:
// // ),

// class _TurorialScreenState extends State<TurorialScreen> {
//   Direction _direction = Direction.right;
//   Page _showPage = Page.first;

//   void _onPanUpdate(DragUpdateDetails details) {
//     // print(details);
//     if (details.delta.dx > 0) {
//       setState(() {
//         _direction = Direction.right;
//       });
//     } else {
//       setState(() {
//         _direction = Direction.right;
//       });
//     }
//   }

//   void _onPanEnd(DragEndDetails detail) {
//     if (_direction == Direction.left) {
//       setState(() {
//         _showPage = Page.second;
//       });
//     } else {
//       setState(() {
//         _showPage = Page.first;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: _onPanUpdate,
//       onPanEnd: _onPanEnd,
//       //손가락으로 스와이프를 할 때
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
//           child: SafeArea(
//             child: AnimatedCrossFade(
//               firstChild: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Gaps.v80,
//                   Text(
//                     "Watch cool videos!",
//                     style: TextStyle(
//                       fontSize: Sizes.size40,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Gaps.v16,
//                   Text(
//                     "Videos are personalized for you based on what you watch, like, and share.",
//                     style: TextStyle(
//                       fontSize: Sizes.size20,
//                     ),
//                   ),
//                 ],
//               ),
//               secondChild: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Gaps.v80,
//                   Text(
//                     "Follow our Rules!",
//                     style: TextStyle(
//                       fontSize: Sizes.size40,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Gaps.v16,
//                   Text(
//                     "Videos are personalized for you based on what you watch, like, and share.",
//                     style: TextStyle(
//                       fontSize: Sizes.size20,
//                       // fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               crossFadeState: _showPage == Page.first
//                   ? CrossFadeState.showFirst
//                   : CrossFadeState.showSecond,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               duration: const Duration(milliseconds: 300),
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: Sizes.size24,
//               horizontal: Sizes.size24,
//             ),
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 300),
//               opacity: _showPage == Page.first ? 0 : 1,
//               child: CupertinoButton(
//                 color: Theme.of(context).primaryColor,
//                 onPressed: () {},
//                 child: const Text("data"),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => MainNavigationScreen(),
        ), (route) {
      // print(route);
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v80,
                    Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
              secondChild: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v80,
                    Text(
                      "Follow the rules",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24,
                horizontal: Sizes.size24,
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _showingPage == Page.first ? 0 : 1,
                child: CupertinoButton(
                  onPressed: _onEnterAppTap,
                  color: Theme.of(context).primaryColor,
                  child: const Text('Enter the app!'),
                ),
              )),
        ),
      ),
    );
  }
}
