import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../const.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String _name;
  String _phone;
  String _address;
  String _postcode;
  File _image;

  String radioItem = 'Landed House / Property';
  int id = 0;

  List<ResidentialList> fList = [
    ResidentialList(
      index: 0,
      name: "Landed House / Property",
    ),
    ResidentialList(
      index: 1,
      name: "Condominium Apartment / High Rise Building",
    ),
    ResidentialList(
      index: 2,
      name: "Comercial",
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Your Profile',
                            style: TextStyle(
                              fontSize: 20,
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
                  ),
                  //======================================================================================== Circle Avatar
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: _image == null
                                  ? NetworkImage(
                                      'https://afmnoco.com/wp-content/uploads/2019/07/74046195_s.jpg')
                                  : FileImage(_image),
                              radius: 50.0,
                            ),
                            InkWell(
                              onTap: _onAlertPress,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.black),
                                  margin: EdgeInsets.only(left: 70, top: 70),
                                  child: Icon(
                                    Icons.photo_camera,
                                    size: 25,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        Text('Change Photo',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                  ),
//=========================================================================================== Form
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            onChanged: ((String name) {
                              setState(() {
                                _name = name;
                                print(_name);
                              });
                            }),
                            decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                          ),
                          //===================================================== Phone

                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextFormField(
                              onChanged: ((String phone) {
                                setState(() {
                                  _phone = phone;
                                  print(_phone);
                                });
                              }),
                              decoration: InputDecoration(
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                return null;
                              },
                            ),
                          ),

                          //===================================================== options
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Residential Type',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          Container(
                            child: Column(
                              children: fList
                                  .map(
                                    (data) => ListTile(
                                      title: Text('${data.name}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16)),
                                      trailing: Radio(
                                        value: data.index,
                                        activeColor: Colors.green[400],
                                        groupValue: id,
                                        onChanged: (value) {
                                          setState(() {
                                            radioItem = data.name;
                                            id = data.index;
                                            print(radioItem);
                                            print(id);
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),

                          //========================================== Delivery Address
                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextFormField(
                              maxLines: 5,
                              onChanged: ((String address) {
                                setState(() {
                                  _address = address;
                                  print(_address);
                                });
                              }),
                              decoration: InputDecoration(
                                labelText: "Delivery Address",
                                labelStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.center,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Delivery address';
                                }
                                return null;
                              },
                            ),
                          ),

                          //===================================================== PostCode

                          Container(
                            margin: EdgeInsets.only(top: 25),
                            child: TextFormField(
                              onChanged: ((String pcode) {
                                setState(() {
                                  _postcode = pcode;
                                  print(_postcode);
                                });
                              }),
                              decoration: InputDecoration(
                                labelText: "PostCode",
                                labelStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a post code';
                                }
                                return null;
                              },
                            ),
                          ),
                          //========================================================
                        ],
                      ),
                    ),
//============================================================================================================= Form Finished
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(),
                        CustomButton(
                          text: 'DONE',
                          callback: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).pop();
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
      ),
    );
  }

  //============================================================================ Function Area
//========================= Gellary / Camera AlerBox
  void _onAlertPress() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/gallery.png',
                      width: 50,
                    ),
                    Text('Gallery'),
                  ],
                ),
                onPressed: getGalleryImage,
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/take_picture.png',
                      width: 50,
                    ),
                    Text('Take Photo'),
                  ],
                ),
                onPressed: getCameraImage,
              ),
            ],
          );
        });
  }

  // ================================= Image from camera
  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      Navigator.pop(context);
    });
  }

  //============================== Image from gallery
  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      Navigator.pop(context);
    });
  }
}

//---------------------------------------- Class
class ResidentialList {
  String name;
  int index;
  ResidentialList({this.name, this.index});
}
