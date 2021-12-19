import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/models/ordersheet.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataTble extends StatelessWidget {
  OrderDataSource orders = OrderDataSource();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Obx(() => Column(
    //         children: List.generate(orderController.orders.length, (index) {
    //           return Text(orderController.orders[index].customerName);
    //         }),
    //       )),

    return Obx(() => Container(
          child: SfDataGrid(
            source: orders,
            columns: [
              GridColumn(
                  columnName: 'product',
                  label: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Product',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'customer',
                  label: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Customer',
                        overflow: TextOverflow.ellipsis,
                      ))),
            ],
          ),
        ));
  }
}

class OrderDataSource extends DataGridSource {
  List<DataGridRow> gridrows;
  List<DataGridRow> get rows => gridrows;

  OrderDataSource() {
    gridrows = orderController.orders
        .map(
          (e) => DataGridRow(cells: [
            DataGridCell(
              columnName: 'product',
              value: e.customerName,
            ),

            //build a cell with customer information and quantity
            DataGridCell<Column>(
              columnName: 'customer',
              value: Column(
                children: [
                  Text(e.customerName),
                  Text(e.date),
                ],
              ),
            ),
          ]),
        )
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((e) {
      return Container(
        child: Text(e.value),
      );
    }).toList());
  }
}
