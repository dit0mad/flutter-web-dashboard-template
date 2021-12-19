import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/services/database.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/order_card.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../routing/orderRouter.dart';
import '../../test.dart';
import '../../widgets/datePicker.dart';

class OrderDashbord extends StatelessWidget {
  OrderDashbord({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.limeAccent,
      child: ListView(
        children: [
          DashHeader(),
          DashBody(),
        ],
      ),
    );
  }
}

class DashHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe5e5e5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              navigationController.navigateOrder(createOrderRoute);
            },
            child: Font(
              text: 'Create Order',
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(DataTble());
            },
            child: Font(
              text: 'Create',
            ),
          ),
          Row(
            children: [
              Text('Showing orders for '),
              SizedBox(
                width: 10,
              ),
              Obx(() => ShowDatePicker(
                    controller: dateController.dateOrderController.value,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class DashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.black,
        height: 800,
        child: ListView.separated(
          separatorBuilder: (_, indesx) => const Divider(
            color: Colors.black,
          ),
          itemCount: orderController.map.length,
          itemBuilder: (_, index) {
            String key = orderController.map.keys.elementAt(index);
            List productListAtKey = orderController.map[key];

            return OrderCard(
              productName: key,
              product: productListAtKey,
            );
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final List<ProductModel> item;

  ProductItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
      //height: 100,
      width: 400,
      child: ListView.separated(
        separatorBuilder: (_, indesx) => const Divider(
          color: Colors.black,
        ),
        itemCount: item.length,
        itemBuilder: (_, index) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 3, child: Text(item[index].id)),
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_circle_down)),
                    //Text(item[index].quantity.toString()),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_circle_up)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
