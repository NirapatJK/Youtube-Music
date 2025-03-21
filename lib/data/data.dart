import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'AIzaSyBZpfqE8d0jc1uisyTc0DWLj0x-33L02hI';

Future<List<Map<String, String>>> fetchSongs(String query) async {
  try {
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
                "videoId": video['id']['videoId'].toString(),
                "artist": video['snippet'].containsKey('channelTitle') 
                          ? video['snippet']['channelTitle'].toString()
                          : "Unknown Artist"
              })
          .toList();
    } else {
      throw Exception('โหลดวิดีโอไม่สำเร็จ: ${response.statusCode}');
    }
  } catch (error) {
    print("ข้อผิดพลาด: $error");
    return [];
  }
}
   

