import "package:http/http.dart" as http;

import 'RecomendClass.dart';

// ignore: camel_case_types
class Services_rec {
  static const String url = 'http://192.168.29.226:8000/recommend/user';
  static Future<List<RecommendClass>> getUsers(String name) async {
    try {
      // name ="abcd"-> abcd
      final response = await http
          .get(Uri.parse('http://192.168.29.226:8000/recommend?user=$name'));
      if (200 == response.statusCode) {
        final List<RecommendClass> users =
            recommendClassFromJson(response.body);
        return users;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
