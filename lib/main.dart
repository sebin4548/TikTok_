import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation.dart';

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
      home: const MainNavigationScreen(),
    );
  }
}
// import 'dart:io';
// import 'dart:convert';
// import 'dart:async';

// Future<String> readFileToString(String filename) async {
//   var file = File(filename);
//   String fileContent = await file.readAsString();
//   return fileContent;
// }

// Future<List<String>> readFileToList(String filename) async {
//   Stream<String> lines = File(filename)
//       .openRead()
//       .transform(utf8.decoder)
//       .transform(const LineSplitter());
//   try {
//     List<String> sList = [];
//     await for (var line in lines) {
//       sList.add(line);
//     }
//     return sList;
//   } catch (error) {
//     rethrow;
//   }
// }

// Future<void> async1() async {
//   Future.delayed(const Duration(seconds: 1), () => print("1S left"));
// }

// Future<void> async2() async {
//   await Future.delayed(
//       const Duration(seconds: 1), () => print("2func 2S left"));
//   await Future.delayed(
//       const Duration(seconds: 1), () => print("2func 1S left"));
// }

// void main() async {
//   // stdout.write("Write and enter ");
//   // var tmpInput = stdin.readLineSync();
//   // stdout.writeln("you wote : $tmpInput");
//   // print(Platform.operatingSystem);
//   // print(Platform.isMacOS);
//   await async1();
//   await async2();

//   String os = Platform.operatingSystem;
//   String path = Platform.script.toFilePath();
//   print(path);
//   print(os);
// }
