import 'package:flutter/material.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final repository = VideoRepository();
      final videoList = await repository.fetchVideoList();
      setState(() {
        videos = videoList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      // body: ListView.builder(
      //   padding: const EdgeInsets.all(16),
      //   itemCount: videos.length,
      //   itemBuilder: (context, index) {
      //     final video = videos[index];
      //     return VideoCard(video: video);
      //   },
      // ),
      body: PageView.builder(
        itemCount: videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final video = videos[index];
          return VideoCard(video: video);
        },
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        child: Stack(
          children: [
            Center(
              child: Image.network(video.thumbCdnUrl ?? ''),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white54,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    video.user?.profilePictureCdn ?? ''),
                              ),
                              title: Text(video.user?.fullname ?? ''),
                              subtitle: Text(video.user?.username ?? ''),
                            ),
                            Text(
                              video.title ?? '',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Text('Duration: ${video.duration ?? 0}'),
                            Text('Like: ${video.totalLikes ?? 0}'),
                            Text('Comment: ${video.totalComments ?? 0}'),
                            Text('Share: ${video.totalShare ?? 0}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
