import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_reels_flutter/domain/entities/video.dart';
import 'package:simple_reels_flutter/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  @override
  Future<List<Video>> fetchList(int page) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.ulearna.com/bytes/all?page=$page&limit=10&country=United+States'));

      if (response.statusCode == 200) {
        // Decode JSON response
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        List<dynamic> data = responseBody['data']['data'];
        // Convert the JSON to a list of Video objects
        return data.map((json) => Video.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
