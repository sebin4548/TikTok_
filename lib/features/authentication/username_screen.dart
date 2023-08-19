import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/utils.dart';

class UsernameScreen extends StatefulWidget {
  static String routeURL = "username";
  static String routeName = "username";
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";
  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => EmailScreen(
    //         // username: _username,
    //         ), //Stateful widget에서는 굳이 context를 쓸 필요가 없다.
    //   ),
    // );

    // Navigator.pushNamed(context, EmailScreen.routeName,
    // arguments: EmailScreenArgs(username: _username));

    // context.push(EmailScreen.routeName);
    context.pushNamed(EmailScreen.routeName,
        extra: EmailScreenArgs(username: _username));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
              ),
            ),
            Gaps.v10,
            Text(
              "You can always change this later",
              style: TextStyle(
                fontSize: Sizes.size16,
                color:
                    isDarkMode(context) ? Colors.grey.shade500 : Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                inputText: "Next",
                disabled: _username.isEmpty ? true : false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
