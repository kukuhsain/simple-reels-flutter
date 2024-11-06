import 'package:simple_reels_flutter/domain/entities/user.dart';

class Video {
  final int id;
  final String title;
  final String url;
  final String cdnUrl;
  final String thumbCdnUrl;
  final int userId;
  final String status;
  final String slug;
  final String encodeStatus;
  final int priority;
  final int categoryId;
  final int totalViews;
  final int totalLikes;
  final int totalComments;
  final int totalShare;
  final int totalWishlist;
  final int duration;
  final DateTime byteAddedOn;
  final DateTime byteUpdatedOn;
  final String? bunnyStreamVideoId;
  final String? bytePlusVideoId;
  final String language;
  final int bunnyEncodingStatus;
  final DateTime? deletedAt;
  final int videoHeight;
  final int videoWidth;
  final String? location;
  final int isPrivate;
  final int isHideComment;
  final String? description;
  final User user;
  final bool isLiked;
  final bool isWished;
  final bool isFollow;
  final String videoAspectRatio;

  Video({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.bytePlusVideoId,
    required this.language,
    required this.bunnyEncodingStatus,
    this.deletedAt,
    required this.videoHeight,
    required this.videoWidth,
    this.location,
    required this.isPrivate,
    required this.isHideComment,
    this.description,
    required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    required this.videoAspectRatio,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      cdnUrl: json['cdn_url'],
      thumbCdnUrl: json['thumb_cdn_url'],
      userId: json['user_id'],
      status: json['status'],
      slug: json['slug'],
      encodeStatus: json['encode_status'],
      priority: json['priority'],
      categoryId: json['category_id'],
      totalViews: json['total_views'],
      totalLikes: json['total_likes'],
      totalComments: json['total_comments'],
      totalShare: json['total_share'],
      totalWishlist: json['total_wishlist'],
      duration: json['duration'],
      byteAddedOn: DateTime.parse(json['byte_added_on']),
      byteUpdatedOn: DateTime.parse(json['byte_updated_on']),
      bunnyStreamVideoId: json['bunny_stream_video_id'],
      bytePlusVideoId: json['byte_plus_video_id'],
      language: json['language'],
      bunnyEncodingStatus: json['bunny_encoding_status'],
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      videoHeight: json['video_height'],
      videoWidth: json['video_width'],
      location: json['location'],
      isPrivate: json['is_private'],
      isHideComment: json['is_hide_comment'],
      description: json['description'],
      user: User.fromJson(json['user']),
      isLiked: json['is_liked'],
      isWished: json['is_wished'],
      isFollow: json['is_follow'],
      videoAspectRatio: json['video_aspect_ratio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'cdn_url': cdnUrl,
      'thumb_cdn_url': thumbCdnUrl,
      'user_id': userId,
      'status': status,
      'slug': slug,
      'encode_status': encodeStatus,
      'priority': priority,
      'category_id': categoryId,
      'total_views': totalViews,
      'total_likes': totalLikes,
      'total_comments': totalComments,
      'total_share': totalShare,
      'total_wishlist': totalWishlist,
      'duration': duration,
      'byte_added_on': byteAddedOn.toIso8601String(),
      'byte_updated_on': byteUpdatedOn.toIso8601String(),
      'bunny_stream_video_id': bunnyStreamVideoId,
      'byte_plus_video_id': bytePlusVideoId,
      'language': language,
      'bunny_encoding_status': bunnyEncodingStatus,
      'deleted_at': deletedAt?.toIso8601String(),
      'video_height': videoHeight,
      'video_width': videoWidth,
      'location': location,
      'is_private': isPrivate,
      'is_hide_comment': isHideComment,
      'description': description,
      'user': user.toJson(),
      'is_liked': isLiked,
      'is_wished': isWished,
      'is_follow': isFollow,
      'video_aspect_ratio': videoAspectRatio,
    };
  }
}
