import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube/widgets/music_provider.dart';

class MusicPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MusicProvider>(context);
    return provider.currentSong.isEmpty
        ? SizedBox.shrink()
        : Container(
            padding: EdgeInsets.all(10),
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(provider.currentSong,
                    style: TextStyle(color: Colors.white)),
                IconButton(
                  icon: Icon(
                      provider.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white),
                  onPressed: () {
                    provider.isPlaying
                        ? provider.pause()
                        : provider.playSong("", provider.currentSong);
                  },
                )
              ],
            ),
          );
  }
}
