import 'package:http/http.dart' as http;

Future<http.Response> createdetail(String userid, desc) {
  return http.get(
    Uri.parse('http://192.168.29.226:8000/adduser?user=$userid' +
        '&description=$desc'),
  );
}
