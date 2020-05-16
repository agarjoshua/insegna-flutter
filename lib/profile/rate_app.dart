import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../const.dart';

class RateAppPage extends StatefulWidget {
  @override
  _RateAppPageState createState() => _RateAppPageState();
}

class _RateAppPageState extends State<RateAppPage> {
  int initRate = 3;
  String feebackMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RATE THIS APP',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 7),
                      child: Text(
                        "How good is the service?",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                    RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        initRate = rating.toInt();
                        print(initRate);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Do you have any suggestion",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.grey[700]),
                          left: BorderSide(width: 0.5, color: Colors.grey[700]),
                          right:
                              BorderSide(width: 0.5, color: Colors.grey[700]),
                          bottom:
                              BorderSide(width: 0.5, color: Colors.grey[700]),
                        ),
                      ),
                      child: Material(
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter your text here"),
                          onChanged: (text) {
                            setState(() {
                              feebackMsg = text;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(
                      text: 'CONFIRM',
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
    );
  }
}
