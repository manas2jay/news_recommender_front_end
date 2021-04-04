import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createdetail(String userid, desc) {
  return http.post(
    Uri.https('https://192.168.29.226:8000/', 'adduser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user': userid,
      'description': desc,
    }),
  );
}
