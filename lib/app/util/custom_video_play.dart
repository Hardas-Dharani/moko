import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:moko/app/util/adsvideoScreen.dart';
import 'package:moko/presentation/pages/my_playlist_playlist/controller/myplaylist_controller.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  VideoPlayerController? _videoPlayerController;
  CustomVideoPlayerController? _customVideoPlayerController;
  bool _isInitialized = false;
  final controller = Get.put(MyPlayListController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Obx(
        () => controller.Ads_open.value
            ? adsScreen(
                videoUrl: 'https://blindsidebets.com/soft-drink.mp4',
                onTap: () {
                  print('asddsdasdasfddfd');
                  controller.Ads_open.value = false;
                },
              )
            : _isInitialized
                ? CustomVideoPlayer(
                    customVideoPlayerController: _customVideoPlayerController!,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_videoPlayerController?.value.isPlaying ?? false) {
      _pauseVideo();
      controller.Ads_open.value = true;
      return false;
    }
    return true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pauseVideo();
      controller.Ads_open.value = true;
    } else if (state == AppLifecycleState.inactive) {
      _pauseVideo();
      controller.Ads_open.value = true;
    } else if (state == AppLifecycleState.detached) {
      _pauseVideo();
      controller.Ads_open.value = true;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoPlayerController?.pause();
    controller.Ads_open.value = true;          
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    WidgetsBinding.instance.addObserver(this);
  }

  void _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    try {
      await _videoPlayerController?.initialize();
      setState(() {
        _isInitialized = true;
      });

      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _videoPlayerController!..setLooping(true),
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          showDurationPlayed: false,
          showDurationRemaining: false,
          playbackSpeedButtonAvailable: true,
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
}
