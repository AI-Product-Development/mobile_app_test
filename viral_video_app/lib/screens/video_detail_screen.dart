import 'package:flutter/material.dart';
import '../models/video_result.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoResult video;

  const VideoDetailScreen({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(video.transcript ?? 'No transcript available.'),
        ),
      ),
    );
  }
}
