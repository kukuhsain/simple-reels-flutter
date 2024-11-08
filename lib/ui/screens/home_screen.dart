import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reels_flutter/bloc/video_list_bloc.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository_impl.dart';
import 'package:simple_reels_flutter/domain/repositories/video_repository.dart';
import 'package:simple_reels_flutter/ui/widgets/video_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VideoRepository _videoRepository = VideoRepositoryImpl();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoListBloc(_videoRepository)..add(FetchVideoListEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<VideoListBloc, VideoListState>(
          builder: (context, state) {
            print('video length: ${state.videos.length}');
            if (state.videos.isNotEmpty) {
              return PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  print('page index: $index');
                  if (index == state.videos.length - 1) {
                    print('should fetch...');
                    context.read<VideoListBloc>().add(FetchVideoListEvent());
                  }
                },
                itemCount: state.videos.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final video = state.videos[index];
                  return VideoDisplay(video: video);
                },
              );
            } else if (state.status == VideoListStatus.failure) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
