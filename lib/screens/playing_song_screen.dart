import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';

class PlayingSongScreen extends StatelessWidget {
  final String? trackPhotoUrl;
  final String? trackName;
  final String? beatMakerName;
  const PlayingSongScreen(
      {required this.trackName,
      required this.beatMakerName,
      required this.trackPhotoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(fit: BoxFit.cover, trackPhotoUrl!),
      ),
      Positioned.fill(
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Positioned(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: CircleAvatar(
                        radius: 160,
                        backgroundImage: NetworkImage(trackPhotoUrl!)),
                  ),
                  ListTile(
                    title: Text(trackName!),
                    subtitle: Text(beatMakerName!),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border_outlined)),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.more)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ProgressBar(
                      progressBarColor: Colors.white,
                      bufferedBarColor: Colors.transparent,
                      thumbColor: Colors.white,
                      progress: const Duration(milliseconds: 1000),
                      buffered: const Duration(milliseconds: 2000),
                      total: const Duration(milliseconds: 5000),
                      onSeek: (duration) {
                        print('User selected a new time: $duration');
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.download_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_previous)),
                        InkWell(
                            child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.pause,
                            color: Colors.black,
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_next)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.document_scanner)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white)),
                    child: const Text(
                      '+ Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ),
            )),
      )
    ]));
  }
}
