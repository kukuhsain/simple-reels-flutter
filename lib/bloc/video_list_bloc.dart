import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';
import 'package:simple_reels_flutter/domain/repositories/video_repository.dart';

part 'video_list_event.dart';

part 'video_list_state.dart';

class VideoListBloc extends Bloc<VideoListEvent, VideoListState> {
  final VideoRepository videoRepository;

  VideoListBloc(this.videoRepository) : super(const VideoListState()) {
    on<FetchVideoListEvent>(_fetchVideoList);
  }

  Future<void> _fetchVideoList(
    VideoListEvent event,
    Emitter<VideoListState> emit,
  ) async {
    emit(state.copyWith(status: VideoListStatus.loading));
    try {
      final newDataPage = state.dataPage + 1;
      final videoList = await videoRepository.fetchList(newDataPage);
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
