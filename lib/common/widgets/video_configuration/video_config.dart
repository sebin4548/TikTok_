import 'package:flutter/foundation.dart';

// ChangeNotifier
//api에서 뭘 많이 받거나 데이터가 많을 때 유용
class VideoConfig extends ChangeNotifier {
  bool autoMute = true;
  void toggleAutoMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();
