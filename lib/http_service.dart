// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'post_model.dart';

// class HttpService {
//   final String postsURL = "http://192.168.29.226:8000/adduser";

//   Future<List<Post>> getPosts() async {
//     Response res = await http.get(Uri.parse(postsURL));

//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);

//       List<Post> posts = body
//           .map(
//             (dynamic item) => Post.fromJson(item),
//           )
//           .toList();

//       return posts;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }
// }
