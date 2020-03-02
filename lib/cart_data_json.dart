class CartData {
  final String cartitemName;
  final String cartitemPrice;
  final String cartitemImage;

  CartData({this.cartitemName, this.cartitemPrice, this.cartitemImage});

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
        cartitemName: json['cartitemName'],
        cartitemPrice: json['cartitemPrice'],
        cartitemImage: json['cartitemImage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cartdata = new Map<String, dynamic>();
    cartdata['cartitemName'] = this.cartitemName;
    cartdata['cartitemPrice'] = this.cartitemPrice;
    cartdata['cartitemImage'] = this.cartitemImage;
    return cartdata;
  }
}
