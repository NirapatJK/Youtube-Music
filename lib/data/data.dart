import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'AIzaSyD1JgGbCT01psk7hYJka38gzcMy-tV5fIg';

Future<List<Map<String, String>>> fetchSongs(String query) async {
  final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query music&type=video&videoCategoryId=10&key=$apiKey&maxResults=10');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    return (data['items'] as List)
        .where((video) => video['id'].containsKey('videoId'))
        .map((video) => {
              "title": video['snippet']['title'].toString(),
              "cover": video['snippet']['thumbnails']['high']['url'].toString(),
              "videoId": video['id']['videoId'].toString()
            })
        .toList();
  } else {
    throw Exception('Failed to load YouTube music videos');
  }
}
