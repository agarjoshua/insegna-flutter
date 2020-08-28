import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apiorder.dart';
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


  Future<List<Stock>> _getStock() async {

    var data = await http.get("http://10.0.2.2:8000/Stock/");

    var jsonData = json.decode(data.body);

    List<Stock> stocks = [];

    // ignore: unused_local_variable
    for(var u in jsonData){

      Stock stock = Stock(u["vendor"], u["gastype"], u["image"], u["price"]);

      stocks.add(stock);

    }

        print(stocks.length);

    return stocks;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: FutureBuilder(
            future: _getStock(),
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
                      //     snapshot.data[index].image,
                      //   ),
                      // ),


                      title: Text(                       
                        snapshot.data[index].vendor ?? '',
                        textAlign: TextAlign.center,
                        ),


                      // subtitle: Text(snapshot.data[index].price ?? '')
                      subtitle: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data[index].gastype ?? ''
                            // snapshot.data[index].price ?? '';
                          )
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

  final Stock stock;
    
    String vendor;
    String value;
    String number;
    String address;
    String note;
    String size;
    String clientname;

  DetailPage(this.stock);
  
  final _formKey = GlobalKey<FormState>();
  bool exitPage = false;


  Future<Order> createOrder(String id,String vendor, String name, String number, String address, String size, String note) async{
    final String apiUrl = 'http://10.0.2.2:8000/Order/';

    final response = await http.post(apiUrl, body:{
      "id": vendor,
      "vendor": vendor,
      "name": name,
      "number": number,
      "address": address,
      "size": size,
      "note": note

    });

    if(response.statusCode == 201){
      final String responseString = response.body;

      return orderFromJson(responseString); 
    }else{
      return null;
    }
  }

  Order _order;


  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  
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
                                    'vendor : ' + stock.vendor,
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
                                          controller: sizeController,
                                            
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
                                          onChanged: (clientname){
                                            value = clientname;
                                          },
                                          controller: nameController,

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
                                          controller: numberController,

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

                                          controller: addressController,

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
                                controller: noteController,

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

                            final String vendor = stock.vendor;
                            final String name = nameController.text;
                            final String number = numberController.text;
                            final String address = addressController.text;
                            final String size = sizeController.text;
                            final String note = noteController.text;
  
                            final Order order = await createOrder(vendor, name, number, address, size, note);

                            // setState(() {
                            //   _user = user;
                            // });

                            
                           if (_formKey.currentState.validate()) {
                            exitPage = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutPage(
                                  
                                  vendor : vendor,
                                  value : value,
                                  number : number,
                                  address : address,
                                  note : note,
                                  size : size,
                                  clientname : clientname, 
                                  title: title,

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



