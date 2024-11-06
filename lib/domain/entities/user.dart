class User {
  final int? userId;
  final String? fullname;
  final String? username;
  final String? profilePicture;
  final String? profilePictureCdn;
  final String? designation;

  User({
    this.userId,
    this.fullname,
    this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      fullname: json['fullname'],
      username: json['username'],
      profilePicture: json['profile_picture'],
      profilePictureCdn: json['profile_picture_cdn'],
      designation: json['designation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'fullname': fullname,
      'username': username,
      'profile_picture': profilePicture,
      'profile_picture_cdn': profilePictureCdn,
      'designation': designation,
    };
  }
}
