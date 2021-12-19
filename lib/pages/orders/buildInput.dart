import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/datecontroller.dart';
import 'package:flutter_web_dashboard/models/product_model.dart';
import 'package:get/get.dart';
import '../../constants/controllers.dart';
import '../../controllers/order_controller.dart';
import '../../widgets/datePicker.dart';

class BuildInputForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text("Date"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: ShowDatePicker(
                            controller:
                                dateController.dateNewOrderController.value),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text("Customer Name"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(() => Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 75,
                                ),
                                Text(
                                  customerController.selectedCustomer.value,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  // child: customerController
                                  //         .selectedCustomer.value.isEmpty
                                  //     ? Text(customerController
                                  //         .selectedCustomer.value)
                                  //     :
                                  child: DropdownButton(
                                    hint: Text('Select Customer'),
                                    items: customerController.customerList
                                        .map<DropdownMenuItem<String>>(
                                            (element) {
                                      return DropdownMenuItem<String>(
                                        value: element,
                                        child: Text(element),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      customerController
                                          .selectedCustomer.value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Obx(() => Container(
                        color: Colors.green,
                        child: TextField(
                          // onChanged: (value) => () {
                          //   orderController.searchProduct(value);
                          // },

                          onChanged: (value) =>
                              orderController.searchProduct(value),
                          controller: orderController.controller.value,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            prefixIconConstraints: const BoxConstraints(
                              minHeight: 36,
                              minWidth: 36,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                            ),
                            hintText: "Search for a product",
                            suffixIconConstraints: const BoxConstraints(
                              minHeight: 36,
                              minWidth: 36,
                            ),
                            suffixIcon: IconButton(
                              constraints: const BoxConstraints(
                                minHeight: 36,
                                minWidth: 36,
                              ),
                              splashRadius: 24,
                              icon: const Icon(
                                Icons.clear,
                              ),
                              onPressed: () {
                                orderController.controller.value.clear();
                              },
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: Obx(() => SingleChildScrollView(
                            child: Container(
                              height: 300,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 3 / 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: orderController.searchList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          // orderController.oncart.add(
                                          //     orderController
                                          //         .searchList[index]);
                                          print('added');
                                          orderController.additem(ProductModel(
                                            id: customerController
                                                .selectedCustomer.value,
                                            name: orderController
                                                .searchList[index].name,
                                            price: 4,
                                            quantity: orderController
                                                .searchList[index].quantity,
                                          ));
                                          // orderController
                                          //     .searchList[index]);
                                        },
                                        child: Container(
                                          child: Text(
                                            orderController
                                                .searchList[index].name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ))),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextButton(
                            onPressed: () {
                              Get.delete<OrderController>();
                              dateController.dateNewOrderController.value
                                  .clear();

                              navigationController.goBackk();
                            },
                            child: Text("Go Back"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextButton(
                            onPressed: () async {
                              await orderController.addOrder();
                              Get.delete<OrderController>();
                              navigationController.goBackk();
                            },
                            child: Text("Comeplete Order"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //row, searchable product, quanitty
            Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Obx(
                    () => ListView.separated(
                      separatorBuilder: (_, indesx) => const Divider(
                        color: Colors.black,
                      ),
                      itemCount: orderController.oncart.length,
                      itemBuilder: (_, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 3,
                                child:
                                    Text(orderController.oncart[index].name)),
                            Expanded(
                                flex: 4,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_circle_down)),
                                    Text(orderController.oncart[index].quantity
                                        .toString()),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_circle_up)),
                                  ],
                                ))
                          ],
                        );
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );

    // Center(
    //   child: Container(
    //     height: 600,
    //     width: 500,
    //     child: ListView(
    //       padding: EdgeInsets.all(5),
    //       children: [
    //         Container(
    //           child: Column(
    //             children: [
    //               Obx(() {
    //                 return Text(
    //                   customerController.selectedCustomer.value,
    //                   style: const TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w500),
    //                 );
    //               }),
    //               Container(
    //                 padding: EdgeInsets.all(10),
    //                 child: DropdownButton(
    //                   //value: customerController.chosenValue.value,
    //                   items: customerController.customerList
    //                       .map<DropdownMenuItem<String>>((element) {
    //                     return DropdownMenuItem<String>(
    //                       value: element,
    //                       child: Text(element),
    //                     );
    //                   }).toList(),
    //                   onChanged: (value) {
    //                     customerController.setValue = value;
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),

    //         const SizedBox(height: 24),
    //         TextField(
    //           controller: emailController,
    //           decoration: InputDecoration(
    //             hintText: 'name@example.com',
    //             labelText: 'Email',
    //             prefixIcon: Icon(Icons.mail),
    //             // icon: Icon(Icons.mail),
    //             suffixIcon: emailController.text.isEmpty
    //                 ? Container(width: 0)
    //                 : IconButton(
    //                     icon: Icon(Icons.close),
    //                     onPressed: () => emailController.clear(),
    //                   ),
    //             border: OutlineInputBorder(),
    //           ),
    //           keyboardType: TextInputType.emailAddress,
    //           textInputAction: TextInputAction.done,
    //           // autofocus: true,
    //         ),
    //         TextField(
    //           decoration: InputDecoration(
    //             hintText: 'Your Password...',
    //             labelText: 'Password',
    //             errorText: 'Password is wrong',
    //             suffixIcon: IconButton(
    //               icon: isPasswordVisible
    //                   ? Icon(Icons.visibility_off)
    //                   : Icon(Icons.visibility),
    //               onPressed: () {},
    //             ),
    //             border: OutlineInputBorder(),
    //           ),
    //           obscureText: isPasswordVisible,
    //         ),
    //         const SizedBox(height: 24),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('Number', style: TextStyle(fontWeight: FontWeight.bold)),
    //             const SizedBox(height: 8),
    //             TextField(
    //               controller: numberController,
    //               decoration: InputDecoration(
    //                 hintText: 'Enter number...',
    //                 hintStyle: TextStyle(color: Colors.white70),
    //                 filled: true,
    //                 fillColor: Colors.black,
    //                 border: OutlineInputBorder(),
    //               ),
    //               style: TextStyle(color: Colors.white),
    //               keyboardType: TextInputType.number,
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 24),
    //         // ButtonWidget(
    //         //   text: 'Submit',
    //         //   onClicked: () {
    //         //     print('Email: ${emailController.text}');
    //         //     print('Password: ${password}');
    //         //     print('Number: ${numberController.text}');
    //         //   },
    //         // ),
    //         TextButton(
    //             onPressed: () {
    //               Get.back();
    //             },
    //             child: Text('Back')),
    //       ],
    //     ),
    //   ),
    // ),
    //);
  }
}

// class ShowDatePicker extends StatelessWidget {
//   //const ShowDatePicker({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 100,
//         color: Colors.yellow,
//         child: Obx(() => TextField(
//               readOnly: true,
//               controller: dateController.dateontroller.value,
//               decoration: InputDecoration(
//                   hintText:
//                       dateController.date.value.toString().substring(0, 10)),
//               onTap: () async {
//                 var date = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime(2100));
//                 dateController.dateontroller.value.text =
//                     date.toString().substring(0, 10);
//               },
//             )));
//   }
// }
