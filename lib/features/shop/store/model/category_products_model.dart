import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProductsModel {
  const CategoryProductsModel({
    required this.productId,
    required this.categoryId,
  });

  final String productId;
  final String categoryId;

  static CategoryProductsModel empty() => const CategoryProductsModel(productId: "", categoryId: "");

  Map<String , dynamic> toJson(){
    return {
      "ProductId" : productId,
      "CategoryId" : categoryId,
    };
  }

  factory CategoryProductsModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final Map<String,dynamic> snapshot = document.data()!;
      return CategoryProductsModel(
          productId: snapshot["ProductId"] ?? "",
          categoryId: snapshot["CategoryId"] ?? "",
      );
    }
    else {
      return empty();
    }
  }
}
