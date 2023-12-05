import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intern_testing/data/model/files_model.dart';
import 'package:intern_testing/home/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer();
  late VideoPlayerController _controller;
  bool isAudioPlaying = false;
  Map<int, bool> isAudioPlayingMap = {};

  setController(String path) {
    _controller = VideoPlayerController.asset(path);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterLogo(size: 120),
                  FlutterLogo(size: 120),
                  FlutterLogo(size: 120),
                  FlutterLogo(size: 120),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.home_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ...List.generate(filesData.length, (index) {
                            if (!isAudioPlayingMap.containsKey(index)) {
                              isAudioPlayingMap[index] = false;
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                tileColor: Colors.orange,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(30, 100),
                                      bottomLeft: Radius.elliptical(30, 100),
                                    ),
                                    side: BorderSide(color: Colors.red)),
                                title: Text(filesData[index].fileName),
                                leading: Text((index + 1).toString()),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("5:20"),
                                    IconButton(
                                      onPressed: () {
                                        if (filesData[index]
                                            .filePath
                                            .contains(".mp4")) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerPage(
                                                        videoAssetPath:
                                                            filesData[index]
                                                                .filePath),
                                              ));
                                        } else {
                                          if (!isAudioPlayingMap
                                              .containsKey(index)) {
                                            isAudioPlayingMap[index] = false;
                                          }

                                          if (!isAudioPlayingMap[index]!) {
                                            player.play(AssetSource(
                                                filesData[index].filePath));
                                          } else {
                                            player.stop();
                                          }

                                          setState(() {
                                            isAudioPlayingMap[index] =
                                                !isAudioPlayingMap[index]!;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        isAudioPlayingMap[index]!
                                            ? Icons.pause_circle_filled
                                            : Icons.play_circle,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
