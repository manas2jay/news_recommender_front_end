import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Recomend.dart';
import 'RecomendClass.dart';

class RecomendParse extends StatefulWidget {
  RecomendParse() : super();
  @override
  State<StatefulWidget> createState() => _RecomendParseState();
}

class _RecomendParseState extends State<RecomendParse> {
  List<RecommendClass> _users;
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
        title: Text(_loading ? "loading..." : "Recommended News"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            RecommendClass user = _users[index];
            return ListTile(
                title: Text(user.title),
                subtitle: Text(user.description),
                leading: Image.network(user.urlToImage),
                onTap: () async {
                  String _url = user.url;
                  if (await canLaunch(_url)) {
                    await launch(_url,
                        forceSafariVC: false, forceWebView: true);
                  } else {
                    throw 'Could not launch $_url';
                  }
                });
          },
        ),
      ),
    );
  }
}