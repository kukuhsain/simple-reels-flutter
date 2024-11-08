import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reels_flutter/data/repositories/video_repository.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';

part 'video_list_event.dart';

part 'video_list_state.dart';

class VideoListBloc extends Bloc<VideoListEvent, VideoListState> {
  VideoListBloc() : super(const VideoListState()) {
    on<FetchVideoListEvent>(_fetchVideoList);
  }

  Future<void> _fetchVideoList(
    VideoListEvent event,
    Emitter<VideoListState> emit,
  ) async {
    emit(state.copyWith(status: VideoListStatus.loading));
    try {
      final videoRepository = VideoRepository();
      final newDataPage = state.dataPage + 1;
      final videoList = await videoRepository.fetchVideoList(page: newDataPage);
      emit(state.copyWith(
        status: VideoListStatus.success,
        videos: [...state.videos, ...videoList],
        dataPage: newDataPage,
      ));
    } catch (err) {
      emit(state.copyWith(status: VideoListStatus.failure));
    }
  }
}
