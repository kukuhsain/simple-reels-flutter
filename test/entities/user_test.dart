import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_reels_flutter/domain/entities/user.dart';

void main() {
  String jsonString = '''{
    "user_id": 32,
    "fullname": "Rahmatullah Nowruz",
    "username": "rnowruz",
    "profile_picture": "QOrUSD426nE7tHwYkPGxWb8Bus-32.jpg",
    "profile_picture_cdn": "https://ulearna.b-cdn.net/profiles/QOrUSD426nE7tHwYkPGxWb8Bus-32.jpg",
    "designation": "Founder and CEO of Ulearna "
  }''';

  test('Counter value should be incremented', () {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    User user = User.fromJson(jsonMap);
    expect(user.toJson(), jsonMap);
  });
}
