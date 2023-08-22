import 'package:flutter/foundation.dart';

// // ChangeNotifier
// //api에서 뭘 많이 받거나 데이터가 많을 때 유용
// class VideoConfig extends ChangeNotifier {
//   bool autoMute = true;
//   void toggleAutoMute() {
//     autoMute = !autoMute;
//     notifyListeners();//autoMute값을 듣고 있는 곳은 값이 바뀐다는 것을 알게된다.
//   }
// }

// final videoConfig = VideoConfig();

final videoConfig = ValueNotifier(false);
