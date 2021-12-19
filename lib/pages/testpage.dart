import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/customer_controller.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../helpers/reponsiveness.dart';
import '../widgets/custom_text.dart';

class TestPage extends StatelessWidget {
  //const TestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildCustomerList(context)),
              Expanded(
                flex: 6,
                child: _buildCustomerinfo(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildCustomerinfo(BuildContext context) {
  return Container(
    //height: MediaQuery.of(context).size.height,
    color: Colors.blue,
    child: Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              color: Colors.red,
              //height: 20,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Info"),
                onTap: () {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              //height: 20,
              child: ListTile(
                leading: Icon(Icons.receipt),
                title: Text("Receipts"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              //height: 20,
              child: ListTile(
                leading: Icon(Icons.note_add),
                title: Text("Notes"),
                onTap: () {},
              ),
            ),
          ),
        ]),
        //display customer info below
        SingleChildScrollView(
          child: Container(
            height: 350,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget _buildCustomerList(BuildContext context) {
  return Obx(() => Container(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Customers"),
              ),
            ),
            Column(
                children: List.generate(
              customerController.customers.length,
              (index) => Text(customerController.customers[index].name),
            )),
          ],
        ),
      ));
}
