import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/services/database.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import 'package:intl/intl.dart';

class ShowDatePicker extends StatelessWidget {
  ShowDatePicker({this.controller});
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Obx(() => TextField(
              readOnly: true,
              //methanata danne initliaze todayas date
              controller: this.controller,
              decoration: InputDecoration(
                  hintText:
                      dateController.date.value.toString().substring(0, 10)),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                controller.text = DateFormat.yMMMd().format(date);
                dateController.selecteDate.value =
                    DateFormat.yMMMd().format(date);
                orderController.changeDate();
              },
            )));
  }
}
