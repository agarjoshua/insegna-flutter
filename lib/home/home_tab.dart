import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './order_now.dart';
import '../const.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

import 'delivery_info.dart';
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

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: 
        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Container(
                    child: Text(
                      'The users about \n ' + user.email,
                      
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ),
                  ),
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
                   )
                 ]
              )           
           );    
        }
      }


class User {
  final int index;
  final String about;
  final String name;
  final String email;
  final String picture;

  User(this.index, this.about, this.name, this.email, this.picture);

}