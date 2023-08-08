import 'package:flutter/cupertino.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text("home"),
    ),
    const Center(
      child: Text("Search"),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          label: "Search",
        )
      ]),
      tabBuilder: (context, index) => screens[index],
    );
    // return Scaffold(
    //   body: screens[_selectedIndex],
    //   bottomNavigationBar: NavigationBar(
    //     selectedIndex: _selectedIndex,
    //     onDestinationSelected: _onTap,
    //     labelBehavior : NavigationDestinationLabelBehavior.onlyShowSelected. ,
    //     destinations: const [
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.house,
    //           color: Colors.amber,
    //         ),
    //         label: "home",
    //       ),
    //       NavigationDestination(
    //         icon: FaIcon(
    //           FontAwesomeIcons.magnifyingGlass,
    //           color: Colors.cyan,
    //         ),
    //         label: "home",
    //       )
    //     ],
    //   ),
    // );
  }
}
