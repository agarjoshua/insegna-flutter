import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: Colors.blue,
              ),
              title: Text(
                'BHP(12 KG x 1)',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
              subtitle: Text(
                'Your order for BHP(12 KG x 1) is now on the way to your location.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                DateFormat('HH:mm').format(
                  DateTime.now(),
                ),
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
              ),
              dense: true,
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
