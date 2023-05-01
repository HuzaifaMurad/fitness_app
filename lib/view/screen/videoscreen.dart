import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const url = 'https://www.youtube.com/watch?v=j6UyNq_TwGA';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags:
            const YoutubePlayerFlags(mute: false, loop: false, autoPlay: true));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        onReady: () {
          setState(() {});
        },
      ),
      builder: (p0, p1) => Scaffold(
        appBar: AppBar(
          title: const Text("WORKOUT PREVIEW"),
        ),
        body: ListView(
          children: [
            p1,
            Text(controller.metadata.title),
            Text(controller.metadata.author),
            Text(controller.metadata.duration.toString()),
          ],
        ),
      ),
    );
  }
}
