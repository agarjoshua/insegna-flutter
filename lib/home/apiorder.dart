// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        this.name,
        this.number,
        this.address,
        this.size,
        this.note,
    });

    String name;
    String number;
    String address;
    String size;
    String note;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        name: json["name"],
        number: json["number"],
        address: json["address"],
        size: json["size"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "address": address,
        "size": size,
        "note": note,
    };
}
