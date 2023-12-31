import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/views/video_preview_screen.dart';

class VideoRecordingScreen extends StatefulWidget {
  static const String routeName = "postVideo";
  static const String routeURL = "/upload";

  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen>
    // with SingleTickerProviderStateMixin {
    with
        TickerProviderStateMixin, //한개가 아닌 2개의 animation을 컨트롤 하기 때문
        WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final bool _noCamera = kDebugMode && Platform.isIOS;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );

  late final Animation<double> _buttonAnimation = Tween(
    begin: 1.0,
    end: 1.3,
  ).animate(_buttonAnimationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  late FlashMode _flashMode;

  late CameraController
      _cameraController; //cameraController은 수정되는 거기 때문에 final이 빠진다.

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.veryHigh);
    await _cameraController.initialize();
    //only for ios
    await _cameraController.prepareForVideoRecording();
    _flashMode = _cameraController.value.flashMode;
    setState(() {});
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    } else {
      //Denied permission
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!_noCamera) {
      initPermissions();
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
    // initPermissions();
    //유저가 application을 벗어나면 우리가 알 수 있게 하는것
    WidgetsBinding.instance.addObserver(this);
    _progressAnimationController.addListener(() {
      setState(() {});
    });
    _progressAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopRecording();
      }
    });
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _onPickVideoPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video == null) return;
    print(video);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          isPicked: true,
          video: video,
        ),
      ),
    );
  }

  Future<void> _startRecording(TapDownDetails _) async {
    if (_cameraController.value.isRecordingVideo) return;
    print("DragSTARTTTTTTTTTTTTTTTTTTTTt");

    await _cameraController.startVideoRecording();

    _buttonAnimationController.forward();
    _progressAnimationController.forward();
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) return;
    print("DragEnddddddddddddddddddddddddd");
    _buttonAnimationController.reverse();
    _progressAnimationController.reset();

    final video = await _cameraController.stopVideoRecording();

    if (!mounted) return;

    // await _cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPreviewScreen(
          isPicked: false,
          video: video,
        ),
      ),
    );
  }

  Future<void> _zoom(DragUpdateDetails details) async {
    print("DraggZoom");

    print("Drag ${details.localPosition.dy}");

    _cameraController.setZoomLevel(details.localPosition.dy / (-50));
    // _cameraController.setZoomLevel(1);
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _buttonAnimationController.dispose();
    if (!_noCamera) _cameraController.dispose();
    super.dispose();
  }

  // void didChangeAppLifecycleStates() {}
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (_noCamera) return;
    print(" jjjjjjjjjjjjjjjj \n \n");
    print(state);
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
      // setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !_hasPermission
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Initializing...",
                  style: TextStyle(color: Colors.white, fontSize: Sizes.size20),
                ),
                Gaps.v20,
                CircularProgressIndicator.adaptive()
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                if (!_noCamera && _cameraController.value.isInitialized)
                  CameraPreview(_cameraController),
                Positioned(
                  top: Sizes.size40,
                  left: Sizes.size20,
                  child: CloseButton(
                    color: Colors.white,
                  ),
                ),
                if (!_noCamera)
                  Positioned(
                    top: Sizes.size20,
                    right: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(
                            Icons.cameraswitch,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.off
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.off),
                          icon: const Icon(
                            Icons.flash_off_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.always
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.always),
                          icon: const Icon(
                            Icons.flash_on_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.auto
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.auto),
                          icon: const Icon(
                            Icons.flash_auto_rounded,
                          ),
                        ),
                        Gaps.v10,
                        IconButton(
                          color: _flashMode == FlashMode.torch
                              ? Colors.amber.shade200
                              : Colors.white,
                          onPressed: () => _setFlashMode(FlashMode.torch),
                          icon: const Icon(
                            Icons.flashlight_on_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                Positioned(
                  bottom: Sizes.size36,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTapDown: _startRecording,
                        onTapUp: (details) => _stopRecording(),
                        onVerticalDragUpdate: (details) => _zoom(details),
                        onVerticalDragStart: (details) {
                          print(details);
                        },
                        child: ScaleTransition(
                          scale: _buttonAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  color: Colors.red.shade500,
                                  value: _progressAnimationController.value,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: IconButton(
                            onPressed: _onPickVideoPressed,
                            icon: FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

// class IconBtn extends StatelessWidget {
//   const IconBtn({super.key, required this.flashMode, required this.icon});
//   final FlashMode flashMode;
//   final Icon icon;

//   @override
//   Widget build(BuildContext context) {
//     late FlashMode _flashMode;
//     return IconButton(
//       color:
//           _flashMode == FlashMode.torch ? Colors.amber.shade200 : Colors.white,
//       onPressed: () => _setFlashMode(FlashMode.torch),
//       icon: const Icon(
//         Icons.flashlight_on_rounded,
//       ),
//     );
//   }
// }

