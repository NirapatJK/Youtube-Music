import 'package:flutter/material.dart';
import 'dart:math';
import '../data/data.dart';
import 'video_player_screen.dart';

class MusicHomePage extends StatefulWidget {
  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  List<Map<String, String>> songs = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    List<Map<String, String>>? results = await fetchSongs("");

    // กรองเฉพาะเพลงที่มีข้อมูลครบถ้วน (มี videoId, cover, และ title)
    results = results
        .where((song) =>
            song['videoId'] != null &&
            song['cover'] != null &&
            song['title'] != null)
        .toList();

    results.shuffle(_random); // สุ่มลำดับเพลง
    setState(() {
      songs = results!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: songs.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return GestureDetector(
                  onTap: () {
  String title = song['title'] ?? "Unknown Title";
  String artist = song.containsKey('artist') ? song['artist']! : "Unknown Artist";
  
  String? videoId = song['videoId'];
  if (videoId == null || videoId.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ไม่สามารถโหลดวิดีโอได้'))
    );
    return;
  }
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VideoPlayerScreen(
        videoUrl: 'https://www.youtube.com/watch?v=$videoId',
        title: title,
        artist: artist,
      ),
    ),
  );
},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(song['cover']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.black.withOpacity(0.7),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          song['title']!,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
