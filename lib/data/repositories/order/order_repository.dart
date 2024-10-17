import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/my_orders/model/order_model.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw "Unable to find user information. Try again in few minutes.";

      final result = await _db.collection("Users").doc(userId).collection("Orders").get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong while fetching Order Information. Try again later";
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try{
      await _db.collection("Users").doc(userId).collection("Orders").add(order.toJson());
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong while saving Order Information. Try again later";
    }
  }
}