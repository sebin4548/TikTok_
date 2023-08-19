import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({super.key});

  @override
  State<VideoRecordingScreen> createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

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
    _flashMode = _cameraController.value.flashMode;
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
    initPermissions();
    // print("ddddd");
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !_hasPermission || !_cameraController.value.isInitialized
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
                CameraPreview(_cameraController),
                Positioned(
                  top: Sizes.size20,
                  left: Sizes.size20,
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