import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import '../services/database.dart';

class DateController extends GetxController {
  static DateController instance = Get.find();

  //controller for create date
  final dateNewOrderController = TextEditingController().obs;
  final dateOrderController = TextEditingController().obs;

  RxString selecteDate = DateFormat.yMMMd().format(DateTime.now()).obs;

//initialize date here
  Rx<DateTime> date = DateTime.now().obs;



  
}
