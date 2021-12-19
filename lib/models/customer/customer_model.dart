class CustomerModel {
  String customerId;
  String name;
  //Receipt receipt;

  CustomerModel.fromJson(
    Map<String, dynamic> cust,
    String id,
  ) {
    this.customerId = id;
    this.name = cust["name"] ?? 'empty';
    //receipt = prod["receipt"] ?? 'empty';
  }

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
