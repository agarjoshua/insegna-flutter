import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  DateTime selectedDate = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Filters'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Drawer(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: <Widget>[
                  //============================================== date picker
                  InkWell(
                    onTap: () {
                      showPicker(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              selectedDate == null
                                  ? 'Select Date'
                                  : 'Picked Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ],
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
                                      color: Colors.grey, fontSize: 16)),
                              trailing: Radio(
                                value: data.index,
                                activeColor: Theme.of(context).primaryColor,
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

                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomButton(
                          text: 'Confirm',
                          callback: () {
                            Navigator.pop(context);
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

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2030));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

//---------------------------------------- Class
class ResidentialList {
  String name;
  int index;
  ResidentialList({this.name, this.index});
}
