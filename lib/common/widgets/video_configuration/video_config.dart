import 'package:flutter/material.dart';

class VideoConfig extends InheritedWidget {
  VideoConfig({required super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
