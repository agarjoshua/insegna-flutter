// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';
import 'global.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.vendor,
        this.name,
        this.number,
        this.address,
        this.size,
        this.note,
    });
    
    String vendor;
    String name;
    String number;
    String address;
    String size;
    String note;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        vendor: json["vendor"],
        name: json["name"],
        number: json["number"],
        address: json["address"],
        size: json["size"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "vendor": vendor,
        "name": name,
        "number": number,
        "address": address,
        "size": size,
        "note": note,
    };
}
