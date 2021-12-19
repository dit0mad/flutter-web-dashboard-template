import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/models/customer/customer_model.dart';

import 'package:get/get.dart';

import '../services/database.dart';

class CustomerController extends GetxController {
  static CustomerController instance = Get.find();

  RxList<CustomerModel> customers = <CustomerModel>[].obs;
  RxString selectedCustomer = 'Select Customer'.obs;

  RxList<String> customerList = <String>[].obs;

  void onInit() async {
    customers.bindStream(Database().getCustomers('customers'));
    print('calling customers');
    _makeDropdownList();
  }

  void _makeDropdownList() {
    customers.listen((value) {
      value.forEach((element) {
        customerList.add(element.name);
      });
    });
  }

  set setValue(String value) {
    selectedCustomer.value = value;
  }
}
