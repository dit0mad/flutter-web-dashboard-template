import 'package:flutter/cupertino.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/routing/router.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

import '../routing/catalogRouter.dart';
import '../routing/orderRouter.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );

Navigator catalogNavigator() => Navigator(
      key: navigationController.catalogNavigatorKey,
      onGenerateRoute: generateCatalogRoute,
      initialRoute: cataMenuRoute,
    );

Navigator orderNaviagtor() => Navigator(
      key: navigationController.orderNavigatorKey,
      onGenerateRoute: generateOrderRoute,
      initialRoute: orderDashboardRoute,
    );
