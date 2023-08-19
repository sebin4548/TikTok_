import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';
import 'package:tiktok_clone/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => Scaffold(
    //       appBar: AppBar(title: const Text('Record video')),
    //     ),
    //     fullscreenDialog: true,
    //   ),
    // );
    context.pushNamed("VideoRecordingScreen");
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    print(Localizations.localeOf(context));
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: (_selectedIndex == 0 || isDarkMode(context))
          ? Colors.black
          : Colors.white,
      resizeToAvoidBottomInset: false,
      //Globalkey를 넣음으로서 각각의 스크린을 독립적으로
      //그러나 화면이 바뀌면 매번 killing됨.
      //이거를 바꾸기 위해 모든 화면을 그리긴 하지만 시각적으로 보이지 않게끔 만든다.
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
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(
              username: "준표",
              tab: "",
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        // color: Colors.black,
        color: (_selectedIndex == 0 || isDark) ? Colors.black : Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: Sizes.size32, top: Sizes.size12),
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
