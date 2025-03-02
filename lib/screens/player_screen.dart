import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerScreen extends StatefulWidget {
  final String videoId;

  const YouTubePlayerScreen({super.key, required this.videoId});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        forceHD: true,
      ),
    )..addListener(() {
        setState(() {
          isPlaying = _controller.value.isPlaying;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    if (isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("เพลง",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(width: 20),
            const Text("วิดีโอ",
                style: TextStyle(color: Colors.white54, fontSize: 18))
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ),
          const SizedBox(height: 20),
          const Text("AWAKE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          const Text("Hoshimachi Suisei",
              style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.thumb_up, color: Colors.white70),
                Text("1.7 หมื่น", style: TextStyle(color: Colors.white70)),
                Icon(Icons.comment, color: Colors.white70),
                Text("122", style: TextStyle(color: Colors.white70)),
                Icon(Icons.playlist_add, color: Colors.white70),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shuffle, color: Colors.white70),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous,
                    color: Colors.white, size: 35),
                onPressed: () {},
              ),
              GestureDetector(
                onTap: togglePlayPause,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ),
              IconButton(
                icon:
                    const Icon(Icons.skip_next, color: Colors.white, size: 35),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.loop, color: Colors.white70),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
