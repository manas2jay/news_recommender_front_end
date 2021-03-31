import 'package:flutter/material.dart';
import 'package:newsapi_v1/Categories/Health.dart';
import 'HealthClass.dart';

class HealthParse extends StatefulWidget {
  HealthParse() : super();
  @override
  State<StatefulWidget> createState() => _HealthParseState();
}

class _HealthParseState extends State<HealthParse> {
  List<HealthClass> _users;
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
        title: Text(_loading ? "loading..." : "Health News"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            HealthClass user = _users[index];
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