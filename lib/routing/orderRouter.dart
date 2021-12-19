import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/orders/buildInput.dart';

import '../pages/orders/order_dashboard.dart';
import '../pages/product/products.dart';

Route<dynamic> generateOrderRoute(RouteSettings settings) {
  switch (settings.name) {
    case createOrderRoute:
      return _getRoute(BuildInputForm());
    case orderDashboardRoute:
      return _getRoute(OrderDashbord());
    //   case catalogMenuPageRoute:
    //     return _getRoute(CatalogMainMenu());
    //   case productPageRoute:
    //     return _getRoute(Products());

    default:
      return _getRoute(Products());
  }
}

PageRoute _getRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

const createOrderRoute = "/createOrder";
const orderDashboardRoute = "/orderDashboard";
