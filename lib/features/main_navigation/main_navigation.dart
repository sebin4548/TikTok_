// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tiktok_clone/constants/gaps.dart';
// import 'package:tiktok_clone/constants/sizes.dart';
// import 'package:tiktok_clone/features/authentication/videos/video_timeline_screen.dart';
// import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
// import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';

// class MainNavigationScreen extends StatefulWidget {
//   const MainNavigationScreen({super.key});

//   @override
//   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// }

// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   int _selectedIndex = 0;

//   // final screens = [
//   //   StfScreen(
//   //     key: GlobalKey(),
//   //     //Globalkey를 넣음으로서 각각의 스크린을 독립적으로
//   //     //그러나 화면이 바뀌면 매번 killing됨.

//   //   ),
//   //   StfScreen(
//   //     key: GlobalKey(),
//   //   ),
//   //   StfScreen(
//   //     key: GlobalKey(),
//   //   ),
//   //   StfScreen(
//   //     key: GlobalKey(),
//   //   ),
//   //   StfScreen(
//   //     key: GlobalKey(),
//   //   ),

//   // ];

//   void _onTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _onPostVideoButtonTap() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: const Text("Record Video"),
//           ),
//         ),
//         fullscreenDialog: true,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: screens.elementAt(_selectedIndex),
//       //Globalkey를 넣음으로서 각각의 스크린을 독립적으로
//       //그러나 화면이 바뀌면 매번 killing됨.
//       //이거를 바꾸기 위해 모든 화면을 그리긴 하지만 시각적으로 보이지 않게끔 만든다.
//       body: Stack(children: [
//         Offstage(
//           //Creates a widget that visually hides its child.
//           offstage: _selectedIndex != 0,
//           // child: const StfScreen(),
//           child: const VideoTimelineScreen(),
//         ),
//         Offstage(
//           offstage: _selectedIndex != 1,
//         ),
//         Offstage(
//           offstage: _selectedIndex != 3,
//         ),
//         Offstage(
//           offstage: _selectedIndex != 4,
//         ),
//       ]),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: Sizes.size24,
//             vertical: Sizes.size24,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               NavTab(
//                 text: "home",
//                 isSelected: _selectedIndex == 0,
//                 selectedIcon: FontAwesomeIcons.house,
//                 icon: FontAwesomeIcons.house,
//                 onTap: () => _onTap(0),
//               ),
//               NavTab(
//                 text: "discover",
//                 isSelected: _selectedIndex == 1,
//                 selectedIcon: FontAwesomeIcons.solidCompass,
//                 icon: FontAwesomeIcons.compass,
//                 onTap: () => _onTap(1),
//               ),
//               Gaps.h24,
//               GestureDetector(
//                 onTap: _onPostVideoButtonTap,
//                 child: const PostVideoButton(),
//               ),
//               Gaps.h24,
//               NavTab(
//                 text: "message",
//                 isSelected: _selectedIndex == 3,
//                 selectedIcon: FontAwesomeIcons.solidMessage,
//                 icon: FontAwesomeIcons.message,
//                 onTap: () => _onTap(3),
//               ),
//               NavTab(
//                 text: "Profile",
//                 isSelected: _selectedIndex == 4,
//                 selectedIcon: FontAwesomeIcons.solidUser,
//                 icon: FontAwesomeIcons.user,
//                 onTap: () => _onTap(4),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     // return CupertinoTabScaffold(
//     //   tabBar: CupertinoTabBar(items: const [
//     //     BottomNavigationBarItem(
//     //       icon: Icon(CupertinoIcons.house),
//     //       label: "home",
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(CupertinoIcons.house),
//     //       label: "Search",
//     //     )
//     //   ]),
//     //   tabBuilder: (context, index) => screens[index],
//     // );
//     // return Scaffold(
//     //   body: screens[_selectedIndex],
//     //   bottomNavigationBar: NavigationBar(
//     //     selectedIndex: _selectedIndex,
//     //     onDestinationSelected: _onTap,
//     //     labelBehavior : NavigationDestinationLabelBehavior.onlyShowSelected. ,
//     //     destinations: const [
//     //       NavigationDestination(
//     //         icon: FaIcon(
//     //           FontAwesomeIcons.house,
//     //           color: Colors.amber,
//     //         ),
//     //         label: "home",
//     //       ),
//     //       NavigationDestination(
//     //         icon: FaIcon(
//     //           FontAwesomeIcons.magnifyingGlass,
//     //           color: Colors.cyan,
//     //         ),
//     //         label: "home",
//     //       )
//     //     ],
//     //   ),
//     // );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Record video')),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(inverted: _selectedIndex != 0),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                selectedIndex: _selectedIndex,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Profile",
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
