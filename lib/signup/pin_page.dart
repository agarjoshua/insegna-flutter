import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:my_gas/const.dart';
import 'package:my_gas/signup/user_info.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PinPage extends StatefulWidget {
  static const routName = '/pin-page';
  final String email;
  PinPage({@required this.email});
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  Timer _timer;
  int _start = 59;
  ProgressDialog pr;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  TextEditingController pinController = TextEditingController();
  String thisText = "";
  int pinLength = 6;

  bool hasError = false;
  String errorMessage;

  //String phoneNumber ;
  String smsCode;
  String verificationId;

  @override
  void initState() {
    startTimer();
    pinController.text = '123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //============================================= loading dialoge
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    //Optional
    pr.style(
      message: 'Please wait...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
//                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
//                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Verification',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  '2/3',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'We\'ve sent the verification code to your email. Please enter the code to continue',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 20,
                          ), // Space in between

                          Container(
                            height: 80,
                            width: double.infinity,
                            child: PinCodeTextField(
                              autofocus: false,
                              controller: pinController,
                              hideCharacter: true,
                              highlight: true,
                              highlightColor: Colors.blue,
                              defaultBorderColor: Colors.black,
                              hasTextBorderColor: Colors.green,
                              maxLength: pinLength,
                              hasError: hasError,
                              maskCharacter: "*",

                              onTextChanged: (text) {
                                setState(() {
                                  hasError = false;
                                  this.smsCode = text;
                                });
                              },
//                                onDone: (text) {
//                                  print("DONE $text");
//                                },
//                              onDone: (_) => _onSucessPin,

                              pinBoxBorderWidth: math.sqrt1_2,
                              pinBoxRadius: 5,
                              wrapAlignment: WrapAlignment.center,
                              pinBoxDecoration: ProvidedPinBoxDecoration
                                  .defaultPinBoxDecoration,
                              pinBoxWidth: 45,
                              pinBoxHeight: 45,
                              pinTextStyle: TextStyle(fontSize: 24.0),
                              pinTextAnimatedSwitcherTransition:
                                  ProvidedPinBoxTextAnimation.scalingTransition,
                              pinTextAnimatedSwitcherDuration:
                                  Duration(milliseconds: 300),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  child: Text(
                                    '0:$_start',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              FlatButton(
//                                  onPressed: verifyPhone,
                                  child: Text(
                                'Send Again  ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 150, bottom: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    CustomButton(
                      text: 'NEXT',
                      callback: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserInfoPage(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  //================================================== Function Area Starts

}
