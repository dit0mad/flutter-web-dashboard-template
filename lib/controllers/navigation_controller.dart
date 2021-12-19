import 'package:flutter/cupertino.dart';
import 'package:flutter_web_dashboard/pages/catalog/catalog.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  GlobalKey<NavigatorState> catalogNavigatorKey = GlobalKey();
  GlobalKey<NavigatorState> orderNavigatorKey = GlobalKey();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.popAndPushNamed(routeName);
  }

  goBack() => navigatorKey.currentState.pop();

  Future<dynamic> navigateCatalog(String routeName) {
    return catalogNavigatorKey.currentState.pushNamed(routeName);
  }

  godBack() => catalogNavigatorKey.currentState.pop();

  Future<dynamic> navigateOrder(String routeName) {
    return orderNavigatorKey.currentState.pushNamed(routeName);
  }

  goBackk() => orderNavigatorKey.currentState.pop();
}
