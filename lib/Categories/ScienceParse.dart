import 'package:flutter/material.dart';
import 'Science.dart';
import 'ScienceClass.dart';

class ScienceParse extends StatefulWidget {
  ScienceParse() : super();
  @override
  State<StatefulWidget> createState() => _ScienceParseState();
}

class _ScienceParseState extends State<ScienceParse> {
  List<ScienceClass> _users;
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
        title: Text(_loading ? "loading..." : "Json Science parse"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            ScienceClass user = _users[index];
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
