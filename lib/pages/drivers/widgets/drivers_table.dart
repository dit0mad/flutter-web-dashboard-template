import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class DriversTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          //orderController.getColumns()
          columns: [
            DataColumn(
              label: Text('Product Name'),
            ),
             DataColumn(
              label: Text('Quantity'),
            ),
          ],
          rows: List<DataRow>.generate(
              productController.products.length,
              (index) => DataRow(cells: [
                    DataCell(
                      CustomText(text: productController.products[index].name),
                      showEditIcon: true,
                    ),
                    DataCell(
                      CustomText(
                        text:
                            productController.products[index].price.toString(),
                      ),
                    ),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "4.5",
                        )
                      ],
                    )),
                    DataCell(
                      TextButton(
                        onPressed: () {},
                        child: Text(productController.products[index].name),
                      ),
                    ),
                  ]))),
    );
  }
}
