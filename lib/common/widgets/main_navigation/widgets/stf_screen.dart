import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;
  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("I'm built");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$_clicks"),
          TextButton(
            onPressed: _increase,
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}
