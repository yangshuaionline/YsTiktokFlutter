import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieVideoPage extends StatefulWidget {
  ChewieVideoPage({Key? key}) : super(key: key);

  @override
  State<ChewieVideoPage> createState() => _ChewieVideoPageState();
}

class _ChewieVideoPageState extends State<ChewieVideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'http://xiaotouhang.oss-cn-beijing.aliyuncs.com/xxth/manager/766e3bd859de4d15b3e65602845b8c14.mp4');
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("在线播放视频"),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}

