import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapi_v1/Categories/Recommend_post.dart';
import 'package:url_launcher/url_launcher.dart';
import '../post_model.dart';
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
  getCurrentUser() {
    final User user = auth.currentUser;
    //final uid = user.uid;
    // Similarly we can get email as well
    final uname = user.email;

    //print(uemail);
    return uname;
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    String name = getCurrentUser();
    Services_rec.getUsers(name);
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String name = getCurrentUser();
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
                tileColor: Colors.black,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4.0, vertical: 15.0),
                title: Text(user.title,
                    style: TextStyle(
                        fontFamily: 'Truneo',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                subtitle: Text(''),
                leading: Image.network(user.urlToImage),
                onTap: () async {
                  var userid = name;
                  var desc = user.description;
                  createdetail(userid, desc);
                  Services_rec.getUsers(name);
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
