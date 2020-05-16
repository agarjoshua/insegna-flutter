import 'package:flutter/material.dart';
import 'package:my_gas/const.dart';
import 'package:my_gas/login/forgot_password.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String _oldPass;
  String _password;
  String _confirmPass;

  bool oldPassVisible = true;
  bool passwordVisible = true;
  bool confirmPassVisible = true;
  @override
  void initState() {
    passwordVisible = true;
    confirmPassVisible = true;
    oldPassVisible = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHANGE PASSWORD',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                //==================================== From Starts here
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //============================================= Old Password Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              obscureText: oldPassVisible,
                              onChanged: ((String oldpass) {
                                setState(() {
                                  _oldPass = oldpass;
                                  print(_oldPass);
                                });
                              }),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Old Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    oldPassVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      oldPassVisible = !oldPassVisible;
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
                                  return 'Please enter old password';
                                }
                                return null;
                              },
                            ),
                          ),

                          //-------------------------------------------- forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
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
                            ],
                          ),

                          //============================================= Password Box
                          Container(
                            margin: EdgeInsets.only(top: 15),
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
                            margin: EdgeInsets.only(top: 15),
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
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CustomButton(
                        text: 'Save',
                        callback: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context);
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
