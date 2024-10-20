import 'package:cloud_firestore/cloud_firestore.dart';

class ProductReviewModel {
  const ProductReviewModel({
  required this.userName,
  required this.userImage,
  required this.rating,
  required this.reviewDate,
  required this.comment,
  });
  final String userName;
  final String? userImage;
  final double rating;
  final DateTime reviewDate;
  final String comment;

  static ProductReviewModel empty() => ProductReviewModel(userName: "", userImage: "", rating: 0, reviewDate: DateTime.now(), comment: "");

  Map<String,dynamic> toJson() {
    return {
      "UserName" : userName,
      "UserImage" : userImage,
      "Rating" : rating,
      "ReviewDate" : reviewDate,
      "Comment" : comment,
    };
  }

  factory ProductReviewModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final Map<String,dynamic> data = document.data()!;
      return ProductReviewModel(
          userName: data["UserName"] as String,
          userImage: data["UserImage"] as String,
          rating: double.parse((data["Rating"] ?? 0.0).toString()),
          reviewDate: (data["ReviewDate"] as Timestamp).toDate(),
          comment: data["Comment"] as String,
      );
    }
    else {
      return empty();
    }
  }
}