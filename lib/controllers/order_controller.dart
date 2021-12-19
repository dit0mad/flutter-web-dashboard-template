import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/models/ordersheet.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:flutter_web_dashboard/services/database.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  RxList<OrderSheet> orders = <OrderSheet>[].obs;
  RxList<ProductModel> oncart = <ProductModel>[].obs;
  RxList<ProductModel> searchList = <ProductModel>[].obs;
  RxMap<dynamic, dynamic> map = Map().obs;

  final Rx<TextEditingController> controller = TextEditingController().obs;

  List<String> val =
      []; //contains list of from products from each order. //also contains the number of occurence
  List<String> cols = [];

  var trap = Map();

  // ignore: must_call_super
  void onInit() async {
    orders.bindStream(Database().getOrders());
    // Future.delayed(Duration(seconds: 5)).then((value) => createList());
  }

  void searchProduct(String searchvalue) {
    searchList.value = productController.products
        .where((element) => element.name.toLowerCase().contains(searchvalue))
        .toList();
  }

  Future<void> changeDate() async {
    orders.bindStream(Database().getOrders());
    Future.delayed(Duration(seconds: 1)).then((value) => makeproductList());
  }

  void additem(ProductModel product) {
    if (oncart.any((element) => element.name == product.name)) {
      var model =
          oncart.firstWhere((elementd) => elementd.name == product.name);

      var index =
          oncart.indexWhere((elementd) => elementd.name == product.name);

      model.quantity = model.quantity + 1;

      oncart[index] = model;
    } else {
      oncart.add(product);
    }
  }

  void makeproductList() {
    //contains rows
    val.clear();
    trap.clear();
    orders.forEach((element) {
      element.product.forEach((index) {
        val.add(index.name);
      });
    });

    print(val);
    createinvoice();
    groupByProducts();
  }

  void groupByProducts() {
    List<ProductModel> templist = [];

    orders.forEach((OrderSheet sheet) {
      sheet.product.forEach((indexofProduct) {
        templist.add(indexofProduct);
      });
    });

    map.value = templist.groupBy((element) => element.name);

    map.forEach((key, value) {
      print('Key $key' + ' value ${value[0].id}');
      //print('Key $key' + ' value ${value[1].id}');
    });

    //map.map((key, value) => TableModel(tableModel: tableModel));
  }

  void createinvoice() {
    val.forEach((element) {
      if (!trap.containsKey(element)) {
        trap[element] = 1;
      } else {
        trap[element] += 1;
      }
    });

    print(trap);
  }

  List<OrderSheet> get getorders => orderController.orders;

  // call database and add item
  Future<void> addOrder() async {
    await Database()
        .addItem(
          OrderSheet(
              date: DateFormat.yMMMd().format(DateTime.now()),
              product: oncart,
              customerName: customerController.selectedCustomer.value),
        )
        .then(
          (value) => Database().updateItem(value),
        );
  }

  @override
  void onClose() {
    oncart.clear();
    searchList.clear();
    controller.value.clear();
  }
}

// class TableModel {
//   String customerName;
//   //String

//   TableModel({@required this.tableModel});
// }
