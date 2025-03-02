import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube/widgets/home_page.dart';
import 'package:youtube/widgets/music_provider.dart';

import 'widgets/main_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MusicProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Music',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}
