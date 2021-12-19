import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/local_navigator.dart';
import 'package:flutter_web_dashboard/widgets/formbuild.dart';
import 'package:get/get.dart';

class VendorPage extends StatelessWidget {
  const VendorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.green,
        child: Column(
      children: [
        Row(
          children: [
            Text("Vendor Name"),
            TextButton(
              onPressed: () {
                Get.bottomSheet(
                  FormBuild(),
                );
              },
              child: Text("Add Vendor"),
            ),
          ],
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
        ),
        TextButton(
            onPressed: () {
              navigationController.godBack();
            },
            child: Text("back"))
      ],
    ));
  }
}
