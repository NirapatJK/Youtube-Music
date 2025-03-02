import 'package:flutter/material.dart';
import 'package:youtube/widgets/video_player_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'AIzaSyD1JgGbCT01psk7hYJka38gzcMy-tV5fIg';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  List<Map<String, String>> videoList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchShorts();
  }

  Future<void> fetchShorts() async {
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=shorts+music&type=video&key=$apiKey&maxResults=10');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        videoList = (data['items'] as List)
            .where((video) => video['id'].containsKey('videoId'))
            .map((video) => {
                  "title": video['snippet']['title'].toString(),
                  "videoId": video['id']['videoId'].toString(),
                })
            .toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load YouTube shorts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                return VideoPlayerScreen(
                  videoUrl:
                      'https://www.youtube.com/watch?v=${videoList[index]["videoId"]}',
                  title: videoList[index]["title"]!,
                  artist: '', // เพิ่มข้อมูลศิลปินถ้ามี
                );
              },
            ),
    );
  }
}
