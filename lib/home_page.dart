//import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:newsapi_v1/post_model.dart';
import 'package:newsapi_v1/post_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
//import 'package:newsapi_v1/Categories/Entertainment.dart';
//import 'package:newsapi_v1/Categories/EntertainmentParse.dart';
//import 'package:newsapi_v1/Categories/General.dart';
//import 'package:newsapi_v1/Categories/GeneralParse.dart';
// import 'package:newsapi_v1/Categories/Health.dart';
//import 'package:newsapi_v1/Categories/HealthParse.dart';
//import 'package:newsapi_v1/Categories/Sports.dart';
// import 'package:newsapi_v1/Categories/Technology.dart';
import 'package:newsapi_v1/services/authservice.dart';
//import 'package:http/http.dart' as http;
import 'Categories/EntertainmentParse.dart';
import 'Categories/GeneralParse.dart';
import 'Categories/HealthParse.dart';
//mport 'Categories/Science.dart';
//import 'Categories/business.dart';
import 'Categories/RecomendParse.dart';
import 'Categories/ScienceParse.dart';
import 'Categories/SportsParse.dart';
import 'Categories/TechnologyParse.dart';
import 'Categories/businessParse.dart';
import 'Topheadline.dart';
import 'TopheadlineClass.dart';

//import 'post_model.dart';
void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopheadlineClass> _users;
  // bool _loading;

  @override
  void initState() {
    super.initState();
    // _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        // _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "24 Hours",
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
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("OMEN"),
                accountEmail: Text("69SAXNINJA69"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1613750147830-c770850838b0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80"))),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("SaxNinja"),
              subtitle: Text("Developer"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.anchor_outlined),
              title: Text("Business",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BusinessParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.subscriptions_outlined),
              title: Text("Entertainment",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EntertainmentParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.healing_outlined),
              title: Text("Health",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HealthParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("General",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GeneralParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.sports),
              title: Text("Sports",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SportsParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_esports_outlined),
              title: Text("Technology",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TechnologyParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.subscript_rounded),
              title: Text("Science",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScienceParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.recommend),
              title: Text("Recommend",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecomendParse()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Truneo',
                  )),
              onTap: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            TopheadlineClass user = _users[index];
            // const _url = 'https://flutter.dev';
            // _launchURL() async {
            //   if (!_url.contains('http')) if (await canLaunch(_url)) {
            //     await launch(_url);
            //   } else {
            //     throw 'Could not launch $_url';
            //   }
            // }
            return ListTile(
                title: Text(user.title),
                subtitle: Text(user.description),
                leading: Image.network(user.urlToImage),
                isThreeLine: true,

                // onTap: () {},
                onTap: () async {
                  var userid = 'getcurrent';
                  var desc = user.description;
                  createdetail(userid, desc);
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
