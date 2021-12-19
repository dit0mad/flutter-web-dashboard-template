import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/catalog/catalog_menu.dart';
import 'package:flutter_web_dashboard/pages/orders/order_page.dart';
import 'package:flutter_web_dashboard/pages/product/products.dart';
import 'package:flutter_web_dashboard/pages/vendor/vendor.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';


Route<dynamic> generateCatalogRoute(RouteSettings settings) {
  switch (settings.name) {
    case cataMenuRoute:
      return _getRoute(CataMenu());
    case vendorPageRoute:
      return _getRoute(VendorPage());
    case catalogMenuPageRoute:
      return _getRoute(CatalogMainMenu());
    case productPageRoute:
      return _getRoute(Products());
    
    default:
      return _getRoute(Products());
  }
}

PageRoute _getRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
