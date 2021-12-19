import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/drivers/widgets/drivers_table.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
            child: ListView.separated(
              separatorBuilder: (_, indesx) => const Divider(
                color: Colors.black,
              ),
              itemCount: productController.products.length,
              itemBuilder: (_, index) {
                return Text(productController.products[index].name);
              },
            ),
            //   child: ListView(
            //   children: [
            //     DriversTable()
            //   ],
            // )
          ),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_web_dashboard/constants/controllers.dart';
// import 'package:flutter_web_dashboard/controllers/product_controller.dart';
// import 'package:get/get.dart';

// class Inventory extends StatelessWidget {
//   //const Inventory({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GetX<ProductController>(
//         builder: (productController) {
//           return ListView.separated(
//               separatorBuilder: (_, index) => const Divider(
//                     color: Colors.black,
//                   ),
//               itemCount: productController.products.length,
//               itemBuilder: (_, index) {
//                 return Row(
//                   children: [
//                     Text(productController.products[index].name),
//                   ],
//                 );
//               });
//         },
//       ),
//     );
//   }
// }
