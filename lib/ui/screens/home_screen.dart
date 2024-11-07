import 'package:flutter/material.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';
import 'package:simple_reels_flutter/ui/widgets/video_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _videoRepository = VideoRepository();
  late PageController _pageController;
  int _pageDataIndex = 1;
  List<Video> _videos = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future.microtask(() async {
      final videoList =
          await _videoRepository.fetchVideoList(page: _pageDataIndex);
      setState(() {
        _videos = videoList;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _onPageChanged(int pageIndex) async {
    print('page index: $pageIndex');
    if (pageIndex == _videos.length - 1) {
      print('should fetch');
      final videoList =
          await _videoRepository.fetchVideoList(page: _pageDataIndex + 1);
      setState(() {
        _videos = [..._videos, ...videoList];
        _pageDataIndex++;
        print('fetched, length: ${_videos.length}, page: $_pageDataIndex');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: _videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final video = _videos[index];
          return VideoDisplay(video: video);
        },
      ),
    );
  }
}
