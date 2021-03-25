import 'package:flutter/material.dart';


class General extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("General", style: TextStyle(color: Colors.white,fontFamily: 'Truneo',),),
            Text(" News",
              style: TextStyle(color: Colors.black,fontFamily: 'Truneo',)
            )],
        )
      ),
    );
  }
}