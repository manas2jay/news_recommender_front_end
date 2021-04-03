import "package:http/http.dart" as http;

import 'RecomendClass.dart';

class Services {
  static const String url = 'http://192.168.29.226:8000/recommend/show';
  static Future<List<RecommendClass>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
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
