import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl, required String title, required String artist});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? _youtubeController;
  bool isError = false;

  @override
  void initState() {
    super.initState();

    // ✅ ตรวจสอบว่า videoId ถูกต้องหรือไม่
    String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    print("🔍 ตรวจสอบ videoId: $videoId");

    if (videoId == null) {
      print("❌ ERROR: ไม่สามารถดึง videoId จาก URL ได้");
      setState(() {
        isError = true;
      });
    } else {
      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      )..addListener(() {
          if (!_youtubeController!.value.isPlaying) {
            print("⏸️ วิดีโอหยุดเล่น");
          }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("เล่นวิดีโอ")),
      body: Center(
        child: isError
            ? Text("❌ ไม่สามารถโหลดวิดีโอได้", style: TextStyle(fontSize: 18))
            : _youtubeController != null
                ? YoutubePlayer(controller: _youtubeController!)
                : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }
}
