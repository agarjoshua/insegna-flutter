import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_gas/firebase/auth_service.dart';
import 'package:my_gas/home/delivery_info.dart';
import 'package:my_gas/home/global.dart';

import '../const.dart';
import '../login/login.dart';
import '../signup/signup_page.dart';

class OrderNowPage extends StatefulWidget {

  // String imgAsset;
  // OrderNowPage(data, {@required this.imgAsset});
  
  final User user;

  OrderNowPage(this.user);

  @override
  _OrderNowPageState createState() => _OrderNowPageState();

}

class _OrderNowPageState extends State<OrderNowPage> {

  bool exitPage = false;

  static String imgAsset;

  @override
  void initState() {
    exitPage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      exitPage ? Navigator.pop(context, true) : exitPage = false;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER NOW',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, false);
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //==============================Top Heading
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Order Now',
                          style: TextStyle(
                            fontSize: 30,
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
                //The vendor
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Vendor',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Image.asset(
                          '',
                          //TODO: Add rating for the vendors
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),

                //order type
              Container(
                  
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Vendor details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Container(
                    margin: EdgeInsets.only(top: 10),
                    
                      
                  ),
                
                //Next Button
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                    bottom: 20,
                  ),
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    text: 'Next',
                    callback: () {
                           Navigator.push(
                              context,
                              // size = size,
                            MaterialPageRoute(
                              builder: (context) => DeliveryInfoPage(
                              ),
                            ));
                      //   authService.user != null ? null : loginAllert();
                      //  Navigator.pop(context, true);
                      
                    }
                  ),
                    
                ),
              ],
            ),
          ),
         ]
        ),
      ) 
      )
      ),
      );
  }

  messageAllert(String msg, String ttl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Text(ttl),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Text('Okay'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  loginAllert() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Text(
              'You need to login before proceed your order',
              style: TextStyle(fontSize: 14),
            ),
            content: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  child: CustomButton(
                    text: 'LOGIN',
                    callback: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                BorderButton(
                  text: 'SIGN UP',
                  callback: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
