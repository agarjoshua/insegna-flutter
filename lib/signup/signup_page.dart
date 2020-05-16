import 'package:flutter/material.dart';
import 'package:my_gas/const.dart';
import 'package:my_gas/signup/pin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name;
  String _email;
  String _password;
  String _confirmPass;

  bool passwordVisible = true;
  bool confirmPassVisible = true;
  @override
  void initState() {
    passwordVisible = true;
    confirmPassVisible = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Account Registeration',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        '1/3',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),

                //==================================== From Starts here
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //============================================= Name Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              onChanged: ((String name) {
                                setState(() {
                                  _name = name;
                                  print(_name);
                                });
                              }),
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          //============================================= Email Box
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
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email address';
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
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

                          //============================================= Password Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              obscureText: confirmPassVisible,
                              onChanged: ((String pass) {
                                setState(() {
                                  _confirmPass = pass;
                                  print(_confirmPass);
                                });
                              }),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    confirmPassVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      confirmPassVisible = !confirmPassVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter confirm password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ]),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 150, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).primaryColor,
                            )),
                            Text(
                              'GO BACK',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CustomButton(
                        text: 'NEXT',
                        callback: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PinPage(
                                  email: _email,
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
