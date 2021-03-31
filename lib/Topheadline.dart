import "package:http/http.dart" as http;

import 'TopheadlineClass.dart';

class Services {
  static const String url = 'http://192.168.29.226:8000/topheadline';
  static Future<List<TopheadlineClass>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<TopheadlineClass> users =
            topheadlineClassFromJson(response.body);
        return users;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
