part of 'video_list_bloc.dart';

sealed class VideoListState {}

final class VideoListInitial extends VideoListState {}

final class VideoListData extends VideoListState {
  final List<Video> videos;
  final int page;

  VideoListData(this.videos, this.page);
}

final class VideoListError extends VideoListState {}
