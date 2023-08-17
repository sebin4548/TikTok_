import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/onboarding/interest_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();
  // DateTime newDate = initialDate.add(const Duration(days: 365 * 12));
  late DateTime beforeDate;

  // DateTime dateTime2 = dateTime1.subtract(const Duration(days: 60));

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialDate);
    // beforeDate = DateTime(initialDate.year - 12);
    beforeDate = initialDate.subtract(const Duration(days: 12 * 365));
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) =>
    //       const InterestScreen(), //Stateful widget에서는 굳이 context를 쓸 필요가 없다.
    // ));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InterestScreen(),
        ),
        (route) => false);
  }

  void _setTextFieldDate(DateTime date) {
    final textdate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textdate);
    // print(date.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
              ),
            ),
            Gaps.v10,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                hintText: "Birthday",
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
              child: const FormButton(
                inputText: "Next",
                disabled: false,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: beforeDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}
