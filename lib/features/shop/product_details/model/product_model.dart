import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/product_details/model/product_attribute_model.dart';
import 'package:t_store/features/shop/product_details/model/product_variation_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  static ProductModel empty() => ProductModel(
      id: "",
      stock: 0,
      price: 0.0,
      title: "",
      salePrice: 0.0,
      thumbnail: "",
      productType: "");

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Stock": stock,
      "SKU": sku,
      "Price": price,
      "Title": title,
      "Date": date,
      "SalePrice": salePrice,
      "Thumbnail": thumbnail,
      "IsFeatured": isFeatured,
      "Brand": brand!.toJson(),
      "Description": description,
      "CategoryId": categoryId,
      "Images": images ?? [],
      "ProductType": productType,
      "ProductAttributes": productAttributes != null? productAttributes!.map((e) => e.toJson()).toList() :[],
      "ProductVariations": productVariations != null? productVariations!.map((e) => e.toJson()).toList() :[],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data() != null){
      final Map<String,dynamic> snapshot = document.data()!;
      return ProductModel(
        id: document.id,
        sku: snapshot["SKU"] ?? "",
        stock: int.parse((snapshot["Stock"] ?? 0).toString()),
        price: double.parse((snapshot["Price"] ?? 0.0).toString()),
        title: snapshot["Title"] ?? "",
        salePrice: double.parse((snapshot["SalePrice"] ?? 0.0).toString()),
        thumbnail: snapshot["Thumbnail"] ?? "",
        productType: snapshot["ProductType"] ?? "",
        isFeatured: snapshot["IsFeatured"] ?? false,
        brand: BrandModel.fromJson(snapshot["Brand"]),
        categoryId: snapshot["CategoryId"] ?? "",
        date: snapshot["Date"],
        description: snapshot["Description"] ?? "",
        images: snapshot["Images"] != null ? List<String>.from(snapshot["Images"]) :[],
        productAttributes: (snapshot["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (snapshot["ProductVariations"] as List<dynamic>).map((e)=> ProductVariationModel.fromJson(e)).toList(),
      );
    }
    else {
      return empty();
    }
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document){
    if(document.data() != null){
      final Map<String,dynamic> snapshot = document.data() as Map<String, dynamic>;
      return ProductModel(
        id: document.id,
        sku: snapshot["SKU"] ?? "",
        stock: int.parse((snapshot["Stock"] ?? 0).toString()),
        price: double.parse((snapshot["Price"] ?? 0.0).toString()),
        title: snapshot["Title"] ?? "",
        salePrice: double.parse((snapshot["SalePrice"] ?? 0.0).toString()),
        thumbnail: snapshot["Thumbnail"] ?? "",
        productType: snapshot["ProductType"] ?? "",
        isFeatured: snapshot["IsFeatured"] ?? false,
        brand: BrandModel.fromJson(snapshot["Brand"]),
        categoryId: snapshot["CategoryId"] ?? "",
        date: snapshot["Date"],
        description: snapshot["Description"] ?? "",
        images: snapshot["Images"] != null ? List<String>.from(snapshot["Images"]) :[],
        productAttributes: (snapshot["ProductAttributes"] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (snapshot["ProductVariations"] as List<dynamic>).map((e)=> ProductVariationModel.fromJson(e)).toList(),
      );
    }
    else {
      return empty();
    }
  }
}
