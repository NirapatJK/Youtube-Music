import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  String _currentSong = "";

  bool get isPlaying => _isPlaying;
  String get currentSong => _currentSong;

  Future<void> playSong(String songUrl, String title) async {
    _currentSong = title;
    await _player.setUrl(songUrl);
    await _player.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _player.pause();
    _isPlaying = false;
    notifyListeners();
  }
}
