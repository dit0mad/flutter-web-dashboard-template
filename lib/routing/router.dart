import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/catalog/catalog.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/inventory/inventory.dart';
import 'package:flutter_web_dashboard/pages/orders/order_page.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/pages/testpage.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/test.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case inventoryPageRoute:
      return _getPageRoute(Inventory());
    case ordersPageRoute:
      return _getPageRoute(Orders());
    case testPageRoute:
      return _getPageRoute(DataTble());
    case catalogPageRoute:
      return _getPageRoute(CatalogPage());

    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
