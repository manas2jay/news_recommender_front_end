import 'package:flutter/material.dart';
import 'package:newsapi_v1/Categories/business.dart';
import 'BusinessClass.dart';

class BusinessParse extends StatefulWidget {
  BusinessParse() : super();
  @override
  State<StatefulWidget> createState() => _BusinessParseState();
}

class _BusinessParseState extends State<BusinessParse> {
  List<BusinessClass> _users;
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
        title: Text(_loading ? "loading..." : "Json business parse"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            BusinessClass user = _users[index];
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