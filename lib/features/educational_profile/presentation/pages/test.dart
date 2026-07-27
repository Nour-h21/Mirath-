import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeTestPage extends StatefulWidget {
  const YoutubeTestPage({super.key});

  @override
  State<YoutubeTestPage> createState() => _YoutubeTestPageState();
}

class _YoutubeTestPageState extends State<YoutubeTestPage> {
  late YoutubePlayerController _controller;

  // رابط تجريبي
  final String url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(url)!;

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        showLiveFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("YouTube Test"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}