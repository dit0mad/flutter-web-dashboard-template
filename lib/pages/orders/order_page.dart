import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/order_controller.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/pages/orders/buildInput.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/reponsiveness.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/large_screen.dart';

class Orders extends StatelessWidget {
  //Orders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(50),
              child: orderNaviagtor(),
            ),
          ),
        ],
      ),
    );
  }
}
