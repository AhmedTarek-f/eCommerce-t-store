import 'package:cloud_firestore/cloud_firestore.dart';

class ProductAttributeModel {
  ProductAttributeModel({
    this.name,
    this.values,
  });
  String? name;
  final List<String>? values;

  static ProductAttributeModel empty() =>
      ProductAttributeModel(name: "", values: []);

  Map<String, dynamic> toJson() {
    return {
      "Name":name,
      "Values": values,
    };
  }

  factory ProductAttributeModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null)
      {
        final Map<String,dynamic> snapshot = document.data()!;
        return ProductAttributeModel(
          name: snapshot["Name"] ?? "",
          values: snapshot["Values"]?? [],
        );
      }
    else {
      return empty();
    }
  }

  factory ProductAttributeModel.fromSnapshot2(Map<String,dynamic> document) {

      final Map<String,dynamic> snapshot = document;
      return ProductAttributeModel(
        name: snapshot["Name"] ?? "",
        values: List<String>.from(snapshot["Values"]) ?? [],
      );

  }
}
