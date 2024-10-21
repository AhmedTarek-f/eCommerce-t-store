import 'package:cloud_firestore/cloud_firestore.dart';

class CouponsModel {
  const CouponsModel({
  required this.couponOffer,
  required this.couponValue,
  required this.couponDescription,
  });
  final String couponOffer;
  final double couponValue;
  final String couponDescription;

  static CouponsModel empty() => const CouponsModel(couponOffer: "", couponValue: 0.0, couponDescription: "");

  factory CouponsModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final Map<String,dynamic> data = document.data()!;
      return CouponsModel(
          couponOffer: data["CouponOffer"] as String,
          couponValue: double.parse((data["CouponValue"] ?? 0.0).toString()) ,
          couponDescription: data["CouponDescription"] as String,
      );
    }
    else {
      return empty();
    }
  }
}