import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'check_out.dart';

import '../const.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

import 'global.dart';

class HomeTabe extends StatefulWidget {
  HomeTabe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomeTabe> {

  Future<List<User>> _getUsers() async {

    var data = await http.get("http://www.json-generator.com/api/json/get/bZlIcnCsWG?indent=2");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for(var u in jsonData){

      User user = User(u["index"], u["about"], u["name"], u["email"], u["picture"]);

      users.add(user);

    }

    print(users.length);

    return users;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.data);
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Loading..." ?? '')
                  )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      // leading: CircleAvatar(
                      //   backgroundImage: NetworkImage(
                      //     snapshot.data[index].picture,
                      //   ),
                      // ),


                      title: Text(                       
                        snapshot.data[index].name ?? '',
                        textAlign: TextAlign.center,
                        ),


                      // subtitle: Text(snapshot.data[index].email ?? '')
                      subtitle: Column(
                        children: <Widget>[
                          Text(snapshot.data[index].email ?? ''),
                      // Text(snapshot.data[index].about ?? '')
                        ],
                      ),


                      onTap: (){
                        Navigator.push(context, 
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                        );
                      },

                    );
                  },
                );
              }
            },
          ),
        ),
      );
  }
}

class DetailPage extends StatelessWidget {

  final User user;

    String value;
    String number;
    String address;
    String note;
    String size;
    var name;

  DetailPage(this.user);
  
  final _formKey = GlobalKey<FormState>();
  bool exitPage = false;
  
  @override
  Widget build(BuildContext context) {

    // setState(() {
    //   exitPage ? Navigator.pop(context, true) : exitPage = false;
    // });

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
                                  Text(
                                    'vendor : ' + user.name,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    )),
                                  Text(
                                    '1/2',
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
                                          'Price of 6 gas size is',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 20
                                              ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Price of 12 gas size is',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 20
                                              ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Price of 22.5 gas size is',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              fontSize: 20
                                              ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '*Please enter the right details. Ensure the gas is either in 3,12 or 22kgs or else order will be marked as spam'
                                        ,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
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
                                  name : name, 
                                  title: title,
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



