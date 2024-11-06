import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_reels_flutter/domain/entities/video.dart';

void main() {
  String jsonString = '''{
    "id": 92,
    "title": "Rahmatullah Nowruz complete podcast with Shahid Anwar! ",
    "url": "e099050d-ad87-47b6-b177-659a19d24a68/preview.webp",
    "cdn_url": "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/play_480p.mp4",
    "thumb_cdn_url": "https://vz-48b5dfd0-3fe.b-cdn.net/e099050d-ad87-47b6-b177-659a19d24a68/thumbnail_25acae55.jpg",
    "user_id": 32,
    "status": "approved",
    "slug": "rahmatullah-nowruz-complete-podcast-with-shahid-an-92",
    "encode_status": "pending",
    "priority": 0,
    "category_id": 19,
    "total_views": 31631,
    "total_likes": 683,
    "total_comments": 84,
    "total_share": 211,
    "total_wishlist": 44,
    "duration": 2575,
    "byte_added_on": "2024-04-03T12:46:47.000Z",
    "byte_updated_on": "2024-11-04T20:45:00.000Z",
    "bunny_stream_video_id": "e099050d-ad87-47b6-b177-659a19d24a68",
    "byte_plus_video_id": null,
    "language": "Pushto",
    "bunny_encoding_status": 4,
    "deleted_at": null,
    "video_height": 1080,
    "video_width": 1920,
    "location": null,
    "is_private": 0,
    "is_hide_comment": 0,
    "description": null,
    "user": {
    "user_id": 32,
    "fullname": "Rahmatullah Nowruz",
    "username": "rnowruz",
    "profile_picture": "QOrUSD426nE7tHwYkPGxWb8Bus-32.jpg",
    "profile_picture_cdn": "https://ulearna.b-cdn.net/profiles/QOrUSD426nE7tHwYkPGxWb8Bus-32.jpg",
    "designation": "Founder and CEO of Ulearna "
    },
    "is_liked": false,
    "is_wished": false,
    "is_follow": false,
    "video_aspect_ratio": "16:9"
  }''';

  test('Video: fromJson', () {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    Video video = Video.fromJson(jsonMap);
    expect(video.toJson(), jsonMap);
  });
}
