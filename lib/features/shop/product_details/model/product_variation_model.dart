import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductVariationModel{
  ProductVariationModel({
    required this.id,
    this.sku ="",
    this.image="",
    this.description,
    this.price=0.0,
    this.salePrice=0.0,
    this.stock=0,
    required this.attributeValues,
});

  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String,String> attributeValues;

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  Map<String,dynamic> toJson()
  {
    return {
      "Id":id,
      "Sku":sku,
      "Image":image,
      "Description": description,
      "Price":price,
      "SalePrice":salePrice,
      "Stock":stock,
      "AttributeValues":attributeValues,
    };
  }

  factory ProductVariationModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document)
  {
    if(document.data() != null)
      {
        final Map<String,dynamic> snapshot = document.data()!;
        return ProductVariationModel(
            id: snapshot["Id"],
            image: snapshot["Image"] ?? "",
            price: double.parse((snapshot["Price"] ?? 0.0).toString()) ,
            description: snapshot["Description"] ?? "",
            salePrice: double.parse((snapshot["SalePrice"] ?? 0.0).toString()),
            sku: snapshot["Sku"] ?? "",
            stock: int.parse((snapshot["Stock"] ?? 0).toString()) ,
            attributeValues: Map<String,String>.from(snapshot["AttributeValues"] ),
        );
      }
    else{
      return empty();
    }
  }

  factory ProductVariationModel.fromJson(Map<String,dynamic> document)
  {
      final Map<String,dynamic> snapshot = document;
      return ProductVariationModel(
        id: snapshot["Id"] ?? "",
        image: snapshot["Image"] ?? "",
        price: double.parse((snapshot["Price"] ?? 0.0).toString()) ,
        description: snapshot["Description"] ?? "",
        salePrice: double.parse((snapshot["SalePrice"] ?? 0.0).toString()),
        sku: snapshot["Sku"] ?? "",
        stock: int.parse((snapshot["Stock"] ?? 0).toString()) ,
        attributeValues: Map<String,String>.from(snapshot["AttributeValues"] ),
      );

  }
}