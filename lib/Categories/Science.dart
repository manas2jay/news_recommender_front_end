import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  var child;
  var url = Uri.parse("http://192.168.29.226:8000/news/listscience");
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Science",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Truneo',
              ),
            ),
            Text(" News",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Truneo',
                ))
          ],
        )),
        body: ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            title: Text(data[index]["title"],
                style: TextStyle(
                    fontFamily: 'Truneo', fontWeight: FontWeight.bold)),
            subtitle: Text("ID: ${data[index]["description"]}"),
            leading: Image.network(data[index]["UrlToImage"]),
            onTap: () {},
          );
        }));
  }
}
