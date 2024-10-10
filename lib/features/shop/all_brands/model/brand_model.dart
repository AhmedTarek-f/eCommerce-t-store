import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  static BrandModel empty() => BrandModel(id: "", name: "", image: "", isFeatured: false, productsCount: 0);

  Map<String , dynamic> toJson() {
    return {
      "Id" : id,
      "Name" : name,
      "Image": image,
      "IsFeatured": isFeatured,
      "ProductsCount" : productsCount
    };
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null)
      {
        final Map<String, dynamic> snapshot = document.data()!;
        return BrandModel(
          id: snapshot["Id"] ?? "",
          name: snapshot["Name"] ?? "",
          image: snapshot["Image"] ?? "",
          isFeatured: snapshot["IsFeatured"] ?? false,
          productsCount: int.parse((snapshot["ProductsCount"] ?? 0).toString()) ,
        );
      }
    else{
      return empty();
    }
  }

  factory BrandModel.fromSnapshot2(Map<String,dynamic> document){

      final Map<String, dynamic> snapshot = document;
      return BrandModel(
        id: snapshot["Id"] ?? "",
        name: snapshot["Name"] ?? "",
        image: snapshot["Image"] ?? "",
        isFeatured: snapshot["IsFeatured"] ?? false,
        productsCount: int.parse((snapshot["ProductsCount"] ?? 0).toString()) ,
      );
  }
}
