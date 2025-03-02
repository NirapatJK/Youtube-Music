import 'package:flutter/material.dart';

class MusicLibraryScreen extends StatelessWidget {
  final List<Map<String, String>> playlists = [
    {
      "title": "เพลงที่ชอบ",
      "subtitle": "เพลย์ลิสต์อัตโนมัติ",
      "image": "assets/liked_songs.jpg"
    },
    {
      "title": "Suisei",
      "subtitle": "เพลย์ลิสต์ • Kaito Ishimaru",
      "image": "assets/suisei.jpg"
    },
  ];

  final List<Map<String, String>> artists = [
    {
      "name": "Hakos Baelz",
      "followers": "1.02 ล้าน",
      "image": "assets/baelz.jpg"
    },
    {"name": "白上フブキ", "followers": "1.81 หมื่น", "image": "assets/fubuki.jpg"},
    {
      "name": "Midnight Grand Orchestra",
      "followers": "1.37 แสน",
      "image": "assets/mgo.jpg"
    },
    {"name": "AZKi", "followers": "1.17 ล้าน", "image": "assets/azki.jpg"},
    {
      "name": "Hoshimachi Suisei",
      "followers": "2.62 ล้าน",
      "image": "assets/suisei.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("คลังเพลง", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("กิจกรรมล่าสุด",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ...playlists.map((playlist) => PlaylistTile(playlist)).toList(),
          SizedBox(height: 20),
          ...artists.map((artist) => ArtistTile(artist)).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}

class PlaylistTile extends StatelessWidget {
  final Map<String, String> playlist;
  PlaylistTile(this.playlist);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(playlist["image"]!)),
      title: Text(playlist["title"]!, style: TextStyle(color: Colors.white)),
      subtitle:
          Text(playlist["subtitle"]!, style: TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }
}

class ArtistTile extends StatelessWidget {
  final Map<String, String> artist;
  ArtistTile(this.artist);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(artist["image"]!)),
      title: Text(artist["name"]!, style: TextStyle(color: Colors.white)),
      subtitle: Text("ศิลปิน • ผู้ติดตาม ${artist["followers"]}",
          style: TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }
}
