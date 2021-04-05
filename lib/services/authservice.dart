import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//import 'package:http/src/response.dart';
import 'package:newsapi_v1/Login_page.dart';
import 'package:newsapi_v1/error_handler.dart';

import '../home_page.dart';
import 'deleteRec.dart';

class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else
            return LoginPage();
        });
  }

  signOut() {
    // ignore: unused_local_variable
    Future<Response> name = deleteRecommend();
    FirebaseAuth.instance.signOut();
  }

  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      print('signed in');
    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
