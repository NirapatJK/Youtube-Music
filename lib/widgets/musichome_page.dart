import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // Menu Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuButton("มาใหม่"),
              _buildMenuButton("อันดับ"),
              _buildMenuButton("อารมณ์และแนวเพลง"),
            ],
          ),
          SizedBox(height: 20),
          Text("อัลบั้มและซิงเกิลใหม่",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          // Album Grid
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildAlbum("WORTH IT!", "Hatsune Miku", "assets/miku1.jpg"),
                _buildAlbum("I NEVER KNEW", "Hatsune Miku", "assets/miku2.jpg"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text("เพลงยอดนิยม",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _buildSongTile("APT.", "ROSÉ และ Bruno", "assets/rose.jpg"),
          _buildSongTile(
              "Die With A Smile", "Lady Gaga", "assets/ladygaga.jpg"),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[900]),
      onPressed: () {},
      child: Text(title, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildAlbum(String title, String artist, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(artist, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSongTile(String title, String artist, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(artist, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert, color: Colors.white),
    );
  }
}
