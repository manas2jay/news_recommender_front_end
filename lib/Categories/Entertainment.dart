// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'dart:convert';

// class Entertainment extends StatefulWidget {
//   @override
//   _EntertainmentState createState() => _EntertainmentState();
// }

// class _EntertainmentState extends State<Entertainment> {
//   var child;
//   var url = Uri.parse("http://192.168.29.226:8000/news/listentertainment");
//   var data;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   fetchData() async {
//     var res = await http.get(url);
//     data = jsonDecode(res.body);
//     setState(() {});
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Entertainment",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Truneo',
//               ),
//             ),
//             Text(" News",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Truneo',
//                 ))
//           ],
//         )),
//         body: ListView.builder(itemBuilder: (context, index) {
//           return ListTile(
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//             title: Text(data[index]["title"],
//                 style: TextStyle(
//                     fontFamily: 'Truneo', fontWeight: FontWeight.bold)),
//             subtitle: Text("ID: ${data[index]["description"]}"),
//             leading: Image.network(data[index]["UrlToImage"]),
//             onTap: () {},
//           );
//         }));
//   }
// }

import "package:http/http.dart" as http;

import 'EntertainmentClass.dart';

class Services {
  static const String url = 'http://192.168.29.226:8000/news/listentertainment';
  static Future<List<EntertainmentClass>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<EntertainmentClass> users =
            entertainmentClassFromJson(response.body);
        return users;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
