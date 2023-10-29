import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

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

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _isInitialized
        ? CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController!,
          )
        : const Center(
            child: CircularProgressIndicator(),
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
}
