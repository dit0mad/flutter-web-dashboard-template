import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';

import '../../constants/controllers.dart';
import '../../routing/routes.dart';

class CatalogMainMenu extends StatelessWidget {
  CatalogMainMenu({Key key}) : super(key: key);


  Widget build(BuildContext context) {
    return Container(
      child: catalogNavigator(),
    );
  }
}

class CataMenu extends StatelessWidget {
  CataMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      navigationController.navigateCatalog(productPageRoute);
                    },
                    child: Text(
                      "Products",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigationController.navigateCatalog(vendorPageRoute);
                    },
                    child: Text(
                      "Vendors",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigationController.navigateCatalog(productPageRoute);
                    },
                    child: Text(
                      "Customers",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Purchase Orders",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Receive/Returns",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
