import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class EnMiVidaScreen extends StatefulWidget {
  static const routeName = '/en-mi-vida';

  const EnMiVidaScreen({Key? key}) : super(key: key);

  @override
  _EnMiVidaScreenState createState() => _EnMiVidaScreenState();
}

class _EnMiVidaScreenState extends State<EnMiVidaScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  double playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/videos/video_emotivo.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 4 / 3,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void togglePlaybackSpeed() {
    if (playbackSpeed == 1.0) {
      playbackSpeed = 1.5;
    } else {
      playbackSpeed = 1.0;
    }
    _videoPlayerController.setPlaybackSpeed(playbackSpeed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 700,
              height: 375,
              child: Chewie(controller: _chewieController),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_videoPlayerController.value.volume == 0 ? Icons.volume_off : Icons.volume_up),
                  onPressed: () {
                    setState(() {
                      if (_videoPlayerController.value.volume == 0) {
                        _videoPlayerController.setVolume(1);
                      } else {
                        _videoPlayerController.setVolume(0);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.fast_rewind),
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(seconds: _videoPlayerController.value.position.inSeconds - 10));
                  },
                ),
                IconButton(
                  icon: Icon(_videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    if (_videoPlayerController.value.isPlaying) {
                      _videoPlayerController.pause();
                    } else {
                      _videoPlayerController.play();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.fast_forward),
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(seconds: _videoPlayerController.value.position.inSeconds + 10));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.speed),
                  onPressed: togglePlaybackSpeed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
