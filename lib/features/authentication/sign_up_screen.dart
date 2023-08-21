import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/generated/l10n.dart';

import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  static const routeURL = "/";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    context.push(LoginScreen.routeName); //stack : 이전 화면 위에 다른 화면을 올린다.
    // context.go(LoginScreen.routeName); //go는 다른 화면으로 이동시키며, stack에 관련된 것은 전부 무시

    // //await를 이용하여 정보를 주고받기
    // final result = await Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => const LoginScreen(),
    // ));
    // print(result);

    // pageroute 2번째
    // final result = Navigator.of(context).pushNamed(LoginScreen.routeName);
    // print(result);
  }

  void onEmailTap(BuildContext context) {
    // push를 하는 방법에는 여러가지가 있다.
    // context.push(UsernameScreen.routeName);
    context.pushNamed("username");

    //just for temp
    // context.push("/users/lynn?show=likes");

    // 두번째
    // Navigator.of(context).pushNamed(UsernameScreen.routeName);

    //첫번째 navigator
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //       transitionDuration: Duration(milliseconds: 300),
    //       reverseTransitionDuration: Duration(milliseconds: 300),
    //       pageBuilder: (context, animation, secondaryAnimation) =>
    //           UsernameScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         final offsetAnimation = Tween(
    //           begin: Offset(1, 0),
    //           end: Offset.zero,
    //         ).animate(animation);
    //         final opacityAnimation = Tween(
    //           begin: 0.5,
    //           end: 1.0,
    //         ).animate(animation);
    //         // final opacityAnimation = Tween(
    //         //   begin: 0.5,
    //         //   end: 1.0,
    //         // ).animate(animation);
    //         return SlideTransition(
    //           position: offsetAnimation,
    //           child: FadeTransition(
    //             opacity: opacityAnimation,
    //             child: child,
    //           ),
    //         );
    //       }),
    // );
  }

  void megastudy(BuildContext context) {
    // context.pushNamed("temp");
    context.push("/users/lynn");
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print("ssssssss $orientation");

        return Scaffold(
          // backgroundColor: Colors.white,
          body: SafeArea(
            // SafeArea는 노치 부분 시간부분, 베터리잔량표시로 가려지는 부분이 없도록 만드는 것
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    // S.of(context).signUpTiktoks,
                    "Sign Up Tiktoks",

                    style: Theme.of(context).textTheme.headlineSmall,
                    // !.copyWith(color: Colors.black),
                    //추가적인 세팅을 지정할 수 있음
                  ),
                  Gaps.v20,
                  Text(
                    // "dddddddddsdsdssd",
                    S.of(context).description(0),
                    // 이렇게 되어 있는 상태에서 Code Action(cmd .) 눌러서 바로 연결되게 하면 됨
                    // S.of(context).signUpSubtitle,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: isDarkMode(context)
                          ? Colors.grey.shade500
                          : Colors.black45,
                      // fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  //회전을 위한 collection if. if에는 한줄만 있으므로 List를 작성
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => onEmailTap(context),
                      child: AuthButton(
                        // text: S.of(context).usePhoneOrEmail,
                        text: "Use Phone or Email",

                        // text: Text("data", style: ,),
                        icon: FaIcon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: () {},
                      child: AuthButton(
                        text: "Continue with apple",
                        icon: FaIcon(
                          FontAwesomeIcons.apple,
                        ),
                      ),
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: () => megastudy(context),
                      child: AuthButton(
                        text: "Direct",
                        icon: FaIcon(
                          FontAwesomeIcons.apple,
                        ),
                      ),
                    ),
                  ],
                  if (orientation == Orientation.landscape) ...[
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => onEmailTap(context),
                            child: const AuthButton(
                              text: "Use phone or email",
                              icon: FaIcon(
                                FontAwesomeIcons.user,
                              ),
                            ),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const AuthButton(
                              text: "Continue with apple",
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            // color: Colors.grey.shade50,
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            // elevation: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size32,
                bottom: Sizes.size64,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account?"),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text("ddddd",
                        // S.of(context).login("male"),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          // color: Colors.white,
                          color: Theme.of(context).primaryColor, //
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
