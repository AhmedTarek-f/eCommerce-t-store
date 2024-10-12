import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  const BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  final String brandId;
  final String categoryId;

  static BrandCategoryModel empty() => const BrandCategoryModel(brandId: "", categoryId: "");

  Map<String , dynamic> toJson(){
    return {
      "BrandId" : brandId,
      "CategoryId" : categoryId,
    };
  }

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final Map<String,dynamic> snapshot = document.data()!;
      return BrandCategoryModel(
          brandId: snapshot["BrandId"] ?? "",
          categoryId: snapshot["CategoryID"] ?? "",
      );
    }
    else {
      return empty();
    }
  }
}
