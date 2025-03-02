import 'package:flutter/material.dart';
import 'package:youtube/widgets/music_library.dart';

import '../screens/short_screnn.dart';
import 'home_page.dart';
import 'musichome_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MusicHomePage(),
    ShortsScreen(),
    MusicPage(),
    MusicLibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showAppBar = _selectedIndex == 0 || _selectedIndex == 2;

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text('Music'),
              actions: [
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://example.com/profile.jpg')),
                SizedBox(width: 10),
              ],
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'สำรวจ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), label: 'ลองฟัง'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'คลังเพลง'),
        ],
      ),
    );
  }
}
