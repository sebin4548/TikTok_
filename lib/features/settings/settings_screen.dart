import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          // LicensePage(),
          const AboutListTile(),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                // lastDate: DateTime(2030),
                lastDate: DateTime(2030),
              );
              print(date);
              final time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              print(time);

              // final booking = await showDateRangePicker(
              //   context: context,
              //   firstDate: DateTime(1980),
              //   lastDate: DateTime(2030),
              //   builder: (context, child) {
              //     return Theme(
              //       data: ThemeData(
              //         appBarTheme: const AppBarTheme(
              //           foregroundColor: Colors.white,
              //           backgroundColor: Colors.black,
              //         ),
              //       ),
              //       child: child!,
              //     );
              //   },
              // );
              // final booking = await showDateRangePicker(
              //   context: context,
              //   firstDate: DateTime(1980),
              //   lastDate: DateTime(2030),
              //   builder: (context, child) {
              //     return Theme(
              //       data: ThemeData(
              //           appBarTheme: const AppBarTheme(
              //               foregroundColor: Colors.white,
              //               backgroundColor: Colors.black)),
              //       child: child!,
              //     );
              //   },
              // );
              // print(booking);
            },
            title: const Text("What is your birthday?"),
          ),
        ],
      ),
      // ListWheelScrollView(
      //   useMagnifier: true,
      //   magnification: 1.5,
      //   itemExtent: 200, //크기를 뜻함
      //   children: [
      //     for (var x in [1, 2, 3, 2, 1, 1, 1, 1, 1])
      //       FractionallySizedBox(
      //         widthFactor: 1,
      //         child: Container(
      //           alignment: Alignment.center,
      //           color: Colors.amber,
      //           child: Text("Pick me $x"),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}