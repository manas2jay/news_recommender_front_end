import 'package:flutter/material.dart';
import 'package:newsapi_v1/services/authservice.dart';
import 'package:newsapi_v1/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  //Color greenColor = Color(0xFF00AF19);
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

   String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Form(
        key: formKey,
        child: _buildLoginForm(),
      ),
    ));
  }


  _buildLoginForm() {
    Color greenColor = Color(0xFF00AF19);
    Color orangeColor = Color(0xFFFF5722);
    

    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          children: [
            SizedBox(height: 75.0),
            Container(
                height: 125.0,
                width: 200.0,
                child: Stack(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontFamily: 'Truneo',
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      top: 50.0,
                      child: Text(
                        'Reader',
                        style: TextStyle(
                            fontFamily: 'Truneo',
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        top: 97.0,
                        left: 190.0,
                        child: Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: greenColor)))
                  ],
                )),
            SizedBox(height: 25.0),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Truneo',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                ),
                onChanged: (value) {
                  this.email = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Email is required' : validateEmail(value)),
                    
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Truneo',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                ),
                obscureText: true,
                onChanged: (value) {
                  this.password = value;
                },
                validator: (value) =>
                    value.isEmpty ? 'Password is required' : null),
                    
            SizedBox(height: 5.0),
            GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Truneo',
                        fontSize: 11.0,
                        decoration: TextDecoration.underline),
                  )),
                )),
            SizedBox(height: 50.0),
            GestureDetector(
              onTap: () async {
                if (checkFields()) AuthService().signIn(email, password, context);
              },
              child: Container(
                height: 50.0,
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  shadowColor: Colors.orangeAccent,
                  color: orangeColor,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Truneo'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ImageIcon(AssetImage('assets/facebook.png'),
                                size: 15),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text(
                              'Login with Facebook',
                              style: TextStyle(fontFamily: 'Truneo'),
                            ),
                          ),
                        ]),
                  ),
                )),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New To 24 Hour News?'),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Truneo',
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
