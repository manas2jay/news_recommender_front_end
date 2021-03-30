import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://192.168.29.226:8000/news/';
}

class HealthService {
  static Future<List<dynamic>> getarticle() async {
    final response = await http.get(Uri.https(URLS.BASE_URL, 'listhealth'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
