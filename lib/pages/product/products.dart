import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Product Name"),
              ),
              Expanded(
                child: Text("Quantity"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
