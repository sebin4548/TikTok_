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

// final videoConfig = ValueNotifier(false);

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleIsMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleAutoPlay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}

//provider 덕분에 앱의 모든 곳에 데이터를 제공하고 보고 읽기 어디서든 사용이 가능하다.
//  사용과정
// 1. provider 패키지 설치
// 2. 앱을 provider으로 감싸기
// 3. listener은 context.watch()만 해도 된다.
// context.read<VideoConfig>().toggleIsMuted(); (함수호출)
// context.watch<VideoConfig>().isMuted (값을 가져오기)


//MVVM
// View <-> View Model <-> Model