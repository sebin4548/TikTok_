import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/onboarding/interest_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/videos/views/video_recording_screen.dart';

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    GoRoute(
      path: SignUpScreen.routeURL,
      name: SignUpScreen.routeName,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: InterestScreen.routeURL,
      name: InterestScreen.routeName,
      builder: (context, state) => InterestScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)", //:tab이라 변수형태가 들어가는데
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(
          tab: tab,
        );
      },
    ),
    GoRoute(
      path: VideoRecordingScreen.routeURL,
      name: VideoRecordingScreen.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(
          milliseconds: 100,
        ),
        child: VideoRecordingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final position = Tween(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: position,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) => ActivityScreen(),
    ),
    GoRoute(
      path: ChatScreen.routeURL,
      name: ChatScreen.routeName,
      builder: (context, state) => ChatScreen(),
      routes: [
        GoRoute(
          path: ChatDetailScreen.routeUrl,
          name: ChatDetailScreen.routeName,
          builder: (context, state) {
            final chatId = state.params["chatId"]!;
            return ChatDetailScreen(
              chatId: chatId,
            );
          },
        ),
      ],
    ),
  ],
);

// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: LoginScreen.routeURL,
//       name: LoginScreen.routeName,
//       builder: (context, state) => LoginScreen(),
//     ),
//     GoRoute(
//       name: SignUpScreen.routeName,
//       path: SignUpScreen.routeURL,
//       builder: (context, state) => SignUpScreen(),
//     ),

//     //nested Route
//     // GoRoute(
//     //   name: SignUpScreen.routeName,
//     //   path: SignUpScreen.routeURL,
//     //   builder: (context, state) => SignUpScreen(),
//     //   routes: [
//     //     GoRoute(
//     //       path: UsernameScreen.routeURL,
//     //       name: UsernameScreen.routeName,
//     //       builder: (context, state) => UsernameScreen(),
//     //       routes: [
//     //         GoRoute(
//     //           path: EmailScreen.routeURL,
//     //           name: EmailScreen.routeName,
//     //           builder: (context, state) {
//     //             final args = state.extra as EmailScreenArgs;
//     //             return EmailScreen(username: args.username);
//     //           },
//     //           routes: [
//     //             GoRoute(
//     //               path: "tutorial",
//     //               name: "tutorial",
//     //               builder: (context, state) => TutorialScreen(),
//     //             ),
//     //           ],
//     //         ),
//     //       ],
//     //     )
//     //   ],
//     // ),
//     // GoRoute(
//     //     path: "/mainNavigation",
//     //     name: "mainNavigation",
//     //     builder: (context, state) => MainNavigationScreen(),
//     //     routes: [
//     //       GoRoute(
//     //         path: "video",
//     //         builder: (context, state) => VideoRecordingScreen(),
//     //       ),
//     //     ]),
//     // GoRoute(
//     //   path: "/VideoRecordingScreen",
//     //   name: "VideoRecordingScreen",
//     //   pageBuilder: (context, state) {
//     //     return CustomTransitionPage(
//     //       child: VideoRecordingScreen(),
//     //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//     //         return FadeTransition(
//     //           opacity: animation,
//     //           child: ScaleTransition(
//     //             scale: animation,
//     //             child: child,
//     //           ),
//     //         );
//     //       },
//     //     );
//     //   },
//     // ),

//     // GoRoute(
//     //   path: "/VideoRecordingScreen",
//     //   name: "VideoRecordingScreen",
//     //   pageBuilder: (context, state) {
//     //     return CustomTransitionPage(
//     //       child: VideoRecordingScreen(),
//     //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//     //         return FadeTransition(
//     //           opacity: animation,
//     //           child: ScaleTransition(
//     //             scale: animation,
//     //             child: child,
//     //           ),
//     //         );
//     //       },
//     //     );
//     //   },
//     // ),

//     // GoRoute(
//     //   name: "username_screen",
//     //   path: UsernameScreen.routeName,
//     //   pageBuilder: (context, state) {
//     //     return CustomTransitionPage(
//     //       child: UsernameScreen(),
//     //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//     //         return FadeTransition(
//     //           opacity: animation,
//     //           child: ScaleTransition(
//     //             scale: animation,
//     //             child: child,
//     //           ),
//     //         );
//     //       },
//     //     );
//     //   },
//     // ),

//     // GoRoute(
//     //   name: "temp",
//     //   path: "/users/:username",
//     //   builder: (context, state) {
//     //     final username = state.params['username'];
//     //     final tab = state.queryParams["show"];
//     //     return UserProfileScreen(
//     //       username: username!,
//     //       tab: tab!,
//     //     );
//     //   },
//     // ),
//     // GoRoute(
//     //   name: "temp",
//     //   path: "/users/:username",
//     //   builder: (context, state) {
//     //     return MainNavigationScreen();
//     //   },
//     // ),
//   ],
// );
