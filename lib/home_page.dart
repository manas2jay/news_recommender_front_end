import 'package:flutter/material.dart';
import 'package:newsapi_v1/Categories/Entertainment.dart';
import 'package:newsapi_v1/Categories/General.dart';
import 'package:newsapi_v1/Categories/Health.dart';
import 'package:newsapi_v1/Categories/Sports.dart';
import 'package:newsapi_v1/Categories/Technology.dart';
import 'package:newsapi_v1/services/authservice.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Categories/Science.dart';
import 'Categories/business.dart';

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
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("24 Hours", style: TextStyle(color: Colors.white,fontFamily: 'Truneo',),),
            Text(" News",
              style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)
            )],
        )
      ),
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
              title: Text("Business",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Business()));
              },
            ),
            ListTile(
              leading: Icon(Icons.subscriptions_outlined),
              title: Text("Entertainment",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Entertainment()));
              },
            ),
            ListTile(
              leading: Icon(Icons.healing_outlined),
              title: Text("Health",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Health()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text("General",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => General()));
              },
            ),
            ListTile(
              leading: Icon(Icons.sports),
              title: Text("Sports",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sports()));
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_esports_outlined),
              title: Text("Technology",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Technology()));
              },
            ),
            ListTile(
              leading: Icon(Icons.subscript_rounded),
              title: Text("Science",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Science()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut",style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)),
              onTap: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
