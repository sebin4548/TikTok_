import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/users/user_profile_screen.dart';
import 'package:tiktok_clone/features/videos/widgets/video_recording_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => VideoRecordingScreen(),
    ),

    // //nested Route
    // GoRoute(
    //   name: SignUpScreen.routeName,
    //   path: SignUpScreen.routeURL,
    //   builder: (context, state) => SignUpScreen(),
    //   routes: [
    //     GoRoute(
    //       path: UsernameScreen.routeURL,
    //       name: UsernameScreen.routeName,
    //       builder: (context, state) => UsernameScreen(),
    //       routes: [
    //         GoRoute(
    //             path: EmailScreen.routeURL,
    //             name: EmailScreen.routeName,
    //             builder: (context, state) {
    //               final args = state.extra as EmailScreenArgs;
    //               return EmailScreen(username: args.username);
    //             },
    //             routes: [
    //               GoRoute(
    //                 path: "tutorial",
    //                 name: "tutorial",
    //                 builder: (context, state) => TutorialScreen(),
    //               ),
    //             ]),
    //       ],
    //     )
    //   ],
    // ),
    // GoRoute(
    //   path: "/mainNavigation",
    //   name: "mainNavigation",
    //   builder: (context, state) => MainNavigationScreen(),
    // ),

    // GoRoute(
    //   name: "username_screen",
    //   path: UsernameScreen.routeName,
    //   pageBuilder: (context, state) {
    //     return CustomTransitionPage(
    //       child: UsernameScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return FadeTransition(
    //           opacity: animation,
    //           child: ScaleTransition(
    //             scale: animation,
    //             child: child,
    //           ),
    //         );
    //       },
    //     );
    //   },
    // ),

    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        final tab = state.queryParams["show"];
        return UserProfileScreen(
          username: username!,
          tab: tab!,
        );
      },
    ),
  ],
);
