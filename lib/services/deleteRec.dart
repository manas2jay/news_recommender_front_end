import 'package:http/http.dart' as http;

Future<http.Response> deleteRecommend() {
  return http.get(Uri.parse('http://192.168.29.226:8000/recommend/deleterec'));
}
