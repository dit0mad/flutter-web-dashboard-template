// we handle all communcations to and from firebase

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/models/customer/customer_model.dart';
import 'package:flutter_web_dashboard/models/ordersheet.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:get/get.dart';

class Database extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //stream from database
  Stream<List<ProductModel>> getprod(String path) {
    return firestore.collection(path).snapshots().map((QuerySnapshot query) {
      List<ProductModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromJson(
          element.data() as Map<String, dynamic>,
          //element.id,
        ));
      });
      return retVal;
    });
  }

  Stream<List<OrderSheet>> getOrders() {
    return firestore
        .collection('orders')
        .where(
          "date",
          isEqualTo: dateController.selecteDate.value,
        )
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrderSheet> val = [];
      query.docs.forEach((element) {
        val.add(OrderSheet.fromJson(
          element.data() as Map<String, dynamic>,
        ));
      });
      return val;
    });
  }

  Stream<List<CustomerModel>> getCustomers(String path) {
    return firestore.collection(path).snapshots().map((QuerySnapshot query) {
      List<CustomerModel> val = [];
      query.docs.forEach((element) {
        val.add(CustomerModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return val;
    });
  }

  Future<String> addItem(OrderSheet item) async {
    String _newID;
    try {
      await firestore
          .collection("orders")
          .add(item.toJson())
          .then((addedItem) => {_newID = addedItem.id});
    } catch (e) {
      print(e);
    }
    return _newID;
  }

  Future<void> updateItem(String orderID) async {
    Map<String, String> data = <String, String>{
      "orderId": orderID,
    };

    try {
      await firestore.collection('orders').doc(orderID).update(data);
    } catch (e) {
      print(e);
    }
  }
}
