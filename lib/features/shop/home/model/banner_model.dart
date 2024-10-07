import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  const BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });
  final String imageUrl;
  final String targetScreen;
  final bool active;

  static BannerModel empty() => const BannerModel(imageUrl: "", targetScreen: "", active: false);

  Map<String , dynamic> toJson() {
    return {
      "ImageUrl":imageUrl,
      "TargetScreen" :targetScreen,
      "Active" : active,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null){
      final Map<String,dynamic> snapshot = document.data()!;

      return BannerModel(
          imageUrl: snapshot["ImageUrl"] ?? "",
          targetScreen: snapshot["TargetScreen"] ?? "",
          active: snapshot["Active"] ?? false,
      );
    }
    else {
      return empty();
    }
  }
}
