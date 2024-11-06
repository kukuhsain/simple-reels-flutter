import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_reels_flutter/domain/entities/video.dart';

class VideoRepository {
  // Method to fetch video list from API
  Future<List<Video>> fetchVideoList() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.ulearna.com/bytes/all?page=1&limit=10&country=United+States'));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Decode JSON response
        print('status: 200');
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        List<dynamic> data = responseBody['data']['data'];
        print('data: ${data.length}');
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
