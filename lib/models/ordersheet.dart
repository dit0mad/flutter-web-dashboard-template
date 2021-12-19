import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:intl/intl.dart';

class OrderSheet {
  String orderId;
  List product;
  String date;
  String customerName;

  List temp = [];

  OrderSheet({
    this.date,
    // this.orderId,
    this.product,
    @required this.customerName,
  });

  OrderSheet.fromJson(
    Map<String, dynamic> order,
  ) {
    customerName = order["customerName"];
    product = List<ProductModel>.from(
          order["product"].map(
            (x) => ProductModel.fromJson(x),
          ),
        ) ??
        temp;

    date = order["date"] ?? DateFormat.yMMMd().format(DateTime.now());
  }

  Map<String, dynamic> toJson() => {
        'product': product.map((e) => e.toJson()).toList(),
        'date': date,
        'customerName': customerName,
      };
}
