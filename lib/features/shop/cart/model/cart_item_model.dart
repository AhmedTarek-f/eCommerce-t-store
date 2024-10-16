import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.title = "",
    this.price = 0.0,
    this.image,
    this.variationId = "",
    this.brandName,
    this.selectedVariation,
  });

  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  static CartItemModel empty() => CartItemModel(productId: "", quantity: 0);

  Map<String,dynamic> toJson() {
    return {
      "ProductId":productId,
      "Title":title,
      "Price":price,
      "Image":image,
      "Quantity":quantity,
      "VariationId":variationId,
      "BrandName":brandName,
      "SelectedVariation":selectedVariation,
    };
  }
  factory CartItemModel.fromJson(Map<String,dynamic> json)
  {
    return CartItemModel(
      productId: json["ProductId"] ?? "",
      title: json["Title"] ?? "",
      price: double.parse((json["Price"] ?? 0.0).toString()),
      image: json["Image"] ?? "",
      quantity: int.parse((json["Quantity"] ?? 0).toString()),
      variationId: json["VariationId"] ?? "",
      brandName: json["BrandName"] ?? "",
      selectedVariation: json["SelectedVariation"] != null ? Map<String,String>.from(json["SelectedVariation"]) : null,
    );
  }
}
