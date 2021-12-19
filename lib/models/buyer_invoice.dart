import 'package:flutter_web_dashboard/controllers/order_controller.dart';
import 'package:flutter_web_dashboard/pages/orders/order_dashboard.dart';

class BuyerInvoice {
  String customerName;
  ProductItem items;
  var map = Map();

  BuyerInvoice({
    this.customerName,
    this.items,
  });
}
