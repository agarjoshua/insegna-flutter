import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'apiorder.dart';



// Future<http.Response> post () async {
//   var url ='http://10.0.2.2:8000/Order/';

//   Map data = {
//     'apikey': ''
//   };
//   //encode Map to JSON
//   var body = json.encode(data);

//   var response = await http.post(url,
//       headers: {"Content-Type": "application/json"},
//       body: body
//   );
//   print("${response.statusCode}");
//   print("${response.body}");
//   return response;
// }

Future<Order>createOrder(String name,String number,String address,String size,String note) async{
  final String apiUrl = 'http://10.0.2.2:8000/Order/';

  final response = await http.post(apiUrl, body:{
    "name": name,
    "number": number,
    "address": address,
    "size": size,
    "note": note,
  });

  if(response.statusCode == 201){
    final String responseString = response.body;

    return orderFromJson(responseString); 
  }else{
    return null;
  }
}
