class Data {
  final String itemName;
  final String itemPrice;
  final String itemImage;

  Data({this.itemName, this.itemPrice, this.itemImage});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        itemName: json['itemName'],
        itemPrice: json['itemPrice'],
        itemImage: json['itemImage']);
  }
}
