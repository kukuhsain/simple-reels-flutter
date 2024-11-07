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
        backgroundColor: Colors.black,
      ),
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
                  color: Colors.black12,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 0),
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    video.user?.profilePictureCdn ?? ''),
                              ),
                              title: Text(
                                video.user?.fullname ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                video.user?.username ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Text(
                              video.title ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              iconSize: 32,
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${video.totalLikes ?? 0}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            IconButton(
                              onPressed: () {},
                              iconSize: 32,
                              icon: const Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${video.totalComments ?? 0}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            IconButton(
                              onPressed: () {},
                              iconSize: 32,
                              icon: const Icon(
                                Icons.send_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${video.totalShare ?? 0}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 16),
                            IconButton(
                              onPressed: () {},
                              iconSize: 32,
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
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
