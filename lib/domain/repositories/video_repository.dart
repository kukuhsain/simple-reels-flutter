import 'package:simple_reels_flutter/domain/entities/video.dart';

abstract class VideoRepository {
  Future<List<Video>> fetchList(int page);
}
