import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); //가로 세로 방향 고정하라
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaybackConfigViewModel(repository),
        )
      ],
      child: TikTikApp(),
    ),
  );
  // runApp(const TikTikApp());
  // VideoPost.isMuteChange(true);
}

class TikTikApp extends StatelessWidget {
  const TikTikApp({super.key});

  @override
  Widget build(BuildContext context) {
    S.load(Locale("en"));
    // return
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => VideoConfig(),
    //     )
    //   ],
    // child:
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: "TikTok",
      // themeMode: ThemeMode.system, //시스템에 맞게 다크, 라이트 모드가 결정된다.
      // theme: ThemeData(
      //   useMaterial3: true,
      //   // textTheme: TextTheme(
      //   //   headlineLarge: const TextStyle(
      //   //     fontSize: Sizes.size28,
      //   //     fontWeight: FontWeight.w700,
      //   //     color: Colors.black,
      //   //   ),
      //   //material design에서 그대로 복사해온것
      //   //   displayLarge: GoogleFonts.roboto(
      //   //       fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      //   //   displayMedium: GoogleFonts.roboto(
      //   //       fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      //   //   displaySmall:
      //   //       GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
      //   //   headlineMedium: GoogleFonts.roboto(
      //   //       fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      //   // ),

      //   //구글 폰트에서 textTheme이 자동으로 복사된다. 자동완성 기능으로 확인하기
      //   // textTheme: GoogleFonts.itimTextTheme(),

      //   //폰트 종류만 결정해주고 weight height space size는 알아서 맞추기
      //   textTheme: Typography.blackCupertino,

      //   //기본 scaffold background를 설정한다.
      //   scaffoldBackgroundColor: Colors.white,
      //   primaryColor: const Color(0xFFE9435A),
      //   textSelectionTheme: const TextSelectionThemeData(
      //     cursorColor: Color(0xFFE9435A),
      //     // selectionColor: Color(0xFFE9435A),
      //   ),
      //   // 이거를 하면 material design에서 버튼 누르면 생기는 잔상을 없앨 수 있음
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,

      //   appBarTheme: const AppBarTheme(
      //     //material 3에 나와야 하는 특이 지점
      //     surfaceTintColor: Colors.white,
      //     backgroundColor: Colors.white,
      //     foregroundColor: Colors.black,
      //     // elevation: 0,
      //     titleTextStyle: TextStyle(
      //       color: Colors.black,
      //       fontSize: Sizes.size20 - Sizes.size2,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   tabBarTheme: TabBarTheme(
      //     labelColor: Colors.black,
      //     unselectedLabelColor: Colors.grey.shade500,
      //     indicatorColor: Colors.black,
      //   ),
      // ),
      // //dark모드에서 theme을 결정해준다.
      // darkTheme: ThemeData(
      //   // textTheme: const TextTheme(
      //   //   headlineLarge: TextStyle(
      //   //     fontSize: Sizes.size28,
      //   //     fontWeight: FontWeight.w700,
      //   //     color: Colors.white,
      //   //   ),
      //   // ),
      //   textTheme: GoogleFonts.itimTextTheme(
      //     //dark mode setting
      //     ThemeData(brightness: Brightness.dark).textTheme,
      //   ),
      //   tabBarTheme: const TabBarTheme(
      //     // labelColor: Colors.white,
      //     indicatorColor: Colors.white,
      //   ),
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: Colors.black,
      //   primaryColor: const Color(0xFFE9435A),
      //   textSelectionTheme: const TextSelectionThemeData(
      //     cursorColor: Color(0xFFE9435A),
      //     // selectionColor: Color(0xFFE9435A),
      //   ),
      //   // 이거를 하면 material design에서 버튼 누르면 생기는 잔상을 없앨 수 있음
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   bottomAppBarTheme: BottomAppBarTheme(
      //     color: Colors.grey.shade900,
      //   ),
      //   appBarTheme: AppBarTheme(
      //     // surfaceTintColor: Colors.white,
      //     backgroundColor: Colors.grey.shade900,
      //     // backgroundColor: Colors.white,
      //   ),
      // ),
      // Theme config for FlexColorScheme version 7.3.x. Make sure you use
      // same or higher package version, but still same major version. If you
      // use a lower package version, some properties may not be supported.
      // In that case remove them after copying this theme to your app.
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff004881),
          primaryContainer: Color(0xffd0e4ff),
          secondary: Color(0xffac3306),
          secondaryContainer: Color(0xffffdbcf),
          tertiary: Color(0xff006875),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          // aligned: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          // alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      // If you do not have a themeMode switch, uncomment this line
      // to let the device system mode control the theme mode:
      // themeMode: ThemeMode.system,

      // comd shft p => flutter Intl : initialize =>  l10n 폴더에 있는 파일에 번역본을 쓰면 자동으로 생성 된다.
      // flutter Intl : Add locale => ko
      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ko"),
      ],
      //navigation을 하는 두번째 방식
      // initialRoute: SignUpScreen.routeName,

      // routes: {
      //   SignUpScreen.routeName: (context) => SignUpScreen(),
      //   UsernameScreen.routeName: (context) => UsernameScreen(),
      //   LoginScreen.routeName: (context) => LoginScreen(),
      //   EmailScreen.routeName: (context) => EmailScreen(),
      // },

      //navigation을 하는 첫번째 방식
      // home: const SignUpScreen(),
      // ),
    );
  }
}
