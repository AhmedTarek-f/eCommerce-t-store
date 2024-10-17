import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/core/utlis/formatter/t_formatter.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';
import 'package:t_store/features/shop/cart/model/cart_item_model.dart';

class OrderModel {
  const OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.paymentMethod,
    required this.address,
    required this.deliveryDate,
    required this.items,
  });

  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  static OrderModel empty() => OrderModel(id: "", userId: "", status: OrderStatus.processing, totalAmount: 0.0, orderDate: DateTime.now(), paymentMethod: "", address: AddressModel.empty(), deliveryDate: null, items: []);

  String get formattedOrderDate => TFormatter.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? TFormatter.getFormattedDate(deliveryDate!) : "";

  String get orderStatusText => status == OrderStatus.delivered
      ? "Delivered"
      : status == OrderStatus.shipped
        ? "Shipment on the way"
        : "Processing";

  Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "UserId": userId,
      "Status": status.toString(),
      "TotalAmount": totalAmount,
      "OrderDate": orderDate,
      "PaymentMethod": paymentMethod,
      "Address": address?.toJson(),
      "DeliveryDate": deliveryDate,
      "Items": items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final Map<String,dynamic> snapshot = document.data()!;
      return OrderModel(
          id: snapshot["Id"] as String,
          userId: snapshot["UserId"] as String,
          status: OrderStatus.values.firstWhere((e) => e.toString() == snapshot["Status"]),
          totalAmount: snapshot["TotalAmount"] as double,
          orderDate: (snapshot["OrderDate"] as Timestamp).toDate(),
          paymentMethod: snapshot["PaymentMethod"] as String ,
          address: AddressModel.fromJson(snapshot["Address"] as Map<String,dynamic>)  ,
          deliveryDate: snapshot["DeliveryDate"] == null ? null : (snapshot["DeliveryDate"] as Timestamp).toDate(),
          items: (snapshot["Items"] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String,dynamic>)).toList(),
      );
    }
    else {
      return empty();
    }
  }
}