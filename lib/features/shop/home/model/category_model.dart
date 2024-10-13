import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId,
    this.categoryBannerImg,
  });
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? parentId;
  final String? categoryBannerImg;

  static CategoryModel empty() =>const CategoryModel(id: "", name: "", image: "", isFeatured: false);

  Map<String,dynamic> toJson() {
    return {
      "Name" : name,
      "Image" : image,
      "IsFeatured": isFeatured,
      "ParentId" : parentId,
      "CategoryBannerImg": categoryBannerImg,
    };
  }

  factory CategoryModel.fromSnapShot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null)
      {
        final Map<String,dynamic> snapshot = document.data()!;

        return CategoryModel(
          id: document.id,
          name: snapshot["Name"] ?? "",
          image: snapshot["Image"] ?? "",
          parentId: snapshot["ParentId"],
          isFeatured: snapshot["IsFeatured"] ?? false,
          categoryBannerImg: snapshot["CategoryBannerImg"],
        );
      }
    else{
      return CategoryModel.empty();
    }
  }
}