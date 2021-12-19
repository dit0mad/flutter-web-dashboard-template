import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import '../services/database.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  RxList<ProductModel> products = <ProductModel>[].obs;
  RxString currentdBPath = ''.obs;

  final List<ProductModel> loadedproducts = [];

  // ignore: must_call_super
  void onInit() async {
    // get the products from the database.
    products.bindStream(Database().getprod('products'));
    //orderController.orders.bindStream(Database().getOrders('orders'));

    print('calling onit');
    loadproducts();
  }

  void loadproducts() {
    products.listen((value) {
      value.forEach((element) {
        loadedproducts.add(element);
      });
    });
  }
}
