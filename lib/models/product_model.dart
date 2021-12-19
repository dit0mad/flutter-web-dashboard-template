class ProductModel {
  String id;
  String name;
  int quantity = 1;
  int price = 1;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
  });

  ProductModel.fromJson(
    Map<String, dynamic> prod,
    //String id,
  ) {
    id = prod['id'] ?? 'd';
    name = prod["name"] ?? 'empty';
    price = prod["price"];
    quantity = prod['quantity'];
  }

  ProductModel.fromOrder(
    Map<String, dynamic> prod,
  ) {
    id = prod['id'] ?? 'null';
    name = prod["name"] ?? 'empty';
    price = prod["price"] ?? 5;
    quantity = prod['quantity'] ?? 1;
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'quantity': this.quantity,
        'price': this.price,
      };
}
