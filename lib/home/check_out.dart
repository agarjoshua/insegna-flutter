import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';
import 'global.dart';
import 'home_tab.dart';
import 'order_now.dart';

import 'global.dart' as global;

class CheckOutPage extends StatefulWidget {

  String value;
  String number;
  String address;
  String note;
  String size;
  // String imgAsset;
   

  String index;


  CheckOutPage({
    Key key,
    @required this.value,
    @required this.number,
    @required this.address,
    @required this.note,
    @required this.size,
    // @required this.imgAsset
    

    }) : super(key : key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState(
    value,
    number,
    address,
    note,
    size,
    // imgAsset

    );
}

class _CheckOutPageState extends State<CheckOutPage> {

  String value;
  String number;
  String address;
  String note;
  String size;
  // String imgAsset;


  _CheckOutPageState(
    this.value,
    this.number,
    this.address,
    this.note,
    this.size,
    // this.imgAsset,
   
    );

//  var imgAsset = OrderNowPage.imgAsset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CHECKOUT DETAILS',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, false);
            }),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[



            //Top Heading
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Order Checkout',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            '3/3',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),



                      //Order Details
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[



                            //Vendor Name 
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Vendor name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    title ?? '',
                                    style:
                                    TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),



                            //Size
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'cylinder Size',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(

                                    widget.size ?? '',
                                    
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),



                            //Order Type
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Order Cost',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(

                                  //  email ?? '',
                                  'ayieyaaaa',
                                    
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),


                            //name of the person ordering
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Your Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(

                                    widget.value ?? '',
                                    
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),



                            //Phone Number
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Phone Number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(

                                    widget.number ?? '',

                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),



                            //Address
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Your building name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    widget.address ?? '',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            //Note about the order
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Note',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    widget.note ?? '' ,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //================================================================= Bottom Details
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black12,
                      ],
                      stops: [0.95, 5.0],
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        width: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          text: 'Next',
                          callback: () {
                          //   Navigator.pop(context, true);
                          //  Navigator.push(
                          //    context,
                          //    MaterialPageRoute(
                          //      builder: (context) => HomeTabe(),
                          //    ),
                          //  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DeliveryInfo {
  String name;
  String number;
  String address;
  String note;
  String size;
  int index;
  
  DeliveryInfo({
    this.name,
    this.number,
    this.address,
    this.note, 
    this.index,
    this.size
    });

    Map toJson() => {
        'name': name,
        'number': number,
        'address': address,
        'note':note,
        'size':size
      };

  //     factory User.fromJson(Map<String, dynamic> json) {
  //     return new User(
  //     id: json['id'],
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     email: json['email'],
  //     vip: json['vip'],
  //     dateOfBirth: json['dateOfBirth'],
  //     shippingAddresses: json['shippingAddresses'].map((value) => new Address.fromJson(value)).toList()
  //   );
  // }

  // String jsonName = jsonEncode(name);
  // print(jsonName);
}
