import 'package:flutter/material.dart';
import 'package:my_gas/const.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FORGOT PASSWORD',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              FittedBox(
                child: Text(
                  'Enter your email address used in MyGas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'A link will be emailed to your email address to reset your password',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ),
              Form(
                key: _formKey,
                child:
                    //============================================= Name Box
                    Container(
                  margin: EdgeInsets.only(top: 20),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    textAlign: TextAlign.start,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your MyGas Eamil';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomButton(
                      text: 'SEND REQUEST',
                      callback: () {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
