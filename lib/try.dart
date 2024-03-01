import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Try extends StatefulWidget {
  const Try({super.key});

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // ignore: deprecated_member_use
    // _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    // _videoPlayerController = VideoPlayerController.network(
    //     'https://www.youtube.com/watch?v=8R7XqslaEUE')
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    _videoPlayerController = VideoPlayerController.asset(
        "assets/images/discovery_page/Art_Of_Thinking.mp4")
      ..initialize().then((_) {
        _videoPlayerController.setLooping(true);
        _videoPlayerController.play();
        // _videoPlayerController.setVolume(1);
        setState(() {});
      });

    // _initializeVideoPlayerFuture = _videoPlayerController.initialize();

    super.initState();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Coba Video'),
  //     ),
  //     body: Container(
  //       child: FutureBuilder(
  //         future: _initializeVideoPlayerFuture,
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             return AspectRatio(
  //               aspectRatio: _videoPlayerController.value.aspectRatio,
  //               child: VideoPlayer(_videoPlayerController),
  //             );
  //           } else {
  //             return Center(child: CircularProgressIndicator());
  //           }
  //         },
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         setState(() {
  //           _videoPlayerController.value.isPlaying
  //               ? _videoPlayerController.pause()
  //               : _videoPlayerController.play();
  //         });
  //       },
  //       child: Icon(
  //         _videoPlayerController.value.isPlaying
  //             ? Icons.pause
  //             : Icons.play_arrow,
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo RIchie"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}

class TryYoutube extends StatefulWidget {
  const TryYoutube({super.key});

  @override
  State<TryYoutube> createState() => _TryYoutubeState();
}

class _TryYoutubeState extends State<TryYoutube> {
  final url = 'https://www.youtube.com/watch?v=8R7XqslaEUE';
  late YoutubePlayerController _ytController;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video Example'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: 'YOUR_YOUTUBE_VIDEO_ID',
            flags: YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
