import 'package:flutter/material.dart';


class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Health", style: TextStyle(color: Colors.white,fontFamily: 'Truneo',),),
            Text(" News",
              style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)
            )],
        )
      ),
    );
  }
}