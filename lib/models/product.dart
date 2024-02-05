class Products {
   int? id;
   String? productName;
   String? productImage;
   String? productDescription;
   int? price;
  Products(
      {
        required this.id,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    productImage = json['productImage'];
    productDescription = json['productDescription'];
    price = json['price'];
  }
   Map<String, dynamic> toJson() {
     final _data = <String, dynamic>{};
     _data['id'] = id;
     _data['productName'] = productName;
     _data['productImage'] = productImage;
     _data['productDescription'] = productDescription;
     _data['price'] = price;
     return _data;
   }
}
