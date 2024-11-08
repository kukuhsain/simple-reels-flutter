import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';

part 'video_list_event.dart';

part 'video_list_state.dart';

class VideoListBloc extends Bloc<VideoListEvent, VideoListState> {
  VideoListBloc() : super(VideoListInitial()) {
    on<FetchVideoListEvent>((event, emit) async {
      emit(VideoListInitial());
      try {
        final videoRepository = VideoRepository();
        final videoList = await videoRepository.fetchVideoList(page: 1);
        emit(VideoListData(videoList, 1));
      } catch (err) {
        emit(VideoListError());
      }
    });
  }
}
