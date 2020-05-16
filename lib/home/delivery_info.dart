import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gas/home/check_out.dart';
import 'package:my_gas/home/order_now.dart';

import '../const.dart';

class DeliveryInfoPage extends StatefulWidget {

  @override
  _DeliveryInfoPageState createState() => _DeliveryInfoPageState();
}

class _DeliveryInfoPageState extends State<DeliveryInfoPage> {

 String value;
 String number;
 String address;
 String note;
 String size;
 String imgAsset;

  @override
  final _formKey = GlobalKey<FormState>();
  bool exitPage = false;

  

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //==============================Top Heading
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('order details',
                                      style: TextStyle(
                                        fontSize: 30,
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

                            // Form Starts here
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              color: Colors.white,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '*Please enter the right details. Ensure the gas is either in 3,12 or 22kgs or else order will be marked as spam',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                      //============================================= Name Box
                                      // Container(
                                      //   padding: EdgeInsets.only(bottom: 10),
                                      //   child: Text(
                                      //     'Your gas size is' + widget.size ?? '',
                                      //     style: TextStyle(
                                      //         fontWeight: FontWeight.w200),
                                      //   ),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: (volume){
                                            size = volume;
                                            print(volume);
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Gas in kgs(either 3kgs, 12kgs or 22kgs)",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
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
                                              return 'Please enter the Gas cylinder size you wish to purchase';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: (name){
                                            value = name;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
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
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      //Phone number section
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: (phone) {
                                            number = phone;
                                          },
                                          // keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: "Phone",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
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
                                              return 'Please enter phone number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                       
                                      //Delivery Address

                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          maxLines: 5,
                                          onChanged: (building) {
                                            address = building;
                                          },
                                          decoration: InputDecoration(
                                            labelText: "Your building name (Delivery Address)",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
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
                                              return 'Please enter the name of your building';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                            ),

                            //========================================= Notes

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                maxLines: 5,
                                onChanged: (info){
                                   note = info;
                                },

                                decoration: InputDecoration(
                                  labelText: "Anything to note on your gas delivery",
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),

                            //The form should be ending at this point
                          ]),
                    ],
                  ),
                ),
              ),
            ),
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
                          callback: () async {
                           if (_formKey.currentState.validate()) {
                            exitPage = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutPage(
                                  value : value,
                                  number : number,
                                  address : address,
                                  note : note,
                                  size : size,
                                  // imgAsset: imgAsset,

                                  ),
                              ),
                            );
                           }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Function Area
