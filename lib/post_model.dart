import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String body;

  Post({
    @required this.id,
    @required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      body: json['body'] as String,
    );
  }
}
