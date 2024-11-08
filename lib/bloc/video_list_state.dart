part of 'video_list_bloc.dart';

enum VideoListStatus { loading, success, failure }

class VideoListState {
  final VideoListStatus status;
  final List<Video> videos;
  final int dataPage;

  const VideoListState({
    this.status = VideoListStatus.loading,
    this.videos = const [],
    this.dataPage = 0,
  });

  VideoListState copyWith({
    VideoListStatus? status,
    List<Video>? videos,
    int? dataPage,
  }) {
    return VideoListState(
      status: status ?? this.status,
      videos: videos ?? this.videos,
      dataPage: dataPage ?? this.dataPage,
    );
  }
}
