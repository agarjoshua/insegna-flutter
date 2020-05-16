import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_gas/const.dart';

import '../firebase/auth_service.dart';
import '../login/forgot_password.dart';
import '../signup/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  var loggedIn = false;
  var firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        bottomOpacity: 0,
//        title: Text('Filters'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/login_logo.png',
                      width: 300,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Theme.of(context).primaryColor,
                          Colors.redAccent
                        ],
                      ),
//                    color: Theme.of(context).primaryColor,
                      boxShadow: [
                        new BoxShadow(blurRadius: 5.0, color: Colors.grey)
                      ],
                      borderRadius: new BorderRadius.vertical(
                          bottom: new Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //============================================= Name Box
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextFormField(
                                    onChanged: ((String email) {
                                      setState(() {
                                        _email = email;
                                        print(_email);
                                      });
                                    }),
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter full name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                //============================================= Password Box
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextFormField(
                                    obscureText: passwordVisible,
                                    onChanged: ((String pass) {
                                      setState(() {
                                        _password = pass;
                                        print(_password);
                                      });
                                    }),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          passwordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black54,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black54,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                FittedBox(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 20, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordPage(),
                                              ),
                                            );
                                          },
                                        ),
                                        BorderButton(
                                          text: 'LOG IN',
                                          callback: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _loginNow();
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                        ),

                        //======================
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Column(
                children: <Widget>[
                  FittedBox(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              authService.signInWithFacebook().then((user) {
                                if (user?.uid != null) {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: Image.asset(
                              'assets/images/fb.png',
                              width: 150,
                              height: 60,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              authService.googleSignIn().then((user) {
                                if (user?.uid != null) {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: Image.asset(
                              'assets/images/google.png',
                              width: 150,
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
//                    padding: EdgeInsets.all(10),
//                      height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Divider(
                          height: 5,
                          color: Colors.black54,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Don\'t have an account?')),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            onPressed: () {
//                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getNotificationUrl =
      'http://54.255.239.59/customer_api/Account/sign_in';

  _loginNow() async {
    await http.post(getNotificationUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '293df0c34d1d7d71fe036200cb70e871',
      "email": _email,
      "password": _password,
      "fcm_token": 'fcmtoken',
      "device_id": 'device id'
    }).then((response) {
      var data = json.decode(response.body);
      // print(data);
      Navigator.pop(context);
      setState(() {
        print('Result => ${data['message']}');
      });
    });
  }
}
