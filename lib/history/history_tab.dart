import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_gas/history/history_details.dart';

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryDetailsPage(),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Brand ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Image.asset(
                                      'assets/images/product-3.png',
                                      width: 50,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Size ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      ' 12 KG',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Order Type ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      ' RM 80 Deposit',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Quantity ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      ' 1',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Date ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      DateFormat.yMMMd().format(DateTime.now()),
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      ' Time ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      DateFormat.jms().format(DateTime.now()),
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          child: VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Status',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text('In Progress',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Total Price',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                              Text('RM 30.80',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black54)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'See more details >',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
