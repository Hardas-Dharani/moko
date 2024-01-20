import 'dart:async';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class adsScreen extends StatefulWidget {
  final String videoUrl;
  final Function()? onTap;
  const adsScreen({Key? key, required this.videoUrl, this.onTap})
      : super(key: key);

  @override
  _adsScreenState createState() => _adsScreenState();
}

class _adsScreenState extends State<adsScreen>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  VideoPlayerController? _videoPlayerController;
  CustomVideoPlayerController? _customVideoPlayerController;
  bool _isInitialized = false;
  RxBool ShowSkipBtn = false.obs;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => Stack(children: [
          Container(
            height: double.infinity,
            child: _isInitialized
                ? CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController!,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          if (ShowSkipBtn.value)
            Positioned(
              bottom: 140,
              right: 10,
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black.withOpacity(0.4)),
                  height: 50,
                  width: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 15,
                        )
                      ]),
                ),
              ),
            )
        ]),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pauseVideo();
    } else if (state == AppLifecycleState.inactive) {
      _pauseVideo();
    } else if (state == AppLifecycleState.detached) {
      _pauseVideo();
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // _customVideoPlayerController?.dispose();
    // _videoPlayerController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController?.pause();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // if (!_isInitialized) {
    //   _initializeVideo();
    // }
    _initializeVideo();

    WidgetsBinding.instance.addObserver(this);
  }

  void _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    try {
      await _videoPlayerController?.initialize();
      setState(() {
        _isInitialized = true;
        _videoPlayerController?.play();
        
        showSkipBtn();
      });
      // ignore: use_build_context_synchronously
      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _videoPlayerController!..setLooping(true),
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          showDurationPlayed: false,
          showDurationRemaining: false,
          playbackSpeedButtonAvailable: true,
          // enterFullscreenOnStart: true,
          settingsButtonAvailable: false,
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  void _pauseVideo() {
    if (_videoPlayerController!.value.isPlaying) {
      setState(() {
        _videoPlayerController?.pause();
      });
    }
  }

  showSkipBtn() {
    Timer(Duration(seconds: 5), () {
      ShowSkipBtn.value = true;
    });
  }
}
