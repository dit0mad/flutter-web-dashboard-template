import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/pages/orders/order_dashboard.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final String productName;
  final List product;

  const OrderCard({Key key, this.productName, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
        ),
        height: 250,
        width: 300,
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.green,
              padding: EdgeInsets.all(20),
              height: 100,
              width: 400,
              child: Center(child: Text(productName)),
            )),
            Expanded(
              child: Container(
                child: ListView.separated(
                    separatorBuilder: (_, indesx) => const Divider(
                          color: Colors.black,
                        ),
                    itemCount: product.length,
                    itemBuilder: (_, index) {
                      return Text(product[index].id);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
