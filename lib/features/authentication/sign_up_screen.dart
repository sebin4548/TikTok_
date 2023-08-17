import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/utils.dart';
import "package:flutter_gen/gen_l10n/intl_generated.dart"; //이거는 자동 import 안됨

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void onEmailTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
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
                    // "Sign up for TikTok",
                    // 번역을 위한 작업. 위에 자동 import 안되니깐 import 확인필요
                    AppLocalizations.of(context)!
                        .signUpTitle("TikTok"), //Placeholder

                    style: Theme.of(context).textTheme.headlineSmall,
                    // !.copyWith(color: Colors.black),
                    //추가적인 세팅을 지정할 수 있음
                  ),
                  Gaps.v20,
                  Text(
                    "Create a profile, follow other accounts, make your own videos, and more.",
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
                      child: const AuthButton(
                        text: "Use phone or email",

                        // text: Text("data", style: ,),
                        icon: FaIcon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: () {},
                      child: const AuthButton(
                        text: "Continue with apple",
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
                    child: Text("Login",
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
