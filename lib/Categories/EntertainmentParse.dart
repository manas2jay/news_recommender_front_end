import 'package:flutter/material.dart';

import 'Entertainment.dart';
import 'EntertainmentClass.dart';

class EntertainmentParse extends StatefulWidget {
  EntertainmentParse() : super();
  @override
  State<StatefulWidget> createState() => _EntertainmentParseState();
}

class _EntertainmentParseState extends State<EntertainmentParse> {
  List<EntertainmentClass> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "loading..." : "Json Entertainmenent parse"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            EntertainmentClass user = _users[index];
            return ListTile(
              title: Text(user.title),
              subtitle: Text(user.description),
              leading: Image.network(user.urlToImage),
            );
          },
        ),
      ),
    );
  }
}
