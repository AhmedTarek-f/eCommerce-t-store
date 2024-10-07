import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = "",
  });
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  static CategoryModel empty() =>const CategoryModel(id: "", name: "", image: "", isFeatured: false);

  Map<String,dynamic> toJson() {
    return {
      "Name" : name,
      "Image" : image,
      "IsFeatured": isFeatured,
      "ParentId" : parentId,
    };
  }

  factory CategoryModel.fromSnapShot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null)
      {
        final Map<String,dynamic> data = document.data()!;

        return CategoryModel(
          id: document.id,
          name: data["Name"] ?? "",
          image: data["Image"] ?? "",
          parentId: data["ParentId"] ?? "",
          isFeatured: data["IsFeatured"] ?? false,
        );
      }
    else{
      return CategoryModel.empty();
    }
  }
}