import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/video_configuration/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    // VideoPost(onVideoFinished: onVideoFinished, index: index);

    print("Drag object");

    // VideoPost.isMute = true;

    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ValueListenableBuilder(
            valueListenable: videoConfig,
            // AnimatedBuilder(
            //animatedbuilder이 딱 필요한 위젯부분만 rebuild
            // animation: videoConfig,
            // builder: (context, child) => SwitchListTile.adaptive(
            builder: (context, value, child) => SwitchListTile.adaptive(
              // value: videoConfig.autoMute, //이렇게만 하면 listen하지 못하기에 animation을 넣는다.
              value: videoConfig.value,
              onChanged: (value) {
                videoConfig.value = !videoConfig.value;
                // videoConfig.toggleAutoMute();
              },
              title: Text("Auto Mute Videos"),
              // title: Text(S.of(context).enableNotifications),
              subtitle: const Text("Videos will be muted by default"),
            ),
          ),
          CheckboxListTile(
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: const Text("Marketing emails"),
            subtitle: const Text("We won't spam you."),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              if (kDebugMode) {
                print(date);
              }
              if (!mounted) return;
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (kDebugMode) {
                print(time);
              }
              if (!mounted) return;
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                        appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black)),
                    child: child!,
                  );
                },
              );
              if (kDebugMode) {
                print(booking);
              }
            },
            title: const Text("What is your birthday?"),
            subtitle: const Text("I need to know!"),
          ),
          ListTile(
            title: const Text("Log out (iOS)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(FontAwesomeIcons.skull),
                  title: const Text("Are you sure?"),
                  content: const Text("Plx dont go"),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(FontAwesomeIcons.car),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please dooooont gooooo"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Not log out"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes plz."),
                    )
                  ],
                ),
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationLegalese: "Don't copy me.",
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class SettingScreen extends StatelessWidget {
//   final String name;
//   const SettingScreen({
//     super.key,
//     required this.name,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // _UserProfileScreenState ssss =
//     //     context.findAncestorStateOfType<_UserProfileScreenState>();
//     return Localizations.override(
//       //세팅화면에서 언어를 설정하기 위한 과정
//       context: context,
//       locale: const Locale("ko"), //한국어로 강제설정
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Settings"),
//         ),
//         body: ListView(
//           children: [
//             // LicensePage(),
//             // IconButton(onPressed: , icon: icon)
//             const AboutListTile(),
//             // TextButton(onPressed: onPressed, child: child)
//             ListTile(
//               onTap: () async {
//                 final date = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1980),
//                   // lastDate: DateTime(2030),
//                   lastDate: DateTime(2030),
//                 );
//                 print(date);
//                 final time = await showTimePicker(
//                     context: context, initialTime: TimeOfDay.now());
//                 print(time);

//                 // widget.name = time.toString();

//                 // final booking = await showDateRangePicker(
//                 //   context: context,
//                 //   firstDate: DateTime(1980),
//                 //   lastDate: DateTime(2030),
//                 //   builder: (context, child) {
//                 //     return Theme(
//                 //       data: ThemeData(
//                 //         appBarTheme: const AppBarTheme(
//                 //           foregroundColor: Colors.white,
//                 //           backgroundColor: Colors.black,
//                 //         ),
//                 //       ),
//                 //       child: child!,
//                 //     );
//                 //   },
//                 // );
//                 // final booking = await showDateRangePicker(
//                 //   context: context,
//                 //   firstDate: DateTime(1980),
//                 //   lastDate: DateTime(2030),
//                 //   builder: (context, child) {
//                 //     return Theme(
//                 //       data: ThemeData(
//                 //           appBarTheme: const AppBarTheme(
//                 //               foregroundColor: Colors.white,
//                 //               backgroundColor: Colors.black)),
//                 //       child: child!,
//                 //     );
//                 //   },
//                 // );
//                 // print(booking);
//               },
//               title: const Text("What is your birthday?"),
//             ),
//           ],
//         ),
//         // ListWheelScrollView(
//         //   useMagnifier: true,
//         //   magnification: 1.5,
//         //   itemExtent: 200, //크기를 뜻함
//         //   children: [
//         //     for (var x in [1, 2, 3, 2, 1, 1, 1, 1, 1])
//         //       FractionallySizedBox(
//         //         widthFactor: 1,
//         //         child: Container(
//         //           alignment: Alignment.center,
//         //           color: Colors.amber,
//         //           child: Text("Pick me $x"),
//         //         ),
//         //       ),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }